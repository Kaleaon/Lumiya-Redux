//! Rust counterparts for the "`small_01`" 48-source Kotlin migration batch.
//!
//! Pure, deterministic algorithms and data shapes extracted from these
//! sources are mirrored directly and covered by tests. Classes whose whole
//! purpose is Android lifecycle, View/Preference/Adapter/Fragment plumbing,
//! OpenGL resource management, or `SQLite`/greenDAO persistence are
//! represented as explicit Android-boundary marker types instead: no logic
//! is invented for them.

// ---------------------------------------------------------------------------
// behavior: VrRuntimeSelector — runtime-id selection decision.
// ---------------------------------------------------------------------------

pub mod vr_runtime_selector {
    pub const VR_RUNTIME_OPENXR: &str = "openxr";
    pub const VR_RUNTIME_CARDBOARD: &str = "cardboard";
    pub const VR_RUNTIME_AUTO: &str = "auto";

    /// Mirrors `VrRuntimeSelector.selectRuntime`'s runtime-id decision once
    /// the caller has already resolved `requested_id` (from the intent
    /// extra, a sanitized VR mode, or the stored preference) and whether
    /// `OpenXR` is allowed on this device.
    #[must_use]
    pub fn select_runtime_id(requested_id: &str, open_xr_allowed: bool) -> &'static str {
        let matches = |value: &str| requested_id.eq_ignore_ascii_case(value);
        if (matches(VR_RUNTIME_OPENXR) || matches(VR_RUNTIME_AUTO)) && open_xr_allowed {
            VR_RUNTIME_OPENXR
        } else {
            VR_RUNTIME_CARDBOARD
        }
    }
}

// ---------------------------------------------------------------------------
// behavior: SkyProgram — windlight sky/haze color computation.
// ---------------------------------------------------------------------------

pub mod sky_program {
    /// Mirrors `SkyProgram.ApplyWindlight`'s sky-color formula.
    #[must_use]
    pub fn sky_color(
        blue_horizon: [f32; 3],
        sunlight_color: [f32; 3],
        ambient: [f32; 3],
        blue_density: [f32; 3],
    ) -> [f32; 3] {
        [
            (blue_horizon[0] + sunlight_color[0] + ambient[0]) * blue_density[0],
            (blue_horizon[1] + sunlight_color[1] + ambient[1]) * blue_density[1],
            (blue_horizon[2] + sunlight_color[2] + ambient[2]) * blue_density[2],
        ]
    }

    /// Mirrors `SkyProgram.ApplyWindlight`'s haze-color formula.
    #[must_use]
    pub fn haze_color(haze_density_0: f32, ambient: [f32; 3]) -> [f32; 3] {
        [
            haze_density_0 * ambient[0],
            haze_density_0 * ambient[1],
            ambient[2] * haze_density_0,
        ]
    }
}

// ---------------------------------------------------------------------------
// behavior: AnimationSequenceInfo — animation sequence/timing value type.
// ---------------------------------------------------------------------------

/// Mirrors `AnimationSequenceInfo`: an immutable record of a running (and
/// possibly stopping) animation sequence, identified by a `u128` stand-in
/// for the original `UUID`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct AnimationSequenceInfo {
    pub animation_id: u128,
    pub sequence_id: i32,
    pub running_since: i64,
    pub stopping_sequence_id: i32,
    pub stopping_running_since: i64,
    pub stopping_easing_out_since: i64,
    pub dont_ease_in: bool,
}

impl AnimationSequenceInfo {
    pub const MAX_ANIMATION_LENGTH: i64 = 60_000;
    const INVALID_SEQUENCE_ID: i32 = 0;
    const INVALID_TIMESTAMP: i64 = -1;

    #[must_use]
    pub fn new_sequence(animation_id: u128, running_since: i64, sequence_id: i32) -> Self {
        Self {
            animation_id,
            sequence_id,
            running_since,
            stopping_sequence_id: Self::INVALID_SEQUENCE_ID,
            stopping_running_since: Self::INVALID_TIMESTAMP,
            stopping_easing_out_since: Self::INVALID_TIMESTAMP,
            dont_ease_in: false,
        }
    }

    #[must_use]
    pub fn restart_sequence(running_since: i64, sequence_id: i32, previous: &Self) -> Self {
        if previous.sequence_id == Self::INVALID_SEQUENCE_ID {
            Self {
                animation_id: previous.animation_id,
                sequence_id,
                running_since,
                stopping_sequence_id: previous.stopping_sequence_id,
                stopping_running_since: previous.stopping_running_since,
                stopping_easing_out_since: previous.stopping_running_since,
                dont_ease_in: true,
            }
        } else {
            Self {
                animation_id: previous.animation_id,
                sequence_id,
                running_since,
                stopping_sequence_id: previous.sequence_id,
                stopping_running_since: previous.running_since,
                stopping_easing_out_since: running_since,
                dont_ease_in: true,
            }
        }
    }

    #[must_use]
    pub fn stop_sequence(now: i64, previous: &Self) -> Option<Self> {
        if previous.sequence_id == Self::INVALID_SEQUENCE_ID {
            return None;
        }
        Some(Self {
            animation_id: previous.animation_id,
            sequence_id: Self::INVALID_SEQUENCE_ID,
            running_since: Self::INVALID_TIMESTAMP,
            stopping_sequence_id: previous.sequence_id,
            stopping_running_since: previous.running_since,
            stopping_easing_out_since: now,
            dont_ease_in: previous.dont_ease_in,
        })
    }

    #[must_use]
    pub fn has_stopped(&self, now: i64) -> bool {
        self.sequence_id == Self::INVALID_SEQUENCE_ID
            && (self.stopping_sequence_id == Self::INVALID_SEQUENCE_ID
                || now >= self.stopping_easing_out_since + Self::MAX_ANIMATION_LENGTH)
    }
}

// ---------------------------------------------------------------------------
// behavior: GPUDetection — GPU family/version string sniffing.
// ---------------------------------------------------------------------------

/// Mirrors `GPUDetection`'s renderer-string sniffing: which GPU family (if
/// any) and version number it reports.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct GpuDetection {
    pub family: Option<&'static str>,
    pub version: Option<String>,
    pub numeric_version: i32,
}

impl GpuDetection {
    pub const GPU_FAMILY_ADRENO: &'static str = "Adreno";
    pub const GPU_FAMILY_TEGRA: &'static str = "Tegra";
    pub const INVALID_VERSION: i32 = -1;

    #[must_use]
    pub fn detect(renderer: &str) -> Self {
        let lower = renderer.to_ascii_lowercase();
        if lower.contains("adreno") {
            let version = extract_first_digit_run_after(renderer, "adreno");
            let numeric_version = version
                .as_deref()
                .and_then(|v| v.parse::<i32>().ok())
                .unwrap_or(Self::INVALID_VERSION);
            Self {
                family: Some(Self::GPU_FAMILY_ADRENO),
                version,
                numeric_version,
            }
        } else if lower.contains("tegra") {
            Self {
                family: Some(Self::GPU_FAMILY_TEGRA),
                version: None,
                numeric_version: Self::INVALID_VERSION,
            }
        } else {
            Self {
                family: None,
                version: None,
                numeric_version: Self::INVALID_VERSION,
            }
        }
    }
}

/// Mirrors the case-insensitive regex `.*?<needle>.*?([0-9]+).*?`: finds
/// `needle` and returns the first run of ASCII digits after it, if any.
fn extract_first_digit_run_after(haystack: &str, needle: &str) -> Option<String> {
    let lower = haystack.to_ascii_lowercase();
    let idx = lower.find(needle)?;
    let rest = &haystack[idx..];
    let digits: String = rest
        .chars()
        .skip_while(|c| !c.is_ascii_digit())
        .take_while(char::is_ascii_digit)
        .collect();
    if digits.is_empty() {
        None
    } else {
        Some(digits)
    }
}

// ---------------------------------------------------------------------------
// behavior: ShaderPreprocessor — #ifdef/#ifndef/#else/#endif + macro expansion.
// ---------------------------------------------------------------------------

/// Mirrors `ShaderPreprocessor`'s single-pass preprocessor: literal macro
/// substitution plus `#ifdef`/`#ifndef`/`#else`/`#endif` conditional
/// inclusion, matching the original's recursive-descent structure.
pub struct ShaderPreprocessor {
    defined_macros: Vec<(String, String)>,
}

enum DirectiveToken {
    Endif,
    Else,
    Eof,
}

impl ShaderPreprocessor {
    #[must_use]
    pub fn new(defined_macros: Vec<(String, String)>) -> Self {
        Self { defined_macros }
    }

    fn is_defined(&self, name: &str) -> bool {
        self.defined_macros.iter().any(|(k, _)| k == name)
    }

    fn substitute(&self, line: &str) -> String {
        let mut result = line.to_string();
        for (key, value) in &self.defined_macros {
            result = result.replace(key.as_str(), value.as_str());
        }
        result
    }

    /// Mirrors the public `processCode(BufferedReader)` entry point; `lines`
    /// stands in for the reader's `readLine()` sequence.
    ///
    /// # Errors
    ///
    /// Returns `Err("#endif expected")` exactly where the original throws
    /// `IOException("#endif expected")`: an `#ifdef`/`#ifndef` whose matching
    /// `#endif` (or `#else` ... `#endif`) is missing.
    pub fn process_code(&self, lines: &[&str]) -> Result<String, &'static str> {
        let mut index = 0usize;
        let (_token, collected) = self.process(lines, &mut index, true)?;
        Ok(collected.join(""))
    }

    fn process(
        &self,
        lines: &[&str],
        index: &mut usize,
        active: bool,
    ) -> Result<(DirectiveToken, Vec<String>), &'static str> {
        let mut collected = Vec::new();
        loop {
            let Some(line) = lines.get(*index) else {
                return Ok((DirectiveToken::Eof, collected));
            };
            *index += 1;
            let trimmed = line.trim();
            if trimmed.starts_with("#endif") {
                return Ok((DirectiveToken::Endif, collected));
            }
            if trimmed.starts_with("#else") {
                return Ok((DirectiveToken::Else, collected));
            }
            if trimmed.starts_with("#ifdef") || trimmed.starts_with("#ifndef") {
                let is_ifdef = trimmed.starts_with("#ifdef");
                let space = trimmed.find(' ').unwrap_or(trimmed.len());
                let macro_name = trimmed[space..].trim();
                let macro_defined = self.is_defined(macro_name);
                let take_this_branch = active && (is_ifdef == macro_defined);
                let (token, branch_lines) = self.process(lines, index, take_this_branch)?;
                if take_this_branch {
                    collected.extend(branch_lines);
                }
                match token {
                    DirectiveToken::Endif => {}
                    DirectiveToken::Else => {
                        let take_else_branch = active && (is_ifdef != macro_defined);
                        let (token2, else_lines) = self.process(lines, index, take_else_branch)?;
                        if take_else_branch {
                            collected.extend(else_lines);
                        }
                        if !matches!(token2, DirectiveToken::Endif) {
                            return Err("#endif expected");
                        }
                    }
                    DirectiveToken::Eof => return Err("#endif expected"),
                }
            } else if active {
                collected.push(self.substitute(trimmed));
                collected.push("\r\n".to_string());
            }
        }
    }
}

// ---------------------------------------------------------------------------
// behavior: AnimationSkeletonData — bone offset packing + buffer swap idiom.
// ---------------------------------------------------------------------------

pub mod animation_skeleton_data {
    pub const NUM_ANIMATED_BONES: usize = 133;

    /// Mirrors the per-bone offset packing at the end of
    /// `AnimationSkeletonData.animate`: xyz position plus `1 - priority` in
    /// the w slot, interleaved four floats per bone.
    ///
    /// # Panics
    ///
    /// Panics if `positions` and `priorities` have different lengths; the
    /// original always drives both from the same fixed-size bone arrays.
    #[must_use]
    pub fn pack_offsets(positions: &[[f32; 3]], priorities: &[f32]) -> Vec<f32> {
        assert_eq!(positions.len(), priorities.len());
        let mut offsets = Vec::with_capacity(positions.len() * 4);
        for (position, priority) in positions.iter().zip(priorities) {
            offsets.push(position[0]);
            offsets.push(position[1]);
            offsets.push(position[2]);
            offsets.push(1.0 - priority);
        }
        offsets
    }
}

// ---------------------------------------------------------------------------
// behavior: GLSyncLoadQueue — per-frame budgeted load loop.
// ---------------------------------------------------------------------------

pub mod gl_sync_load_queue {
    use std::collections::VecDeque;

    pub const MAX_LOADS_PER_FRAME: u32 = 16;
    pub const MAX_SIZE_PER_FRAME: u64 = 4_194_304;
    pub const WAIT_FRAMES_AFTER_LOAD: u32 = 3;

    /// A queued unit of work, standing in for `GLLoadQueue.GLLoadable`.
    pub trait Loadable {
        fn load_size(&self) -> u64;
    }

    /// Mirrors `GLSyncLoadQueue.RunLoadQueue`'s per-frame budgeting loop. A
    /// `VecDeque` stands in for the original's (effectively unordered) weak
    /// queue; the loop-control shape being mirrored does not depend on that
    /// choice. Returns `(loaded_count, loaded_size)` for this call, matching
    /// what the original passes to its debug log. Note that, matching the
    /// original exactly, when the loop breaks because a frame's budget was
    /// reached, the item that triggered the break is *not* counted in the
    /// returned totals (it only affects `frames_wait`).
    pub fn run_load_queue<L: Loadable>(
        queue: &mut VecDeque<L>,
        frames_wait: &mut u32,
        mut can_allocate: impl FnMut(u64) -> bool,
        mut stall: impl FnMut(),
        mut load: impl FnMut(&L) -> u64,
    ) -> (u32, u64) {
        if *frames_wait != 0 {
            *frames_wait -= 1;
            return (0, 0);
        }
        let mut loaded_size: u64 = 0;
        let mut loaded_count: u32 = 0;
        loop {
            if !can_allocate(0) {
                break;
            }
            let Some(removed) = queue.pop_front() else {
                break;
            };
            if !can_allocate(removed.load_size()) {
                stall();
                queue.push_back(removed);
                break;
            }
            let new_loaded_size = load(&removed) + loaded_size;
            *frames_wait = WAIT_FRAMES_AFTER_LOAD;
            let new_loaded_count = loaded_count + 1;
            if new_loaded_count >= MAX_LOADS_PER_FRAME || new_loaded_size >= MAX_SIZE_PER_FRAME {
                break;
            }
            loaded_count = new_loaded_count;
            loaded_size = new_loaded_size;
        }
        (loaded_count, loaded_size)
    }
}

// ---------------------------------------------------------------------------
// behavior: DrawList — draw-list capacity growth heuristic.
// ---------------------------------------------------------------------------

pub mod draw_list {
    /// Mirrors `DrawList.create`'s growth heuristic for a new frame's
    /// draw-list capacities, given the previous frame's size: `size * 4 / 3`
    /// using integer division exactly like the original Java.
    #[must_use]
    pub fn grown_capacity(previous_size: usize) -> usize {
        previous_size * 4 / 3
    }
}

// ---------------------------------------------------------------------------
// behavior: DrawListObjectEntry — world-space bounding box recomputation.
// ---------------------------------------------------------------------------

pub mod draw_list_object_entry {
    /// Mirrors `DrawListObjectEntry.updateBoundingBox`: recomputes the
    /// world-space AABB (`[min_x, min_y, min_z, max_x, max_y, max_z]`) of an
    /// object from its `world_matrix` (column-major 4x4, OpenGL layout) and
    /// half-extent `object_coords`, clamped to the region size (256 in x/y,
    /// 4096 in z).
    #[must_use]
    pub fn update_bounding_box(world_matrix: &[f32; 16], object_coords: &[f32; 3]) -> [f32; 6] {
        let mut bb = [0.0f32; 6];
        for i in 0..3 {
            let f = world_matrix[i + 12];
            bb[i + 3] = f;
            bb[i] = f;
        }
        for j in 0..3 {
            for k in 0..3 {
                let f2 = world_matrix[j * 4 + k] * (-object_coords[k] / 2.0);
                let f3 = world_matrix[j * 4 + k] * (object_coords[k] / 2.0);
                if f2 < f3 {
                    bb[j] += f2;
                    bb[j + 3] += f3;
                } else {
                    bb[j] += f3;
                    bb[j + 3] += f2;
                }
            }
        }
        for (i, limit) in [256.0f32, 256.0, 4096.0].into_iter().enumerate() {
            bb[i] = limit.min(0.0f32.max(bb[i]));
            bb[i + 3] = limit.min(0.0f32.max(bb[i + 3]));
        }
        bb
    }
}

// ---------------------------------------------------------------------------
// behavior: AvatarAnimationList — weight renormalization + needAnimate OR.
// ---------------------------------------------------------------------------

pub mod avatar_animation_list {
    /// Mirrors the per-bone quaternion weight renormalization at the end of
    /// `AvatarAnimationList.animate`: when the accumulated priority weight
    /// falls meaningfully short of 1.0 (strictly between 0 and 0.99),
    /// rescale the quaternion components by `1 / (1 - priority)`.
    #[must_use]
    pub fn renormalize_quaternion(priority: f32, quaternion: [f32; 4]) -> [f32; 4] {
        let remaining = 1.0 - priority;
        if remaining > 0.01 && remaining < 1.0 {
            let factor = 1.0 / remaining;
            [
                quaternion[0] * factor,
                quaternion[1] * factor,
                quaternion[2] * factor,
                factor * quaternion[3],
            ]
        } else {
            quaternion
        }
    }

    /// Mirrors `AvatarAnimationList.needAnimate`'s OR-reduce over sequences.
    #[must_use]
    pub fn need_animate(flags: &[bool]) -> bool {
        flags.iter().fold(false, |acc, &value| value || acc)
    }
}

// ---------------------------------------------------------------------------
// behavior: AvatarTextures — per-face texture merge decision.
// ---------------------------------------------------------------------------

pub mod avatar_textures {
    use std::collections::HashMap;
    use std::hash::{BuildHasher, Hash};

    /// Mirrors `AvatarTextures.ApplyTextures`'s per-face merge decision:
    /// given the currently stored texture for a face (if any), the newly
    /// decoded texture id, and whether existing values should be kept
    /// (`keep_existing`), decide the face's new stored value and whether it
    /// changed.
    #[must_use]
    pub fn apply_face(
        existing: Option<u128>,
        texture_id: u128,
        keep_existing: bool,
    ) -> (Option<u128>, bool) {
        if (keep_existing && existing.is_some()) || existing == Some(texture_id) {
            (existing, false)
        } else {
            (Some(texture_id), true)
        }
    }

    /// Mirrors folding [`apply_face`] over every face of a decoded texture
    /// entry, matching `AvatarTextures.ApplyTextures`'s full loop.
    pub fn apply_all<K: Eq + Hash + Copy, S: BuildHasher>(
        avatar_textures: &mut HashMap<K, u128, S>,
        faces: &[(K, u128)],
        keep_existing: bool,
    ) -> bool {
        let mut changed = false;
        for &(face, texture_id) in faces {
            let existing = avatar_textures.get(&face).copied();
            let (new_value, did_change) = apply_face(existing, texture_id, keep_existing);
            if let Some(value) = new_value {
                avatar_textures.insert(face, value);
            }
            changed |= did_change;
        }
        changed
    }
}

// ---------------------------------------------------------------------------
// behavior: BasicPrimProgram — windlight lighting-uniform decision.
// ---------------------------------------------------------------------------

pub mod basic_prim_program {
    /// Mirrors `BasicPrimProgram.SetupLighting`'s decision of the diffuse
    /// direction/color and ambient color uniforms from an optional windlight
    /// preset (`lightnorm`, `sunlight_color`, `ambient`, already resolved
    /// for above/below water by the caller).
    #[must_use]
    pub fn lighting(
        preset: Option<([f32; 3], [f32; 3], [f32; 3])>,
    ) -> ([f32; 3], [f32; 3], [f32; 3]) {
        match preset {
            None => ([0.0, 1.0, 0.0], [0.0, 0.0, 0.0], [1.0, 1.0, 1.0]),
            Some((lightnorm, sunlight_color, ambient)) => {
                let diffuse_dir = [lightnorm[0], lightnorm[2], -lightnorm[1]];
                let diffuse_color = if lightnorm[1].abs() > 0.1 {
                    sunlight_color
                } else {
                    [0.0, 0.0, 0.0]
                };
                (diffuse_dir, diffuse_color, ambient)
            }
        }
    }
}

// ---------------------------------------------------------------------------
// behavior: AvatarShapeParams — fixed-size visual-param array resize/merge.
// ---------------------------------------------------------------------------

pub mod avatar_shape_params {
    pub const PARAM_COUNT: usize = 218;

    /// Mirrors the two-argument `AvatarShapeParams.create(previous, int[])`
    /// overload's resize logic: right-pad/truncate `values` to
    /// [`PARAM_COUNT`], borrowing any missing tail values from `previous`
    /// (or leaving them zero when there is no previous state).
    #[must_use]
    pub fn resize(previous: Option<&[i32; PARAM_COUNT]>, values: &[i32]) -> [i32; PARAM_COUNT] {
        let mut result = [0i32; PARAM_COUNT];
        let copy_len = values.len().min(PARAM_COUNT);
        result[..copy_len].copy_from_slice(&values[..copy_len]);
        if values.len() < PARAM_COUNT {
            if let Some(prev) = previous {
                result[copy_len..].copy_from_slice(&prev[copy_len..]);
            }
        }
        result
    }
}

// ---------------------------------------------------------------------------
// behavior: FrustrumPlanes — view-frustum plane extraction and AABB test.
// ---------------------------------------------------------------------------

pub mod frustrum_planes {
    pub const INSIDE: i32 = 1;
    pub const INTERSECT: i32 = 0;
    pub const OUTSIDE: i32 = -1;
    const NUM_PLANES: usize = 6;

    /// Mirrors `FrustrumPlanes`: the 6 view-frustum planes extracted from an
    /// MVP matrix, plus the min/max vertex index lookup used to test an AABB
    /// against them without branching per-axis.
    #[derive(Clone, Debug, PartialEq)]
    pub struct FrustrumPlanes {
        params: [f32; 24],
        pn_index: [usize; 36],
    }

    impl FrustrumPlanes {
        #[must_use]
        pub fn new(matrix: &[f32; 16]) -> Self {
            let mut result = Self {
                params: [0.0; 24],
                pn_index: [0; 36],
            };
            for i in 0..NUM_PLANES {
                let axis = 2 - (i / 2);
                let sign = if (i & 1) != 0 { -1.0 } else { 1.0 };
                result.init_plane(i, matrix, axis, sign);
            }
            result
        }

        fn init_plane(&mut self, i: usize, matrix: &[f32; 16], axis: usize, sign: f32) {
            let base = i * 4;
            for j in 0..4 {
                self.params[base + j] = matrix[j * 4 + 3] + matrix[j * 4 + axis] * sign;
            }
            let mut length_sq = 0.0f32;
            for k in 0..3 {
                let v = self.params[base + k];
                length_sq += v * v;
            }
            let length = length_sq.sqrt();
            for m in 0..4 {
                self.params[base + m] /= length;
            }
            for n in 0..3 {
                self.pn_index[i * 6 + n] = if self.params[base + n] >= 0.0 {
                    n + 3
                } else {
                    n
                };
                self.pn_index[i * 6 + n + 3] = if self.params[base + n] >= 0.0 {
                    n
                } else {
                    n + 3
                };
            }
        }

        fn plane_distance(&self, params_index: usize, pn_index_base: usize, vector: &[f32]) -> f32 {
            let mut sum = 0.0f32;
            for j in 0..3 {
                sum += self.params[params_index + j] * vector[self.pn_index[pn_index_base + j]];
            }
            self.params[params_index + 3] + sum
        }

        /// Mirrors `FrustrumPlanes.testBoundingBox`. `point` holds both the
        /// min and max corner components addressed via the precomputed
        /// `pn_index`, exactly like the original's single `float[]` argument.
        #[must_use]
        pub fn test_bounding_box(&self, point: &[f32], near_distance_out: &mut [f32]) -> i32 {
            let mut pn_index_base = 0usize;
            let mut params_index = 0usize;
            for j in 0..NUM_PLANES {
                if self.plane_distance(params_index, pn_index_base, point) < 0.0 {
                    return OUTSIDE;
                }
                let far_distance = self.plane_distance(params_index, pn_index_base + 3, point);
                if j == 0 {
                    near_distance_out[0] = far_distance;
                }
                if far_distance < 0.0 {
                    return INTERSECT;
                }
                params_index += 4;
                pn_index_base += 6;
            }
            INSIDE
        }
    }
}

// ---------------------------------------------------------------------------
// contract: GroupRoleMemberList — greenDAO entity shape.
// ---------------------------------------------------------------------------

/// Mirrors `GroupRoleMemberList`'s data shape (a greenDAO entity keyed by
/// `group_id`), independent of the Android/SQLite persistence machinery.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct GroupRoleMemberList {
    pub group_id: Option<u128>,
    pub request_id: Option<u128>,
    pub must_revalidate: bool,
}

// ---------------------------------------------------------------------------
// contract: BoundingBox — debug unit-cube geometry shape.
// ---------------------------------------------------------------------------

pub mod bounding_box {
    /// Mirrors `BoundingBox`'s unit-cube vertex data shape: 12 triangles (36
    /// vertices), 3 floats per vertex, no normals or UVs, half-extent 0.5 on
    /// every axis.
    pub const CUBE_VERTEX_COUNT: usize = 36;
    pub const CUBE_HALF_EXTENT: f32 = 0.5;
}

// ---------------------------------------------------------------------------
// contract: ObjectDerezDialog — derez action/destination mapping.
// ---------------------------------------------------------------------------

/// Mirrors `ObjectDerezDialog.DerezAction`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DerezAction {
    Take,
    TakeCopy,
    Delete,
}

/// Mirrors `EDeRezDestination`'s subset of values used by `DerezAction`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DeRezDestination {
    TakeIntoAgentInventory,
    AcquireToAgentInventory,
    Trash,
}

impl DerezAction {
    #[must_use]
    pub fn destination(self) -> DeRezDestination {
        match self {
            DerezAction::Take => DeRezDestination::TakeIntoAgentInventory,
            DerezAction::TakeCopy => DeRezDestination::AcquireToAgentInventory,
            DerezAction::Delete => DeRezDestination::Trash,
        }
    }
}

// ---------------------------------------------------------------------------
// contract: NotificationType — notification category priority/ordering.
// ---------------------------------------------------------------------------

/// Mirrors `NotificationType`'s priority metadata and descending-priority
/// ordering, independent of its Android preference-key strings.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum NotificationType {
    LocalChat,
    Private,
    Group,
}

impl NotificationType {
    #[must_use]
    pub fn priority(self) -> i32 {
        match self {
            NotificationType::LocalChat => 0,
            NotificationType::Group => 1,
            NotificationType::Private => 2,
        }
    }

    /// Mirrors `NotificationType.VALUES_BY_DESCENDING_PRIORITY`.
    #[must_use]
    pub fn by_descending_priority() -> [NotificationType; 3] {
        [
            NotificationType::Private,
            NotificationType::Group,
            NotificationType::LocalChat,
        ]
    }
}

// ---------------------------------------------------------------------------
// contract: Quad — unit-quad vertex/index data shape.
// ---------------------------------------------------------------------------

pub mod quad {
    /// Mirrors `Quad`'s vertex/index data shape: 4 vertices (position + UV),
    /// drawn as 2 triangles via the given index order.
    pub const VERTEX_COUNT: usize = 4;
    pub const INDEX_ORDER: [u16; 6] = [0, 1, 2, 0, 2, 3];
}

// ---------------------------------------------------------------------------
// boundary: Android-lifecycle/View/Fragment/Preference/GL/DB marker types.
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
        TeleportHomeDialog, GLResourceTexture, DrawListPrimEntry, TOSActivity, MyAvatarActivity,
        ChatEventTimestampUpdater, DaoManager, RiggedMeshProgram30, DrawListAvatarEntry,
        InventoryListAdapter, AvatarPickerForShare, SettingsSelectionFragment, GLBuffer,
        SettingsActivity, DrawListEntry, UserNotesEditFragment, DrawableStore,
        UserAboutTextEditFragment, ThemedActivity, VrSession, DrawableFaceTexture,
        GoogleDriveSyncPreference, GLExternalTexture, ObjectListNewActivity, DrawableAvatarStub,
        ChatterListSimpleAdapter, RingtonePreference, ChatLayoutManager, LinkMovementMethodSafe
    }
}

#[cfg(test)]
#[allow(clippy::float_cmp)]
mod tests {
    use super::*;

    #[test]
    fn vr_runtime_selector_prefers_openxr_when_allowed() {
        use vr_runtime_selector::*;
        assert_eq!(select_runtime_id("auto", true), VR_RUNTIME_OPENXR);
        assert_eq!(select_runtime_id("AUTO", true), VR_RUNTIME_OPENXR);
        assert_eq!(select_runtime_id("openxr", true), VR_RUNTIME_OPENXR);
        assert_eq!(select_runtime_id("openxr", false), VR_RUNTIME_CARDBOARD);
        assert_eq!(select_runtime_id("cardboard", true), VR_RUNTIME_CARDBOARD);
        assert_eq!(select_runtime_id("auto", false), VR_RUNTIME_CARDBOARD);
    }

    #[test]
    fn sky_program_computes_windlight_colors() {
        let sky = sky_program::sky_color(
            [0.1, 0.1, 0.1],
            [0.2, 0.2, 0.2],
            [0.05, 0.05, 0.05],
            [2.0, 2.0, 2.0],
        );
        assert!((sky[0] - 0.7).abs() < 1e-6);
        let haze = sky_program::haze_color(0.5, [1.0, 2.0, 3.0]);
        assert_eq!(haze, [0.5, 1.0, 1.5]);
    }

    #[test]
    fn animation_sequence_info_lifecycle() {
        let started = AnimationSequenceInfo::new_sequence(1, 1_000, 7);
        assert!(!started.has_stopped(1_000));

        let restarted = AnimationSequenceInfo::restart_sequence(2_000, 8, &started);
        assert_eq!(restarted.stopping_sequence_id, 7);
        assert_eq!(restarted.sequence_id, 8);

        let stopped = AnimationSequenceInfo::stop_sequence(3_000, &restarted).unwrap();
        assert_eq!(stopped.sequence_id, 0);
        assert!(!stopped.has_stopped(3_000));
        assert!(stopped.has_stopped(3_000 + AnimationSequenceInfo::MAX_ANIMATION_LENGTH));

        let already_stopped = AnimationSequenceInfo::new_sequence(1, -1, 0);
        assert!(AnimationSequenceInfo::stop_sequence(1, &already_stopped).is_none());
    }

    #[test]
    fn gpu_detection_recognizes_adreno_and_tegra() {
        let adreno = GpuDetection::detect("Adreno (TM) 530");
        assert_eq!(adreno.family, Some(GpuDetection::GPU_FAMILY_ADRENO));
        assert_eq!(adreno.numeric_version, 530);

        let tegra = GpuDetection::detect("NVIDIA Tegra");
        assert_eq!(tegra.family, Some(GpuDetection::GPU_FAMILY_TEGRA));
        assert_eq!(tegra.numeric_version, GpuDetection::INVALID_VERSION);

        let other = GpuDetection::detect("Mali-G72");
        assert_eq!(other.family, None);
    }

    #[test]
    fn shader_preprocessor_substitutes_macros() {
        let preprocessor = ShaderPreprocessor::new(vec![("FOO".to_string(), "1".to_string())]);
        let out = preprocessor.process_code(&["a FOO b"]).unwrap();
        assert_eq!(out, "a 1 b\r\n");
    }

    #[test]
    fn shader_preprocessor_handles_ifdef_true_and_false() {
        let preprocessor = ShaderPreprocessor::new(vec![("DEFINED".to_string(), String::new())]);
        let defined_branch = preprocessor
            .process_code(&["#ifdef DEFINED", "yes", "#else", "no", "#endif"])
            .unwrap();
        assert_eq!(defined_branch, "yes\r\n");

        let empty = ShaderPreprocessor::new(vec![]);
        let undefined_branch = empty
            .process_code(&["#ifdef DEFINED", "yes", "#else", "no", "#endif"])
            .unwrap();
        assert_eq!(undefined_branch, "no\r\n");
    }

    #[test]
    fn shader_preprocessor_reports_missing_endif() {
        let preprocessor = ShaderPreprocessor::new(vec![]);
        assert_eq!(
            preprocessor.process_code(&["#ifdef X", "body"]),
            Err("#endif expected")
        );
    }

    #[test]
    fn animation_skeleton_data_packs_offsets() {
        let offsets = animation_skeleton_data::pack_offsets(&[[1.0, 2.0, 3.0]], &[0.25]);
        assert_eq!(offsets, vec![1.0, 2.0, 3.0, 0.75]);
    }

    use gl_sync_load_queue::Loadable;

    struct FakeLoad(u64);
    impl gl_sync_load_queue::Loadable for FakeLoad {
        fn load_size(&self) -> u64 {
            self.0
        }
    }

    #[test]
    fn gl_sync_load_queue_waits_out_frames_after_loading() {
        use std::collections::VecDeque;
        let mut queue: VecDeque<FakeLoad> = VecDeque::new();
        queue.push_back(FakeLoad(10));
        let mut frames_wait = 0u32;
        let (count, size) = gl_sync_load_queue::run_load_queue(
            &mut queue,
            &mut frames_wait,
            |_| true,
            || {},
            Loadable::load_size,
        );
        assert_eq!((count, size), (1, 10));
        assert_eq!(frames_wait, gl_sync_load_queue::WAIT_FRAMES_AFTER_LOAD);

        // Next call is a no-op while frames_wait counts down, matching the
        // original's early-return branch.
        let (count2, size2) = gl_sync_load_queue::run_load_queue(
            &mut queue,
            &mut frames_wait,
            |_| true,
            || {},
            Loadable::load_size,
        );
        assert_eq!((count2, size2), (0, 0));
        assert_eq!(frames_wait, gl_sync_load_queue::WAIT_FRAMES_AFTER_LOAD - 1);
    }

    #[test]
    fn gl_sync_load_queue_requeues_when_out_of_memory() {
        use std::collections::VecDeque;
        let mut queue: VecDeque<FakeLoad> = VecDeque::new();
        queue.push_back(FakeLoad(10));
        let mut frames_wait = 0u32;
        let mut stalled = false;
        let (count, size) = gl_sync_load_queue::run_load_queue(
            &mut queue,
            &mut frames_wait,
            |requested| requested == 0,
            || stalled = true,
            Loadable::load_size,
        );
        assert_eq!((count, size), (0, 0));
        assert!(stalled);
        assert_eq!(queue.len(), 1);
    }

    #[test]
    fn draw_list_grows_capacity_by_a_third() {
        assert_eq!(draw_list::grown_capacity(30), 40);
        assert_eq!(draw_list::grown_capacity(0), 0);
    }

    #[test]
    fn draw_list_object_entry_updates_bounding_box_for_identity_matrix() {
        let identity = [
            1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 10.0, 20.0, 30.0, 1.0,
        ];
        let bb = draw_list_object_entry::update_bounding_box(&identity, &[2.0, 4.0, 6.0]);
        assert_eq!(bb, [9.0, 18.0, 27.0, 11.0, 22.0, 33.0]);
    }

    #[test]
    fn avatar_animation_list_renormalizes_and_ors() {
        let quaternion = avatar_animation_list::renormalize_quaternion(0.5, [1.0, 1.0, 1.0, 1.0]);
        assert_eq!(quaternion, [2.0, 2.0, 2.0, 2.0]);
        let unchanged = avatar_animation_list::renormalize_quaternion(1.0, [1.0, 1.0, 1.0, 1.0]);
        assert_eq!(unchanged, [1.0, 1.0, 1.0, 1.0]);

        assert!(avatar_animation_list::need_animate(&[false, true, false]));
        assert!(!avatar_animation_list::need_animate(&[false, false]));
    }

    #[test]
    fn avatar_textures_merge_respects_keep_existing() {
        use std::collections::HashMap;
        let mut textures: HashMap<u8, u128> = HashMap::new();
        let changed = avatar_textures::apply_all(&mut textures, &[(0u8, 111u128)], false);
        assert!(changed);
        assert_eq!(textures[&0], 111);

        let changed_again = avatar_textures::apply_all(&mut textures, &[(0u8, 222u128)], true);
        assert!(!changed_again);
        assert_eq!(textures[&0], 111);

        let changed_overwrite = avatar_textures::apply_all(&mut textures, &[(0u8, 222u128)], false);
        assert!(changed_overwrite);
        assert_eq!(textures[&0], 222);
    }

    #[test]
    fn basic_prim_program_lighting_without_and_with_preset() {
        let (dir, color, ambient) = basic_prim_program::lighting(None);
        assert_eq!(dir, [0.0, 1.0, 0.0]);
        assert_eq!(color, [0.0, 0.0, 0.0]);
        assert_eq!(ambient, [1.0, 1.0, 1.0]);

        let (dir2, color2, _) =
            basic_prim_program::lighting(Some(([0.1, 0.9, 0.2], [1.0, 1.0, 1.0], [0.3, 0.3, 0.3])));
        assert_eq!(dir2, [0.1, 0.2, -0.9]);
        assert_eq!(color2, [1.0, 1.0, 1.0]);

        let (_, color3, _) = basic_prim_program::lighting(Some((
            [0.1, 0.05, 0.2],
            [1.0, 1.0, 1.0],
            [0.3, 0.3, 0.3],
        )));
        assert_eq!(color3, [0.0, 0.0, 0.0]);
    }

    #[test]
    fn avatar_shape_params_resize_pads_and_truncates() {
        use avatar_shape_params::{resize, PARAM_COUNT};
        let small = [1, 2, 3];
        let resized = resize(None, &small);
        assert_eq!(&resized[..3], &small[..]);
        assert_eq!(resized[3], 0);

        let mut previous = [0i32; PARAM_COUNT];
        previous[3] = 42;
        let resized_with_previous = resize(Some(&previous), &small);
        assert_eq!(resized_with_previous[3], 42);

        let oversized = vec![9i32; PARAM_COUNT + 5];
        let truncated = resize(None, &oversized);
        assert_eq!(truncated.len(), PARAM_COUNT);
        assert_eq!(truncated[PARAM_COUNT - 1], 9);
    }

    #[test]
    fn frustrum_planes_classifies_points() {
        let identity = [
            1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0,
        ];
        let planes = frustrum_planes::FrustrumPlanes::new(&identity);
        let mut near = [0.0f32; 1];
        // A point comfortably inside every clip-space plane of the identity
        // matrix's "frustum" is INSIDE; a point far outside is OUTSIDE.
        let inside_point = [0.0f32; 6];
        assert_eq!(
            planes.test_bounding_box(&inside_point, &mut near),
            frustrum_planes::INSIDE
        );
        let outside_point = [100.0f32; 6];
        assert_eq!(
            planes.test_bounding_box(&outside_point, &mut near),
            frustrum_planes::OUTSIDE
        );
    }

    #[test]
    fn derez_action_maps_to_destination() {
        assert_eq!(
            DerezAction::Take.destination(),
            DeRezDestination::TakeIntoAgentInventory
        );
        assert_eq!(
            DerezAction::TakeCopy.destination(),
            DeRezDestination::AcquireToAgentInventory
        );
        assert_eq!(DerezAction::Delete.destination(), DeRezDestination::Trash);
    }

    #[test]
    fn notification_type_priority_and_ordering() {
        assert_eq!(NotificationType::Private.priority(), 2);
        assert_eq!(
            NotificationType::by_descending_priority(),
            [
                NotificationType::Private,
                NotificationType::Group,
                NotificationType::LocalChat
            ]
        );
    }

    #[test]
    fn group_role_member_list_default_is_empty() {
        let list = GroupRoleMemberList::default();
        assert_eq!(list.group_id, None);
        assert!(!list.must_revalidate);
    }
}
