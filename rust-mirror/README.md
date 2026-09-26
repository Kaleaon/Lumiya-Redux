# Rust behavior mirror

This workspace is secondary storage for reviewed Rust counterparts to Lumiya's
production code. It is deliberately **not** an automated Java-to-Rust dump and
is not linked into the Android APK. Android framework types, JNI entry points,
rendering resources, and recovered protocol behavior need explicit designs and
parity tests before a Rust counterpart is useful or safe.

Each entry in `mapping.csv` records the JVM source represented by a Rust module.
A mapping means that the contract has a counterpart; it does not mean the
Android implementation has been replaced. Run the crate independently with:

```bash
cargo test --manifest-path rust-mirror/Cargo.toml
```

See [`../docs/modernization/kotlin-rust-roadmap.md`](../docs/modernization/kotlin-rust-roadmap.md)
for the staged migration rules and completion definition.
