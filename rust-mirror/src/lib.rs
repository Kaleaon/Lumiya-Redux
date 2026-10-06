//! Behavior-focused Rust counterparts to the recovered Android sources.
//!
//! Modules are added only after the corresponding JVM behavior is understood
//! and covered. This crate is secondary storage and is not linked into the
//! Android application.

pub mod callbacks;
pub mod migration_batch;
pub mod migration_batch3_small0;
pub mod migration_batch3_small1;
pub mod migration_batch3_small2;
pub mod migration_batch3_small3;
pub mod migration_batch3_small4;
pub mod migration_batch4_dao;
pub mod migration_batch4_ui;
pub mod migration_batch4_utils;
pub mod migration_batch4_render;
pub mod packet_offload;
pub mod protocol_messages;
pub mod slproto_types;
pub mod utils;
