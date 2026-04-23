# Lumiya 3.4.2 — Codebase Architecture

This document orients a new developer to the Lumiya Viewer codebase recovered
from `lumiya3.4.2.apk`. Where a package maps cleanly onto an open-source
Second Life artefact we link the upstream reference so that the reconstructed
Java code can be read alongside the spec it implements.

> Lumiya is a third-party Second Life client for Android. The original source
> was lost with the designer's laptop, so everything here was reconstructed
> from the published APK. See `recovered/README.md` for the reverse-
> engineering pipeline (jadx / apktool / Ghidra) and the raw artefacts.
> See `BUILD_STATUS.md` for what compiles today and what is still open.

## Second Life references

The official Linden Lab / Second Life open-source repos that are useful
alongside this codebase:

| Upstream | What it gives you | Where it matches in Lumiya |
| --- | --- | --- |
| [`secondlife/master-message-template`](https://github.com/secondlife/master-message-template) | Canonical UDP message template (`message_template.msg`, 483 messages, 241 KB). Checked in at `recovered/reference/message_template.msg`. | `app/src/main/java/com/lumiyaviewer/lumiya/slproto/messages/` implements **475 of the 483** defined messages (98.3%). Every `*.java` under that directory is a hand-rolled Java port of one message block. |
| [`secondlife/viewer`](https://github.com/secondlife/viewer) | The official C++ desktop viewer — reference implementation of the SL protocol, LLSD serialization, caps system, inventory, asset pipeline, rendering. | Cross-reference `indra/llmessage/`, `indra/llcommon/llsd*`, `indra/llinventory/`, and `indra/newview/` for protocol / data-model semantics that Lumiya ports. |
| [`secondlife/python-llsd`](https://github.com/secondlife/python-llsd) | Clean Python implementation of LLSD (XML / binary / notation). | `com.lumiyaviewer.lumiya.slproto.llsd.*` — LLSD streaming parser & node model. |
| [`secondlife/libremetaverse`](https://github.com/secondlife/libremetaverse) | Performance-oriented fork of the C# libopenmetaverse. The closest open-source peer to what Lumiya is in Java. | Whole of `slproto/` is the Java counterpart of libremetaverse's protocol layer — when in doubt about the wire format or a caps round-trip, look there. |
| [`secondlife/3p-openjpeg`](https://github.com/secondlife/3p-openjpeg) | SL's autobuild wrapper around OpenJPEG 2. | `libopenjpeg.so` in `app/src/main/jniLibs/` was built from this. `com.lumiyaviewer.lumiya.openjpeg.*` are the JNI wrappers. |
| [`secondlife/create`](https://github.com/secondlife/create) | Official creator documentation site source (Hugo). | Useful to understand UX semantics: inventory types, wearable slots, permissions masks, asset kinds. |

## Package map

All paths below are under `app/src/main/java/com/lumiyaviewer/lumiya/` unless
otherwise noted.

### Protocol layer — `slproto/`

| Sub-package | Responsibility | Upstream analogue |
| --- | --- | --- |
| `slproto/messages/` | 477 UDP message classes (one per Linden Lab message). Each encodes/decodes the bytes that go on the wire for that specific message. | `message_template.msg` |
| `slproto/llsd/` | LLSD parser, DOM model (`LLSDNode`, `LLSDNodeType`), streaming parser, XML serializer. | `python-llsd`, `indra/llcommon/llsd*` |
| `slproto/caps/` | HTTP "capabilities" URLs & event-queue polling. | `indra/newview/llviewerregion.cpp`, `llcapabilityprovider.h` |
| `slproto/types/` | Value types used in messages: `LLVector3`, `LLQuaternion`, `LLVector3d`, `CameraParams`, `ImmutableVector`, `VertexArray`, `LLTersePacking`. | `indra/llmath/` |
| `slproto/assets/`, `mesh/`, `textures/` | Asset fetch, mesh decoding, texture streaming/JPEG2000 pipelines. | `indra/llmessage/llassetstorage.cpp`, mesh pipeline around `llviewertexture.cpp` |
| `slproto/avatar/`, `baker/` | Avatar appearance, texture baking, wearable composition. | `indra/newview/llappearance*`, `lltexlayer.cpp` |
| `slproto/chat/`, `events/`, `handler/` | Chat plumbing, event plumbing, generic message handler registry. | — |
| `slproto/inventory/`, `objects/`, `prims/`, `terrain/`, `windlight/` | Inventory model, object/prim tracking, terrain patch decoding, sky/atmosphere parameters. | `indra/llinventory/`, `indra/newview/llviewerobject*.cpp`, `llsurface.cpp`, `llsettingssky.cpp` |
| `slproto/auth/`, `https/`, `dispnames/`, `users/`, `modules/`, `parcels` | Login XMLRPC auth, HTTP layer, display names, user/group cache, parcel info, pluggable modules. | `indra/newview/llstartup.cpp`, `indra/newview/llavatarnamecache.cpp` |
| `slproto/SL{Connection,Circuit,AgentCircuit,TempCircuit,GridConnection}.java` | UDP circuit lifecycle (the one per-simulator "circuit" that carries messages). | `indra/llmessage/llmessagesystem.cpp` |

### Rendering — `render/`

Custom OpenGL ES renderer that draws a Second Life scene on Android. Notable
sub-packages:

| Sub-package | Responsibility |
| --- | --- |
| `render/spatial/` | Spatial partitioning (`DrawList`, `DrawListEntry` hierarchy, octree-style culling). |
| `render/avatar/` | Avatar mesh/skinning (`DrawableAvatar`, attachments). |
| `render/prims/`, `render/mesh/` | Prim & rigged-mesh draw paths. |
| `render/shaders/` | GLSL shaders (under `app/src/main/assets/shaders/`). |
| `render/windlight/` | Sky/atmosphere / windlight cycle. |
| `render/world/`, `render/cardboard/` | Scene root, Google Cardboard (stereoscopic VR) renderer path for `CardboardActivity`. |

### Native code — `libs/*.so`, `jniLibs/`

| Library | Source | Notes |
| --- | --- | --- |
| `librawbuf.so` | Custom (8 JNI entry points, fully decompiled at `recovered/native/`) | Fast `memcpy` between `DirectByteBuffer`s and Java arrays. |
| `libopenjpeg.so` | [OpenJPEG](https://github.com/uclouvain/openjpeg) via [`secondlife/3p-openjpeg`](https://github.com/secondlife/3p-openjpeg) | JPEG 2000 codec for SL textures. Called from `com.lumiyaviewer.lumiya.openjpeg.*`. |
| `libgvr.so` | [Google VR SDK](https://github.com/googlevr/gvr-android-sdk) (deprecated) | Daydream/Cardboard runtime. The SDK has been sunset; the native lib is shipped as-is in `jniLibs/` because the Maven artefacts were removed. |

### UI — `ui/`

Everything the user sees. Each Activity has its own subdirectory; shared
widgets live under `ui/common/`.

| Activity (in manifest) | Package | Purpose |
| --- | --- | --- |
| `LoginActivity` | `ui/login/` | XMLRPC login, grid picker, saved credentials. |
| `ChatNewActivity` | `ui/chat/` | Local/IM chat UI. |
| `InventoryActivity` | `ui/inventory/` | Inventory browser, texture preview, notecard edit, upload. |
| `ObjectListNewActivity` | `ui/objects/` | In-world object list. |
| `WorldViewActivity` | `ui/render/` | The 3D scene. |
| `CardboardActivity`, `CardboardTransitionActivity` | `ui/render/` | VR variant of the scene (GVR / Daydream). |
| `MinimapActivity` | `ui/minimap/` | 2D minimap. |
| `SettingsActivity` | `ui/settings/` | Shared-preferences UI. |
| `MyAvatarActivity` | `ui/myava/` | Outfit / avatar-image management, transaction log. |
| `ManageGridsActivity`, `ManageAccountsActivity` | `ui/grids/`, `ui/accounts/` | Multi-grid / multi-account management. |
| `SearchGridActivity` | `ui/search/` | SL search grid (people, events, places, classifieds). |
| `StreamingMediaActivity` | `ui/media/` | Parcel streaming media playback. |
| `TeleportSLURLActivity` | `ui/login/` | `secondlife://` URL scheme handler. |

Shared widgets & helpers:

| Path | Notes |
| --- | --- |
| `ui/common/` | `ThemedActivity`, navigation drawer, loading layouts, swipe-dismiss, list adapters, lifecycle helpers. |
| `ui/notify/` | Notification channels, online/IM notifications. |
| `ui/voice/` | Voice-chat UI. |

### Persistence — `orm/`, `dao/`

greenDAO 2.x data access.

- `orm/` — `@Entity`-annotated data classes (friends, groups, chat history, transaction log, cached-asset metadata, search history, SL URLs, …).
- `dao/` — Generated-looking DAO classes (`DaoMaster`, `DaoSession`, plus one per entity). These were generated by the greenDAO 2.x compiler at build time in the original project; they are kept as source in the recovery.

### Eventing, DI-lite — `eventbus/`, `react/`

- `eventbus/` — Lumiya's thin wrapper over Guava's `com.google.common.eventbus.EventBus`. Single-threaded publish/subscribe with a few helper dispatchers.
- `react/` — A reactive subscription model (`Subscribable`, `Subscription`, `Pool`). Lumiya uses this for async data binding (e.g. a chatter name subscribing to the display-name cache).

### Misc

| Path | Notes |
| --- | --- |
| `base64/` | Public-domain Base64 impl (used where Android's built-in is unavailable on API 14). |
| `voice/`, `voiceintf/` | Vivox voice-chat client shim (JNI details live inside the voice AAR / `.so` that is not shipped with the APK — only the Java surface). |
| `cloud/` | Lumiya's own push / cloud-messaging endpoints. |
| `licensing/` | Play Store license check. |
| `sync/` | Background sync (groups / inventory). |
| `media/` | Media streaming helpers. |
| `utils/`, `res/` | Grab-bag helpers. |
| `LumiyaApp.java` | The `Application` subclass. Entry point for app-wide init. |
| `GridConnectionService.java` | Foreground service that owns the UDP circuit; survives Activity recreation. |
| `StreamingMediaService.java` | Foreground service for parcel-media playback. |

## Dependencies (modernised)

See `app/build.gradle` for the current resolved coordinates. Every third-party
package the decompilation imported is now satisfied by a Maven dependency,
except for the few that are no longer distributed:

| Package | Source |
| --- | --- |
| AndroidX / Material Components | Maven — latest stable (`androidx.*`, `com.google.android.material:*`). The decompiled `android.support.*` imports were rewritten to their AndroidX equivalents by `tools/migrate_androidx.py`. |
| OkHttp 3.14.9 + Okio 1.17.5 | Maven Central. The APK shipped 3.5.0; 3.14.9 is the last API-compatible 3.x release. |
| greenDAO 2.1.0 | Maven Central. Transitional dependency while Room migration is in progress. Remove once Room is authoritative for all active entities/queries and migrations are validated end-to-end. |
| ButterKnife 10.2.3 | Maven Central. Deprecated but final release. Transitional dependency: replace touched UI files with ViewBinding (preferred) or modern alternatives opportunistically; remove compiler/runtime after last consumer is migrated. |
| Gson 2.10.1, Guava 32.1.3-android, JSR-305 3.0.2 | Maven Central. |
| PagerSlidingTabStrip 1.0.1, nineoldandroids 2.4.0 | Maven Central. Kept at their last released versions. |
| **PhotoView** | Shipped in-tree at `uk/co/senab/photoview/` because no reliable Maven drop-in preserves the legacy package. Migration target: `com.github.chrisbanes:PhotoView:2.3.0` + rewrite of the one consumer (`TextureViewFragment`). |
| **Google VR SDK** | Shipped in-tree at `com/google/vr/` and `com/google/vrtoolkit/` plus `jniLibs/*/libgvr.so`. Google retired the SDK in 2019 and removed the Maven artefacts in 2021. Keep only until Cardboard/OpenXR replacement reaches parity and rollout confidence gates are met; then remove in-tree packages + `libgvr.so`. |
| **protobuf-nano** | Shipped in-tree at `com/google/protobuf/nano/`. protobuf-javanano was discontinued. Only the GVR stack uses it, so remove with the GVR teardown after parity/rollout confidence is established. |

### Dependency cleanup gates (post-functional migrations)

- **GVR teardown gate:** remove `com/google/vr/**`, `com/google/vrtoolkit/**`, `com/google/protobuf/nano/**`, and `jniLibs/*/libgvr.so` only after Cardboard/OpenXR parity is verified and staged rollout health is stable.
- **Persistence teardown gate:** remove greenDAO runtime + generated DAO surface only after Room migration completion (entities, queries, schema migration tests).
- **UI modernization gate:** replace ButterKnife in files touched by feature/fix work using ViewBinding-first opportunistic cleanup; avoid all-at-once rewrites unless explicitly scheduled.

## Protocol modernization guardrails

For modernization work in protocol packages, use `docs/protocol_migration_conformance.md` as the required safety checklist. It maps LLSD/inventory classes to official `secondlife/viewer` and `secondlife/python-llsd` references, defines Room-entity annotation expectations for protocol-derived storage, and documents the conformance scripts run in CI.

## Kotlin modernization guardrails

Use `docs/kotlin-migration-plan.md` for Kotlin adoption boundaries. It defines the touch-only Java conversion rule and marks VR abstraction, repository, and new data-layer package roots as Kotlin-first for all newly created classes.

## Development tips

- The project is built against `compileSdk 34`, `minSdk 26`, `targetSdk 34`.
- Minimum SDK is intentionally pinned to Android 8.0 (API 26): this lets us remove legacy pre-Oreo compatibility branches and rely on framework notification channels/runtime behavior consistently across the app.
- Service startup code assumes the Oreo+ foreground-service contract (`ContextCompat.startForegroundService`) for long-lived connection/media entry points; API 21–25 start-service compatibility shims are intentionally removed.
- Release builds currently run with `minifyEnabled false` so stack traces stay readable. When you turn R8 back on, use `proguard-rules.pro` to keep classes reflected on by greenDAO, ButterKnife, JNI, and the Second Life JSON/LLSD types.
- Run with `./gradlew :app:assembleDebug`. See `BUILD_STATUS.md` for the known set of remaining decomp artefacts.
- For Second Life protocol debugging, keep `recovered/reference/message_template.msg` open in a split pane — the message classes under `slproto/messages/` are 1:1 with the blocks in that file.
