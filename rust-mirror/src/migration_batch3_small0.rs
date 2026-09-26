//! Rust counterparts for the "`small_00`" 47-source Kotlin migration batch.
//!
//! Pure, deterministic algorithms and data shapes extracted from these
//! sources are mirrored directly and covered by tests. Classes whose whole
//! purpose is Android lifecycle, View/Preference/Adapter plumbing, OpenGL
//! state, `SQLite` DDL, or JNI/reflection are represented as explicit
//! Android-boundary marker types instead: no logic is invented for them.

// ---------------------------------------------------------------------------
// behavior: RenderSettings — parse-with-fallback for stored render prefs.
// ---------------------------------------------------------------------------

/// Mirrors `RenderSettings.parseIntSetting`: parse a preference string into an
/// int, falling back to `default` when missing or not a valid integer.
#[must_use]
pub fn parse_int_setting(value: Option<&str>, default: i32) -> i32 {
    value.and_then(|v| v.parse::<i32>().ok()).unwrap_or(default)
}

// ---------------------------------------------------------------------------
// behavior: VrIntentContract — runtime id sanitization + intent constants.
// ---------------------------------------------------------------------------

pub mod vr_intent_contract {
    pub const ALIAS_VR_ACTIVITY_CLASS: &str = "com.lumiyaviewer.lumiya.ui.render.VrActivity";
    pub const ACTION_LEGACY_CARDBOARD_ENTRY: &str =
        "com.lumiyaviewer.lumiya.ui.render.CardboardActivity";
    pub const ACTION_VR_ENTRY: &str = "com.lumiyaviewer.lumiya.ui.render.VrActivity";
    pub const EXTRA_VR_RUNTIME: &str = "com.lumiyaviewer.lumiya.ui.render.extra.VR_RUNTIME";
    pub const VR_RUNTIME_AUTO: &str = "auto";
    pub const VR_RUNTIME_CARDBOARD: &str = "cardboard";
    pub const VR_RUNTIME_OPENXR: &str = "openxr";

    /// Mirrors `VrIntentContract.sanitizeRuntime`.
    #[must_use]
    pub fn sanitize_runtime(value: Option<&str>) -> &'static str {
        match value {
            Some(VR_RUNTIME_OPENXR) => VR_RUNTIME_OPENXR,
            Some(VR_RUNTIME_CARDBOARD) => VR_RUNTIME_CARDBOARD,
            _ => VR_RUNTIME_AUTO,
        }
    }
}

// ---------------------------------------------------------------------------
// behavior: WhatsNewActivity — bullet-list join algorithm.
// ---------------------------------------------------------------------------

/// Mirrors `WhatsNewActivity.joinAsBulletList`: blank-line-separated bullets.
#[must_use]
pub fn join_as_bullet_list(entries: &[&str]) -> String {
    let mut result = String::new();
    for entry in entries {
        if !result.is_empty() {
            result.push_str("\n\n");
        }
        result.push_str("\u{2022} ");
        result.push_str(entry);
    }
    result
}

// ---------------------------------------------------------------------------
// behavior: SynchronousExecutor — FIFO queue drained synchronously.
// ---------------------------------------------------------------------------

/// Mirrors `SynchronousExecutor`: tasks queue up via [`SynchronousExecutor::execute`]
/// and only run when [`SynchronousExecutor::run_queued_tasks`] drains the queue,
/// on whatever thread calls it. A task that "fails" is recorded rather than
/// aborting the drain, matching the original catch-and-log behavior.
#[derive(Default)]
pub struct SynchronousExecutor<T> {
    queue: std::collections::VecDeque<T>,
}

impl<T> SynchronousExecutor<T> {
    #[must_use]
    pub fn new() -> Self {
        Self {
            queue: std::collections::VecDeque::new(),
        }
    }

    pub fn execute(&mut self, task: T) {
        self.queue.push_back(task);
    }

    /// Runs every queued task in FIFO order via `run`, collecting the error
    /// (if any) from tasks that fail instead of stopping the drain early.
    pub fn run_queued_tasks<E>(&mut self, mut run: impl FnMut(T) -> Result<(), E>) -> Vec<E> {
        let mut errors = Vec::new();
        while let Some(task) = self.queue.pop_front() {
            if let Err(e) = run(task) {
                errors.push(e);
            }
        }
        errors
    }

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.queue.is_empty()
    }
}

// ---------------------------------------------------------------------------
// behavior: FriendlyEditTextPreference — summary template substitution.
// ---------------------------------------------------------------------------

/// Mirrors `FriendlyEditTextPreference.formatSummary`/`getSummary`: `None`
/// when the text is empty, otherwise the template with the text substituted
/// in (matching `String.format(summary, text)` for a single `%s`).
#[must_use]
pub fn friendly_edit_text_summary(summary_template: &str, text: Option<&str>) -> Option<String> {
    match text {
        Some(t) if !t.is_empty() => Some(summary_template.replacen("%s", t, 1)),
        _ => None,
    }
}

// ---------------------------------------------------------------------------
// behavior: NotificationSounds — enum-to-sound mapping and resource URIs.
// ---------------------------------------------------------------------------

pub mod notification_sounds {
    #[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
    pub enum NotificationSound {
        LocalChat,
        Im,
        Group,
    }

    #[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
    pub enum NotificationType {
        LocalChat,
        Private,
        Group,
    }

    /// Mirrors `NotificationSounds.defaultSounds`.
    #[must_use]
    pub fn default_sound_for(notification_type: NotificationType) -> NotificationSound {
        match notification_type {
            NotificationType::LocalChat => NotificationSound::LocalChat,
            NotificationType::Private => NotificationSound::Im,
            NotificationType::Group => NotificationSound::Group,
        }
    }

    /// Mirrors `NotificationSounds.getResourceUri`.
    #[must_use]
    pub fn resource_uri(resource_id: i32) -> String {
        format!("android.resource://com.lumiyaviewer.lumiya/{resource_id}")
    }
}

// ---------------------------------------------------------------------------
// behavior: AvatarRunningAnimation — priority/sequence ordering.
// ---------------------------------------------------------------------------

/// Mirrors `AvatarRunningAnimation.compareTo`: higher joint-set priority
/// sorts first, ties broken by higher sequence id first.
#[must_use]
pub fn compare_running_animations(
    priority_a: i32,
    sequence_id_a: i32,
    priority_b: i32,
    sequence_id_b: i32,
) -> std::cmp::Ordering {
    (priority_b, sequence_id_b).cmp(&(priority_a, sequence_id_a))
}

// ---------------------------------------------------------------------------
// behavior: StateAwareFragment — lifecycle-flag state machine.
// ---------------------------------------------------------------------------

/// Mirrors the `fragmentStarted`/`fragmentVisible` flag transitions driven by
/// `StateAwareFragment`'s `onStart`/`onStop`/`onResume`/`onPause` overrides.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct FragmentLifecycleState {
    pub started: bool,
    pub visible: bool,
}

impl FragmentLifecycleState {
    #[must_use]
    pub fn new() -> Self {
        Self::default()
    }

    pub fn on_start(&mut self) {
        self.started = true;
    }

    pub fn on_stop(&mut self) {
        self.started = false;
    }

    pub fn on_resume(&mut self) {
        self.visible = true;
    }

    pub fn on_pause(&mut self) {
        self.visible = false;
    }
}

// ---------------------------------------------------------------------------
// behavior: CacheLocationPreference — displayable cache path truncation.
// ---------------------------------------------------------------------------

/// Mirrors `CacheLocationPreference.makeDisplayableCacheLocation`.
#[must_use]
pub fn make_displayable_cache_location(path: &str) -> String {
    let mut s = path;
    if let Some(idx) = s.find("/Android") {
        s = &s[..idx];
    }
    if let Some(idx) = s.find("/com.lumiyaviewer.lumiya") {
        s = &s[..idx];
    }
    s.to_string()
}

// ---------------------------------------------------------------------------
// behavior: FrustrumInfo — equals/hashCode and matrix construction.
// ---------------------------------------------------------------------------

/// Mirrors `FrustrumInfo`'s value semantics: two instances are equal when all
/// scalar fields and the 16-element MVP matrix match exactly (bit-for-bit
/// float comparison, matching the original's `==`/`Arrays.equals`).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct FrustrumInfo {
    pub view_x: f32,
    pub view_y: f32,
    pub view_z: f32,
    pub view_distance: f32,
    pub mvp_matrix: [f32; 16],
}

impl FrustrumInfo {
    /// Mirrors the single-matrix constructor: copies `matrix` in directly.
    #[must_use]
    pub fn from_mvp(
        view_x: f32,
        view_y: f32,
        view_z: f32,
        view_distance: f32,
        matrix: [f32; 16],
    ) -> Self {
        Self {
            view_x,
            view_y,
            view_z,
            view_distance,
            mvp_matrix: matrix,
        }
    }
}

// ---------------------------------------------------------------------------
// behavior: DBOpenHelper — schema-71 targeted-upgrade decision gate.
// ---------------------------------------------------------------------------

/// Mirrors `DBOpenHelper.shouldAttemptTargetedUpgradeTo71`: the narrow,
/// column-adding upgrade path applies only for the 70 -> 71 transition. The
/// actual SQL DDL remains Android/SQLite-owned.
#[must_use]
pub fn should_attempt_targeted_upgrade_to_71(from_version: i32, to_version: i32) -> bool {
    from_version == 70 && to_version == 71
}

// ---------------------------------------------------------------------------
// behavior: DrawListTerrainEntry — terrain patch bounding box math.
// ---------------------------------------------------------------------------

const TERRAIN_PATCH_SIZE: i32 = 16;

/// Mirrors `DrawListTerrainEntry.computeBoundingBox`: the world-space AABB of
/// a 16x16 terrain patch given its grid coordinates and height range.
///
/// Terrain patch grid coordinates stay far below `f32`'s 24-bit exact-integer
/// range in practice, so the `i32`-to-`f32` conversion below is lossless for
/// every real call site; the cast is intentional, matching the Kotlin/Java
/// original's implicit `int * int -> float` arithmetic.
#[must_use]
#[allow(clippy::cast_precision_loss)]
pub fn terrain_patch_bounding_box(
    patch_x: i32,
    patch_y: i32,
    min_height: f32,
    max_height: f32,
) -> [f32; 6] {
    [
        (patch_x * TERRAIN_PATCH_SIZE) as f32,
        (patch_y * TERRAIN_PATCH_SIZE) as f32,
        min_height,
        ((patch_x + 1) * TERRAIN_PATCH_SIZE) as f32,
        ((patch_y + 1) * TERRAIN_PATCH_SIZE) as f32,
        max_height,
    ]
}

// ---------------------------------------------------------------------------
// contract: plain data/enum shapes with no behavior of their own.
// ---------------------------------------------------------------------------

/// Mirrors `Loadable.Status`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum LoadableStatus {
    Idle,
    Loading,
    Loaded,
    Error,
}

/// Mirrors `MyAvatarDetailsPages` (title-resource association only).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MyAvatarDetailsPage {
    PageProfile,
    PageOutfits,
    PageBlockList,
    PageBalance,
}

/// Mirrors `SettingsPage` (xml/title resource association only).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SettingsPage {
    PageConnection,
    PageAppearance,
    PageChat,
    PageNotifications,
    Page3D,
    PageRlv,
    PageCache,
}

/// Mirrors `VrInputState`: an immutable snapshot of VR controller input, with
/// no computation of its own.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct VrInputState {
    pub app_button_pressed: bool,
    pub touching: bool,
    pub touch_x: f32,
    pub touch_y: f32,
    pub connection_state: i32,
}

impl VrInputState {
    pub const EMPTY: VrInputState = VrInputState {
        app_button_pressed: false,
        touching: false,
        touch_x: 0.0,
        touch_y: 0.0,
        connection_state: 0,
    };
}

/// Mirrors the `GroupMemberList` greenDAO entity shape (group id is the
/// nullable primary key; request id is required).
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct GroupMemberList {
    pub group_id: Option<[u8; 16]>,
    pub request_id: [u8; 16],
}

/// Mirrors the `CachedResponse` POJO shape.
#[derive(Clone, Debug, PartialEq, Eq, Default)]
pub struct CachedResponse {
    pub key: Option<String>,
    pub data: Option<Vec<u8>>,
    pub must_revalidate: bool,
}

/// A boxed entry-removal callback, as used by [`DrawEntryList`].
type RemovalListener<T> = Box<dyn FnMut(&T)>;

/// Mirrors `DrawEntryList`'s entry-removal-listener wiring: the listener, if
/// present, is invoked; otherwise the removal request is a no-op.
#[derive(Default)]
pub struct DrawEntryList<T> {
    listener: Option<RemovalListener<T>>,
    entries: Vec<T>,
}

impl<T> DrawEntryList<T> {
    #[must_use]
    pub fn new(listener: Option<RemovalListener<T>>) -> Self {
        Self {
            listener,
            entries: Vec::new(),
        }
    }

    pub fn add_entry(&mut self, entry: T) {
        self.entries.push(entry);
    }

    pub fn request_entry_removal(&mut self, entry: &T) {
        if let Some(listener) = self.listener.as_mut() {
            listener(entry);
        }
    }
}

/// Mirrors `AvatarRunningSequence`'s data shape: a sequence id plus a
/// dirty/invalidation delegation to its owning spatial tree, without
/// reimplementing `AnimationData`'s own timing algorithm (owned by Android).
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct AvatarRunningSequence {
    pub sequence_id: i32,
    pub running_since: i64,
    pub stopping_since: i64,
    pub dont_ease_in: bool,
}

/// Mirrors `MyAvatarTreeNode`'s add/remove-marks-dirty delegation pattern
/// (the tree invalidation itself is Android/GL rendering-tree owned).
#[derive(Default)]
pub struct DirtyMarkingList<T> {
    entries: Vec<T>,
    dirty: bool,
}

impl<T> DirtyMarkingList<T> {
    #[must_use]
    pub fn new() -> Self {
        Self {
            entries: Vec::new(),
            dirty: false,
        }
    }

    pub fn add_entry(&mut self, entry: T) {
        self.entries.push(entry);
        self.dirty = true;
    }

    pub fn remove_entry(&mut self, index: usize) -> T {
        self.dirty = true;
        self.entries.remove(index)
    }

    #[must_use]
    pub fn is_dirty(&self) -> bool {
        self.dirty
    }

    pub fn clear_dirty(&mut self) {
        self.dirty = false;
    }
}

// ---------------------------------------------------------------------------
// boundary: Android-lifecycle/View/Preference/Adapter/GL/DB/JNI marker types.
// ---------------------------------------------------------------------------

/// Marker types make Android-owned implementations explicit at the FFI seam;
/// none of these carry mirrored logic.
pub mod android_boundary {
    macro_rules! boundary_types {
        ($($name:ident),+ $(,)?) => {$ (
            #[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
            pub struct $name;
        )+ };
    }

    boundary_types! {
        RiggedMeshProgram, ChatterReloadableFragment, ClearCachePreference, AvatarProgram,
        SearchGridActivity, SafeDrawerLayout, BoundingBoxProgram, RawShaderProgram, GLLoadQueue,
        GLTextureCache, StarsProgram, ProfileTextFieldEditFragment, StreamingMediaActivity,
        GLTextTextureCache, GLVertexArrayObject, ChatterListAdapter, GLTerrainTextureCache,
        QuadProgram, ShaderProgram, SkyCloudsProgram, OpenXrRuntime, ObjectPopupsAdapter,
        WaterProgram, ChatFragmentActivityFactory, AvatarPickerForMute, FXAAProgram
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn render_settings_parses_or_falls_back() {
        assert_eq!(parse_int_setting(Some("20"), 99), 20);
        assert_eq!(parse_int_setting(Some("not a number"), 20), 20);
        assert_eq!(parse_int_setting(None, 5), 5);
    }

    #[test]
    fn vr_intent_contract_sanitizes_runtime() {
        use vr_intent_contract::*;
        assert_eq!(sanitize_runtime(Some(VR_RUNTIME_OPENXR)), VR_RUNTIME_OPENXR);
        assert_eq!(
            sanitize_runtime(Some(VR_RUNTIME_CARDBOARD)),
            VR_RUNTIME_CARDBOARD
        );
        assert_eq!(sanitize_runtime(Some("bogus")), VR_RUNTIME_AUTO);
        assert_eq!(sanitize_runtime(None), VR_RUNTIME_AUTO);
    }

    #[test]
    fn bullet_list_joins_with_blank_lines() {
        assert_eq!(join_as_bullet_list(&[]), "");
        assert_eq!(join_as_bullet_list(&["one"]), "\u{2022} one");
        assert_eq!(
            join_as_bullet_list(&["one", "two"]),
            "\u{2022} one\n\n\u{2022} two"
        );
    }

    #[test]
    fn synchronous_executor_drains_fifo_and_collects_errors() {
        let mut executor: SynchronousExecutor<i32> = SynchronousExecutor::new();
        executor.execute(1);
        executor.execute(2);
        executor.execute(3);
        let mut ran = Vec::new();
        let errors = executor.run_queued_tasks::<&str>(|task| {
            ran.push(task);
            if task == 2 {
                Err("boom")
            } else {
                Ok(())
            }
        });
        assert_eq!(ran, vec![1, 2, 3]);
        assert_eq!(errors, vec!["boom"]);
        assert!(executor.is_empty());
    }

    #[test]
    fn friendly_summary_substitutes_or_hides() {
        assert_eq!(
            friendly_edit_text_summary("Value: %s", Some("hi")),
            Some("Value: hi".to_string())
        );
        assert_eq!(friendly_edit_text_summary("Value: %s", Some("")), None);
        assert_eq!(friendly_edit_text_summary("Value: %s", None), None);
    }

    #[test]
    fn notification_sounds_map_and_format_uri() {
        use notification_sounds::*;
        assert_eq!(
            default_sound_for(NotificationType::LocalChat),
            NotificationSound::LocalChat
        );
        assert_eq!(
            default_sound_for(NotificationType::Private),
            NotificationSound::Im
        );
        assert_eq!(
            default_sound_for(NotificationType::Group),
            NotificationSound::Group
        );
        assert_eq!(
            resource_uri(42),
            "android.resource://com.lumiyaviewer.lumiya/42"
        );
    }

    #[test]
    fn running_animation_order_matches_priority_then_sequence_descending() {
        use std::cmp::Ordering;
        // Higher priority sorts first.
        assert_eq!(compare_running_animations(5, 0, 1, 0), Ordering::Less);
        assert_eq!(compare_running_animations(1, 0, 5, 0), Ordering::Greater);
        // Equal priority: higher sequence id sorts first.
        assert_eq!(compare_running_animations(1, 10, 1, 2), Ordering::Less);
        assert_eq!(compare_running_animations(1, 1, 1, 1), Ordering::Equal);
    }

    #[test]
    fn fragment_lifecycle_state_tracks_start_stop_resume_pause() {
        let mut state = FragmentLifecycleState::new();
        assert!(!state.started && !state.visible);
        state.on_start();
        assert!(state.started);
        state.on_resume();
        assert!(state.visible);
        state.on_pause();
        assert!(!state.visible && state.started);
        state.on_stop();
        assert!(!state.started);
    }

    #[test]
    fn cache_location_trims_android_and_package_suffix() {
        assert_eq!(
            make_displayable_cache_location(
                "/storage/emulated/0/Android/data/com.lumiyaviewer.lumiya/cache"
            ),
            "/storage/emulated/0"
        );
        assert_eq!(
            make_displayable_cache_location("/mnt/sdcard/com.lumiyaviewer.lumiya/cache"),
            "/mnt/sdcard"
        );
        assert_eq!(
            make_displayable_cache_location("/mnt/sdcard"),
            "/mnt/sdcard"
        );
    }

    #[test]
    fn frustrum_info_equality_is_bitwise_on_all_fields() {
        let a = FrustrumInfo::from_mvp(1.0, 2.0, 3.0, 4.0, [0.0; 16]);
        let b = FrustrumInfo::from_mvp(1.0, 2.0, 3.0, 4.0, [0.0; 16]);
        let mut c = b;
        c.mvp_matrix[0] = 1.0;
        assert_eq!(a, b);
        assert_ne!(a, c);
    }

    #[test]
    fn db_upgrade_gate_only_applies_for_70_to_71() {
        assert!(should_attempt_targeted_upgrade_to_71(70, 71));
        assert!(!should_attempt_targeted_upgrade_to_71(69, 71));
        assert!(!should_attempt_targeted_upgrade_to_71(70, 72));
    }

    #[test]
    #[allow(clippy::float_cmp)]
    fn terrain_patch_bounding_box_matches_grid_math() {
        let bounds = terrain_patch_bounding_box(2, 3, 10.0, 20.0);
        assert_eq!(bounds, [32.0, 48.0, 10.0, 48.0, 64.0, 20.0]);
    }

    #[test]
    fn draw_entry_list_notifies_listener_or_noops() {
        let removed = std::rc::Rc::new(std::cell::RefCell::new(Vec::new()));
        let removed_clone = removed.clone();
        let mut list = DrawEntryList::new(Some(Box::new(move |entry: &i32| {
            removed_clone.borrow_mut().push(*entry);
        })));
        list.add_entry(7);
        list.request_entry_removal(&7);
        assert_eq!(*removed.borrow(), vec![7]);

        let mut silent: DrawEntryList<i32> = DrawEntryList::new(None);
        silent.add_entry(1);
        silent.request_entry_removal(&1); // must not panic
    }

    #[test]
    fn dirty_marking_list_tracks_mutations() {
        let mut list: DirtyMarkingList<i32> = DirtyMarkingList::new();
        assert!(!list.is_dirty());
        list.add_entry(1);
        assert!(list.is_dirty());
        list.clear_dirty();
        assert!(!list.is_dirty());
        list.remove_entry(0);
        assert!(list.is_dirty());
    }

    #[test]
    fn vr_input_state_empty_constant_is_all_zero() {
        assert_eq!(
            VrInputState::EMPTY,
            VrInputState {
                app_button_pressed: false,
                touching: false,
                touch_x: 0.0,
                touch_y: 0.0,
                connection_state: 0
            }
        );
    }

    #[test]
    fn group_member_list_holds_ids_shape() {
        use std::collections::HashMap;

        let entry = GroupMemberList {
            group_id: Some([1; 16]),
            request_id: [2; 16],
        };
        assert_eq!(entry.group_id, Some([1; 16]));
        assert_eq!(entry.request_id, [2; 16]);
        let mut map = HashMap::new();
        map.insert(entry.request_id, entry.clone());
        assert_eq!(map.get(&[2; 16]), Some(&entry));
    }
}
