# Lumiya-Redux modernization execution roadmap

This is the implementation-oriented companion to the long-form modernization
plan. The existing phase documents contain useful product and protocol goals,
but some were written for the separate Linkpoint codebase. Work in this
repository uses the restored Lumiya app as the chassis and follows the gates
below.

## Working principles

1. **Preserve behavior before redesigning it.** Recovery checks, protocol
   conformance, unit tests, and an install smoke test must protect each seam
   before its implementation changes.
2. **Remove one legacy constraint at a time.** Each pull request should retire
   a dependency, compatibility branch, or unsafe boundary and remain buildable.
3. **Keep protocol and rendering changes separate.** This makes regressions
   diagnosable against the recovered APK and upstream Second Life references.
4. **Prefer Kotlin for new seams, not bulk conversion.** Existing recovered
   Java remains until a tested feature or bug fix already requires touching it.
5. **Do not delete a fallback until its replacement has runtime evidence.**
   This applies especially to greenDAO, GVR, native JPEG2000, and voice.

## Milestones

### M0 — Reproducible baseline

- Keep `assembleDebug`, unit tests, protocol conformance, and undecompiled-body
  checks green in CI.
- Add an emulator install-and-launch smoke test and record the login-screen
  baseline.
- Inventory direct dependencies and map each legacy library to its final
  consumer before removing it.

**Exit gate:** a clean checkout produces and launches a debug APK, and every
recovery/conformance check runs from one documented command sequence.

### M1 — Build and platform cleanup

- Remove pre-API-26 compatibility code now made unreachable by `minSdk 26`.
- Retire NineOldAndroids, legacy support artifacts, Jetifier, and
  `lifecycle-extensions` in that order, verifying the dependency graph after
  each removal.
- Move build constants into a version catalog only after the dependency set is
  understood; avoid a build-script rewrite mixed with runtime changes.
- Raise Java/Kotlin bytecode targets only after debug and release builds pass
  on JDK 17 without relying on accidental Java 8 behavior.

**Exit gate:** no obsolete animation/support compatibility dependency remains,
Jetifier is disabled, and debug plus release assembly are green.

### M2 — UI lifecycle safety

- ~~Replace ButterKnife~~ Done: the generated bindings are in-tree source and the
  library and annotation processor are removed. View Binding per screen is optional.
- Replace `AsyncTask` work with lifecycle-owned executors or coroutines,
  explicitly preserving cancellation and result-delivery behavior.
- Migrate framework preferences to AndroidX preferences.

**Exit gate:** ButterKnife and its annotation processor are removed, UI work
does not outlive its owner, and restored navigation flows pass smoke tests.

### M3 — Data and networking seams

- Put login, capabilities, inventory, and asset access behind repository
  interfaces while retaining current implementations.
- Expand LLSD and message-template conformance coverage before parser changes.
- Migrate greenDAO tables incrementally to Room with schema and upgrade tests;
  remove greenDAO only when Room is authoritative for every active query.

**Exit gate:** repository contracts are tested, protocol fixtures remain
byte-compatible where required, and database upgrade/rollback behavior is
documented and verified.

### M4 — Rendering, XR, and media

- Define renderer and XR runtime boundaries before replacing implementations.
- Prove the Cardboard/OpenXR path through stereo rendering, tracking, input,
  pause/resume, and device-loss tests before removing GVR and `libgvr.so`.
- Treat voice and native asset decoding as independent migrations with device
  performance baselines.

**Exit gate:** replacement paths meet functional and stability parity, and
legacy native binaries are no longer loaded on supported devices.

### M5 — Release hardening

- Restore lint as a blocking signal by paying down suppressions in bounded
  groups.
- Enable R8/resource shrinking with explicit JNI, reflection, Room, and message
  parser rules.
- Add signing, dependency review, SBOM, crash reporting, accessibility, and
  physical-device regression gates.

**Exit gate:** a reproducible, signed candidate passes protocol, upgrade,
security, accessibility, performance, and device-matrix acceptance checks.

## First completed slice

The first M1 slice removes NineOldAndroids. Its sole consumer was the swipe to
dismiss helper, whose API 11/12 fallbacks were unreachable with the app's API
26 minimum. The helper now uses platform view properties and
`ViewPropertyAnimator` exclusively, allowing the dependency to be deleted.

## Next slices

1. Add a dependency report/check that proves which artifacts still require
   Jetifier.
2. Convert the smallest `*_ViewBinding`-backed activity to View Binding and add
   a focused lifecycle test.
3. Convert one contained `AsyncTask` flow after characterizing cancellation
   and configuration-change behavior.
