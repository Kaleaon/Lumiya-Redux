# Kotlin modernization and Rust mirror roadmap

## Purpose

Lumiya contains recovered application code, bundled third-party sources, Android
resources, shaders, and native binaries. Treating all of those as mechanically
translatable would lose Android behavior and make bytecode recovery impossible
to review. This roadmap gives **every production JVM source** a place in a
repeatable inventory while requiring small, tested migrations.

The Android application remains Kotlin/JVM. Rust is a secondary, non-shipping
behavior mirror until an explicit Android/JNI integration proposal is approved.
No generated Rust placeholder counts as a port.

## Complete inventory

`tools/modernization/inventory.py` discovers every `.java` and `.kt` file under
`app/src/main/java`; therefore newly recovered files enter the backlog without a
hand-maintained checklist. Its CSV form is the canonical review queue:

```bash
python3 tools/modernization/inventory.py --fail-if-empty --check
python3 tools/modernization/inventory.py --csv > /tmp/lumiya-modernization.csv
```

The checked-in `remaining-java.txt` snapshot lists every production Java source
still awaiting migration. Regenerate it after each conversion; `--check`
rejects stale snapshots:

```bash
python3 tools/modernization/inventory.py --remaining-java > docs/modernization/remaining-java.txt
```

The summary separates Kotlin from Java awaiting review. Rust counterparts must
be registered in `rust-mirror/mapping.csv`, which makes one shared Rust module
able to represent several related JVM contracts without inventing fake files.
Each mapping is classified as `behavior`, `contract`, or `boundary`. A boundary
is executable Rust type/trait scaffolding for code whose implementation remains
owned by Android; it is not presented as a native reimplementation.

## Definition of done for one JVM source

1. Identify callers, subclasses, reflection, serialization, JNI, and generated
   code dependencies.
2. Add or identify focused behavior tests before changing the implementation.
3. Convert to idiomatic Kotlin while preserving its Java-visible binary API;
   nullable types must be justified by callers rather than guessed.
4. Compile both Kotlin and Java consumers and run unit tests, lint, protocol
   conformance (when applicable), and APK bytecode/link verification.
5. Add a Rust counterpart only when behavior can be represented independently
   of Android, or document an Android adapter design first.
6. Record the counterpart in `rust-mirror/mapping.csv` and test it with Cargo.
7. Keep each commit narrow enough to diagnose and revert independently.

## Ordered work streams

### 0. Guardrails and accounting

- Keep the dynamic source inventory and Rust mapping valid.
- Preserve original-bytecode fallbacks until the existing verifier accepts a
  replacement.
- Never modify recovered reference/decompiler output to make migration counts
  look better; only `app/src/main/java` is the shipping JVM queue.

### 1. Leaf contracts and pure utilities

- Convert interfaces, value types, math helpers, collections, and codecs with
  no Android lifecycle dependency.
- Mirror deterministic algorithms and data contracts in Rust first.
- Completed slices:
  - utility contracts: `AbstractFilter`, `HasList`, and `Identifiable`;
  - lifecycle and observer contracts in `react`, `res`, `slproto`, and `utils`;
  - UI callback and fragment contracts in `ui/common`, `ui/chat`, and
    `ui/render`.
  - a 100-source batch spanning request infrastructure, renderer values,
    protocol data, RLV command metadata, small UI types, and VR boundaries;
    every source in this batch has a compiled Rust behavior, contract, or
    explicit Android-boundary counterpart.
  - 461 generated UDP message classes migrated across two protocol-focused
    batches (261, then 200); their Rust contract registry independently records
    message-template names, zero-coding, fixed payload sizes where applicable,
    and dispatch methods.
- The source inventory is the authority for remaining Java work; counts are
  intentionally calculated rather than copied into this document.

### 2. Protocol models and codecs

- Freeze UDP message, LLSD, inventory, UUID, and asset fixtures.
- Convert parsers and models package-by-package, preserving wire encodings and
  unknown-field behavior.
- Use the same fixture corpus for Kotlin and Rust rather than comparing only
  hand-selected examples.

### 3. Persistence and repositories

- Finish Room authority and schema migration before removing greenDAO.
- Keep database entities Kotlin-first; mirror query/domain semantics in Rust,
  not Android Room annotations.
- Test upgrades, downgrades, null columns, ordering, and transaction boundaries.

### 4. Networking and session state

- Separate transport-neutral state machines from Android services and sockets.
- Port those state machines after captured-session replay tests exist.
- Treat authentication, TLS, reconnect, capabilities, and throttling as
  security-sensitive review units.

### 5. Rendering, assets, and native boundaries

- Convert renderer orchestration to Kotlin behind the existing backend seams.
- Do not translate GLSL shaders, images, audio, or packaged `.so` files into
  Rust; inventory them as assets or replace them through a separate proposal.
- Rust math/mesh decoders require benchmark and golden-image parity gates before
  any JNI integration.

### 6. Android UI and platform services

- Migrate one screen at a time to Kotlin and View Binding with lifecycle and
  instrumentation coverage.
- Keep Activities, Fragments, notifications, audio, sensors, and permissions on
  the JVM side unless a pure domain component can be extracted.
- Rust mirrors model domain behavior only; they do not imitate Android APIs.

### 7. Bundled Google VR and third-party code

- Prefer a supported upstream dependency or replacement over transliteration.
- Retain recovered sources and binaries until the decommission gates in
  `MIGRATION_CHECKLIST.md` pass.
- License, provenance, and compatibility review is mandatory before mirroring
  third-party implementation code in Rust.

## Repository-wide completion gates

- The inventory reports zero Java sources awaiting review (a reviewed decision
  to retain Java must be represented by a future exception ledger).
- Every mapped Rust module passes formatting, Clippy, and tests.
- Android assemble, check, lint, protocol conformance, and original-APK link/
  bytecode verification pass.
- No JNI or reflection ABI is changed accidentally, and performance-sensitive
  paths meet recorded baselines.
- Documentation describes any intentionally JVM-only or asset-only component;
  “all code” means every file is accounted for, not blindly transliterated.
