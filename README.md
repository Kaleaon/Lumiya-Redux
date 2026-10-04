# Lumiya-Redux

Reconstruction of the Lumiya Second Life Android viewer. The original source
tree was lost along with the designer's laptop; this repo starts from the
shipped `lumiya3.4.2.apk` and rebuilds from there.

## Linkpoint Design & Ktheme Alignment

`Lumiya-Redux` aligns its theme resources with the universal **[Linkpoint Design](https://github.com/Kaleaon/linkpoint-design)** reference frame (`docs/DESIGN_LANGUAGE.md`). Android themes in `GlobalOptions` and `ThemeMapper` map directly to Linkpoint Design Ktheme palette families:
- `Theme_Lumiya_Light` → **Daylight Family** (`Frutiger Aero` / `Calm Clinical`)
- `Theme_Lumiya` (Dark) → **Terminal & Neon Family** (`Ink Terminal` / `Slate Cyan`)
- `Theme_Lumiya_Pink` → **Metal & Jewel Family** (`Burgundy Rose Gold` / `Rose Gold`)

## Layout

| Path | What it is |
| --- | --- |
| `app/` | Android Studio / Gradle module with recovered sources (AndroidX-migrated), resources, assets, native libs, manifest. |
| `recovered/` | Raw reverse-engineering outputs — see `recovered/README.md`. |
| `recovered/reference/` | Upstream Second Life references pulled for cross-checking (e.g. `message_template.msg` from `secondlife/master-message-template`). |
| `tools/migrate_androidx.py` | The `android.support.*` → `androidx.*` rewriter. |
| `tools/verify/` | Bytecode verifier against the original APK (`dexdiff.py`), link checker, before/after identity checker. |
| `tools/recover/` | Decompiler-bug fixers, candidate swapping, protocol labelling, original-bytecode jar builder. |
| `docs/recovery/` | [How the recovery is verified](docs/recovery/verified_recovery.md) and the [coding standard](docs/recovery/coding_standard.md) for recovered code. |
| `ARCHITECTURE.md` | Package-by-package tour of the codebase with links to `github.com/secondlife` reference repos. |
| `docs/protocol_migration_conformance.md` | Required migration safety mappings for message templates, LLSD/inventory semantics, and protocol-derived schema annotations. |
| `docs/modernization/kotlin-rust-roadmap.md` | Repository-wide Kotlin review queue, staged migration gates, and Rust behavior-mirror policy. |
| `rust-mirror/` | Independently tested Rust counterparts for reviewed, platform-neutral contracts. |
| `BUILD_STATUS.md` | What compiles, what doesn't, and the pattern-level description of every remaining error. |

## Verified against the original APK

Decompilers damage code quietly, so nothing here is taken on trust. Every
class in the build is checked against the bytecode of the shipped
`Lumiya_3.4.2.apk`. Classes whose source does not yet reproduce that bytecode
ship as the original compiled code. Current result: **0 damaged classes, 0
unresolved links**. See [docs/recovery/verified_recovery.md](docs/recovery/verified_recovery.md).

```bash
tools/recover/legacy/build_legacy_jar.sh /path/to/Lumiya_3.4.2.apk
tools/verify/verify_against_apk.sh      /path/to/Lumiya_3.4.2.apk
```

## Quick start

```bash
# Requires Android SDK (platforms;android-34, build-tools;34.0.0), JDK 17+.
./gradlew :app:compileDebugJavaWithJavac
```

## Developer Onboarding & Workstation Setup

To set up your local workstation and automatically install `pre-commit` hooks for code formatting and linter checks:

```bash
./scripts/setup_dev_environment.sh
```

Alternatively, install `pre-commit` manually and register the hooks into your local repository:

```bash
pip install pre-commit
pre-commit install
```

To run formatting (`black`) and linter checks (`ruff`, `check-yaml`, etc.) manually across all files:

```bash
pre-commit run --all-files
```

See [`ARCHITECTURE.md`](ARCHITECTURE.md) to navigate the code and
[`BUILD_STATUS.md`](BUILD_STATUS.md) for the last-mile cleanup list.

## CI/CD Pipeline & Itemized Verification Tasks

The unified CI workflow (`.github/workflows/ci.yml`) runs on pull requests and pushes to `main`/`master`, enforcing three itemized verification tasks:

1. **Task 1 - Pre-Commit Guardrails**: Code formatting and linter checks
   ```bash
   pre-commit run --all-files
   ```
2. **Task 2 - Android Build & Quality Verification**: Compile debug APK, run JVM tests, and Android lint
   ```bash
   ./gradlew --no-daemon :app:assembleDebug :app:check
   ```
3. **Task 3 - Protocol Conformance Verification**: Verify protocol definitions and ORM mapping conformance
   ```bash
   tools/protocol/run_conformance.sh
   ```
## Android support window

- **Minimum supported Android version:** 8.0 (API 26)
- **Target Android version:** 14 (API 34)

The min SDK is intentionally set to API 26 so cleanup passes can remove
pre-Oreo compatibility code (especially notification-channel fallbacks and
other low-API branches) without behavior drift between supported devices.
