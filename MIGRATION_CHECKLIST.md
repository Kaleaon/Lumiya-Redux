# Migration checklist (compile-baseline triage)

## Google VR + protobuf (first pass)
- [x] `com/google/vr/cardboard/ConfigUtils.java` — rebuilt decompiled try/catch flow and normalized catch variables.
- [x] `com/google/vr/cardboard/ContentProviderVrParamsProvider.java` — rebuilt query/cursor handling and normalized exception handling.
- [x] `com/google/vr/sdk/base/HeadTransform.java` — fixed decompiler temp-variable artifact in quaternion math.
- [x] `com/google/vr/vrcore/library/api/ObjectWrapper.java` — added explicit generic cast in unwrap path.
- [x] `com/google/protobuf/nano/MessageNano.java` — removed invalid `@Override` decompile artifact.
- [x] `com/google/protobuf/nano/ExtendableMessageNano.java` — fixed generic return cast.
- [x] `com/google/protobuf/nano/CodedInputByteBufferNano.java` — fixed broken varint64 temporary variable artifact.
- [x] `com/google/protobuf/nano/CodedOutputByteBufferNano.java` — fixed broken UTF-8 encoding temp-variable artifact.
- [x] `com/google/protobuf/nano/MessageNanoPrinter.java` — fixed raw `Map.Entry` generic typing.
- [x] `com/google/protobuf/nano/InternalNano.java` — fixed generic map/message casts from decompiled code.

## Lumiya core follow-up
- [x] `com/lumiyaviewer/lumiya/slproto/users/ChatterID.java` — replaced `-$Lambda$...` artifacts with valid lambdas; removed synthetic `final` from switch-map array.
- [x] `com/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever.java` — replaced `-$Lambda$...` artifacts with method refs/lambdas.
- [x] `com/lumiyaviewer/lumiya/ui/common/UserFunctionsFragment.java` — removed duplicate AlertDialog import.
- [x] `com/lumiyaviewer/lumiya/ui/search/SearchGridAdapter.java` — resolved nested holder generic reference and removed embedded ButterKnife generated binding artifact.
- [x] `com/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter.java` — resolved nested class generic reference.
- [x] `com/lumiyaviewer/lumiya/ui/myava/TransactionLogAdapter.java` — resolved nested holder generic reference and removed embedded ButterKnife generated binding artifact.
- [x] `com/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask.java` — qualified nested result generic type in AsyncTask signature.
- [x] `com/lumiyaviewer/lumiya/slproto/messages/*.java` — normalized common decompiler artifacts (`Iterator<T>` and catch-variable rebinding cleanup) for message parser set.
