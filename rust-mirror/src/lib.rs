//! Behavior-focused Rust counterparts to the recovered Android sources.
//!
//! Modules are added only after the corresponding JVM behavior is understood
//! and covered. This crate is secondary storage and is not linked into the
//! Android application.

pub mod callbacks;
pub mod migration_batch;
pub mod migration_batch3_small0;
pub mod protocol_messages;
pub mod utils;
