# Phase 2 — Protocol Parity

Goal: the Linkpoint protocol layer handles every message and CAP the
reference Lumiya build handles, with equivalent or better correctness,
and can be fuzzed without crashing. Nothing user-visible changes in this
phase; everything internal does.

## Why this phase matters

The April-2026 `LUMIYA_COMPARISON_WORKLIST.md` in Linkpoint lists concrete
parity gaps: placeholder `AgentID`/`SessionID` in `ObjectManager`/`ParcelManager`,
several `MessageIds` constants without handlers (`MOVE_INVENTORY_ITEM`,
`UPDATE_TASK_INVENTORY`, `PARCEL_BUY`, `OBJECT_GRAB`/`OBJECT_DEGRAB`,
`KICK_USER`, `UPDATE_USER_INFO`, `FIND_AGENT`), partial JPEG2000 decode,
and incomplete CAP call-site coverage. Phase 2 is the bulk catch-up pass.

## Tasks

### P2-MSG-01 — Message template conformance

- **Input**: `recovered/reference/message_template.msg` (byte-identical
  to upstream); Lumiya `slproto/messages/*.java` (~450 classes);
  Linkpoint `protocol/messages/MessageIds.kt` and generated parsers.
- **Output**: Every message in the template has one of three states in
  Linkpoint:
  1. **Supported**: a registered parser/writer with a test fixture.
  2. **Declared-only**: an entry in `MessageIds.kt` with a
     `// OUTBOUND_ONLY` or `// IGNORED_INBOUND` comment explaining
     why it's not wired, plus a tracking issue.
  3. **Deprecated**: explicitly listed in a
     `DeprecatedMessages.kt` table with the upstream removal commit
     ID if available.
  
  No silent absences.
- **Automation**: Port Lumiya's
  `tools/protocol/verify_message_template_conformance.py` to a
  Kotlin-resident test that parses `message_template.msg` at test
  time, enumerates every message, and asserts each is classified
  above. The test fails the build if a new template delta is
  unaccounted for.
- **Steps**:
  1. Run the verifier against the current tree; categorise every
     gap.
  2. For each category-1 gap, either add the parser (most) or
     declare-only with a dated rationale.
  3. The Lumiya Java message classes are not a port target; they are
     the behavioural source of truth for block order and field
     order. The Kotlin parsers should be code-generated from
     `message_template.msg` itself to eliminate drift. A small
     `tools/protocol/generate_kotlin_parsers.py` compiles the
     template into Kotlin data classes + `MessageParser` implementations.
- **Acceptance**: Template conformance test green. Random sample of 10
  generated parsers hand-reviewed against Lumiya's Java equivalents.

### P2-MSG-02 — Outbound identity correctness

- **Input**: `LUMIYA_COMPARISON_WORKLIST.md §1`.
- **Output**: Every outbound message builder takes an `AgentIdentity`
  object (containing current `agentId`, `sessionId`, and region context)
  and refuses to construct the message if any field is a zero UUID or
  empty. Compile-time enforcement via a `@RequiresIdentity` annotation
  is nice-to-have; runtime assertion is required.
- **Acceptance**: Grep for `UUID.ZERO` in outbound message construction
  returns zero matches in `protocol/messages/` outside test fixtures.

### P2-LLSD-01 — Harden the LLSD parser

- **Input**: Linkpoint `protocol/llsd/LLSDParser.kt`; REVIEW.md §3.
- **Output**: Parser rejects malformed input without crashing and
  without unbounded allocation.
- **Concrete bounds** (enforce at parse time):
  - `MAX_LLSD_STRING_BYTES = 1 << 20` (1 MB).
  - `MAX_LLSD_BINARY_BYTES = 16 << 20` (16 MB).
  - `MAX_LLSD_ARRAY_LENGTH = 1_000_000`.
  - `MAX_LLSD_MAP_ENTRIES = 1_000_000`.
  - `MAX_LLSD_DEPTH = 64` (nesting).
  - `MAX_LLSD_TOTAL_BYTES = 64 << 20` (64 MB document).
- **Stream semantics**: Every `stream.read(buf)` result is checked.
  EOF before expected length raises `LLSDTruncated`, not silent
  garbage.
- **Fuzzing**: Add a Jazzer/kotlinx-fuzzer entrypoint under
  `src/test/kotlin/com/linkpoint/protocol/llsd/LLSDParserFuzz.kt`
  that runs in CI for a 5-minute budget per PR touching llsd/.
  Crashes fail the build.
- **Compatibility**: Before bumping these limits against observed
  traffic, record the 99th percentile of real field sizes over a
  week of telemetry; re-tune from data, not hunches.
- **Acceptance**:
  - 100% of LLSD tests pass.
  - 5-minute fuzz shows zero OOM, zero unhandled exception.
  - On the golden `seed_capability` response from P1, bytes-out is
    identical to Lumiya's parser output (LLSD canonical form).

### P2-LLSD-02 — LLSD encoder parity with upstream

- **Input**: upstream `indra/llcommon/llsdserialize.cpp`. Lumiya
  `slproto/llsd/*Serialize*`.
- **Output**: `LLSDSerializer` with XML / binary / notation outputs.
  Binary form is the default for POST bodies (smaller, faster).
  Determinism: map-entry iteration uses insertion order (matches
  upstream), not alphabetical.
- **Tests**: Round-trip corpus — for every LLSD value in
  `LLSD-KOTLIN/src/test/resources/`, encode → decode → assert
  equivalent.
- **Acceptance**: Round-trip test green; one chosen real capability
  POST to Agni has body bytes identical to upstream's output for
  the same logical payload.

### P2-CAPS-01 — Close CAP call-site gaps

- **Input**: Linkpoint `docs/MASTER_TRACKING.md §OPEN_BLOCKER` (Apr
  2026).
- **Output**: Each of these declared-but-unused CAPS is either wired to
  at least one call site or removed from the request list with a
  dated comment:
  - `CAP_SET_DISPLAY_NAME` → wired from display-name change UI (Phase
    5-UX task).
  - `CAP_SIMULATOR_FEATURES` → fetched at region cross; result feeds
    `RegionFeatureFlags` singleton consulted by renderer (PBR support,
    mesh support, etc.).
  - `CAP_AGENT_PREFERENCES` → wired from preferences UI.
  - `CAP_UPDATE_AGENT_LANGUAGE` → wired from locale change.
  - `CAP_RENDER_MATERIALS` → wired from PBR material fetch (Phase 4).
  - `CAP_OBJECT_MEDIA_NAVIGATE` → wired from in-world media nav (defer
    to Phase 7-UX).
  - `CAP_COPY_INVENTORY_FROM_NOTECARD` → wired from inventory paste.
  - `CAP_REGION_EXPERIENCE` → wired from experiences UI.
  - `CAP_MOVE_INVENTORY_ITEM` → wired from inventory move op.
- **Acceptance**: For each cap, a unit test asserts "request this op;
  HTTP client is hit with the correct cap URL and payload."

### P2-CAPS-02 — Region-cross CAP refresh

- **Input**: upstream `indra/newview/llviewerregion.cpp` region-cross
  path; Lumiya `SLAgentCircuit.java` region-cross.
- **Output**: When the viewer crosses from region A to region B, caps
  for A are retained while caps for B are fetched; the event queue
  for A is torn down after B's is live. No per-region singleton
  cap state.
- **Acceptance**: Integration test with two adjacent regions and a
  scripted walk: never less than one cap table active, never a gap
  where outgoing messages target a dead circuit.

### P2-INV-01 — AIS v3 inventory fetch

- **Input**: upstream `indra/newview/llaisapi.cpp`; Lumiya
  `slproto/inventory/SLInventory.java`.
- **Output**: Linkpoint `inventory/AisClient.kt` does:
  - `GET {inventory_cap}/category/{folder_id}/children?depth=N` to
    fetch a folder subtree.
  - `GET {inventory_cap}/item/{item_id}` for individual items.
  - `PATCH` / `POST` / `DELETE` for mutations.
  - On 404: log + fall through to UDP `FetchInventoryDescendents2`
    (classic).
  - On 5xx: exponential backoff, max 3 retries.
- **Storage**: A Room database under `com.linkpoint.inventory.db.InventoryDb`
  with entities `InventoryFolder`, `InventoryItem`, `InventoryVersion`.
  Versioning mirrors AIS's `version` field — stale reads are
  detectable and cheap.
- **Acceptance**: A test account with a known inventory tree populates
  entirely in <5 s on a cold cache; second session uses cached
  version and issues zero AIS calls until server increments version.

### P2-FRIENDS-01 — Friends list (buddy-list)

- **Input**: `SLAuthReply.parseBuddyList` (Lumiya reference);
  `OnlineNotification`/`OfflineNotification` messages.
- **Output**: `FriendsRepository` (Kotlin, Flow-based) exposing:
  - `val friends: StateFlow<List<FriendEntry>>`.
  - `suspend fun setRights(uuid, canSeeOnline, canSeeOnMap, canEditObjects): Result<Unit>`
    (sends `GrantUserRights`).
  - `suspend fun remove(uuid): Result<Unit>`.
  - `suspend fun invite(user: Username): Result<Unit>`.
- **Acceptance**: Two test accounts; the repository reflects
  online/offline transitions within 2 s of the other side's state
  change.

### P2-GROUPS-01 — Groups list bootstrap

- **Input**: Lumiya `slproto/modules/groups/SLGroupManager.java`;
  upstream `indra/newview/llgroupmgr.cpp`.
- **Output**: `GroupsRepository` with the same shape as friends;
  populated from `AgentGroupData` block in `AgentDataUpdate` and
  from `GroupProfileRequest`/`GroupProfileReply`.
- **Acceptance**: Test account with >1 group populates within 5 s of
  handshake-complete.

### P2-CHAT-01 — Local chat + IM plumbing

- **Input**: `ChatFromSimulator`, `ImprovedInstantMessage`,
  `ChatFromViewer`, `StartPingCheck`, Lumiya chat modules.
- **Output**:
  - `LocalChatRepository` — `Flow<List<LocalChatEntry>>`, bounded
    ring buffer of 1,000 messages. Derived from `ChatFromSimulator`.
  - `ImRepository` — per-session (agent-to-agent and group) message
    threads. Uses `SessionStartReply`/`IM_SessionAdd`.
  - Outbound `sendLocalChat(text, channel=0)` and
    `sendImTo(agentId, text)` flow through `ChatFromViewer` and
    `ImprovedInstantMessage` respectively.
- **Chat channel 0 rules**: agent typing is ASCII-filtered to
  client-legal chars; no control chars, UTF-8 allowed. Truncate to
  1023 bytes (server limit).
- **Acceptance**: Send "hello" to Agni channel 0 from the test
  account; the same account viewing from the official viewer sees
  "hello" echoed within 2 s.

### P2-PARCEL-01 — Parcel info

- **Input**: `ParcelOverlay`, `ParcelProperties`, `ParcelDwellRequest`.
- **Output**: `ParcelRepository` exposing the current parcel's name,
  owner, flags (allow-fly, allow-voice, etc.), music URL, media URL,
  landing point. No UI yet.
- **Acceptance**: In a scripted walk across parcel boundaries, the
  repository's state updates in <1 s of each crossing.

### P2-RENDERCTX-01 — Region feature flags to renderer seam

- **Input**: `CAP_SIMULATOR_FEATURES` (P2-CAPS-01 above).
- **Output**: A `RegionFeatureFlags` data class exposed on every
  `Region` with fields for: `supportsPbr`, `meshMaxSizeBytes`,
  `maxTextureDiscardLevel`, `maxPrimCount`, `allowsAvatarImpostors`,
  `supportsAnimatedObjects`, `supportsAis`. Consumed by Phase 4
  renderer and Phase 5 inventory.
- **Acceptance**: Flags are populated for Agni regions and readable
  via diagnostics.

## Files expected to change

- `Linkpoint/src/main/java/com/linkpoint/protocol/llsd/LLSDParser.kt`
- `Linkpoint/src/main/java/com/linkpoint/protocol/llsd/LLSDSerializer.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/protocol/messages/generated/` (generated)
- `Linkpoint/src/main/java/com/linkpoint/protocol/messages/MessageIds.kt`
- `Linkpoint/src/main/java/com/linkpoint/protocol/caps/CapabilityNames.kt`
- `Linkpoint/src/main/java/com/linkpoint/inventory/AisClient.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/inventory/db/*` (new Room)
- `Linkpoint/src/main/java/com/linkpoint/users/FriendsRepository.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/groups/GroupsRepository.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/chat/LocalChatRepository.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/chat/ImRepository.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/world/ParcelRepository.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/world/RegionFeatureFlags.kt` (new)
- `tools/protocol/generate_kotlin_parsers.py` (new)

## Exit criteria for Phase 2

- Template conformance test green; all ~450 messages classified.
- LLSD fuzz green for 5 minutes, no crashes.
- AIS inventory fetch produces identical tree to what the official
  viewer shows for the same account.
- Friends / groups / local chat / IM / parcel repos are populated and
  observable via the diagnostics surface.
- Zero literal capability name strings outside `CapabilityNames.kt`.
