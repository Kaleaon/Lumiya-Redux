# Lumiya 3.4.2 — Recovered Sources

Reverse-engineered from the only surviving artifact: `lumiya3.4.2.apk`
(SHA of DEX captured below). Produced because the original source tree was
lost with the designer's laptop.

## Layout

| Path | Contents | Produced by |
| --- | --- | --- |
| `src/` | Java source tree (≈3,000 files) reconstructed from `classes.dex`. Closest thing to the original source. | [jadx 1.5.1](https://github.com/skylot/jadx) |
| `android/AndroidManifest.xml` | Decoded binary manifest. | apktool 2.12.0 |
| `android/res/` | Decoded resources (layouts, drawables, strings, styles). | apktool 2.12.0 |
| `android/assets/` | Raw asset files shipped in the APK (fonts, grid lists, shaders, etc.). | `unzip` |
| `android/apktool.yml` | Build metadata (SDK versions, locales, framework id) that apktool needs for a round-trip rebuild. | apktool 2.12.0 |
| `smali/com/lumiyaviewer/` | Smali disassembly of the Lumiya package — kept as a ground-truth fallback for any Java method where jadx decompilation is lossy. Third-party packages (android.support, okhttp, butterknife, etc.) were dropped. | apktool / baksmali 3.0.9 |
| `native/librawbuf.so` | The only non-third-party native library, arm64-v8a build. | APK |
| `native/librawbuf.so.disasm.txt` | Full AArch64 disassembly. | Ghidra 12.0.4 headless |
| `native/librawbuf.so.decompiled.c` | Pseudo-C decompilation of every function. | Ghidra 12.0.4 headless |
| `native/librawbuf.so.symbols.txt` | Symbol table (addresses + names). | Ghidra 12.0.4 headless |

## What's in the APK at a glance

- **Package**: `com.lumiyaviewer.lumiya`
- **Java packages of interest** (under `src/com/lumiyaviewer/lumiya/`):
  - `slproto/` — Second Life message/protocol layer
  - `render/` — OpenGL / Daydream VR renderer (`WorldViewActivity`, `CardboardActivity`)
  - `ui/` — all Activities/Fragments (chat, inventory, login, minimap, etc.)
  - `voice/`, `voiceintf/` — voice chat
  - `orm/`, `dao/` — local DB layer (greenDAO)
  - `openjpeg/` — JNI wrappers for the bundled `libopenjpeg.so`
  - `sync/`, `cloud/`, `react/`, `eventbus/`, `utils/`
- **Native libs shipped in the APK** (7 ABIs: arm64-v8a, armeabi-v7a, armeabi, mips, mips64, x86, x86_64):
  - `libgvr.so` — Google VR SDK (third party, not included here)
  - `libopenjpeg.so` — OpenJPEG JPEG-2000 codec, upstream open source (not included here)
  - `librawbuf.so` — custom, 8 JNI entry points for fast memcpy between `DirectByteBuffer` and Java arrays (included, fully decompiled)

## Third-party code NOT included

These upstream libraries are present in `classes.dex` and in `smali/` in the
original APK but were **excluded** here to keep the recovery focused on
Lumiya's own code:

- `android.support.*` (AndroidX/Support Library)
- `android.arch.*` (Android Architecture Components)
- `com.google.*` (Play Services, GVR SDK, Protobuf)
- `com.astuetz.pagerslidingtabstrip`
- `com.nineoldandroids`
- `butterknife.*`
- `okhttp3.*`, `okio.*`
- `de.greenrobot.dao`
- `uk.co.senab.*` (PhotoView)
- `javax.annotation.*`

If you need to reconstruct a buildable project, pull these in as Gradle
dependencies rather than from the decompilation.

## Reproducing this recovery

```bash
# 1. Decode resources + smali
java -jar apktool_2.12.0.jar d -f -o apktool_out lumiya3.4.2.apk

# 2. Recover Java source
jadx --no-res -d jadx_out lumiya3.4.2.apk

# 3. Disassemble the custom native lib with Ghidra (headless)
analyzeHeadless /tmp/ghidra_proj LumiyaRawbuf \
    -import lib/arm64-v8a/librawbuf.so \
    -scriptPath . -postScript DumpAll.java
```

See `native/DumpAll.java`-equivalent logic in the commit history for the
Ghidra headless post-script that produced the `.disasm.txt` / `.decompiled.c`
files.

## Caveats

- **Decompiled code is not original source.** Comments, formatting, generic
  type parameters, local variable names, and some control-flow constructs
  (especially around `try/finally` and `switch`) are reconstructions. Behaviour
  should match byte-for-byte, but style will not.
- **ProGuard obfuscation**: by visual inspection the app does *not* appear to
  have been run through ProGuard/R8 name obfuscation — class and method names
  are meaningful — so the recovery is unusually clean.
- **Resource IDs**: numeric IDs in the decompiled Java (`R.id.foo = 0x7f…`)
  are re-resolved by jadx against the decoded `res/` tree. If you move files
  around, re-run jadx against the APK to keep them consistent.
- **Two jadx errors** were reported during decompilation but the tool still
  produced output for every class; inspect individual files before trusting
  them for a rebuild.
