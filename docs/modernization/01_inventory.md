# 01 — Inventory

What actually exists in each tree, as of April 2026. Numbers rounded;
structure exact. File paths are relative to each repo root.

## Lumiya-Redux (this repo)

### Source

- `app/src/main/java/com/lumiyaviewer/lumiya/` — ~1,481 Java files, fully
  AndroidX-migrated (305 files / 1,003 imports rewritten by
  `tools/migrate_androidx.py`).
- `recovered/` — raw jadx/smali outputs kept for provenance.
- `recovered/reference/message_template.msg` — upstream SL message
  template, byte-identical to `secondlife/master-message-template`
  `message_template.msg`.

### Key modules (protocol only)

| Path | What it does | Reference health |
| --- | --- | --- |
| `slproto/SLAgentCircuit.java` | UDP circuit, message dispatch | **Reliable reference.** Behaviour mirrors 10-year working app. |
| `slproto/SLGridConnection.java` | Login → circuit bringup | Reliable reference. |
| `slproto/caps/SLCaps.java` | CAPS fetch | Reliable; already extended with upstream canonical cap list in this repo. |
| `slproto/https/SLHTTPSConnection.java` | okhttp wrapper, DoH fallback | Reliable reference (static IP fallback for `login.agni.lindenlab.com` may be stale). |
| `slproto/llsd/*` | LLSD XML/binary/notation | Reliable reference. |
| `slproto/messages/*.java` | ~450 generated message classes | Mechanically faithful to `message_template.msg`. |
| `slproto/auth/SLAuth.java` | `SendLoginRequest` | **Broken stub.** `throws new UnsupportedOperationException(...)`. Must reconstruct against upstream `llstartup.cpp`. |
| `slproto/modules/texfetcher/SLTextureFetcher.java` | UDP-only texture fetch | Reliable reference, but UDP-only — no `GetTexture` CAP path implemented even though the cap URL is read. |

### Build

- Gradle 8.10.2, AGP 8.7.3, JDK 21, compileSdk 34, minSdk 26.
- `./gradlew :app:compileDebugJavaWithJavac` reports ~100 errors across
  ~60 files. Every remaining error is a jadx artefact, catalogued in
  `BUILD_STATUS.md` into four patterns.

### Docs worth keeping

- `docs/kotlin-migration-plan.md` — touch-only Kotlin migration policy.
- `docs/protocol_migration_conformance.md` — LLSD / inventory / message
  template conformance contract.
- `docs/llsd_edge_case_conformance.md` — LLSD edge-case matrix.
- `docs/secondlife_apk_2026_analysis.md` — SL 2026 Android APK
  reverse-engineering record (added this session).
- `tools/protocol/verify_message_template_conformance.py` — automated
  check against `message_template.msg`.

## Linkpoint (`github.com/Kaleaon/Linkpoint`)

### Source layout

```
Linkpoint/
  src/main/java/com/linkpoint/        ~322 Kotlin files, ~93K LOC
    animesh/    avatar/     assets/     auth/       bom/
    chat/       core/       diagnostics/ economy/   groups/
    hud/        i18n/       inventory/  media/      messaging/
    network/    notifications/ objects/  protocol/  push/
    render/     rlv/        scripts/    service/    services/
    snapshot/   teleport/   ui/         users/      util/
    utils/      voice/      world/      world3d/    xr/
  src/main/cpp/                       basis_universal, zstd,
                                      openjpeg JNI, vivox/audio/rawbuf stubs
  src/main/res/                       Compose + xml resources
  src/main/appres_old/                archived Lumiya resource dump, do not edit
  src/test/kotlin/com/linkpoint/      13 test files (see below)
  build.gradle.kts                    Kotlin 2.2.21, AGP 8.6.1, compileSdk 35
```

### Package LOC (top hitters)

| Package | Files | LOC | Notes |
| --- | --- | --- | --- |
| `protocol/` | 51 | 20,136 | messages, circuit, llsd, caps, translation |
| `ui/` | 72 | 17,810 | Compose screens + ViewModels |
| `network/` | 20 | 8,577 | UDP/HTTP, DNS, quality, diagnostics |
| `render/` | 43 | 8,831 | Filament + scene graph + prims |
| `world/` | 11 | 4,954 | region/parcel/terrain state |
| `avatar/` | 11 | 3,459 | appearance, baking, animation |
| `assets/` | 8 | 3,635 | JPEG2000, mesh, cache |
| `inventory/` | 5 | 2,815 | AIS v3, outfits |
| `objects/` | 6 | 2,724 | prims, selection |
| `core/` | 5 | 2,012 | `LinkpointApp.kt` (5,080 lines alone) |

### Notable files

- `protocol/circuit/LinkpointThreadedCircuit.kt` (1,061 lines) — port of
  Lumiya's single-threaded UDP circuit. Per Apr 2026 tracking, now
  activated via `LinkpointCircuitIntegration.initialize()`.
- `protocol/messages/UDPConnectionFixed.kt` — legacy coroutine-based path
  that once used `runBlocking`; partially cleaned up.
- `protocol/llsd/LLSDParser.kt` — LLSD parser with known
  unbounded-allocation holes (REVIEW.md §3 critical).
- `auth/MfaHashStorage.kt` — MFA secret storage; currently falls back to
  plaintext on `EncryptedSharedPreferences` failure.
- `render/filament/` (12 files per `FILAMENT.md`) — Filament engine
  lifecycle, surface view, world renderer, material/texture managers,
  terrain, glTF, avatar, lighting, performance optimizer.
- `LLSD-KOTLIN/` — standalone LLSD library, 34 Kotlin + 67 Java files,
  candidate for extraction to its own Maven artifact.

### Tests

13 test files. Strong in: `NetworkExceptionUtilsTest` (46 tests),
`ChatManagerTest`, `ConnectionDiagnosticTest`, `NetworkQualityTest`.
Minimal in: `LLSDParserTest` (2 tests), `LLSDMapTest` (3), 
`RegionHandshakeParserTest` (1), `TerrainPatchTest` (1).
Integration: `ConnectionIntegrationTest` can do real login with test
credentials.

### Known-bad patterns (from Linkpoint/REVIEW.md)

- **God class.** `LinkpointApp.kt` at 5,080 lines, 62 `lateinit var`
  managers, ~100 UDP handler registrations.
- **Race-condition pattern.** `if (::managerX.isInitialized) managerX.call()`
  used ~100 times; non-atomic.
- **Memory-leak risk.** ~100 `registerHandler` calls with no
  corresponding `unregister`.
- **Inconsistent cleanup.** `onTerminate()` has `isInitialized` guards on
  some managers, not others.
- **Build misconfig.** Kotlin 1.9.22 in root `build.gradle` vs 2.2.21 in
  module `build.gradle.kts`; Compose compiler 1.5.10 expects Kotlin
  1.8–1.9; JVM target 1.8 with JDK 21 runtime; release `isMinifyEnabled =
  false` and `isShrinkResources = false`.
- **Beta deps in production.** `openjpeg-ndk26-static:2.5.0-beta-4`, KTX
  `1.12.1-rc1`.
- **Unbounded channels.** `CircuitTaskQueue` uses `Channel.UNLIMITED`.
- **LLSD parser.** `ByteArray(len)` from untrusted `len`; no size cap.

## `secondlife/viewer` (LGPL upstream, reference only)

Files we cite by name in this plan. We do not vendor upstream source; we
cross-reference it.

| Upstream file | What it tells us |
| --- | --- |
| `indra/newview/llviewerregion.cpp` | `LLViewerRegionImpl::buildCapabilityNames` — canonical CAP list. |
| `indra/newview/llaisapi.cpp` / `llaisapi.h` | AIS v3 inventory cap names and URL shape. |
| `indra/newview/llstartup.cpp` | `login_to_simulator` XMLRPC param struct. |
| `indra/newview/llappviewer.cpp` | Startup sequence, circuit bringup timing. |
| `indra/newview/lleventpoll.cpp` | Event-queue long-poll semantics. |
| `indra/llmessage/message_template.msg` | Wire protocol master. Already mirrored into `recovered/reference/`. |
| `indra/llmessage/llmessagetemplate.cpp` | Template-driven encode/decode rules. |
| `indra/newview/lltexturefetch.cpp` | Texture fetch priorities, bandwidth throttling. |
| `indra/llprimitive/llprimitive.cpp` | Primitive serialization. |
| `indra/newview/llvoavatar*.cpp` | Avatar appearance pipeline. |
| `indra/llrender/llimagej2c*.cpp` | JPEG2000 discard-level semantics. |

## Assets & binary artefacts available

- `artifacts/secondlife/secondlife2026.3.1089.apk` — latest first-party
  Android client (Unity + IL2CPP, base APK only — native libs in split
  APKs). Already mined for endpoints in
  `docs/secondlife_apk_2026_analysis.md`.
- `app/src/main/jniLibs/` — `librawbuf.so`, `libopenjpeg.so`, `libgvr.so`
  (32/64-bit) from the original Lumiya APK.
- Linkpoint `src/main/cpp/` — source-built `basis_universal`, `zstd`,
  `openjpeg` integration; stubs for `rawbuf`, `vivox`, `audio`.

## What's missing that we will need

- **Real login credentials for CI integration tests.** Must be a dedicated
  test account; don't use a human's primary. Stored as CI secret; never
  committed.
- **A mesh test region.** A Second Life region we control or a known
  public region used as a fixture, with known-stable object count for
  scene-parity golden tests.
- **A reproducible emulator config** for UI/renderer tests (Android API
  34, 1080×2400, Vulkan-capable).
- **A dedicated Filament material author tooling.** Filament compiles
  `.mat` → `.filamat` via `matc`; current Linkpoint ships prebuilt files.
  Build step needs a host `matc` binary in CI.
