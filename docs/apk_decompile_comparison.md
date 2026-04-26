# APK decompile comparison (2026-04-26)

This pass decompiled the recovered original APKs and compared behavior-critical methods against the repo Java sources.

## Inputs

- `recovered/original_apks/Lumiya_3.4.2.apk`
- `recovered/original_apks/Lumiya Voice Plugin_1.4.apk`
- `recovered/original_apks/Lumiya Cloud Plugin_1.0.apk`

## Decompiled output

- `recovered/jadx_apks/lumiya342/`
- `recovered/jadx_apks/voice14/`
- `recovered/jadx_apks/cloud10/`
- `artifacts/ghidra_compare/lumiya342/jadx-output/`
- `artifacts/ghidra_compare/lumiya342/ghidra.log`

## Comparison scope

Focused on previously patched core files:

- `GlobalOptions.getTotalMemory()`
- `WorldViewRenderer.processObjectPick()` and aspect ratio setup
- `SLWorldMap.HandleFindAgent()`
- `SLTextureFetcher.HandleImageData()/HandleImagePacket()`
- `SLXfer.invokeListeners()`

## Findings

1. **One accuracy mismatch found and corrected**
   - In `WorldViewRenderer.processObjectPick()`, repo code returned immediately on object-loop exception.
   - Smali behavior logs the exception but still reaches final handler dispatch if a prior pick result exists.
   - Java was updated to match that behavior (warn-and-continue-to-final-dispatch instead of early return).

2. **One additional region-handle mismatch found and corrected**
   - In `SLWorldMap.HandleMapBlockReply()`, decompiled Java used `((data.X * 256) << 32)` without widening first.
   - Smali shows `int-to-long` before `shl-long`, so the high 32 bits must be formed from a long shift.
   - Java was corrected to `(((long) (data.X * 256)) << 32)` to match APK behavior.

3. **Ghidra vs JADX practical difference**
   - Ghidra headless successfully analyzed both ELF `.so` files and `classes.dex` from the APK bundle in one pass (`Dalvik Executable (DEX)` loader + ELF loaders).
   - For Java-level readability, JADX remains easier to navigate; for native/loader-level confirmation and analyzer coverage, Ghidra provided broader visibility.

4. **Other targeted methods match expected behavior**
   - Texture fetch completion callback retention logic matches smali monitor-exit and callback flow.
   - `SLXfer.invokeListeners()` now iterates concrete listener wrapper type and matches smali cast/dispatch behavior.
   - `SLWorldMap.HandleFindAgent()` region-handle composition and local offsets align with decompiled/smali behavior.
   - `GlobalOptions.getTotalMemory()` uses explicit accumulator and zero default, matching register initialization semantics.

## Notes

- JADX output for some classes remains partially degraded (typical for this APK), so smali remains the source of truth for edge control flow.
- Voice/cloud plugin APKs were decompiled for parity/reference; this patch did not require plugin-source behavior changes.
