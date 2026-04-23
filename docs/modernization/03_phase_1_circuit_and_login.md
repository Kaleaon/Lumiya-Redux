# Phase 1 — Circuit & Login

Goal: a user with valid Second Life credentials can launch the app, enter
first/last/password, and see "You are in <Region Name>" in the logcat with
the app still connected one minute later. No rendering yet; no inventory
yet; no features. The floor of everything else.

This phase exercises the full TCP (login) → UDP (circuit) → HTTP (CAPS) →
HTTP long-poll (event queue) chain. If any link is broken, the rest of the
app stack is hallucinating.

## Background: what must work

A Second Life session bringup, in order:

1. **Login** — HTTPS POST XMLRPC `login_to_simulator` to
   `https://login.agni.lindenlab.com/cgi-bin/login.cgi` with a struct of
   credentials and an LLSD-ish options array. Response carries
   `session_id`, `secure_session_id`, `agent_id`, `circuit_code`,
   `sim_ip`, `sim_port`, `seed_capability`, `inventory-root`,
   `buddy-list`, etc. Lumiya's `SLAuthReply.java` parses this today and
   is the authoritative field list.
2. **Circuit open** — UDP to `sim_ip:sim_port`. Send `UseCircuitCode`
   with `circuit_code`, `session_id`, `agent_id`. Wait for an ACK.
3. **Agent handshake** — `CompleteAgentMovement` after the
   `UseCircuitCode` ACK. Region replies with `RegionHandshake`, to which
   the viewer replies `RegionHandshakeReply`.
4. **CAPS fetch** — HTTPS POST LLSD-XML to `seed_capability` with an
   array of requested cap names. Server returns a dict of
   cap-name → cap-URL. Bounded to the region.
5. **Event queue long-poll** — HTTPS GET to the `EventQueueGet` cap URL
   with an LLSD-in-body ack counter. Server holds the connection until
   it has events or the 30-second timeout elapses; returns an LLSD
   array of `body` dicts. Viewer re-polls immediately.
6. **Steady state** — circuit sends `AgentUpdate` at ~10 Hz,
   `PingCheck` every 10 s, receives `ObjectUpdate`, `CoarseLocationUpdate`,
   `ChatFromSimulator`, etc.

Linkpoint has all six pieces in the tree. They are individually functional;
the integration is where prior attempts broke.

## Tasks

### P1-AUTH-01 — Reconstruct `SLAuth.SendLoginRequest` (Kotlin)

This is the single most important reverse-engineering task.

- **Input**:
  - Lumiya-Redux `app/src/main/java/com/lumiyaviewer/lumiya/slproto/auth/SLAuth.java`
    (broken stub) and `SLAuthReply.java` (working parser).
  - Upstream `indra/newview/llstartup.cpp` (XMLRPC struct construction
    and options list) and `indra/newview/llloginhandler.cpp`.
  - `docs/secondlife_apk_2026_analysis.md` §"Known protocol gap".
- **Output**: `Linkpoint/src/main/java/com/linkpoint/auth/LoginClient.kt`
  implementing `suspend fun login(params: LoginParams): LoginResult`.
  Input: first/last/password/start-location/channel/version/mac/id0/
  agree_to_tos/read_critical/mfa_token?/mfa_hash?. Output: typed
  `LoginResult.Success(session: SessionSnapshot)` or
  `LoginResult.Failure(reason: LoginFailure)` where `LoginFailure` is a
  sealed class with entries for BadCredentials, TosRequired (carrying
  `next_url`/`next_method`), AccountDisabled, MfaRequired,
  MaintenanceMode, Unknown(String).
- **Wire-level detail**:
  - XMLRPC method name: `login_to_simulator`.
  - Params: single struct, member names: `first`, `last`, `passwd`,
    `start`, `channel`, `version`, `platform` (`Lnx`|`Mac`|`Win`;
    Android reports `Lnx` for kernel parity in upstream), `mac`,
    `id0`, `host_id`, `mfa_hash` (persisted hash from prior MFA
    success; empty on first login), `token` (6-digit TOTP if required),
    `agree_to_tos`, `read_critical`, `viewer_digest` (MD5 of viewer
    binary; spoofable but must be stable per session),
    `last_exec_event`, `last_exec_duration`, `options` (array of strings).
  - `options` is the reply-field selector. Canonical set for a full
    featureful reply: `inventory-root`, `inventory-skeleton`,
    `inventory-lib-root`, `inventory-lib-owner`, `inventory-skel-lib`,
    `initial-outfit`, `gestures`, `event_categories`, `event_notifications`,
    `classified_categories`, `buddy-list`, `ui-config`, `login-flags`,
    `global-textures`, `adult_compliant`.
  - Password hashing: `$1$` + MD5(first 16 chars of plaintext).
    Already implemented in Lumiya `SLAuth.getPasswordHash`.
  - Transport: HTTPS POST, `Content-Type: text/xml`. OkHttp.
- **Response handling**: transport raw response bytes into the Linkpoint
  equivalent of `SLAuthReply.java`. Port the XMLPullParser walk
  verbatim into Kotlin; keep the field names identical to the wire.
- **Tests**:
  - Unit test: feed a golden `methodResponse` XML from
    `recovered/reference/login_response_sample.xml` (to be captured by
    the first implementer who has a test account) and assert the
    parsed `SessionSnapshot`.
  - Integration test: `ConnectionIntegrationTest.kt` already supports
    real login with test credentials; extend it to assert the full
    `SessionSnapshot` surface.
- **Acceptance**: A dev with test creds runs `./gradlew :Linkpoint:connectedCheck -Pcreds=…`
  and the integration test goes green. Logcat shows a populated
  `seed_capability` URL.

### P1-CIRCUIT-01 — Adopt `LinkpointThreadedCircuit` as the sole UDP path

- **Input**: Linkpoint `protocol/circuit/LinkpointThreadedCircuit.kt`,
  `protocol/messages/UDPConnectionFixed.kt`. Lumiya reference
  `slproto/SLAgentCircuit.java`.
- **Output**: `UDPConnectionFixed.kt` is deleted or shrunk to a thin
  adapter over `LinkpointThreadedCircuit`. All message handler
  registration goes through the circuit's synchronous registry.
- **Rationale**: REVIEW.md §0 is unambiguous that the coroutine-based
  path was the root cause of prior inoperability. Lumiya's single
  dedicated thread with `receive → send pending → send acks → idle
  tasks → sleep` loop is the known-good pattern.
- **Steps**:
  1. Audit every `registerHandler` call site in Linkpoint (REVIEW
     counts ~100); replace with the `LinkpointThreadedCircuit`
     equivalent.
  2. Delete `CircuitTaskQueue`, `CircuitThread` dead instances in
     `UDPConnectionFixed.kt`.
  3. Move all `runBlocking` out of hot paths. Circuit-internal
     operations use the circuit thread directly; anything crossing
     out of the circuit uses a bounded `Channel(capacity=256)`.
  4. The circuit loop's sleep should be `max(0, nextIdleDueMs -
     nowMs)` with a hard floor of 10 ms — not a fixed 1 s from
     the Lumiya reference. Modern devices can do 10 ms ticks
     without thermal impact and this tightens responsiveness.
- **Acceptance**:
  - Zero `runBlocking` occurrences in `protocol/` and `network/`.
  - No-op `UseCircuitCode` + ACK round trip succeeds in <500 ms on
    Wi-Fi to Agni.
  - Packet-loss test (10% drop injected by a Linux qdisc) retransmits
    correctly; sequence numbers stay monotonic.

### P1-CIRCUIT-02 — Reliable packet layer parity

- **Input**: Lumiya `SLAgentCircuit.java` reliable-packet path, upstream
  `indra/llmessage/llpacketring.cpp`.
- **Output**: Linkpoint circuit correctly implements:
  - 24-bit sequence numbers with wrap-around (`& 0xFFFFFF`).
  - Packet header flags: `LL_ZERO_CODE_FLAG`, `LL_RELIABLE_FLAG`,
    `LL_RESENT_FLAG`, `LL_ACK_FLAG`.
  - Reliable-packet queue with retransmit at 100 ms, 200 ms, 400 ms,
    800 ms, 1600 ms. Drop after 5 attempts and log `CIRCUIT_DEAD`.
  - Appended ACKs: trailing ACK-count byte + N big-endian sequence
    numbers. Linkpoint PR #225/#227 already fixed byte-order; keep
    that fix and add a unit test fixture under
    `src/test/resources/fixtures/packets/`.
  - Standalone `PacketAck` (`0xFB`) message for pure-ack packets.
- **Acceptance**: Unit tests for each flag combination. Integration
  test logs show no packets with `retry_count > 2` during a 60 s idle
  session (steady state should hit 0 retransmits).

### P1-CIRCUIT-03 — Handshake state machine

- **Input**: upstream `indra/newview/llviewerregion.cpp` region-bringup
  sequence; Lumiya `SLAgentCircuit.java` handshake path.
- **Output**: An explicit state machine in
  `Linkpoint/src/main/java/com/linkpoint/protocol/circuit/HandshakeStateMachine.kt`
  with states `Idle`, `UseCircuitSent`, `UseCircuitAcked`,
  `CompleteAgentMovementSent`, `RegionHandshakeReceived`,
  `SeedCapFetching`, `SeedCapReady`, `EventQueueStarted`, `Live`, `Dead`.
  Transitions have preconditions; a linter rejects direct state
  mutation outside the machine.
- **Acceptance**: A golden-path transcript under `src/test/resources/`
  produces exactly the state sequence above. A fault-injection test
  that drops the `UseCircuitCode` ACK three times exercises the
  retransmit path and eventually enters `Dead` with a structured error.

### P1-CAPS-01 — Complete canonical CAPS fetch

- **Input**: upstream `LLViewerRegionImpl::buildCapabilityNames` (cited
  in `docs/secondlife_apk_2026_analysis.md`). Lumiya `SLCaps.java` (now
  extended to full upstream set on this branch).
- **Output**: Linkpoint `CapabilityManager` requests the full upstream
  canonical set plus the two AIS v3 caps. Missing caps (server returns
  no entry) are logged at `INFO`, not `WARN`; expected absence of
  some caps on third-party grids must not pollute logs.
- **Steps**:
  1. Consolidate all cap-name constants into
     `protocol/caps/CapabilityNames.kt`. Delete string-literal
     usages (REVIEW.md §MASTER_TRACKING flags `"GroupProfile"`
     literal in `ProfileManager`).
  2. Every `capabilityManager.request(CAP_*)` call site references
     constants only. Add a ktlint rule or a unit test that greps for
     literal caps strings outside `CapabilityNames.kt`.
  3. `CapabilityManager.fetch(seedCapUrl: String): CapabilityTable`
     returns an immutable, thread-safe table; mutations happen only
     on region cross. One table per `Region`.
- **Acceptance**: On a live Agni login, logs show exactly one cap-fetch
  request with `N >= 20` caps returned. Failing test: a region that
  returns 5xx for the seed-cap POST produces a typed `CapFetchFailed`
  error, not a silent swallow.

### P1-EVENTQ-01 — Event queue long-poll

- **Input**: upstream `indra/newview/lleventpoll.cpp`. Linkpoint
  `protocol/caps/CapEventQueue.kt`.
- **Output**: Long-poll runs on a dedicated coroutine with a
  `SupervisorJob` scoped to the region. Ack counter is monotonic.
  Timeouts produce a reconnect, not a crash. Server-side `done: true`
  ends the poll cleanly. Backoff on 5xx: 1 s → 2 s → 4 s, max 30 s.
- **Acceptance**: 10-minute idle session shows ≥20 long-poll cycles
  with no ack drift; `ack` monotonically increases. A simulated 30 s
  outage resumes correctly.

### P1-MSG-01 — Minimum message handler set

- **Input**: Lumiya-Redux `slproto/messages/` — every Java class in that
  directory is a generated message. Linkpoint
  `protocol/messages/MessageIds.kt`,
  `protocol/messages/MessageParserRegistry.kt`.
- **Output**: Handlers registered for the P1 minimum set:
  - `UseCircuitCodeReply`/ACK (already via `PacketAck`).
  - `RegionHandshake` / `RegionHandshakeReply`.
  - `AgentMovementComplete`.
  - `HealthMessage`.
  - `StartPingCheck` → respond `CompletePingCheck`.
  - `PacketAck`.
  - `ImprovedTerseObjectUpdate` (stored, not rendered yet).
  - `ObjectUpdate` (stored, not rendered yet).
  - `CoarseLocationUpdate`.
  - `ChatFromSimulator` (delivers to a local chat sink log for now).
  - `AgentDataUpdate`.
  - `KillObject`.
  - `OnlineNotification`/`OfflineNotification` (stored in friends map).
- **Acceptance**: For a 60 s idle session on Agni, every received message
  ID has a registered handler, or falls through to an explicit
  `UNHANDLED(id=...)` log. Zero exceptions in handlers during the window.

### P1-AGENT-01 — Agent control & heartbeat

- **Input**: Lumiya `slproto/modules/SLAvatarControl.java`, upstream
  `indra/newview/llagent.cpp` agent-update cadence.
- **Output**: `AgentUpdate` sent at 10 Hz with zeroed controls when the
  user isn't inputting. `PingCheck` cadence per region.
  `AgentThrottle` message sets bandwidth buckets reflecting device
  link quality (Wi-Fi vs LTE). Pauseable when app is backgrounded
  (Android `onStop` → throttle to 1 Hz AgentUpdate, resume on
  `onStart`).
- **Acceptance**: 60 s foreground session: exactly ~600 `AgentUpdate`
  sent (±5%). Backgrounded session: ~60 `AgentUpdate` sent.

### P1-DIAG-01 — Connection diagnostics surface

- **Input**: Linkpoint `diagnostics/` existing scaffolding;
  `connection/ConnectionDiagnosticTest.kt`.
- **Output**: A developer-only screen (gate by build flavor `dev` only)
  showing: circuit state, RTT, packets sent/received/dropped,
  sequence-number skew, CAP count, event-queue ack, last 50 received
  message IDs as a scrolling list. Readable over `adb shell content
  query --uri content://com.linkpoint.dev.diagnostics` for scripted
  integration tests.
- **Acceptance**: The integration test asserts the diagnostics surface
  matches expected post-bringup state.

## Files expected to change

- `Linkpoint/src/main/java/com/linkpoint/auth/LoginClient.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/auth/SessionSnapshot.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/protocol/circuit/HandshakeStateMachine.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/protocol/caps/CapabilityNames.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/protocol/circuit/LinkpointThreadedCircuit.kt` (revision)
- `Linkpoint/src/main/java/com/linkpoint/protocol/messages/UDPConnectionFixed.kt` (shrink / delete)
- `Linkpoint/src/test/resources/fixtures/*` (golden transcripts)
- `Linkpoint/src/test/kotlin/com/linkpoint/auth/LoginClientTest.kt` (new)
- `Linkpoint/src/test/kotlin/com/linkpoint/protocol/circuit/HandshakeStateMachineTest.kt` (new)

## Exit criteria for Phase 1

- User can log in to Agni from the UI.
- Logcat shows `HandshakeStateMachine.state = Live` within 15 s of
  credential submit on a 10 Mbit connection.
- Session stays in `Live` for at least 10 minutes of idle use with zero
  reconnects and zero handler exceptions.
- Every Phase 1 task's own acceptance test is green in CI (where the
  test is not live-grid dependent — live tests run nightly).

## What we do *not* fix in Phase 1

- Logged-in scene rendering. The user sees a black screen or a
  splash; we only care that the session is alive. Rendering is Phase 4.
- Inventory population. Data arrives and is stored; no UI. That's
  Phase 5.
- Voice. Phase 6.
- Architecture cleanup (god class). Touch-only Phase 7 refactors
  throughout, but no dedicated cleanup sprint yet.
