# Phase 0 — Baseline

Goal: the Linkpoint repo builds a debug APK on a clean CI runner in under
20 minutes, deterministically, with no "works on my machine" variance, and
installs on a stock Android 14 device without crashing on launch. Nothing
else is in scope. No new features. No protocol work. No rendering work.

This phase is finished when a fresh clone of Linkpoint can be built by
anyone on the project with one command and the resulting APK opens to the
login screen.

## Why Phase 0 exists

Linkpoint's own `REVIEW.md` (Feb 2026 §1) flagged multiple build-config
issues: Kotlin version conflict between root `build.gradle` (1.9.22) and
module `build.gradle.kts` (2.2.21); Compose compiler 1.5.10 incompatible
with Kotlin 2.2.21; release `isMinifyEnabled = false`; JVM target 1.8 on
JDK 21; parallel/daemon/cache all disabled in `gradle.properties` with
"resource conflicts" as the stated reason. Every subsequent phase depends
on a sane build. Fix this first.

## Tasks

### P0-BUILD-01 — Reconcile Kotlin / AGP / Compose versions

- **Input**: Linkpoint `build.gradle`, `build.gradle.kts`, `gradle/libs.versions.toml` if present.
- **Output**: Single source of truth for toolchain versions. All modules
  resolve the same Kotlin compiler and Compose compiler. JDK target
  bumped to 17 (AGP 8.6+ requires JDK 17+).
- **Steps**:
  1. Introduce `gradle/libs.versions.toml` version catalogue covering
     kotlin, agp, compose-compiler-plugin, compose-bom, kotlinx-coroutines,
     kotlinx-serialization, okhttp, filament, webrtc, room, hilt, compose
     runtime, material3, lifecycle, work, room.
  2. Delete the root `build.gradle` buildscript block. The Kotlin plugin
     is already declared in module `build.gradle.kts`; the root is dead.
  3. Move all plugin `id(...) version "..."` declarations into
     `settings.gradle.kts` via `pluginManagement { plugins { ... } }` so
     modules reference versionless `id(...)` only.
  4. Select a Kotlin Compose compiler plugin version matching the
     Kotlin version (use the Kotlin Compose plugin `org.jetbrains.kotlin.plugin.compose`
     which pins to the Kotlin version, not the old `kotlinCompilerExtensionVersion`).
  5. Set `compileOptions.sourceCompatibility = JavaVersion.VERSION_17`
     and `kotlinOptions.jvmTarget = "17"` across every module.
- **Acceptance**: `./gradlew :Linkpoint:dependencies` exits 0 and the
  report shows a single Kotlin stdlib version. No Gradle `WARNING: Unable
  to determine Gradle version` noise.

### P0-BUILD-02 — Re-enable Gradle performance flags

- **Input**: `gradle.properties`.
- **Output**: `org.gradle.parallel=true`, `org.gradle.daemon=true`,
  `org.gradle.caching=true`, `org.gradle.configuration-cache=true`,
  `android.useAndroidX=true`, `android.enableJetifier=false`,
  `kotlin.incremental=true`, `kotlin.daemon.jvmargs=-Xmx2g`,
  `org.gradle.jvmargs=-Xmx4g -XX:+UseParallelGC`.
- **Acceptance**: Clean build time drops by ≥40% vs Apr-2026 baseline on
  the same hardware. Configuration cache stores successfully and is
  reused on the second invocation (`--configuration-cache` flag is
  silently accepted).

### P0-BUILD-03 — Minification for release

- **Input**: `build.gradle.kts` release build type; `proguard-rules.pro`.
- **Output**: Release builds have `isMinifyEnabled = true`,
  `isShrinkResources = true`, `proguard-android-optimize.txt` +
  project-specific rules.
- **Steps**:
  1. Narrow the `-keep class com.linkpoint.** { *; }` rule to only the
     entry points R8 cannot see: Application class, Activity classes
     listed in the manifest, JNI-visible classes (`@Keep`-annotated),
     Room entities and DAOs, Parcelable classes, Compose `@Composable`
     functions if they use reflection (they should not).
  2. Add `-keep class com.linkpoint.protocol.messages.generated.** { *; }`
     because message parsers are registered via reflection.
  3. Add Filament rules (it ships `proguard.pro` in the aar — reference
     it with `-keepattributes *Annotation*` etc. per Filament docs).
  4. Add WebRTC rules.
- **Acceptance**: Release APK is ≤ 40% smaller than the current
  un-minified release. The app launches and the login screen is usable.
  No `ClassNotFoundException` in `adb logcat` under a two-minute smoke.

### P0-BUILD-04 — CI pipeline

- **Input**: Linkpoint `.github/workflows/` if any.
- **Output**: A single GitHub Actions workflow `.github/workflows/build.yml`
  that on push to any branch and every PR:
  1. Sets up JDK 17, Android SDK (compile/target 35), Gradle cache.
  2. Runs `./gradlew :Linkpoint:assembleDebug`.
  3. Runs `./gradlew :Linkpoint:testDebugUnitTest`.
  4. Runs `./gradlew :Linkpoint:lintDebug` with `abortOnError = true`.
  5. Uploads the debug APK as a build artefact.
- **Acceptance**: A PR that introduces a compile error fails the job
  within 10 minutes. A successful PR lands a downloadable APK artefact.

### P0-BUILD-05 — Deterministic output

- **Input**: AGP packaging options, keystore.
- **Output**: Two invocations of `assembleDebug` on the same commit on
  the same CI image produce byte-identical APKs.
- **Steps**:
  1. Set `android.packagingOptions { jniLibs.useLegacyPackaging = false }`
     (avoids file order drift).
  2. Set AGP `includeDependencyInformationInApk = false`, or accept the
     variance if dependency-report signing is desired.
  3. Debug keystore is repo-committed (never the release keystore); CI
     uses it to sign debug builds identically run-over-run.
- **Acceptance**: `sha256sum Linkpoint-debug.apk` equal across two CI
  runs of the same commit.

### P0-BUILD-06 — Pre-commit and pre-push hooks

- **Input**: nothing; this is a new `.githooks/` directory.
- **Output**: `pre-commit` runs `ktlintCheck`, `pre-push` runs
  `assembleDebug`. `scripts/install-hooks.sh` wires them into `.git/hooks/`.
  Optional: the project adopts `pre-commit` the tool with a
  `.pre-commit-config.yaml`.
- **Acceptance**: A commit touching `.kt` files is rejected when ktlint
  complains. CI-detected style issues drop to zero over the following
  fortnight.

### P0-BUILD-07 — Version catalogue and metadata

- **Input**: `build.gradle.kts` defaultConfig; `AndroidManifest.xml`
  meta-data.
- **Output**: `versionName` derived from `git describe --tags --always`;
  `versionCode` from `git rev-list --count HEAD` (monotonic). Channel
  suffix ("dev" / "alpha" / "beta" / "stable") driven by build flavor.
- **Steps**:
  1. Add four flavors under one dimension `channel`: `dev`, `alpha`,
     `beta`, `stable`. Each has a distinct `applicationIdSuffix` so
     multiple channels can co-install.
  2. Emit `versionName` as `${gitDescribe}-${channel}`; `versionCode`
     as the commit-count int.
  3. TPV-policy channel string (`AuthParams.viewerChannel`): always
     "Linkpoint" (or the project's final name), independent of flavour
     — this is what Linden Lab logs, not marketing copy.
- **Acceptance**: `adb shell dumpsys package com.linkpoint.dev | grep
  versionName` shows `<describe>-dev` for a dev build; grid inspection
  shows channel "Linkpoint".

### P0-BUILD-08 — Dependency hygiene

- **Input**: `build.gradle.kts`.
- **Output**: No beta / rc / snapshot dependencies. All third-party deps
  pinned to stable versions. `./gradlew dependencyUpdates` (Ben Manes
  plugin) runs in CI weekly and opens a PR with stale-dep report.
- **Steps**:
  1. Replace `openjpeg-ndk26-static:2.5.0-beta-4` with the most recent
     stable OpenJPEG, or vendor the source and build it in-tree via
     CMake (already partially done in `src/main/cpp/`).
  2. Replace KTX `1.12.1-rc1` with latest stable.
  3. Audit Guava version; bump to latest `*-android`.
- **Acceptance**: No `-beta`, `-rc`, `-alpha`, `-SNAPSHOT` version
  strings in the resolved dependency graph.

### P0-SMOKE-01 — Install-and-open smoke

- **Input**: a release-debug APK from CI; a physical or emulated device.
- **Output**: A documented `docs/modernization/smoke-test.md` with
  step-by-step: install, open, reach login screen, enter garbage creds,
  see a rejection dialog, close. Screenshot each step.
- **Acceptance**: Reproduced three consecutive times on emulator
  API 34 and a physical device (one low-end, one high-end) with no
  crash, no ANR, and no logcat `FATAL`.

## Files expected to change

- `Linkpoint/build.gradle.kts`
- `Linkpoint/build.gradle` (likely deleted)
- `Linkpoint/settings.gradle.kts`
- `Linkpoint/gradle.properties`
- `Linkpoint/gradle/libs.versions.toml` (new)
- `Linkpoint/proguard-rules.pro`
- `.github/workflows/build.yml` (new)
- `.githooks/` (new)
- `Linkpoint/src/main/AndroidManifest.xml` (flavored metadata)

## Out-of-scope for Phase 0

- Any runtime code change in `src/main/java/com/linkpoint/`. If a runtime
  change is required to make the build green, it's a Phase 1 task and
  gets its own ticket.
- Tests for the above. Phase 0 is build infrastructure; tests for app
  code begin in Phase 1.
- Release keystore. Debug key only in Phase 0. Release keys land in
  Phase 9.
