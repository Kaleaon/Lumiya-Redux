# Verified recovery of Lumiya 3.4.2

Every decompiler damages something. jadx, Vineflower and CFR each produce
Java that compiles but quietly does something different from the app that
shipped. This repo no longer trusts any of them. The shipped
`Lumiya_3.4.2.apk` is the only ground truth, and every class that goes into
the build is **checked against its original bytecode**.

```
sha256(Lumiya_3.4.2.apk) = cc4bac60dc2df24f5e4e98be293ba4b9061ac237156afab6629793fa2ffc0c5d
```

## What the damage looked like

These were all found by the verifier, not by reading code. The source looked
plausible every time.

| Damage | Where | Effect |
| --- | --- | --- |
| jadx replaced the literal `255` with Guava `UnsignedBytes.MAX_VALUE`, a **byte** equal to -1, so `b & 255` became `b & -1` | 433 sites in 235 files, mostly packet decoding | bytes sign-extend; array lookups go out of bounds; decoded values are wrong |
| covariant `clone()` overrides renamed `mo6clone()`, plus 119 other synthetic method names | protobuf nano, GVR, chat dialogs | overrides silently stop overriding |
| raw resource ids from the original APK left as integers | GVR `R` classes, several activities | wrong layouts, strings and drawables after resources are recompiled |
| empty `switch` | `GridConnectionService.notifySettingsByType` | group chat and IMs used the local-chat notification settings |
| "decompiled incorrectly" bodies replaced by hand-written guesses in earlier passes | e.g. `SLCircuit.ProcessReceive` | ACKs dropped when a packet failed to parse; different ordering |
| refactors that dropped calls | `CardboardActivity` | VR mode lost keep-screen-on, immersive fullscreen, VR mode and sustained-performance mode |
| nested classes moved to top-level files | 4 adapters | ButterKnife binding class names changed |

## The pipeline

```
Lumiya_3.4.2.apk
   │  baksmali (lossless)                      ┌───────────────────────────┐
   ├──────────────────────► original smali ───►│ tools/verify/dexdiff.py    │◄── rebuilt APK → baksmali
   │                                           │ per-method fingerprints    │
   │  jadx (safe flags) / Vineflower / CFR     └─────────────┬─────────────┘
   ├──────────────────────► candidate sources ──► tools/recover/swap_candidates.py
   │                                              (compile, error-guided repair, verify, keep only if better)
   │  dex2jar + ASM remap (tools/recover/legacy)
   └──────────────────────► app/libs/lumiya-original-classes.jar
                              original bytecode for every class no source reproduces yet
```

### 1. The referee: `tools/verify/dexdiff.py`

Both the original and the rebuilt APK are disassembled with baksmali. Each
method is reduced to what it *does*, independent of compiler and register
allocation:

* methods it calls, fields it reads and writes, types it creates or checks
* string constants, numeric constants, and resource ids resolved to their names
* whether it throws, catches or switches

Anything the original method does that the rebuilt one does not is **damage**.
The normalisations for legitimate toolchain differences are documented in the
script: D8 vs dx lambdas, javac accessors, enum `$values`, ButterKnife 8 vs 10
field names, `minSdk 26` folding of `SDK_INT` branches (reported separately as
`sdk_folded`), and so on. Self-check: original vs original reports zero
differences.

Differences a person reviewed and judged intentional or codegen-only live in
`tools/verify/accepted.txt`, **each with its reason**. The script refuses an
entry without one.

### 2. Link check: `tools/verify/linkcheck.py`

Every call and field access between app classes in the built APK must resolve.
javac guarantees this for source; this check covers the original bytecode
linked from the jar.

### 3. Identity check: `tools/verify/smali_identical.py`

This one is for cleanup-only changes: renames, named constants, comments,
labels. It compares the build before and after, and passes only if every
instruction of every class is identical. It allows differences in debug info
and newly added named constants (which javac inlines). All readability work in
this repo passed it.

### 4. Repairs

* `tools/recover/fixers.py` holds mechanical fixes for known decompiler bug
  patterns (AndroidX names, `UnsignedBytes`, renamed `clone`, resource ids).
  They are applied to every candidate source.
* `tools/recover/restore_renames.py` undoes jadx method renames using its own
  `/* renamed from: */` notes.
* `tools/recover/swap_candidates.py` tries alternative decompilations per
  damaged class. It compiles them, applies error-guided rewrites (e.g.
  `((Outer) this)` → `Outer.this` inside anonymous classes), and keeps a
  candidate only when the referee proves it better.
* Hand repairs: the method is rewritten from its smali and then verified.

### 5. The safety net: original bytecode

A class that no source reproduces yet can ship as its **original compiled
code** while it is being repaired:

* `tools/recover/bytecode_classes.txt` lists these classes. **It is empty
  today: every class is compiled from source.**
* When the list is non-empty, `app/build.gradle` stops compiling their `.java`
  and links `app/libs/lumiya-original-classes.jar` instead.
* `tools/recover/legacy/build_legacy_jar.sh` builds the jar: dex2jar (zero
  conversion errors on this dex), then ASM remaps `android.support.*` →
  AndroidX using the same table as the source migration, pulls in each class's
  original ButterKnife binding and D8 lambda classes, and routes `PendingIntent`
  factories through `compat/PlatformCompat` (Android 12 requires a mutability
  flag). With an empty list it deletes the jar.
* `app/stable-ids.txt` pins all 3,798 original resource ids (`aapt2
  --stable-ids`), so ids compiled into original bytecode still resolve.

To move a class back to source, fix its `.java`, delete its line from
`bytecode_classes.txt`, rebuild the jar, and run the verifier. The class must
come out `OK`.

### 6. Methods no decompiler could structure

jadx, CFR and Vineflower all failed on `GvrSurfaceView.GLThread.guardedRun`
(the VR render loop; jadx left a stub that threw
`UnsupportedOperationException`). It was written by hand from the smali: it is
the AOSP `GLSurfaceView` render loop plus Google VR's swap-mode handling
(`EGL_RENDER_BUFFER` / `EGL_FRONT_BUFFER_AUTO_REFRESH_ANDROID`).

### 7. Readability passes that must not change the build

* `tools/recover/names/FixSwitchMaps.java` replaces the switch-map helpers
  jadx prints for dx-compiled enum switches (`switch (m199x…()[key.ordinal()])
  { case 1: … }`) with plain `switch (key) { case agent_id: … }`, and removes
  the helper and its cache field (35 files).
* `tools/recover/names/FixOuterParam.java` removes the explicit outer-instance
  parameters jadx prints for inner-class constructors.

Classes with intentional post-recovery work (Android 8–14 service and
notification rules, the VR runtime boundary, the render backend, the Room
migration, `PriorityBinQueue` fixes) are in `tools/recover/protected.txt` and
are never replaced automatically.

## Running it

```bash
# once: JDK 17, Android SDK 34 (ANDROID_HOME), python3
tools/recover/legacy/build_legacy_jar.sh /path/to/Lumiya_3.4.2.apk
tools/verify/verify_against_apk.sh      /path/to/Lumiya_3.4.2.apk
# -> damaged classes: 0, linkcheck: 0 unresolved references
```

Where Maven Central rate-limits, set `MAVEN_REPO` to a mirror, e.g.
`https://maven-central.storage-download.googleapis.com/maven2`.

## Current state

| | classes |
| --- | --- |
| verified identical in behaviour (`OK`) | 1,163 |
| only additions (javac/jadx artefacts, documentation-driven rewrites, `sdk_folded` branches) | 260 |
| reviewed differences in `accepted.txt` | 25 |
| **damaged** | **0** |
| shipped as original bytecode | **0** |

The verifier also lists two kinds of method for human review. They are not
counted as damage:

* **REDUCED** (64 methods): a call or field access appears fewer times than in
  3.4.2 but is not gone. All 64 were triaged. The causes seen: dx duplicating
  `finally` blocks and branch tails that javac/D8 share (e.g.
  `InventoryFragment.updateLoadingStatus`, `GLThread.run`,
  `SLInventoryUDPFetchRequest.HandleInventoryDescendents`), try-with-resources
  replacing hand-written close/catch pairs (`AnimationCache`), and differences
  already listed in `accepted.txt` (GPU capability probe, notification
  groups).
* **SDKFOLD** (42 methods): a `Build.VERSION.SDK_INT` check disappeared, and
  the verifier cannot tell which lost calls sat in the dead branch. All 42 were
  reviewed by hand. One hid a real loss: `DatabaseCommitThread.run` had been
  rewritten without the per-batch commit and `yieldIfContendedSafely()`, and
  is now restored.

## Decisions left for the maintainer

* **Behaviour from earlier passes that faithful source replaced.** Earlier
  hand-rewrites (PRs 29, 31, 32) added behaviour that 3.4.2 never had, such as
  bounded retries in cache I/O and inventory transaction cleanup. Where those
  files did not verify, they were rewritten to match 3.4.2 exactly. The 92
  affected classes are listed in `docs/recovery/superseded_hand_edits.txt`. To
  bring a fix back, apply it on top of the faithful source and record it in
  `accepted.txt`.
* **Login identity (TPV policy).** `SLAuth` sends `channel = "Lumiya Release"`
  and `user-agent = "Lumiya"`, exactly like 3.4.2. Second Life's Third Party
  Viewer policy expects a modified viewer to identify itself honestly. The
  channel name for Lumiya-Redux is a maintainer decision.
