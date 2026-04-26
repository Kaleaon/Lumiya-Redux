# Ghidra headless workflow for Lumiya APK recovery

## Why this was added

This repository already includes recovered APKs and smali/source artifacts, but our reverse-engineering flow needed clearer, reproducible headless steps tied to:

1. Practical `analyzeHeadless` usage patterns (batch import and batch scripting).
2. Better disassembly/decompilation triage habits from NSA's advanced Ghidra material.

This document is a short operator guide for those two goals.

## Source references used

- Tristan White: *Ghidra's Headless Analyzer* (posted October 19, 2024; updated December 7, 2024).
- NSA Ghidra class PDF: *Improving Disassembly and Decompilation (Moderately Advanced Ghidra Usage)*.

## Recommended repo workflow

### 1) Run the repo helper script

```bash
scripts/disassemble_lumiya.sh [APK_PATH] [WORKDIR]
```

Default input is a downloadable Lumiya APK URL (you can also pass a local APK path).

The helper now:

- runs JADX first (quick code navigation baseline),
- unpacks APK internals,
- builds an import zip for Ghidra,
- runs `analyzeHeadless` when available.

If `analyzeHeadless` is not on `PATH`, set `GHIDRA_HOME` and rerun.

### 2) Use headless import for scale

For large batches, prefer headless import + recursive analysis rather than opening each file in GUI one-by-one.

This aligns with the headless usage recommendations in the Tristan White guide.

### 3) Apply "analysis quality" triage from the NSA advanced slides

When results are noisy or wrong, prioritize this order:

1. **Non-returning functions**: mark known no-return functions to prevent downstream bad disassembly.
2. **Function starts**: verify suspicious missing/overgrown functions.
3. **Data type cleanup**: fix types before trusting pseudocode.
4. **Calling convention/signature corrections**: repair prototypes to improve callsite decompilation.
5. **Control-flow sanity check**: review weird irreducible blocks and re-run local analysis where needed.

## Practical notes for Lumiya

- Prefer validating behavior-critical fixes (network, renderer, transfer code) against recovered smali before large mechanical sweeps.
- Keep changes small and testable; avoid broad "normalize everything" edits without per-file evidence.
- Use headless batch analysis for discovery, then use targeted manual correction for high-impact paths.

## Known environment caveat

Some CI/dev shells may not have Ghidra installed. In that case, the helper exits after JADX with a warning instead of failing hard.
