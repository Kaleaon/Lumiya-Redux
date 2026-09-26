//! Rust counterparts for the first 4 sources of the "`small_02`" Kotlin
//! migration batch (the remaining ~44 sources land in a later commit).
//!
//! `SpatialIndex`'s ownership-guard logic is pure and mirrored directly with
//! a test. `GLResourceManager`, `GLQuery`, and `ObjectPopupsActionProvider`
//! are OpenGL/Android-View-owned; they get explicit boundary marker types
//! instead of invented logic.

// ---------------------------------------------------------------------------
// behavior: SpatialIndex — single-owner enable/disable guard.
// ---------------------------------------------------------------------------

/// Mirrors `SpatialIndex.DisableObjectIndex`'s guard for whether the active
/// index's `disableIndex()` is invoked. `indexHolder`/`objectIndex` are
/// always cleared unconditionally by the caller regardless of this result;
/// invocation additionally requires an active index, and either the caller
/// still owns the held reference (by identity) or the held reference was
/// already cleared.
#[must_use]
pub fn may_disable_object_index(
    has_active_index: bool,
    held_matches_caller: bool,
    held_is_none: bool,
) -> bool {
    has_active_index && (held_matches_caller || held_is_none)
}

// ---------------------------------------------------------------------------
// boundary: Android-lifecycle/View/OpenGL marker types.
// ---------------------------------------------------------------------------

/// Marker types make Android/OpenGL-owned implementations explicit at the
/// FFI seam; none of these carry mirrored logic.
pub mod android_boundary {
    macro_rules! boundary_types {
        ($($name:ident),+ $(,)?) => {$ (
            #[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
            pub struct $name;
        )+ };
    }

    boundary_types! {
        GLResourceManager, GLQuery, ObjectPopupsActionProvider
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn disable_index_not_invoked_when_no_active_index() {
        // The caller's held state is always cleared unconditionally by
        // `DisableObjectIndex`; this function only answers whether
        // `disableIndex()` itself is invoked, which requires an active index.
        assert!(!may_disable_object_index(false, false, false));
        assert!(!may_disable_object_index(false, true, true));
    }

    #[test]
    fn disable_allowed_when_caller_owns_the_held_reference() {
        assert!(may_disable_object_index(true, true, false));
    }

    #[test]
    fn disable_allowed_when_held_reference_already_cleared() {
        assert!(may_disable_object_index(true, false, true));
    }

    #[test]
    fn disable_refused_when_another_owner_holds_the_index() {
        assert!(!may_disable_object_index(true, false, false));
    }
}
