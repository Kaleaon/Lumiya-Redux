# Lumiya-Redux vs. modern Second Life viewers: gap analysis, Filament plan, upgrades

Review date: 2026-09-24, against `main` at `4bf5ca4` (all 1,302 Java classes
compiled from source, 0 damaged classes per `tools/verify`).

This document answers three questions:

1. What does Lumiya 3.4.2 lack compared with the viewers people use on Second
   Life today, and which gaps actually break things?
2. How can Google Filament (and other current Android code) be brought in
   without throwing away the verified recovery?
3. Which upgrades are concrete enough to do now?

Section 6 lists what this branch already changed. Everything else is a plan.
The phase documents in this directory (`06_phase_4_rendering.md`,
`08_phase_6_voice.md`, `10_phase_8_security.md`) were written against the
Linkpoint code base. This document grounds the same goals in the recovered
Lumiya classes they have to change.

Where this document states something about the live grid or upstream viewers
that could not be checked from this repository, it says so. Check those
statements against current `secondlife/viewer` sources before relying on them.

---

## 1. Where the code stands

| Area | State | Notes |
| --- | --- | --- |
| Size | 1,302 Java files, ~139 k lines, 0 Kotlin | 477 of them are UDP message classes. |
| Renderer | Custom GLES 1.1 / 2.0 / 3.0, 106 classes under `render/` | Forward renderer. Blinn-style prim shading, FXAA, Windlight sky dome, simple water. No shadows, PBR or point lights. |
| Native | `libopenjpeg.so` (OpenJPEG **1.5.0**, 2012), `librawbuf.so`, `libgvr.so` | `libopenjpeg.so` also holds 18 renderer helpers (skinning morphs, flexi, terrain bake, frustum culling, `drawBuf`). Only `librawbuf` has recovered C. |
| VR | GVR (Daydream/Cardboard SDK, retired 2019) behind the new `VrRuntime` seam | OpenXR runtime stub exists (`ui/render/vr/OpenXrRuntime.java`). |
| Persistence | greenDAO 2.1 with a Room mirror in progress | See `data/room`. |
| Network | OkHttp 3.14.9, XML-RPC login, LLSD/XML caps, UDP circuit | OkHttp 3.x reached end of life in 2021. |
| Voice | Vivox, through a separate plugin APK (`voice/common/VoicePluginMessenger`) | The plugin is not part of this repo. |
| UI | Activities + Fragments, ButterKnife in 17 files, 6 `AsyncTask`s, framework `android.preference` in 11 files | |

The recovery is excellent groundwork: every class is verified against the
shipped bytecode, and the existing seams (`RenderBackend`, `GpuCapabilities`,
`VrRuntime`, the Room adapters) are in the right places. The main
architectural risk for Filament is covered in §4.1. The render seam that
exists today is at the wrong level for a retained-mode engine.

---

## 2. Compared with modern viewers

Reference points:

* **Second Life Viewer 7.x** (`secondlife/viewer`), the Linden Lab desktop
  viewer.
* **Firestorm 7.x**, the most-used third-party viewer. It follows the Linden
  Lab viewer's rendering and protocol features.
* **Cool VL Viewer** and **Alchemy**: smaller third-party viewers that stay
  close to upstream.
* **Second Life Mobile**, Linden Lab's own mobile client. Its Android APK is
  analysed in `docs/secondlife_apk_2026_analysis.md`.

Legend: **Breaks** means content fails to show or a feature fails on the
current grid. **Looks wrong** means content shows but renders incorrectly.
**Missing** means a feature is absent.

### 2.1 Protocol and grid features

| Feature (year in SL) | Lumiya 3.4.2 | Impact | Where to implement |
| --- | --- | --- | --- |
| `ViewerAsset` capability for textures, meshes, animations, sounds and settings (~2020–21) | Knew only `GetTexture` / `GetMesh` | **Breaks.** Current SL viewers fetch everything through `ViewerAsset`, and the per-asset caps are believed retired on Agni. Meshes could not load, and textures fell back to slow UDP. | **Done on this branch** (§6). |
| Multi-factor authentication at login (2022) | Not supported | **Breaks** for accounts with MFA enabled. Login returns `reason = "mfa_challenge"`, and the viewer must re-send with `token` (and later `mfa_hash`). | `slproto/auth/SLAuth.SendLoginRequest`, `SLAuthReply`. Add a token prompt in `ui/login/LoginActivity`. Reference: `indra/newview/lllogininstance.cpp`. |
| Bakes on Mesh, BOM (2019) | Not supported. Only the 6 legacy bake slots (`BakedTextureIndex`). | **Looks wrong.** Most mesh bodies and heads show the placeholder "use baked texture" UUIDs instead of the skin. This is the most visible avatar gap. | Map the `IMG_USE_BAKED_*` UUIDs (`indra/llprimitive/llprimitive.h` / `lltextureentry`) to the wearer's bakes when building `DrawablePrim` faces for attachments. Add the 5 newer bake slots (`BAKED_LEFT_ARM`, `BAKED_LEFT_LEG`, `BAKED_AUX1..3`, texture entries 40–44). See §5.2. |
| Animesh (2018) | Parsing only. Extra-param `0x70` (extended mesh) is ignored. | **Looks wrong.** Animated mesh objects stand frozen in bind pose. | `PrimVolumeParams.unpackExtraParams`, `ObjectAnimation` message, drive an `AvatarSkeleton` per object. |
| Environment Enhancement Project, EEP (2019) | Built-in Windlight day cycle from `assets/windlight`, sun hour from the sim | **Looks wrong.** Region and parcel skies and water settings are ignored. | `ExtEnvironment` cap (region/parcel LLSD) plus settings assets through `ViewerAsset?settings_id=`. |
| PBR / glTF materials (2023) | None. Extra-param `0x80` (render material) is ignored. | **Looks wrong.** New content made for PBR shows its fallback or a blank texture. | `RenderMaterials`-era material assets, GLTF material overrides (`GenericStreamingMessage`). Needs a PBR-capable renderer, so it is the main driver for Filament (§4). |
| Legacy materials: normal and specular maps (2013) | Not rendered | Looks flat | Filament legacy material (§4.3). |
| Point lights (extra-param `0x20`) and projectors (`0x40`) | Ignored | Night scenes are unlit | Parse in `unpackExtraParams`. Render in Filament (§4.3). |
| Reflection probes and mirrors (2023–24) | None | Cosmetic | Filament IBL. Low priority on mobile. |
| AIS3 inventory (`InventoryAPIv3`) | Uses `FetchInventoryDescendents2` | Slower. Some newer inventory operations (thumbnails, some link operations) need AIS3. | New repository behind the existing inventory seam. |
| WebRTC voice (2024–25) | Vivox only, through an external plugin | **Breaks** once Vivox is withdrawn on the grid. Check the current status with LL's announcements. | `ProvisionVoiceAccountRequest` with `voice_server_type=webrtc`, then the `VoiceSignalingRequest` cap. Android has a native WebRTC stack (for example `io.github.webrtc-sdk:android`). This removes the separate plugin APK. |
| Server-side appearance (2013) | Supported (`UpdateAvatarAppearance`, appearance-service bake URLs) | OK | |
| Display names, group chat, IM, search | Supported | OK | |

### 2.2 Platform and security

| Item | Finding | Severity |
| --- | --- | --- |
| TLS | `SLHTTPSConnection` installs a trust-everything `X509TrustManager` **and** a hostname verifier that returns `true`, for every HTTPS call including login (password hash) and caps. Modern viewers verify certificates: the SL viewer ships a CA bundle (`indra/newview/app_settings/ca-bundle.crt`). | **P0 security.** Any on-path attacker can capture the login hash and session. See §5.1 for a rollout that won't strand OpenSimulator users. |
| 16 KB page size | `jniLibs/arm64-v8a/libgvr.so` and both `x86_64` libraries have 4 KB `LOAD` alignment (`readelf -lW`). Android 15+ devices with 16 KB pages cannot load them, and Google Play requires 16 KB compatibility for apps targeting API 35+. | **P1.** Rebuilding `libopenjpeg`/`librawbuf` from source and removing GVR fixes it. |
| OpenJPEG 1.5.0 | 2012 release. Many CVEs were fixed in 2.x. It decodes untrusted J2C data from the grid. | P1 |
| OkHttp 3.14.9 | No longer maintained | P2. Move to OkHttp 4.12 (same `okhttp3` package, Kotlin runtime). |
| `targetSdk 34` | Play requires API 35 for new updates. This needs edge-to-edge handling and 16 KB libraries. | P2 |
| Login identity | `viewer_digest` is a fixed UUID, and `mac` is `MD5("android_id")` (a constant string). Both are honest but meaningless. | Low. Keep the TPV-policy identification. |

### 2.3 Rendering quality compared with desktop viewers

The LL viewer's current pipeline is deferred PBR with reflection probes, HDR
and tone mapping, SSAO, and cascaded sun shadows. Lumiya is a forward
per-face renderer with no lighting beyond the sun and ambient. On mobile, a
forward+ PBR renderer such as Filament is the realistic way to close most of
that gap within a phone's power budget.

---

## 3. Code-quality findings

### 3.1 Bugs fixed on this branch

These are real 3.4.2 bugs, not decompiler damage. The verifier confirmed the
source matched the original bytecode.

1. **`MeshCache.MeshDownloadRequest.run()`** kept looping after a successful
   download. Every mesh was fetched **twice**, the request was completed
   twice, and then completed a third time with `null`. A consumer that acts
   on the last callback therefore saw "mesh failed".
2. **Mesh URL lost on GL context recreation.** `MeshCache` belongs to the
   per-`RenderContext` `DrawableStore`, but the URL was only set on an
   agent-circuit event. When the EGL context was lost (preserve-on-pause is
   best-effort), the new `MeshCache` had no URL. Each mesh request then
   blocked an `HTTPFetchExecutor` thread forever, and that is the same pool
   textures use.
3. **Texture fetch with no HTTP cap** built the URL `"null/?texture_id=…"`,
   hit `MalformedURLException` and gave up without trying the UDP path the
   code was written to fall back to.

### 3.2 Patterns to fix next

* **Waits that never time out.** `MeshCache` blocks on `capURLlock.wait()`
  with no timeout and swallows interrupts. Replace it with a bounded wait, or
  queue requests until the URL arrives.
* **Shared HTTP pool.** Mesh and texture fetches share `HTTPFetchExecutor`,
  whose size is set by `setMaxTextureDownloads`. A slow mesh endpoint starves
  textures. Use separate pools, or one OkHttp `Dispatcher` with per-host
  limits (what the LL viewer's `LLCore::HttpRequest` policy classes do).
* **Ad-hoc threading.** There are `new Thread(` in 15 files, `Handler(` in
  59 and `synchronized` in 75. Migrate these to coroutines with structured
  cancellation as each file is touched, following the Kotlin-first package
  policy that already exists.
* **Caching.** Asset files are written without size limits in some caches,
  and a cached mesh that fails to parse is kept forever. Delete it on parse
  failure.
* **Guava EventBus** (3 files) and the home-grown `react/` layer. Move to
  Kotlin `Flow`/`StateFlow` at the repository boundary.

---

## 4. Bringing in Google Filament

Filament (`com.google.android.filament`, **1.77.0** on Maven Central as of
2026-09-21) fits this project:

* It is a physically based renderer built for Android: GLES 3.0+ and Vulkan
  backends, plus a feature level 0 path for GLES 2.0 devices.
* **Its PBR model is glTF 2.0 metallic-roughness**, the same material model
  Second Life adopted. `gltfio` can load the materials directly.
* It includes cascaded shadow maps, IBL, bloom, FXAA/TAA, tone mapping,
  dynamic resolution and **stereoscopic/multiview rendering** for VR.
* Materials are compiled offline by `matc` (published on Maven Central as
  `com.google.android.filament:matc`, alongside `filament-android`,
  `gltfio-android`, `filament-utils-android` and `filamat-android`).

### 4.1 The seam has to change

`render/backend/RenderBackend` wraps **immediate-mode GL calls**
(`useProgram`, `bindTexture2D`, `setUniform4f`, `submitMeshDraw`).
Filament is **retained-mode**: you create entities, vertex and index
buffers, material instances and transforms once, then update them. Filament
does not let you issue GL calls, so a Filament implementation of
`RenderBackend` is impossible. `ExperimentalRenderBackend extends
LegacyGlesBackend` will stay a dead end.

The seam should sit one level up, at **scene changes**, not draw calls:

```
slproto (ObjectUpdate, KillObject, terse updates, LayerData, AvatarAppearance)
        │
        ▼
SpatialIndex / SLObjectInfo  ──►  SceneDelta queue (bounded, like P4-SCENE-01)
        │                                  │
        ▼                                  ▼
 Legacy GLES renderer               FilamentSceneBridge (Kotlin, engine thread)
 (current DrawList walk)            entity per prim face-group / avatar / patch
```

* `SceneDelta` has these variants: `ObjectAdded(localId, params)`,
  `ObjectTransform(localId, pos, rot, scale)`, `ObjectTextures(localId, te)`,
  `ObjectRemoved(localId)`, `TerrainPatch(x, y, heights)`,
  `AvatarAppearance(id, bakes, visualParams)`, `Environment(settings)`.
  It is produced where `SpatialObjectIndex` is updated today.
* Both renderers consume the same deltas, so the legacy renderer stays the
  fallback for `GpuCapabilities.CompatibilityTier.TIER_C` and for A/B checks
  against the golden images in `docs/shader_parity_inventory_and_milestones.md`.
* Geometry generation (`PrimVolume`, `PrimProfile`, `PrimPath`, the sculpt
  and mesh decoders) is renderer-independent CPU code. **Reuse it as is.**
  `DrawableGeometry`'s vertex buffers are copied into Filament
  `VertexBuffer`s. Tangent frames come from `SurfaceOrientation` (Filament
  wants quaternion tangents).

### 4.2 Threading and lifecycle

* Filament's `Engine` calls must come from one thread. Use a dedicated
  "engine thread". Decoders keep running on the existing executors and post
  results through a queue, the same pattern as the
  `SynchronousExecutor`/`renderThreadExecutor` in `WorldViewRenderer`.
* Use `UiHelper` with `SurfaceView` (or `TextureView` for the chat overlay
  view) and `DisplayHelper` for refresh rate. `Choreographer` drives frames.
* Lifecycle: create the engine once per process, and create or destroy the
  `SwapChain` with the surface. This avoids the context-loss problem fixed in
  §3.1 by design.

### 4.3 Materials

Compile these `.mat` files at build time with a Gradle task that runs `matc`:

| Material | Covers | Filament model |
| --- | --- | --- |
| `sl_legacy.mat` | Diffuse texture and colour, texture transform (repeats, offset, rotation from the texture entry), alpha modes none/blend/mask/emissive, glow, legacy normal and specular maps | `lit`, specular-glossiness-style parameters mapped to roughness |
| `sl_fullbright.mat` | Fullbright faces, hover text, HUDs | `unlit` |
| `sl_pbr.mat` or gltfio `UbershaderProvider` | SL glTF materials, including `KHR_texture_transform` and overrides | `lit`, metallic-roughness |
| `sl_terrain.mat` | 4 detail textures blended by height and noise, as in `llvlcomposition.cpp`. PBR terrain later. | `lit` |
| `sl_water.mat` | Water plane with scrolling normals. Reflections come later. | `lit`, `blending: transparent` |
| `sl_sky.mat` | Port of `sky.fsh`/Windlight, then EEP parameters | `unlit` on a skydome, sun as a directional `LightManager` light |
| `sl_avatar.mat` | Skinned avatar body and rigged mesh (4 weights per vertex, fits Filament's 4-bone skinning; the bento skeleton fits the 256-bone limit) | `lit`, skinning |

Point lights (extra-param `0x20`) map to Filament `LightManager.Type.POINT`
with falloff, and projectors (`0x40`) to `SPOT`. Filament's clustered forward
lighting handles many lights on mobile.

### 4.4 Textures

J2C data is decoded to RGBA (OpenJPEG, see §5.3), then uploaded with
`Texture.setImage(PixelBufferDescriptor)` and `generateMipmaps`. Keep
`TextureMemoryTracker` as the budget. Later, discard levels below the
on-screen size (what the LL viewer's discard levels do) and optionally
transcode to ASTC/ETC2.

### 4.5 Picking, HUDs, text

* Object picking uses `View.pick(x, y)` to get an entity, then maps the
  entity to `SLObjectInfo`. Face and UV touch for `TouchObjectFace` still
  needs the existing CPU ray intersection (`render/picking`), run only on
  the picked object.
* HUD attachments render in a second `View` with an orthographic camera,
  composited after the world view.
* Hover text and name tags reuse `DrawableTextBitmap` bitmaps on
  camera-facing quads with `sl_fullbright`.

### 4.6 VR

Filament's stereoscopic rendering (`Engine.Config.stereoscopicEyeCount = 2`,
multiview) plugs into the existing `VrRuntime` seam. Use OpenXR for
headsets. For phone VR, use the open-source **Cardboard SDK**
(`google/cardboard`, built from source), which replaces the retired GVR
library and its 4 KB-aligned `libgvr.so`.

### 4.7 Staging

| Stage | Output | Exit check |
| --- | --- | --- |
| F0 | Add `filament-android` and a `matc` Gradle task. Add a developer-only `FilamentWorldActivity` that renders terrain and sky from `SceneDelta`s. | Opens and closes 100 times with no native memory drift (P4-ENGINE-01). |
| F1 | Terrain, water, sky, sun | Terrain matches the legacy renderer's golden images. |
| F2 | Prims, sculpts, meshes with `sl_legacy`, point lights | Golden-image parity with the legacy renderer on the milestone-1 corpus. |
| F3 | Avatars: skinning, animation, attachments, **BOM**, animesh | Avatars and attachments match the legacy renderer. BOM bodies show skin. |
| F4 | PBR materials and overrides | Known PBR content renders the same as the LL viewer (screenshot comparison). |
| F5 | Shadows, IBL, bloom, tone mapping, dynamic resolution, quality presets | ≥30 fps on the reference device at the medium preset. |
| F6 | VR through OpenXR and Cardboard SDK, then remove GVR | Meets the VR parity gates in `MIGRATION_CHECKLIST.md`. |

Choose the renderer per device at runtime from `GpuCapabilities` (Filament
on TIER_A/B, legacy on TIER_C) with a user override in settings.

---

## 5. Other concrete upgrades, in priority order

### 5.1 TLS verification (P0)

1. Build a `TrustManager` from the system trust store **plus** the CA
   certificates the Linden Lab viewer ships
   (`indra/newview/app_settings/ca-bundle.crt`, filtered to the Linden Lab
   CAs), and use the default `HostnameVerifier`.
2. Ship it in **report-only mode** for one release: verify, log failures per
   host, and continue. This shows whether any Agni sim hosts still present
   certificates chained to Linden's private CA.
3. Enforce it for `*.secondlife.com`, `*.lindenlab.com` and
   `*.secondlife.io`. Add a per-grid "allow untrusted certificates" switch in
   `ManageGridsActivity`, defaulting to off, for OpenSimulator grids that use
   self-signed certificates.

### 5.2 Bakes on Mesh (high user value, no new renderer needed)

* Add the 5 bake slots to `BakedTextureIndex`/`AvatarTextureFaceIndex` and
  their appearance-service names.
* In `DrawablePrim`'s face setup, when the face texture is one of the
  `IMG_USE_BAKED_*` UUIDs and the prim is an attachment, build the
  `DrawableTextureParams` with `create(bakedUUID, faceIndex, wearerUUID)`
  (the same path `DrawableAvatarPart.setTexture` already uses). Rebuild the
  face when the wearer's appearance changes.
* This needs `DrawableAttachments` to pass the wearer's `AvatarTextures` down
  to the prims it creates.

### 5.3 Rebuild the native layer from source

* Build **OpenJPEG 2.5.x** from source with CMake and the NDK, with
  `-Wl,-z,max-page-size=16384`.
* Reimplement the 20 JNI entry points of `libopenjpeg.so`. Split them into
  `libj2c.so` (`decompress`, `writeJPEG2K`, `decompressTGA`, the buffer
  helpers) and `liblumiyageom.so` (the morph, flexi, terrain and culling
  helpers). Before swapping, check each against the shipped library with
  output-equivalence tests on recorded inputs, in the same spirit as
  `tools/verify`.
* Rebuild `librawbuf` from `recovered/native/librawbuf.so.decompiled.c`.

### 5.4 Login: MFA

When the reply has `reason == "mfa_challenge"`, prompt for the code and
re-send with `token`. Store the `mfa_hash` returned on success, per account,
and send it on later logins. Do this before Filament work, because without it
some accounts cannot log in at all.

### 5.5 EEP and extra-params

* Parse extra-params `0x20` (light), `0x40` (light image), `0x70`
  (extended mesh flags) and `0x80` (render material) into
  `PrimVolumeParams`. This is a pure data change: unit-test it against
  captured `ObjectUpdate` blobs.
* Fetch region and parcel environments through `ExtEnvironment`, and
  settings assets through `ViewerAsset?settings_id=`. Map the sky parameters
  onto the existing `WindlightSky` uniforms first, then onto the Filament sky.

### 5.6 Platform and libraries

| Now | Target | Notes |
| --- | --- | --- |
| OkHttp 3.14.9 | OkHttp 4.12 | Drop-in (`okhttp3` package). Needs the Kotlin stdlib, which is already a dependency. |
| greenDAO 2.1 | Room only | Continue the adapter migration. |
| ButterKnife (17 files) | View Binding | Per screen, as M2 plans. |
| `AsyncTask` (6) | Coroutines with `lifecycleScope` | |
| `android.preference` (11) | `androidx.preference` (already a dependency) | |
| Guava EventBus / `react/` | Kotlin `Flow` | At repository boundaries |
| Vivox plugin APK | In-app WebRTC | §2.1 |
| GVR | OpenXR + Cardboard SDK | §4.6 |
| Java 8 bytecode | Java 17 target | After Kotlin/Java toolchain alignment (M1) |
| `targetSdk 34` | 35 | After the 16 KB libraries and edge-to-edge insets |

New UI can use Jetpack Compose, hosted in the existing Activities through
`ComposeView`. Chat and IM, inventory and the login screen are the screens
where users would notice modern UI most. Rewriting everything is out of
scope.

---

## 6. What this branch changed

| Change | Files | Behaviour |
| --- | --- | --- |
| Texture fetch uses `ViewerAsset`, then `GetTexture` | `slproto/caps/SLCaps.java` (`getTextureFetchURL`), `slproto/modules/texfetcher/SLTextureFetcher.java` | Textures load over HTTP on grids that grant only `ViewerAsset`. |
| Mesh fetch uses `ViewerAsset`, then `GetMesh2`, then `GetMesh` | `SLCaps.getMeshFetchURL`, `render/WorldViewRenderer.java` | Meshes load on current SL regions. |
| Texture fetch with no HTTP cap goes straight to UDP | `res/textures/TextureCompressedCache.java` | Previously gave up with `MalformedURLException`. |
| Mesh URL restored when the GL context is recreated | `render/WorldViewRenderer.onSurfaceCreated` | Stops mesh fetches blocking the HTTP pool forever after a context loss. |
| Mesh download returns on success | `res/mesh/MeshCache.java` | One download per mesh instead of two, and no false "failed" completion. |

`GetMesh2` was added to `SLCapability` (for OpenSimulator). The intentional
bytecode differences are recorded in `tools/verify/accepted.txt`. The cap
fallback order is covered by `app/src/test/.../slproto/caps/SLCapsTest.java`.

**Not verified here:** there is no device or grid in this environment, and
the original APK needed by `tools/verify/verify_against_apk.sh` is not in the
repository. The changes were checked by `./gradlew :app:assembleDebug`, the
unit tests and the protocol conformance script only. The first on-device
test should confirm meshes and textures load in a mesh-heavy SL region and
that the log shows `ViewerAsset` URLs.
