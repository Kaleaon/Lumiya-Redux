# Lumiya-Redux

Reconstruction of the Lumiya Second Life Android viewer. The original source
tree was lost along with the designer's laptop; this repo starts from the
shipped `lumiya3.4.2.apk` and rebuilds from there.

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

See [`ARCHITECTURE.md`](ARCHITECTURE.md) to navigate the code and
[`BUILD_STATUS.md`](BUILD_STATUS.md) for the last-mile cleanup list.

## Pull-request verification

Every pull request runs the Android CI workflow. It installs the pinned API 34
SDK, validates the Gradle wrapper, builds a debug APK, and runs the complete
Gradle `check` lifecycle (including JVM tests, Android lint, and the repository's
source-policy checks). Successful runs retain the installable debug APK for 14
days; lint and unit-test reports are uploaded even when verification fails.

Run the same verification locally with:

```bash
./gradlew --no-daemon :app:assembleDebug :app:check
```

## Protocol conformance checks

```bash
tools/protocol/run_conformance.sh
```

Run this before protocol modernization changes and rely on CI to enforce it for touched protocol packages.
## Android support window

- **Minimum supported Android version:** 8.0 (API 26)
- **Target Android version:** 14 (API 34)

The min SDK is intentionally set to API 26 so cleanup passes can remove
pre-Oreo compatibility code (especially notification-channel fallbacks and
other low-API branches) without behavior drift between supported devices.
