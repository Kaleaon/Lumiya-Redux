# Kotlin Migration Plan (Gradual / Opportunistic)

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

### 3) UI leaf features (third)
Rationale: migrate isolated screens/components before touching shared UI scaffolding.

Kotlin-first package root:
- `com.lumiyaviewer.lumiya.ui.features`

## Enforcement
- Gradle `check` runs `enforceKotlinFirstPackages`, which fails if `.java` files are present in Kotlin-first roots.
- This enforces Kotlin-by-default only for selected package roots and leaves the rest of the Java tree untouched.
