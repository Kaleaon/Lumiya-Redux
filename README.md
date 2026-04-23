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
| `ARCHITECTURE.md` | Package-by-package tour of the codebase with links to `github.com/secondlife` reference repos. |
| `BUILD_STATUS.md` | What compiles, what doesn't, and the pattern-level description of every remaining error. |

## Quick start

```bash
# Requires Android SDK (platforms;android-34, build-tools;34.0.0), JDK 17+.
./gradlew :app:compileDebugJavaWithJavac
```

See [`ARCHITECTURE.md`](ARCHITECTURE.md) to navigate the code and
[`BUILD_STATUS.md`](BUILD_STATUS.md) for the last-mile cleanup list.

## Android support window

- **Minimum supported Android version:** 8.0 (API 26)
- **Target Android version:** 14 (API 34)

The min SDK is intentionally set to API 26 so cleanup passes can remove
pre-Oreo compatibility code (especially notification-channel fallbacks and
other low-API branches) without behavior drift between supported devices.
