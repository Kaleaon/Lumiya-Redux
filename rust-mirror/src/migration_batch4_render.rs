//! Rust counterparts for the batch-4 (render) Kotlin migration.
//!
//! Pure, deterministic algorithms and data shapes extracted from
//! the render/, render/avatar/, render/caps/, render/drawable/,
//! render/glres/, render/shaders/, render/spatial/ packages.
//!
//! GL calls, Android-specific types, and mutable scene state are
//! represented as marker types (no logic invented).  Only the
//! math, constants, and conversion routines have full Rust
//! implementations with tests.

// ===========================================================================
// MatrixStack – fixedToFloat
// ===========================================================================

/// Converts a GL fixed-point value to floating-point.
///
/// Mirrors `MatrixStack.fixedToFloat`:
/// ```kotlin
/// fun fixedToFloat(i: Int): Float = i * 1.5258789E-5f
/// ```
#[inline]
pub fn fixed_to_float(i: i32) -> f32 {
    i as f32 * 1.525_878_9e-5
}

// ===========================================================================
// TextureMemoryTracker – page-aligned size
// ===========================================================================

/// Returns the page-aligned (4096-byte) texture memory size.
///
/// Mirrors `TextureMemoryTracker.actualSize`:
/// ```kotlin
/// fun actualSize(i: Int): Int = (((i + 4096) - 1) / 4096) * 4096
/// ```
#[inline]
pub fn texture_actual_size(bytes: u32) -> u32 {
    ((bytes + 4096 - 1) / 4096) * 4096
}

// ===========================================================================
// AnimationData – keyframe interpolation helpers
// ===========================================================================

/// Converts a `u16` to the [0.0, 1.0] range used by SL animation data.
///
/// Mirrors `AnimationData.uint16ToFloat`.
#[inline]
pub fn uint16_to_float(val_u16: u16, min: f32, max: f32) -> f32 {
    min + ((val_u16 as f32 / 65535.0) * (max - min))
}

/// Hermite smooth-step (cubic ease-in/out).
///
/// Mirrors `AnimationData.cubicStep`:
/// ```kotlin
/// fun cubicStep(f: Float): Float = f * f * (3.0f - 2.0f * f)
/// ```
#[inline]
pub fn cubic_step(f: f32) -> f32 {
    f * f * (3.0 - 2.0 * f)
}

/// Computes the "in animation" time, wrapping or clamping by loop settings.
///
/// Mirrors `AnimationData.getInAnimationTime`.
pub fn get_in_animation_time(
    elapsed_sec: f32,
    duration: f32,
    loop_in: f32,
    loop_out: f32,
    is_looping: bool,
) -> f32 {
    if !is_looping {
        return elapsed_sec.min(duration);
    }
    let loop_duration = loop_out - loop_in;
    if loop_duration <= 0.0 {
        return elapsed_sec.min(duration);
    }
    if elapsed_sec <= loop_out {
        return elapsed_sec;
    }
    loop_in + ((elapsed_sec - loop_in) % loop_duration)
}

/// Ease-in factor for blending the start of an animation.
///
/// Mirrors `AnimationData.getInFactor`.
#[inline]
pub fn get_in_factor(elapsed: f32, ease_in: f32) -> f32 {
    if ease_in <= 0.0 || elapsed >= ease_in {
        1.0
    } else {
        cubic_step(elapsed / ease_in)
    }
}

/// Ease-out factor for blending the end of an animation.
///
/// Mirrors `AnimationData.getOutFactor`.
#[inline]
pub fn get_out_factor(remaining: f32, ease_out: f32) -> f32 {
    if ease_out <= 0.0 || remaining >= ease_out {
        1.0
    } else {
        cubic_step(remaining / ease_out)
    }
}

// ===========================================================================
// AvatarSkeleton – driven-weight ramp
// ===========================================================================

/// Computes the "driven weight" for a visual parameter with a
/// trapezoidal ramp defined by (min1, max1, max2, min2).
///
/// Mirrors `AvatarSkeleton.getDrivenWeight`:
/// ```kotlin
/// val driven_weight = when {
///     paramValue <= min1 || paramValue >= min2 -> 0.0f
///     paramValue < max1 -> (paramValue - min1) / (max1 - min1)
///     paramValue <= max2 -> 1.0f
///     else -> (min2 - paramValue) / (min2 - max2)
/// }
/// ```
pub fn get_driven_weight(param_value: f32, min1: f32, max1: f32, max2: f32, min2: f32) -> f32 {
    if param_value <= min1 || param_value >= min2 {
        0.0
    } else if param_value < max1 {
        (param_value - min1) / (max1 - min1)
    } else if param_value <= max2 {
        1.0
    } else {
        (min2 - param_value) / (min2 - max2)
    }
}

// ===========================================================================
// GpuCapabilities – tier selection
// ===========================================================================

/// GPU compatibility tiers.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum GpuTier {
    TierA,
    TierB,
    TierC,
}

/// Selects a GPU compatibility tier.
///
/// Mirrors `GpuCapabilities.chooseTier`:
/// - Tier A: ES 3.0 with no ES3-shader quirk
/// - Tier B: ES 2.0 capable (but not 3.0 or has quirk)
/// - Tier C: legacy fixed-function
pub fn choose_tier(supports_es3: bool, selected_gl20: bool, quirk_disable_es3: bool) -> GpuTier {
    if supports_es3 && !quirk_disable_es3 {
        GpuTier::TierA
    } else if selected_gl20 {
        GpuTier::TierB
    } else {
        GpuTier::TierC
    }
}

// ===========================================================================
// WindlightSky – icosahedron geometry constants
// ===========================================================================

/// Golden ratio used for icosahedron vertex construction.
pub const GOLDEN_RATIO_Q: f32 = 1.618_034;

/// Number of random stars generated by WindlightSky.
pub const WINDLIGHT_STAR_COUNT: usize = 500;

/// The 12 vertices of the unit icosahedron (non-normalized) used
/// for the sky dome. Each row is (x, y, z).
pub const ICOSAHEDRON_VERTICES: [[f32; 3]; 12] = [
    [-1.0,  GOLDEN_RATIO_Q,  0.0],
    [ 1.0,  GOLDEN_RATIO_Q,  0.0],
    [-1.0, -GOLDEN_RATIO_Q,  0.0],
    [ 1.0, -GOLDEN_RATIO_Q,  0.0],
    [ 0.0, -1.0,  GOLDEN_RATIO_Q],
    [ 0.0,  1.0,  GOLDEN_RATIO_Q],
    [ 0.0, -1.0, -GOLDEN_RATIO_Q],
    [ 0.0,  1.0, -GOLDEN_RATIO_Q],
    [ GOLDEN_RATIO_Q,  0.0, -1.0],
    [ GOLDEN_RATIO_Q,  0.0,  1.0],
    [-GOLDEN_RATIO_Q,  0.0, -1.0],
    [-GOLDEN_RATIO_Q,  0.0,  1.0],
];

/// The 20 triangular faces of the icosahedron, each as three
/// vertex indices into [`ICOSAHEDRON_VERTICES`].
pub const ICOSAHEDRON_INDICES: [[u8; 3]; 20] = [
    [0, 11,  5], [0,  5,  1], [0,  1,  7], [0,  7, 10], [0, 10, 11],
    [1,  5,  9], [5, 11,  4], [11, 10,  2], [10,  7,  6], [7,  1,  8],
    [3,  9,  4], [3,  4,  2], [3,  2,  6], [3,  6,  8], [3,  8,  9],
    [4,  9,  5], [2,  4, 11], [6,  2, 10], [8,  6,  7], [9,  8,  1],
];

// ===========================================================================
// DrawableGeometry – ray-triangle intersection
// ===========================================================================

/// A 3D vector (x, y, z).
pub type Vec3 = [f32; 3];

/// Result of a successful ray-triangle intersection.
#[derive(Debug, Clone)]
pub struct RayTriangleHit {
    /// Barycentric coordinate u (weight of vertex 1).
    pub u: f32,
    /// Barycentric coordinate v (weight of vertex 2).
    pub v: f32,
    /// Parameter t along the ray (distance factor from origin).
    pub t: f32,
}

/// Moller-Trumbore ray-triangle intersection.
///
/// Returns `Some(hit)` if the ray from `origin` toward `direction`
/// intersects the triangle `(v0, v1, v2)`.
///
/// Mirrors the inner loop of `DrawableGeometry.IntersectRay`.
pub fn ray_triangle_intersect(
    origin: &Vec3,
    direction: &Vec3,
    v0: &Vec3,
    v1: &Vec3,
    v2: &Vec3,
) -> Option<RayTriangleHit> {
    let edge1 = sub(v1, v0);
    let edge2 = sub(v2, v0);
    let h = cross(direction, &edge2);
    let a = dot(&edge1, &h);
    if a.abs() < 1e-7 {
        return None; // parallel
    }
    let f = 1.0 / a;
    let s = sub(origin, v0);
    let u = f * dot(&s, &h);
    if !(0.0..=1.0).contains(&u) {
        return None;
    }
    let q = cross(&s, &edge1);
    let v = f * dot(direction, &q);
    if v < 0.0 || u + v > 1.0 {
        return None;
    }
    let t = f * dot(&edge2, &q);
    if t > 1e-7 {
        Some(RayTriangleHit { u, v, t })
    } else {
        None
    }
}

#[inline]
fn sub(a: &Vec3, b: &Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

#[inline]
fn cross(a: &Vec3, b: &Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

#[inline]
fn dot(a: &Vec3, b: &Vec3) -> f32 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

// ===========================================================================
// RenderContext – gluUnProject (screen to world)
// ===========================================================================

/// 4x4 matrix stored column-major (OpenGL convention).
pub type Mat4 = [f32; 16];

/// Multiply two 4x4 matrices (column-major).
fn mat4_multiply(out: &mut Mat4, a: &Mat4, b: &Mat4) {
    for col in 0..4 {
        for row in 0..4 {
            out[col * 4 + row] = (0..4)
                .map(|k| a[k * 4 + row] * b[col * 4 + k])
                .sum();
        }
    }
}

/// Multiply a 4x4 matrix by a 4-vector.
fn mat4_mul_vec4(out: &mut [f32; 4], m: &Mat4, v: &[f32; 4]) {
    for row in 0..4 {
        out[row] = (0..4).map(|k| m[k * 4 + row] * v[k]).sum();
    }
}

/// Invert a 4x4 matrix. Returns `false` if singular.
fn mat4_invert(out: &mut Mat4, m: &Mat4) -> bool {
    let mut inv = [0.0f32; 16];
    inv[0] = m[5]*m[10]*m[15] - m[5]*m[11]*m[14] - m[9]*m[6]*m[15]
           + m[9]*m[7]*m[14] + m[13]*m[6]*m[11] - m[13]*m[7]*m[10];
    inv[4] = -m[4]*m[10]*m[15] + m[4]*m[11]*m[14] + m[8]*m[6]*m[15]
           - m[8]*m[7]*m[14] - m[12]*m[6]*m[11] + m[12]*m[7]*m[10];
    inv[8] = m[4]*m[9]*m[15] - m[4]*m[11]*m[13] - m[8]*m[5]*m[15]
           + m[8]*m[7]*m[13] + m[12]*m[5]*m[11] - m[12]*m[7]*m[9];
    inv[12] = -m[4]*m[9]*m[14] + m[4]*m[10]*m[13] + m[8]*m[5]*m[14]
           - m[8]*m[6]*m[13] - m[12]*m[5]*m[10] + m[12]*m[6]*m[9];

    inv[1] = -m[1]*m[10]*m[15] + m[1]*m[11]*m[14] + m[9]*m[2]*m[15]
           - m[9]*m[3]*m[14] - m[13]*m[2]*m[11] + m[13]*m[3]*m[10];
    inv[5] = m[0]*m[10]*m[15] - m[0]*m[11]*m[14] - m[8]*m[2]*m[15]
           + m[8]*m[3]*m[14] + m[12]*m[2]*m[11] - m[12]*m[3]*m[10];
    inv[9] = -m[0]*m[9]*m[15] + m[0]*m[11]*m[13] + m[8]*m[1]*m[15]
           - m[8]*m[3]*m[13] - m[12]*m[1]*m[11] + m[12]*m[3]*m[9];
    inv[13] = m[0]*m[9]*m[14] - m[0]*m[10]*m[13] - m[8]*m[1]*m[14]
           + m[8]*m[2]*m[13] + m[12]*m[1]*m[10] - m[12]*m[2]*m[9];

    inv[2] = m[1]*m[6]*m[15] - m[1]*m[7]*m[14] - m[5]*m[2]*m[15]
           + m[5]*m[3]*m[14] + m[13]*m[2]*m[7] - m[13]*m[3]*m[6];
    inv[6] = -m[0]*m[6]*m[15] + m[0]*m[7]*m[14] + m[4]*m[2]*m[15]
           - m[4]*m[3]*m[14] - m[12]*m[2]*m[7] + m[12]*m[3]*m[6];
    inv[10] = m[0]*m[5]*m[15] - m[0]*m[7]*m[13] - m[4]*m[1]*m[15]
           + m[4]*m[3]*m[13] + m[12]*m[1]*m[7] - m[12]*m[3]*m[5];
    inv[14] = -m[0]*m[5]*m[14] + m[0]*m[6]*m[13] + m[4]*m[1]*m[14]
           - m[4]*m[2]*m[13] - m[12]*m[1]*m[6] + m[12]*m[2]*m[5];

    inv[3] = -m[1]*m[6]*m[11] + m[1]*m[7]*m[10] + m[5]*m[2]*m[11]
           - m[5]*m[3]*m[10] - m[9]*m[2]*m[7] + m[9]*m[3]*m[6];
    inv[7] = m[0]*m[6]*m[11] - m[0]*m[7]*m[10] - m[4]*m[2]*m[11]
           + m[4]*m[3]*m[10] + m[8]*m[2]*m[7] - m[8]*m[3]*m[6];
    inv[11] = -m[0]*m[5]*m[11] + m[0]*m[7]*m[9] + m[4]*m[1]*m[11]
           - m[4]*m[3]*m[9] - m[8]*m[1]*m[7] + m[8]*m[3]*m[5];
    inv[15] = m[0]*m[5]*m[10] - m[0]*m[6]*m[9] - m[4]*m[1]*m[10]
           + m[4]*m[2]*m[9] + m[8]*m[1]*m[6] - m[8]*m[2]*m[5];

    let det = m[0]*inv[0] + m[1]*inv[4] + m[2]*inv[8] + m[3]*inv[12];
    if det.abs() < 1e-12 {
        return false;
    }
    let inv_det = 1.0 / det;
    for i in 0..16 {
        out[i] = inv[i] * inv_det;
    }
    true
}

/// Unprojects a window coordinate to object coordinates.
///
/// Mirrors `RenderContext.gluUnProject`.
///
/// Returns `Some([x, y, z])` in object space, or `None` if the
/// combined model-projection matrix is singular.
pub fn glu_unproject(
    win_x: f32,
    win_y: f32,
    win_z: f32,
    model: &Mat4,
    proj: &Mat4,
    viewport: &[i32; 4],
) -> Option<Vec3> {
    // Normalized device coordinates
    let nd_x = ((win_x - viewport[0] as f32) * 2.0 / viewport[2] as f32) - 1.0;
    let nd_y = ((win_y - viewport[1] as f32) * 2.0 / viewport[3] as f32) - 1.0;
    let nd_z = 2.0 * win_z - 1.0;

    // Combined matrix = proj * model
    let mut combined = [0.0f32; 16];
    mat4_multiply(&mut combined, proj, model);

    // Inverse
    let mut inv = [0.0f32; 16];
    if !mat4_invert(&mut inv, &combined) {
        return None;
    }

    let input = [nd_x, nd_y, nd_z, 1.0];
    let mut output = [0.0f32; 4];
    mat4_mul_vec4(&mut output, &inv, &input);

    if output[3] == 0.0 {
        return None;
    }
    Some([
        output[0] / output[3],
        output[1] / output[3],
        output[2] / output[3],
    ])
}

// ===========================================================================
// Shader enum constants
// ===========================================================================

/// Number of shader entries in the `Shader` enum.
pub const SHADER_COUNT: usize = 26;

// ===========================================================================
// DrawablePrim render-pass constants
// ===========================================================================

/// Render pass flags from `DrawablePrim`.
pub const RENDER_PASS_OPAQUE: u32 = 1;
pub const RENDER_PASS_TRANSPARENT: u32 = 2;
pub const RENDER_PASS_ALL: u32 = RENDER_PASS_OPAQUE | RENDER_PASS_TRANSPARENT;

// ===========================================================================
// RenderContext constants
// ===========================================================================

pub const NEAR_PLANE: f32 = 0.5;
pub const UNIFORM_BLOCK_ANIMATION_DATA: u32 = 1;
pub const UNIFORM_BLOCK_RIGGING_DATA: u32 = 2;

// ===========================================================================
// SpatialObjectIndex constants
// ===========================================================================

pub const SPATIAL_NUM_DEPTH_BINS: u32 = 16;
pub const SPATIAL_REGION_SIZE_XY: f32 = 256.0;
pub const SPATIAL_REGION_SIZE_Z: f32 = 4096.0;

// ===========================================================================
// TextureMemoryTracker constants
// ===========================================================================

pub const RELEASE_DELAY_FRAMES: u32 = 4;

// ===========================================================================
// WorldViewRenderer constants
// ===========================================================================

pub const MIN_DRAW_LIST_UPDATE_FRAMES: u32 = 4;
pub const MIN_DRAW_LIST_UPDATE_INTERVAL_MS: u64 = 100;
pub const EGL_CONTEXT_CLIENT_VERSION: i32 = 12440;

// ===========================================================================
// DrawableObject constants
// ===========================================================================

pub const INVISIBLE_FRAMES_APPEAR: i32 = 10;
pub const INVISIBLE_FRAMES_DISAPPEAR: i32 = 10;

// ===========================================================================
// MatrixStack constant
// ===========================================================================

pub const MATRIX_STACK_DEFAULT_MAX_DEPTH: usize = 32;

// ===========================================================================
// Marker types for platform-specific classes
// ===========================================================================

/// Marker for `RenderContext` – manages GL state, shader programs, and the
/// drawable store.  Requires an active EGL context.
pub struct RenderContextMarker {
    _private: (),
}

/// Marker for `WorldViewRenderer` – implements `GLSurfaceView.Renderer`
/// and `GLSurfaceView.EGLContextFactory`.  Drives the render loop.
pub struct WorldViewRendererMarker {
    _private: (),
}

/// Marker for `DrawableAvatar` – avatar rendering with skeleton animation,
/// attachment management, and per-bone picking.
pub struct DrawableAvatarMarker {
    _private: (),
}

/// Marker for `DrawableGeometry` – VBO/VAO setup and per-face ray
/// intersection with barycentric UV interpolation.
pub struct DrawableGeometryMarker {
    _private: (),
}

/// Marker for `DrawablePrim` – per-face render-pass determination,
/// UV matrix construction, and Bakes on Mesh texture substitution.
pub struct DrawablePrimMarker {
    _private: (),
}

/// Marker for `GLAsyncLoadQueue` – async GL texture loading thread
/// with a shared EGL context.
pub struct GLAsyncLoadQueueMarker {
    _private: (),
}

/// Marker for `MatrixStack` – 4x4 matrix stack with push/pop.
/// Pure math, but deeply integrated with GL state calls.
pub struct MatrixStackMarker {
    _private: (),
}

/// Marker for `WindlightSky` – sky dome geometry and star rendering.
pub struct WindlightSkyMarker {
    _private: (),
}

/// Marker for `SpatialTree` / `SpatialTreeNode` – octree-like spatial
/// index with frustum culling and depth-bin linked list.
pub struct SpatialTreeMarker {
    _private: (),
}

// ===========================================================================
// Tests
// ===========================================================================

#[cfg(test)]
mod tests {
    use super::*;

    // -- fixedToFloat --

    #[test]
    fn test_fixed_to_float_zero() {
        assert_eq!(fixed_to_float(0), 0.0);
    }

    #[test]
    fn test_fixed_to_float_one() {
        // 1.0 in 16.16 fixed-point is 65536
        let result = fixed_to_float(65536);
        assert!((result - 1.0).abs() < 1e-3, "got {result}");
    }

    #[test]
    fn test_fixed_to_float_negative() {
        let result = fixed_to_float(-65536);
        assert!((result - (-1.0)).abs() < 1e-3, "got {result}");
    }

    // -- texture_actual_size --

    #[test]
    fn test_texture_actual_size_zero() {
        assert_eq!(texture_actual_size(0), 0);
    }

    #[test]
    fn test_texture_actual_size_one() {
        assert_eq!(texture_actual_size(1), 4096);
    }

    #[test]
    fn test_texture_actual_size_exact() {
        assert_eq!(texture_actual_size(4096), 4096);
    }

    #[test]
    fn test_texture_actual_size_just_over() {
        assert_eq!(texture_actual_size(4097), 8192);
    }

    // -- uint16_to_float --

    #[test]
    fn test_uint16_to_float_min() {
        let v = uint16_to_float(0, -1.0, 1.0);
        assert!((v - (-1.0)).abs() < 1e-5);
    }

    #[test]
    fn test_uint16_to_float_max() {
        let v = uint16_to_float(65535, -1.0, 1.0);
        assert!((v - 1.0).abs() < 1e-3);
    }

    #[test]
    fn test_uint16_to_float_mid() {
        let v = uint16_to_float(32768, 0.0, 1.0);
        assert!((v - 0.5).abs() < 0.01);
    }

    // -- cubic_step --

    #[test]
    fn test_cubic_step_zero() {
        assert_eq!(cubic_step(0.0), 0.0);
    }

    #[test]
    fn test_cubic_step_one() {
        assert!((cubic_step(1.0) - 1.0).abs() < 1e-7);
    }

    #[test]
    fn test_cubic_step_half() {
        assert!((cubic_step(0.5) - 0.5).abs() < 1e-7);
    }

    // -- get_in_animation_time --

    #[test]
    fn test_animation_time_no_loop_clamp() {
        let t = get_in_animation_time(5.0, 3.0, 0.0, 3.0, false);
        assert_eq!(t, 3.0);
    }

    #[test]
    fn test_animation_time_loop_wrap() {
        let t = get_in_animation_time(5.0, 4.0, 1.0, 3.0, true);
        // loop_duration=2, excess=5-1=4, 4%2=0, result=1+0=1
        assert!((t - 1.0).abs() < 1e-5);
    }

    #[test]
    fn test_animation_time_before_loop_out() {
        let t = get_in_animation_time(2.0, 4.0, 1.0, 3.0, true);
        assert_eq!(t, 2.0);
    }

    // -- get_in_factor / get_out_factor --

    #[test]
    fn test_in_factor_no_ease() {
        assert_eq!(get_in_factor(0.5, 0.0), 1.0);
    }

    #[test]
    fn test_in_factor_past_ease() {
        assert_eq!(get_in_factor(2.0, 1.0), 1.0);
    }

    #[test]
    fn test_in_factor_mid_ease() {
        let f = get_in_factor(0.5, 1.0);
        assert!((f - cubic_step(0.5)).abs() < 1e-7);
    }

    #[test]
    fn test_out_factor_no_ease() {
        assert_eq!(get_out_factor(0.5, 0.0), 1.0);
    }

    // -- get_driven_weight --

    #[test]
    fn test_driven_weight_below_min() {
        assert_eq!(get_driven_weight(0.0, 0.1, 0.3, 0.7, 0.9), 0.0);
    }

    #[test]
    fn test_driven_weight_above_max() {
        assert_eq!(get_driven_weight(1.0, 0.1, 0.3, 0.7, 0.9), 0.0);
    }

    #[test]
    fn test_driven_weight_plateau() {
        assert_eq!(get_driven_weight(0.5, 0.1, 0.3, 0.7, 0.9), 1.0);
    }

    #[test]
    fn test_driven_weight_ramp_up() {
        let w = get_driven_weight(0.2, 0.1, 0.3, 0.7, 0.9);
        assert!((w - 0.5).abs() < 1e-5);
    }

    #[test]
    fn test_driven_weight_ramp_down() {
        let w = get_driven_weight(0.8, 0.1, 0.3, 0.7, 0.9);
        assert!((w - 0.5).abs() < 1e-5);
    }

    // -- choose_tier --

    #[test]
    fn test_choose_tier_a() {
        assert_eq!(choose_tier(true, true, false), GpuTier::TierA);
    }

    #[test]
    fn test_choose_tier_b_quirk() {
        assert_eq!(choose_tier(true, true, true), GpuTier::TierB);
    }

    #[test]
    fn test_choose_tier_b_no_es3() {
        assert_eq!(choose_tier(false, true, false), GpuTier::TierB);
    }

    #[test]
    fn test_choose_tier_c() {
        assert_eq!(choose_tier(false, false, false), GpuTier::TierC);
    }

    // -- ray_triangle_intersect --

    #[test]
    fn test_ray_hits_triangle() {
        let origin = [0.0, 0.0, -1.0];
        let direction = [0.0, 0.0, 1.0];
        let v0 = [-1.0, -1.0, 0.0];
        let v1 = [1.0, -1.0, 0.0];
        let v2 = [0.0, 1.0, 0.0];
        let hit = ray_triangle_intersect(&origin, &direction, &v0, &v1, &v2);
        assert!(hit.is_some());
        let h = hit.unwrap();
        assert!((h.t - 1.0).abs() < 1e-5);
    }

    #[test]
    fn test_ray_misses_triangle() {
        let origin = [5.0, 5.0, -1.0];
        let direction = [0.0, 0.0, 1.0];
        let v0 = [-1.0, -1.0, 0.0];
        let v1 = [1.0, -1.0, 0.0];
        let v2 = [0.0, 1.0, 0.0];
        assert!(ray_triangle_intersect(&origin, &direction, &v0, &v1, &v2).is_none());
    }

    #[test]
    fn test_ray_parallel_to_triangle() {
        let origin = [0.0, 0.0, 0.0];
        let direction = [1.0, 0.0, 0.0];
        let v0 = [-1.0, -1.0, 0.0];
        let v1 = [1.0, -1.0, 0.0];
        let v2 = [0.0, 1.0, 0.0];
        assert!(ray_triangle_intersect(&origin, &direction, &v0, &v1, &v2).is_none());
    }

    // -- glu_unproject --

    #[test]
    fn test_glu_unproject_identity() {
        let identity: Mat4 = [
            1.0, 0.0, 0.0, 0.0,
            0.0, 1.0, 0.0, 0.0,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0,
        ];
        let viewport = [0, 0, 800, 600];
        // Center of viewport, depth 0.5 -> NDC (0,0,0)
        let result = glu_unproject(400.0, 300.0, 0.5, &identity, &identity, &viewport);
        assert!(result.is_some());
        let r = result.unwrap();
        assert!(r[0].abs() < 1e-4, "x={}", r[0]);
        assert!(r[1].abs() < 1e-4, "y={}", r[1]);
        assert!(r[2].abs() < 1e-4, "z={}", r[2]);
    }

    #[test]
    fn test_glu_unproject_corner() {
        let identity: Mat4 = [
            1.0, 0.0, 0.0, 0.0,
            0.0, 1.0, 0.0, 0.0,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0,
        ];
        let viewport = [0, 0, 800, 600];
        // Bottom-left corner, depth 0 -> NDC (-1,-1,-1)
        let result = glu_unproject(0.0, 0.0, 0.0, &identity, &identity, &viewport);
        assert!(result.is_some());
        let r = result.unwrap();
        assert!((r[0] - (-1.0)).abs() < 1e-4);
        assert!((r[1] - (-1.0)).abs() < 1e-4);
        assert!((r[2] - (-1.0)).abs() < 1e-4);
    }

    // -- constants --

    #[test]
    fn test_icosahedron_counts() {
        assert_eq!(ICOSAHEDRON_VERTICES.len(), 12);
        assert_eq!(ICOSAHEDRON_INDICES.len(), 20);
    }

    #[test]
    fn test_render_pass_all() {
        assert_eq!(RENDER_PASS_ALL, 3);
        assert_eq!(RENDER_PASS_OPAQUE | RENDER_PASS_TRANSPARENT, RENDER_PASS_ALL);
    }
}
