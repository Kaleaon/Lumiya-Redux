# Acceptance Criteria

This is the cumulative "are we done" checklist, per phase. A phase is
accepted when **every** box under it is green. No partial credit; no
"works on my machine"; acceptance is CI-verified or explicit manual
sign-off from a named reviewer.

Use this file as the template for the "Phase N exit review" PR. Copy
the section, check the boxes, link the evidence.

## Phase 0 — Baseline

- [ ] `./gradlew :Linkpoint:assembleDebug` finishes green on a fresh
      CI runner in <20 min.
- [ ] Two consecutive CI runs on the same commit produce byte-identical
      APKs (`sha256sum` match).
- [ ] `./gradlew dependencies` shows a single Kotlin stdlib version
      and zero `-beta`/`-rc`/`-SNAPSHOT` versions.
- [ ] Release build has `isMinifyEnabled = true`,
      `isShrinkResources = true`; APK ≤60% of the un-minified size;
      launches to login screen without ClassNotFound errors.
- [ ] `.github/workflows/build.yml` runs on every PR; failing build
      blocks merge.
- [ ] `gradle.properties` re-enables parallel / daemon / caching /
      config cache; build time drops ≥40% from the Apr-2026 baseline.
- [ ] Four flavors (`dev` / `alpha` / `beta` / `stable`) install
      simultaneously without conflict.
- [ ] Smoke test (`docs/modernization/smoke-test.md`) passes three
      times on emulator API 34 and one physical device.

## Phase 1 — Circuit & Login

- [ ] `LoginClient` integration test (real test creds) succeeds with
      a populated `SessionSnapshot`.
- [ ] `HandshakeStateMachine.state = Live` within 15 s on a 10 Mbit
      connection to Agni.
- [ ] Session stays `Live` for ≥10 min idle with zero reconnects,
      zero handler exceptions.
- [ ] Packet-loss injection test (10% loss, qdisc) stays connected;
      no retransmit storms.
- [ ] Zero `runBlocking` in `protocol/` and `network/`.
- [ ] AgentUpdate cadence ~10 Hz foreground, ~1 Hz background.
- [ ] Connection diagnostics surface readable via `adb shell content
      query`; integration test asserts post-bringup state.
- [ ] Full upstream canonical CAPS list requested; response logged
      with count ≥20 on Agni.
- [ ] Event queue ack monotonically increases over a 10 min sample.

## Phase 2 — Protocol Parity

- [ ] Template conformance test green; all ~450 messages classified
      (Supported / Declared-only / Deprecated).
- [ ] LLSD fuzzer green for a continuous 5-minute budget on PRs
      touching `protocol/llsd/`.
- [ ] LLSD round-trip corpus bytes-identical to upstream's output.
- [ ] AIS inventory fetch result matches upstream viewer's tree
      (item / folder count / UUIDs) for the test account.
- [ ] `FriendsRepository` reflects online/offline transitions within
      2 s of counterpart state change.
- [ ] `LocalChatRepository` round-trip (send / receive / echo)
      verified across two accounts.
- [ ] Region-cross integration test: no cap-table gap, event queue
      for old region cleaned up after new one is live.
- [ ] Zero literal cap-name strings outside `CapabilityNames.kt`.
- [ ] `UUID.ZERO` grep in outbound message builders returns zero
      non-test hits.

## Phase 3 — Assets

- [ ] 500 SL textures decode without error; mean decode ≤80 ms
      (@ discard=0) on Snapdragon 778-class.
- [ ] Zero native leaks over 10,000 J2C decodes (tracked under
      `AddressSanitizer` or equivalent).
- [ ] 50-mesh corpus decodes; vertex counts match upstream.
- [ ] Scripted-walk cache hit rate ≥85% on second pass through a
      populated region.
- [ ] Avatar bake fetch populates skin/upper/lower/eyes/hair within
      10 s of rez.
- [ ] Texture upload round-trip (client → grid → upstream viewer
      sees it) succeeds with correct permissions.
- [ ] Bandwidth throttle at 1 Mbps keeps receive rate <110 kB/s.

## Phase 4 — Rendering (4a)

- [ ] User logs in and sees terrain, water, sky, avatars, prims,
      meshes.
- [ ] 30 fps floor in a typical region; 60 fps on flagship hardware.
- [ ] Camera orbit / mouselook / free-camera work with gesture feel
      parity to Lumiya.
- [ ] 30-min traversal of 5 regions, zero crashes.
- [ ] `FilamentSurfaceView` orientation-change loop (100×) produces
      ±5% native-memory drift.
- [ ] 5,000-prim region populates in ≤10 s.
- [ ] Sun position matches upstream viewer ±2° over simulated
      24 h cycle.

## Phase 4b — Rendering polish

- [ ] PBR content renders with correct metallic-roughness response.
- [ ] Shadows togglable; <10% fps cost at medium preset.
- [ ] Tone-mapping + bloom on by default; quality preset-controlled.

## Phase 5 — UX

- [ ] Every task in `07_phase_5_ux.md` has a live screen tested
      end-to-end against a real grid.
- [ ] Accessibility Scanner pass with zero Critical findings.
- [ ] Pseudo-locale (`en-rXA`) reveals zero hardcoded strings.
- [ ] No `TODO`/`FIXME` banners visible to users.
- [ ] Inventory scroll at 60 fps over 50k items.
- [ ] Manhattan-teleport test (20 named regions, sequential
      teleport) completes without error.
- [ ] Light / dark / Material-You themes readable on every screen.

## Phase 6 — Voice

- [ ] Parcel / private / group voice channels all reach `Live`
      within 10 s.
- [ ] Spatial attenuation curve matches spec ±10%.
- [ ] PTT / open-mic / muted modes behave correctly.
- [ ] Device routing transparent across BT hotplug; no glitch
      >200 ms.
- [ ] No Vivox references remain in code or deps.

## Phase 7 — Architecture

- [ ] `LinkpointApp.kt` <300 lines.
- [ ] Zero `runBlocking`, zero `GlobalScope`, zero `throws` in
      production suspend APIs (lint-enforced).
- [ ] Module graph clean; zero cycles.
- [ ] Every class header documents thread ownership; lint green.
- [ ] Logs redacted per `R-SEC-01`; release flavour logcat shows
      only `WARN`/`ERROR`.
- [ ] Monkey 1,000-event run produces zero ANR, zero StrictMode
      violation.

## Phase 8 — Security & Compliance

- [ ] LLSD + UDP parser fuzz 24 h clean on CI cron.
- [ ] MITM on release flavour fails (pinning holds).
- [ ] Credential storage has no plaintext fallback; biometric gate
      works.
- [ ] Runtime permissions are lazy, rationale-backed, deny-path
      graceful.
- [ ] No `WRITE_EXTERNAL_STORAGE` in the manifest.
- [ ] Dependency-Check + `gitleaks` green.
- [ ] TPV compliance matrix published, linked, tested, with DMCA
      contact routed to a real mailbox.
- [ ] Content-permissions respect: no-transfer / no-copy export
      paths blocked with user-readable messaging.
- [ ] Google Play Data Safety form completed and matches observed
      traffic.

## Phase 9 — Release

- [ ] Tag-triggered release pipeline delivers Play internal build
      and GitHub Release within 30 min.
- [ ] Release keystore backed up, fingerprint published, rotation
      playbook dry-run successful.
- [ ] Four channels installable side-by-side.
- [ ] Sideload update feed works; in-app updater prompts, verifies
      SHA-256, hands to installer.
- [ ] Staged rollout configured (1% → 5% → 25% → 100%).
- [ ] Rollback playbook rehearsed.
- [ ] Opt-in telemetry default-off; view-outgoing surface present.
- [ ] User documentation linked in-app and from Play.
- [ ] Eight launch locales complete.
- [ ] Lumiya-Redux archived read-only with pointer to Linkpoint.

## The shipped client

The whole program is "done" when a Second Life user can:

- [ ] Find the app in the Play Store.
- [ ] Install on Android 8+ without sideload steps.
- [ ] Log in with their SL credentials (+ MFA where required).
- [ ] See their avatar in their home region with correct appearance.
- [ ] Walk, fly, teleport, chat (local + IM + group), pay, manage
      inventory, view profiles, use voice.
- [ ] Receive push notifications for IMs and friend events while the
      app is backgrounded.
- [ ] Experience 30 fps+ rendering with correct day-night cycle and
      basic lighting.
- [ ] Use the app for an hour without crashes or memory growth.
- [ ] Update the app on their own terms through Play or sideload.
