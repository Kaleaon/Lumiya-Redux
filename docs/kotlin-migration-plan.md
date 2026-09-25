# Kotlin Migration Plan (Gradual / Opportunistic)

## Decision

Use **Kotlin** for Android application modernization. It is the best fit for
this repository because it compiles alongside the recovered Java sources,
preserves JVM-facing APIs during one-file-at-a-time conversions, and is
supported directly by the Android Gradle plugin already used by the app. A
cross-platform rewrite (for example, Dart or TypeScript) would require replacing
the Android UI, protocol, rendering, and native-library integration at once and
would discard the bytecode-parity recovery work.

This is a source-language migration, not an instruction to rewrite stable Java.
Java remains supported at interoperability boundaries and for recovered code
that has not yet passed focused behavior tests.

## Goals
- Enable Kotlin in the Android app without mass conversion.
- Keep existing Java files untouched unless they are already being edited for feature/bug work.
- Move package-by-package in a predictable order.

## Policy
1. **No broad Java-to-Kotlin rewrite PRs.**
2. **When editing a file for other reasons**, migrate that file to Kotlin only if it is low-risk and covered by existing behavior checks.
3. **New source files** in Kotlin-first packages should be `.kt` files.

## Migration Order

### 1) VR / Runtime layer (first)
Rationale: contains the new engine-facing seams and benefits most from null-safety and sealed modeling.

Kotlin-first package root:
- `com.lumiyaviewer.lumiya.vr.runtime`

### 2) Data repositories (second)
Rationale: repository APIs are shared dependencies; Kotlin data classes and extension functions reduce boilerplate.

Kotlin-first package root:
- `com.lumiyaviewer.lumiya.repository`

### 3) New data layer expansion (third)
Rationale: new Room-backed entities/DAOs and adapters should start Kotlin-first while legacy ORM paths stay stable.

Kotlin-first package root:
- `com.lumiyaviewer.lumiya.data`

The Room migration coordinator and the three greenDAO-to-Room repository
adapters are now Kotlin. Their Java-callable class names, constructors, and
methods remain unchanged, while cursor/resource handling uses Kotlin `use`
blocks and entity mapping uses scoped extension functions.

### 4) Tested modernization seams (opportunistic)

Rationale: renderer seams and shared utilities are safe incremental candidates
when their JVM API can be preserved and focused tests exist.

Kotlin-first package roots:
- `com.lumiyaviewer.lumiya.render.backend`
- `com.lumiyaviewer.lumiya.render.picking`
- `com.lumiyaviewer.lumiya.render.scene`
- `com.lumiyaviewer.lumiya.render.terrain`
- `com.lumiyaviewer.lumiya.render.tex`
- `com.lumiyaviewer.lumiya.utils`

## Enforcement
- Gradle `check` runs `enforceKotlinFirstPackages`, which rejects **new** `.java`
  files in Kotlin-first roots.
- Existing tracked Java files are grandfathered until they are deliberately
  converted, keeping the migration incremental and reviewable.
- The first production conversions preserve their Java ABI: `HasPriority` is
  now an idiomatic Kotlin property that still exposes `getPriority()` to Java,
  and `ExperimentalRenderBackend` remains public, open, and constructible with
  a no-argument constructor.

## Conversion boundaries
- **Touch-only conversion rule:** existing Java files are not mass-converted; convert only when the file is already being modified for feature/bug work and the change can be validated in the same PR.
- **Boundary rule:** modernization workstreams (VR abstraction, repositories, new data layer) create new classes in Kotlin by default.
- **Out-of-scope for this policy:** legacy packages outside the Kotlin-first roots can remain Java until they are explicitly scheduled for migration.

## Per-file completion gate

A Java file is ready to convert only when all of the following are true:

1. Its public JVM signature is unchanged, or every caller is migrated in the
   same change.
2. Nullability choices are based on call sites rather than guessed from
   decompiled annotations.
3. Focused unit/instrumentation tests cover the behavior, or the class is a
   declaration-only compatibility seam.
4. `:app:compileDebugKotlin`, `:app:testDebugUnitTest`, and the Kotlin-first
   source policy pass.
5. JNI/reflection/serialization entry points are checked explicitly before
   conversion; these should remain Java when signature parity is uncertain.

## Deprecated Android API policy

- Prefer typed AndroidX compatibility helpers, such as `BundleCompat`, over
  deprecated untyped framework accessors.
- Use the API 31 communication-device routing APIs for voice on current
  Android releases. The SCO/speakerphone APIs are retained only in an
  explicitly isolated API 26-30 fallback so the application's supported
  minimum SDK continues to work.
- A deprecation suppression must be attached to the smallest compatibility
  function possible; file-wide suppression is not allowed.
