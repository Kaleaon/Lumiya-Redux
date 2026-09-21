# Lumiya-Redux — Modernization Review & Cardboard→VR Migration Path

Review date: 2026-09-21. Reviewed tree: `claude/cool-thompson-nuw6az` at
`a2d0ca3`. 1,481 Java files, 0 Kotlin files, AGP 8.7.3 / Gradle 8.10.2 /
Kotlin 1.9.25, `minSdk 26` / `targetSdk 34` / `compileSdk 34`.

This is a static review. No Android SDK is present in the review
environment, so nothing here was confirmed by compiling or running. Claims
about file contents, ELF headers, and manifest/gradle configuration were
read directly from the tree; claims about runtime behavior are inferences
from that code and are marked where they are uncertain.

---

## 0. A strategic contradiction to resolve first

`docs/modernization/00_overview.md` states the program decision plainly:

> **Linkpoint is the chassis. Lumiya-Redux is the protocol reference.**
> […] Stop investing in making Lumiya-Redux compile. `BUILD_STATUS.md`
> work […] is **de-prioritised**. […] Eventually (Phase 9 acceptance),
> this repo is archived read-only with a pointer to Linkpoint.

Everything below assumes the opposite — that this tree is meant to become
a shippable app. Those two positions cannot both be funded. Before acting
on this review, decide which repo is the product. If the 00_overview
decision stands, most of §2 is wasted effort and only §3–§4 matter, as a
design document to be implemented *in Linkpoint*.

Worth noting either way: **VR appears nowhere in the 14-document
modernization plan.** The only mention of the VR stack in
`docs/modernization/` is one line in `01_inventory.md` listing
`libgvr.so` as a file that exists. Whichever repo ships, the VR story
below is currently unowned.

---

## 1. The headline: this is not "almost compiling"

`BUILD_STATUS.md` frames the remaining work as "~100 errors, all
decompiler artefacts, most are five-second edits." That understates the
gap in two ways.

### 1.1 Thirty-two methods have no body at all

jadx emitted `throw new UnsupportedOperationException("Method not
decompiled: …")` for 32 methods. These are not syntax artifacts — the
logic is *gone* and has to be reconstructed from smali or rewritten from
the upstream protocol spec. The list includes the two methods that make
the app an app:

| File | Method | Consequence |
| --- | --- | --- |
| `slproto/auth/SLAuth.java:39` | `SendLoginRequest(SLAuthParams)` | **No login.** Cannot reach any grid. |
| `slproto/SLCircuit.java:219` | `ProcessReceive()` | **No inbound packet loop.** Even with a session, nothing is received. |
| `slproto/objects/SLObjectInfo.java:321` | `ApplyObjectUpdate(ObjectUpdateCompressed$ObjectData)` | Compressed object updates — most of the world — never apply. |
| `slproto/modules/SLMinimap.java:204,363` | `HandleCoarseLocationUpdate`, `HandleParcelProperties` | No minimap avatars, no parcel data. |
| `slproto/baker/BakeLayer.java:159` | `Bake(...)` | No avatar texture baking. |
| `slproto/avatar/SLAnimatedMeshData.java:77` | `GLDraw(...)` | Animesh does not render. |
| `render/glres/GLSyncLoadQueue.java:85` | `RunLoadQueue(RenderContext)` | GPU resource upload queue is a stub. |
| `slproto/modules/rlv/RLVRestrictions.java:186` | `isAllowed(...)` | RLV permission checks — **fails open or throws**; see §2.1. |

Plus 24 more across inventory HTTP fetch, texture cache, animation cache,
parcel `killObject`, voice notifications, and several UI touch handlers.

**This is the critical path.** No amount of Gradle, AndroidX, or VR work
changes the fact that the app cannot connect to Second Life. Any plan
that does not start here is sequenced wrong.

### 1.2 401 unresolved lambda-desugaring artifacts remain

`BUILD_STATUS.md` logs Category 2 (`-$Lambda$…`) as ✅ complete for two
files. Across the tree:

```
401 occurrences of -$Lambda$ in 106 files
```

`CardboardActivity.java` alone contains at least 24 of them (the
`-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA.NN` family at lines 1790, 1848, and
throughout `WorldStereoRenderer`). These are compile blockers. The
"~100 errors" figure in `BUILD_STATUS.md` is a `-Xmaxerrs` artifact —
javac caps at 100 by default, and the doc's own step 3 tells you to raise
it. The real count is unknown and is certainly larger.

### 1.3 Nothing in CI builds the app

`.github/workflows/` contains exactly one workflow: `protocol-conformance.yml`,
which runs a Python script on `slproto/` path changes. There is no
`assembleDebug`, no `compileDebugJavaWithJavac`, no lint, no test.

Ground rule **G4 ("Build stays green")** in `00_overview.md` is therefore
unenforceable — there is no signal to be green or red. Adding a
compile job is cheap and should happen before any other work, precisely
so the 401-artifact cleanup has a scoreboard.

---

## 2. Modernization findings

Tiered by "does this stop a release" → "is this accumulating interest."

### 2.1 Tier 0 — release blockers

**T0-1 · `targetSdk 34` is below the Play Store floor, today.**
Google Play has required API 36 (Android 16) for new apps and updates
since **31 August 2026** — three weeks before this review. API 35 or
lower is rejected. An extension window to 1 November 2026 can be
requested. Path: `compileSdk`/`targetSdk` 36, then work the behavior
changes for 35 and 36 (mandatory edge-to-edge, orientation/resizability
changes on large screens, foreground-service restrictions). The
landscape-locked `CardboardActivity` will need attention under the API 35
large-screen orientation rules.

**T0-2 · `libgvr.so` is 4 KB-page aligned and cannot be fixed.**
Verified with `readelf -lW`:

| Library | ABI | `LOAD` alignment |
| --- | --- | --- |
| `libgvr.so` | arm64-v8a | `0x1000` (4 KB) ❌ |
| `libgvr.so` | armeabi-v7a | `0x1000` (4 KB) ❌ |
| `libopenjpeg.so` | arm64-v8a | `0x10000` (64 KB) ✅ |
| `librawbuf.so` | arm64-v8a | `0x10000` (64 KB) ✅ |

Android 15+ devices may use 16 KB memory pages, and Google Play requires
16 KB-compatible native code for apps targeting Android 15+. A 4 KB-aligned
`.so` will not load there. `libgvr.so` is a prebuilt binary from a
discontinued SDK — **there is no source to rebuild it from.**

This is the fact that converts §3 from a roadmap item into a hard
dependency: *GVR cannot ship, so the Cardboard stack has to go regardless
of whether anyone wants new VR features.*

Related: `packagingOptions { jniLibs { useLegacyPackaging = true } }` in
`app/build.gradle` re-enables compressed/extracted native libs, which
works against the modern uncompressed-and-aligned expectation. The
comment justifies it as "Lumiya loads its .so files on old APIs too" —
but `minSdk` is 26, so the API 23 cutoff that motivated legacy packaging
is moot. Drop it.

**T0-3 · Foreground service with no `foregroundServiceType`.**
`GridConnectionService` calls `ContextCompat.startForegroundService()`
(line 146) and `startForeground()` (line 742). The manifest declares:

```xml
<service android:name="com.lumiyaviewer.lumiya.GridConnectionService" android:exported="false" />
```

No `android:foregroundServiceType`, and no `FOREGROUND_SERVICE_*`
permission in the manifest at all. Apps targeting API 34+ that call
`startForeground()` without a declared type throw
`MissingForegroundServiceTypeException`. Since the module already
declares `targetSdk 34`, **this should crash on Android 14+ the moment
the app connects to a grid.** I could not run it to confirm, but the
manifest and call sites are unambiguous.

Likely correct type: `connectedDevice` or `dataSync`, plus
`FOREGROUND_SERVICE_CONNECTED_DEVICE` / `FOREGROUND_SERVICE_DATA_SYNC`.
This needs a deliberate choice — Play reviews foreground-service-type
justifications.

**T0-4 · RLV enforcement is a stub.**
`RLVRestrictions.RLVRestrictionList.isAllowed(...)` throws
`UnsupportedOperationException`. RLV restrictions are a *consent*
mechanism — users rely on them to constrain what the viewer will do on
their behalf. A viewer that cannot evaluate them either crashes at the
check or, if a caller swallows the exception, silently ignores
restrictions the user believes are active. Treat this as a
correctness-and-trust blocker, not a feature gap, and confirm the failure
mode before shipping anything.

**T0-5 · Voice is bound to an app that no longer exists.**
`VoicePluginServiceConnection:221` binds to
`ComponentName("com.lumiyaviewer.lumiya.voice", ".VoiceService")` — a
separate Vivox plugin APK distributed via
`LicenseChecker.VOICE_PLUGIN_URL` (a Play Store listing for a delisted
app). Two compounding problems: the plugin is unobtainable, and the
manifest has **no `<queries>` element**, so on Android 11+ package
visibility the bind would fail even if the user had it installed. Voice
needs a plan (in-process WebRTC, or explicit removal), not a dangling
bind.

### 2.2 Tier 1 — toolchain and platform

| Item | Current | Notes |
| --- | --- | --- |
| AGP / Gradle | 8.7.3 / 8.10.2 | ~2 years behind; needed anyway for `compileSdk 36`. |
| Kotlin | 1.9.25 | EOL. And **there are zero `.kt` files** — see T1-1. |
| Java level | `VERSION_1_8` source & target | Move to 17. Desugaring config disappears with it. |
| Jetifier | `android.enableJetifier=true` | Deprecated, slated for removal, and a significant build-time cost. `BUILD_STATUS.md` says the Lumiya tree is already rewritten to AndroidX, so Jetifier now exists only for ButterKnife / PagerSlidingTabStrip / nineoldandroids. Retire those (§2.3) and this flag goes with them. |
| R class flags | `nonTransitiveRClass=false`, `nonFinalResIds=false` | Legacy opt-outs; AGP 9 removes them. |
| Preferences API | `android.preference.PreferenceManager` in 11 files, `androidx.preference` in the settings screens | Mixed. Framework `android.preference` was deprecated at API 29. `VrRuntimeSelector` and `CardboardActivity:1762` both use the framework one. |
| `@TargetApi(16)` | on `CardboardActivity` | Vestigial at `minSdk 26`. |
| Backup | `allowBackup=true` + `fullBackupContent` | No `android:dataExtractionRules` (required for API 31+ behavior). Also worth auditing what's in the backup — this app stores grid credentials. |
| Storage | `READ_/WRITE_EXTERNAL_STORAGE` | No-ops under scoped storage. The snapshot/upload paths need MediaStore or SAF. |
| `enableVrMode` | `com.google.vr.vrcore/...VrCoreListenerService` (`strings.xml:350`) | Points at Google VR Services, which is gone. Dead attribute. |

**T1-1 · The Kotlin-first gate guards an empty room.**
`app/build.gradle` registers `enforceKotlinFirstPackages`, wired into both
`check` and `lint`, forbidding new `.java` files under
`vr/runtime`, `repository`, and `data`. Meanwhile the tree contains
**0 Kotlin files**, and `com/lumiyaviewer/lumiya/vr/runtime` does not
exist (the VR code lives at `ui/render/vr/`, which the gate does not
cover). The policy is real; the migration behind it has not started, and
the one path it names for VR is the wrong path.

### 2.3 Tier 2 — dependency debt

| Dependency | Status | Replacement | Blast radius |
| --- | --- | --- | --- |
| ButterKnife 10.2.3 | Deprecated 2020, archived | ViewBinding | ~36 UI files; also removes the `--add-opens` JDK hack in `build.gradle` |
| greenDAO 2.1.0 (`de.greenrobot`) | Abandoned ~2016 | Room (already a dependency) | 9 files in `orm/`; Room has 3 entities so far — `CachedResponse`, `UserPic`, `SearchGridResult`. Bulk not started. |
| OkHttp 3.14.9 | Final 3.x, 2020 | OkHttp 4.12 / 5.x | Mostly source-compatible; no longer receives TLS fixes |
| nineoldandroids 2.4.0 | Dead since ~2014 | Framework `ViewPropertyAnimator` (API 12+) | **One file.** Free win. |
| PagerSlidingTabStrip 1.0.1 | 2014 | Material `TabLayout` | Small |
| `uk.co.senab.photoview` (in-tree) | Renamed upstream 2016; 2 methods are undecompiled stubs | `com.github.chrisbanes:PhotoView:2.3.0` | `TextureViewFragment` + attacher rewrite |
| `legacy-support-v4` / `-v13` | Umbrella of the entire old support library | Delete; depend on what's used | Wide but mechanical |
| `lifecycle-extensions:2.2.0` | Deprecated, removed upstream | `lifecycle-*-ktx` | Small |
| protobuf-nano | Dead; only GVR needs it | Removed with GVR | Free once §3 lands |
| GVR SDK (158 in-tree Java files) | SDK EOL 2019, artifacts pulled 2021 | See §3 | Large — §3 is about this |

**T2-1 · `libopenjpeg.so` is a 2016 JPEG2000 decoder with no source.**
This is the more dangerous of the two prebuilts. It parses **untrusted,
attacker-supplied asset data** from arbitrary grids, it is a codec (a
historically CVE-dense category), and like `libgvr.so` there is no source
in-tree to patch. Unlike `libgvr.so` it *is* 16 KB-aligned, so nothing
forces the issue — which is exactly why it will get skipped.

Recommend rebuilding from current OpenJPEG (2.5.x) with a CMake external
project and running the decode entry point under a fuzzer, per ground
rule **G5**. `docs/modernization/10_phase_8_security.md` should own this;
I did not check whether it already does.

### 2.4 Tier 3 — architecture

- **God activities.** `CardboardActivity` 2,158 lines,
  `WorldViewActivity` 1,668 lines. Both mix VR session lifecycle, GL
  rendering, input, chat UI, voice UI, and object picking.
- **Custom reactive framework.** `com/lumiyaviewer/lumiya/react/` is 32
  files of hand-rolled subscription/request machinery. It works and it is
  load-bearing; Flow is the eventual target but this is *not* urgent and
  should not be touched speculatively.
- **Legacy framework APIs.** `android.app.Fragment` / `LoaderManager` in
  16 files; `AsyncTask` in 8.
- **Fixed-function GL fallbacks.** 121 `GLES10` and 38 `GLES11`
  references, including a live branch in `LegacyGlesBackend`
  (`renderContext.hasGL20` false path). At `minSdk 26`, GLES 2.0 is
  universal and GLES 3.0 nearly so. This is dead weight that complicates
  every renderer change — and §3.4 wants it gone.
- **`RenderBackendFlags.ENABLE_EXPERIMENTAL_BACKEND = false`**, a
  compile-time constant. `ExperimentalRenderBackend` is unreachable code.
  Either finish it or delete it.
- 1,453 of 1,481 files still carry the `/* loaded from: classes.dex */`
  jadx marker — a rough proxy for how many files no human has read line
  by line.

---

## 3. VR: current state

### 3.1 What is actually there

The `ui/render/vr/` abstraction is **genuinely good bones** and deserves
credit — someone has already done the hard conceptual work of separating
"what the viewer needs from a VR runtime" from "GVR." `VrRuntime`,
`VrSession`, `VrPose`, `VrEye`, `VrInputState` are the right *set* of
concepts.

The UI approach is also the right one and is fully portable: Android
Views are rendered into a `GLExternalTexture` (a `SurfaceTexture`) by
`draw2DUI()`, then sampled in the eye pass and drawn as a head-locked
quad (`renderer.drawExternalTexture(...)` in `onDrawEye`). That pattern
survives the migration unchanged. Keep it.

### 3.2 What is not there

**V-1 · `OpenXrRuntime` contains no OpenXR.** In full:

```java
public VrSession createSession(Activity activity, VrSession.Listener listener) {
    Debug.Printf("VR runtime: OpenXR bridge session active (head pose + stereo + controller mapping enabled).");
    return new GvrVrSessionAdapter(activity, ID, listener, true);
}
```

It returns the GVR adapter. The log line asserting that head pose, stereo,
and controller mapping are "enabled" is false, and it will appear in logs
and bug reports as evidence that OpenXR works. `OpenXrRuntimeCapabilities`
wraps this with 100 lines of staged-rollout machinery — `dogfood`/`beta`/
`general` stages, percentage rollout, `ANDROID_ID`-hashed device
bucketing — gating a feature that does not exist. And its capability
probe cannot fail:

```java
private static boolean isRuntimeCapable(Context context) {
    boolean supportsVrMode = Build.VERSION.SDK_INT >= 24;   // always true at minSdk 26
    return supportsVrMode || hasVrHighPerformance;          // ...so always true
}
```

The manifest comment (`"Compatibility shim until OpenXR transition path is
production-ready"`) and the `build.gradle` comment (`"Cleanup gate: remove
libgvr.so only after Cardboard/OpenXR parity lands"`) both describe an
OpenXR path as in progress. It has not started. **Fixing this honesty
problem is the first task in §4**, before any code.

**V-2 · The camera is 3DOF, and the code is one line from admitting it.**
`CardboardActivity:901` reads head translation into
`headTransformCompat.translationVector` — and `translationVector` is
**never read anywhere else in the tree** (verified by grep across
`app/src/main/java`). Stereo separation is synthesized manually from IPD
× right-vector in `onDrawEye`; head *position* never reaches
`CameraParams.getVRCamera`. Lean your head forward in the world and
nothing moves. On a 6DOF headset that mismatch is not a missing feature,
it is a nausea source.

**V-3 · Turning is a Cardboard-era comfort hack.** In `onNewFrame`:
hold your gaze more than 35° off a slowly-recentering "neutral yaw" and
the avatar yaws continuously (`TURN_DEGREES_PER_MS`). This exists because
Cardboard had one button and no stick. On a headset with thumbsticks it
is actively wrong — it fights the user's natural head movement.

**V-4 · Input models a single Daydream touchpad.** `VrInputState` is
`(appButtonPressed, touching, touchX, touchY, connectionState)` — one
3DOF wand. Modern controllers need: two hands, per-hand 6DOF pose,
thumbstick, trigger (analog), grip (analog), A/B/X/Y, menu, plus optional
hand tracking. `GvrVrSessionAdapter` gets this from
`com.google.vr.sdk.controller.ControllerManager` — **Daydream**, which
Google discontinued; `VrCore` is not installed on modern devices, so
`ControllerManager` has nothing to connect to.

**V-5 · The scene is fully re-rendered per eye.** `onDrawEye` calls
`renderer.onDrawFrame(...)` for each eye — full traversal, full culling,
full draw submission, twice. Cardboard at 60 Hz on a 2016 phone tolerated
this. A standalone headset at 72–90 Hz with a hard frame deadline will
not.

**V-6 · Near plane is 0.5 m.** `eye.getPerspective(0.5f, drawDistance)`.
Anything within half a metre of your face clips — including your own
hands once you have tracked controllers. VR wants ~0.05 m.

**V-7 · The abstraction's shape cannot express OpenXR.** This is the
most important design finding. `VrSession` is built around
`getView()` → a `View` added to a `FrameLayout`, plus `setRenderer()` →
callbacks the runtime invokes. That is the `GvrView`/`GLSurfaceView`
model: *the runtime owns the loop and calls you.*

OpenXR inverts this. **You** own the loop:

```
xrWaitFrame → xrBeginFrame → xrLocateViews (per view: pose + FoV)
            → acquire/wait swapchain image → render → release
            → xrEndFrame(layers)
```

There is no `View`, no `FrameLayout`, no `onDrawEye` callback, and the
projection comes as an asymmetric FoV (four angles), not a ready-made
matrix. So `getView()` and `setRenderer()` both have to go. The
*concepts* in `ui/render/vr/` survive; the *lifecycle* does not.

### 3.3 Where to go — three options

| | **A. Cardboard SDK** | **B. OpenXR** ✅ | **C. Jetpack XR** |
| --- | --- | --- | --- |
| Target | Phone in a holder | Quest, Pico, Android XR, Vive XR | Android XR only |
| DoF | 3 | 6 | 6 |
| Input | One button | Full controllers + hand tracking | Hands / controllers |
| Language | C++ (NDK) + thin Java | C (NDK) + JNI | Kotlin, no NDK |
| Fixes T0-2 | Yes (buildable from source) | Yes | Yes |
| Reach in 2026 | Effectively nil | Every standalone headset | One ecosystem |
| Effort | Low | High | Medium |

**Recommendation: B, and skip A.** Option A is tempting because it is the
smallest diff that unblocks T0-2 — `googlevr/cardboard` is open source, so
you can build a 16 KB-aligned library and keep the existing 3DOF design
almost intact. But it spends real effort to preserve a product category
that no longer has users, and it does *not* pay down V-2, V-4, V-5, or
V-7, so every one of those bills arrives again later.

Option C is the least work per feature but locks you to one ecosystem and
leaves Quest — where the actual users are — unserved.

Option B is where "VR" means anything in 2026. It is also, usefully, the
superset: an OpenXR client runs on Android XR devices, so C becomes
unnecessary rather than forgone.

One consequential sub-decision inside B: **keep GLES or move to Vulkan.**
Headset runtimes are tuned for Vulkan and some vendors treat GLES as
legacy. But this renderer is ~540 GLES call sites of GLES 1.0/2.0/3.0
across 30+ files. Rewriting it to Vulkan is a separate multi-month
project that should not be smuggled into a VR migration. Use
`XR_KHR_opengl_es_enable` and GLES 3.0 + multiview; revisit Vulkan only
if frame timing proves it necessary.

### 3.4 Staged migration plan

**V0 — Stop lying (days, no new capability).**
Delete `OpenXrRuntime` or make it throw / return `null` with an accurate
log. Delete or neutralize `OpenXrRuntimeCapabilities` — it gates nothing
and its probe cannot fail. Correct the manifest and `build.gradle`
comments that describe OpenXR as in progress. Document that VR today is
3DOF Cardboard only. *This costs nothing and stops the codebase from
misleading its next reader — including whoever picks up V1.*

**V1 — Reshape the abstraction (2–3 weeks, still on GVR).**
Do this *before* touching OpenXR, while GVR still works as a reference
implementation to test against.
- Replace `getView()` / `setRenderer()` with a session that owns its own
  render thread and frame loop, and an explicit `beginFrame()` /
  `endFrame()` the caller drives.
- Replace `VrEye` (viewport + `getPerspective(near,far)`) with `VrView`
  (pose + asymmetric FoV + swapchain target), which both GVR and OpenXR
  can produce.
- Extend `VrPose` to expose position, and **plumb it through**:
  `HeadTransformCompat.translationVector` → `CameraParams.getVRCamera`
  as a per-frame offset from the interpolated avatar position. This is
  V-2, and it is testable on GVR even though GVR always reports zero.
- Widen `VrInputState` to two hands × (pose, thumbstick, trigger, grip,
  buttons). Map the Daydream wand onto hand 0 for continuity.
- Split the eye loop: cull and build the draw list **once**, submit per
  view (V-5). This is the prerequisite for hitting a headset frame
  budget and it pays off on phones too.
- Near plane 0.5 → 0.05 (V-6).

**V2 — OpenXR backend (6–10 weeks).**
- New Gradle module with CMake + `org.khronos.openxr:openxr_loader_for_android`.
  Build 16 KB-aligned from the start (`-Wl,-z,max-page-size=16384`) —
  that is the T0-2 fix.
- JNI bridge: session lifecycle, per-frame view poses/FoVs, swapchain
  GLES texture handles up to the existing Java renderer. Rendering stays
  in Java/GLES; only the loop and the swapchain move native.
- `OpenXrRuntime` becomes real. `VrRuntimeSelector` keeps its existing
  shape — the fallback-to-Cardboard logic is already written and is
  correct once there is something to fall back *from*.
- Input via `XrActionSet` / `XrAction`, bound per interaction profile
  (`khr/simple_controller`, `oculus/touch_controller`, …), surfaced
  through the V1 `VrInputState`.
- Manifest: `<uses-feature android:name="android.hardware.vr.headtracking" android:required="true"/>`,
  the XR category intent filter, and store-specific metadata (Meta
  requires `com.oculus.intent.category.VR`). Note the Play requirement
  differs for XR: Android XR apps target API 34+, not 36.
- Delete the 158 in-tree GVR Java files, `libgvr.so`, protobuf-nano, and
  the `enableVrMode` string.

**V3 — VR-native UX (3–4 weeks).**
- Replace the 35°-gaze-turn (V-3) with thumbstick smooth/snap turn and
  stick strafe. Keep gaze-turn as an accessibility option — it is a
  legitimate seated/no-controller mode, just a terrible default.
- Promote the head-locked UI quad to world-locked panels with controller
  ray-cast selection, keeping gaze+dwell as the fallback. The existing
  `GLExternalTexture` path needs no change — only where the quad is
  anchored and how hit-testing is sourced.
- Remove the per-frame `runOnUiThread` hit-point post in `onFinishFrame`
  — main-thread work in the frame loop is a stutter source.
- Comfort vignette during artificial locomotion.

**V4 — Rendering for a headset budget (ongoing).**
- GLES 3.0 as the floor; delete the `GLES10`/`GLES11` fixed-function
  paths and the `hasGL20` false branch (§2.4).
- `GL_OVR_multiview2`: one draw call writes both eye layers. Given V-5,
  this is the single largest win available.
- Frame pacing against the runtime's predicted display time rather than
  `SystemClock.uptimeMillis()` deltas.
- Aggressive LOD/draw-distance defaults for VR — a Second Life region is
  unbounded geometry against a hard 11–13 ms budget.

---

## 4. Suggested sequencing

The ordering constraint that matters: **V1 is much cheaper while GVR
still runs**, because GVR is the reference implementation you test the
reshaped abstraction against. But GVR only runs if the app runs, and the
app cannot log in. So protocol work gates everything.

1. **Add a CI build job.** Nothing else has a scoreboard without it. (§1.3)
2. **V0 — delete the fake OpenXR runtime.** Independent of everything,
   costs a day, prevents compounding confusion. (§3.4)
3. **Reconstruct `SLAuth.SendLoginRequest` and `SLCircuit.ProcessReceive`,**
   then the other 30 stubs in dependency order. Until this lands, nothing
   downstream is testable. (§1.1)
4. **Clear the 401 lambda artifacts** to first green build. (§1.2)
5. **T0-3 foreground service type** — likely a live crash on Android 14+. (§2.1)
6. **`targetSdk` 36 + toolchain bump.** Already past the Play deadline. (§2.1, §2.2)
7. **Free dependency wins:** nineoldandroids, `legacy-support-*`,
   `lifecycle-extensions`, PagerSlidingTabStrip. Then ButterKnife →
   ViewBinding, which retires Jetifier and the `--add-opens` hack. (§2.3)
8. **T2-1 rebuild `libopenjpeg.so` + fuzz.** Untrusted input from
   arbitrary grids. (§2.3)
9. **V1 abstraction reshape,** once the app can log in and render. (§3.4)
10. **V2 OpenXR,** which also resolves T0-2 and drops ~160 files. (§3.4)
11. **V3 / V4** VR UX and rendering budget. (§3.4)

Steps 1, 2, and 7 are independent of the protocol work and can run in
parallel with step 3.

---

## 5. What this review did not check

Stated plainly so the gaps are not mistaken for clean bills of health:

- **Nothing was compiled or run.** No Android SDK in this environment.
  Every "this will crash" is inference from source, most notably T0-3.
- **Actual error count** from `javac` is unknown; §1.2's 401 is a grep
  count of one artifact pattern, not a compile result.
- **The `recovered/` tree** (smali, resources, raw jadx output) was not
  examined. It is presumably where the 32 missing method bodies get
  reconstructed from, and someone should assess whether the smali is
  complete enough to do that before committing to step 3.
- **Protocol correctness** against `secondlife/viewer` — out of scope
  here, and already covered by `docs/protocol_migration_conformance.md`
  and the conformance CI.
- **Whether `docs/modernization/10_phase_8_security.md` already owns**
  the `libopenjpeg.so` issue (T2-1). I did not read it.
- **TPV policy compliance** (channel/version strings, credential
  logging) — `00_overview.md` ground rule G6 treats this as blocking and
  it was not audited.
- **Effort estimates in §3.4 are rough.** They assume one developer
  familiar with both Android GL and OpenXR, and they assume the app
  actually runs first.
