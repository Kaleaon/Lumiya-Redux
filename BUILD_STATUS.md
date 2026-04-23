# Build status

Snapshot taken against `./gradlew :app:assembleDebug`, AGP 8.7.3, Gradle
8.10.2, JDK 21, Android SDK 34, on the `claude/reverse-engineer-apk-zBeon`
branch at the commit that introduces this file.

Current SDK window in this branch: `minSdk 26`, `targetSdk 34`, `compileSdk 34`.

## What works

| Stage | Status |
| --- | --- |
| Gradle configuration | Clean — `settings.gradle` + `build.gradle` resolve, wrapper runs. |
| Dependency resolution | All Maven coordinates resolve (AndroidX, Material, OkHttp, greenDAO 2.1.0, ButterKnife 10.2.3, Gson, Guava, JSR-305, PagerSlidingTabStrip, nineoldandroids, Protobuf-lite). |
| Manifest merge (`processDebugMainManifest`) | Passes after: removing `package=` attr, deduping `READ_EXTERNAL_STORAGE`, adding explicit `android:exported` on every `<activity>`. |
| Resource merge (`mergeDebugResources`) | Passes after stripping ~306 `<attr>` declarations from `res/values/attrs.xml` that duplicate AndroidX / Material attrs. |
| Resource compile (`processDebugResources`) | Passes. R class is generated correctly. |
| Source migration | All `android.support.*` / `android.arch.*` imports in the Lumiya Java tree rewritten to their AndroidX equivalents (1,003 occurrences across 305 files). See `tools/migrate_androidx.py`. |
| Java compile | **Partially failing** — see below. |
| `librawbuf.so`, `libopenjpeg.so`, `libgvr.so` packaging | Works (present under `src/main/jniLibs/<abi>/`). |

## What is still failing

`./gradlew :app:compileDebugJavaWithJavac` reports ~100 errors across ~60
files. Every remaining error is a jadx-decompilation artefact — none of them
reflect a missing dependency, misrouted import or structural error in the
project. Four patterns cover all of them:

### 1. Lost catch-clause variable names (dominant, ~75% of errors)

```
} catch (IOException e2) {
    e = e2;                      // ← javac: "cannot find symbol: e"
}
```

jadx frequently emits the assignment `e = e2;` inside a catch block when it
reconstructs a `try { … } catch (X e) { … }` but loses the original variable
declaration. **Fix:** change the catch-clause variable name to `e` (or
declare `X e = null;` in the enclosing scope). Files affected:

- `com/google/vr/cardboard/ConfigUtils.java` (9 spots)
- `com/google/vr/cardboard/ContentProviderVrParamsProvider.java` (3 spots)
- `com/lumiyaviewer/lumiya/slproto/llsd/LLSDNode.java` (4 spots)
- `com/lumiyaviewer/lumiya/slproto/messages/*.java` — several "Reply" parsers where `catch (Exception e) { e = e2; … }` appears.

### 2. Lambda desugaring artefacts (5–10% of errors)

```
… new Subscription.OnData() { // from class: com.lumiyaviewer.lumiya.slproto.users.-$Lambda$0dEDWURupJXcv_HDGgfxSQl02DE
    @Override public void onData(…) { ((ChatterNameRetriever) this).m274x6559d93e(…); }
}
```

These `-$Lambda$…` synthetic class names come from D8 lambda desugaring; jadx
didn't fold them back into the enclosing class. **Fix:** replace the
anonymous class with a proper lambda that calls the `m274…` helper directly
(or rename the helper and invoke it normally).  Affected files:
`slproto/users/ChatterID.java`, `slproto/users/ChatterNameRetriever.java`.

### 3. Static-final switch-table reassignment (~5% of errors)

```
static final int[] f114x653d09df;
static { … }

// in a catch/finally somewhere:
f114x653d09df = iArr;            // ← javac: cannot assign to final variable
```

jadx emits the synthetic switch-table array as `static final` but leaves a
reassignment in a try/catch fallback branch that the bytecode never actually
reached. **Fix:** remove the `final` modifier on the synthetic switch-table
field.  Mainly in `slproto/llsd/LLSDNode.java`.

### 4. Forward-referenced nested class via generic type (~3% of errors)

```
class NavDrawerAdapter extends ArrayAdapter<NavDrawerItem> {   // line 27
    …
    static class NavDrawerItem { … }                            // line 64
}
```

Modern javac (21) is stricter than the compiler used when Lumiya originally
built, and occasionally refuses to resolve a nested class used in its
enclosing class's generic bound. **Fix:** hoist `NavDrawerItem` and
`NavDrawerActivityItem` into their own top-level files (same package). Same
pattern for `SearchViewHolder`, `TransactionViewHolder`, `UploadImageResult`.

### Specific additional one-offs

- `ui/common/UserFunctionsFragment.java:11` — duplicate `AlertDialog` import after AndroidX migration. Remove the non-AndroidX one.
- `uk/co/senab/photoview/PhotoViewAttacher.java:902` — jadx lost `r0` variable. Either migrate to `com.github.chrisbanes:PhotoView:2.3.0` or declare `Matrix r0 = getDisplayMatrix();` (or equivalent, inferred from the smali) above the call site.
- `com/google/protobuf/nano/MessageNano.java:58` — `@Override` on a method whose superclass doesn't have it; drop the annotation.
- `com/google/protobuf/nano/ExtendableMessageNano.java:62` — generic-return decompile bug; cast `(M) this`.
- `com/google/vr/vrcore/library/api/ObjectWrapper.java:21` — same generic-return bug; cast `(T) ((ObjectWrapper) iObjectWrapper).wrappedObject`.

## How to iterate

Because these are all small local edits, the practical workflow is:

1. Open the project in Android Studio (it reads `app/build.gradle` directly; no extra setup).
2. Turn off "Error highlighting" suppression in the Java editor to see every issue inline.
3. Run `./gradlew :app:compileDebugJavaWithJavac --rerun-tasks -Xmaxerrs=9999 2>&1 | tee /tmp/compile.log` once to get the full list (javac otherwise caps at 100).
4. Apply the fixes above file by file; most are five-second edits.
5. The release-compile trail (`R8`, dex, APK sign) has **not** been exercised. Expect a handful of additional R8 issues once the project compiles; the `proguard-rules.pro` starter kit keeps the common reflection consumers.

## Not-yet-addressed, but lower priority

- **Release-build minification** is disabled. Re-enabling R8 will need `-keep` rules for greenDAO entities, ButterKnife-generated view-binding classes, JNI callbacks into `com.lumiyaviewer.rawbuffers.DirectByteBuffer` and `com.lumiyaviewer.lumiya.openjpeg.*`.
- **MIPS support** was dropped from `abiFilters` because NDK removed MIPS in r17. Not revisiting.
- **GVR** will keep running from the bundled `libgvr.so`, but the SDK is end-of-life. The clean replacement is the open [Google Cardboard SDK](https://github.com/googlevr/cardboard), at the cost of rewriting `CardboardActivity` and the renderer wiring.
