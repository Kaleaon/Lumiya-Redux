# Shader Inventory and Visual-Parity Milestones

This document inventories the current shader programs and defines incremental visual-parity milestones with screenshot-based golden tests.

## Scope and source of truth

- Shader source files live in `app/src/main/assets/shaders/`.
- Program wrappers and uniforms/attributes are bound in `app/src/main/java/com/lumiyaviewer/lumiya/render/shaders/`.
- Runtime fallback selection is driven by `RenderContext` capability checks (`hasGL20`, `hasGL30`, external-texture support, clouds option, shader compile success).

## Current shader-program inventory

> Legend: “Required inputs” combines mandatory vertex attributes, uniforms, samplers, and runtime state.

| Program | Shader files | Visual intent | Required inputs | Fallback behavior |
|---|---|---|---|---|
| `PrimProgram` (alpha-cutout) | `prim.vsh` + `prim.fsh` | Baseline lit textured geometry with alpha discard (`a < 0.1`) for cutouts. | `vPosition`, `vTexCoord`, `vNormal`; `uMVPMatrix`, `uObjWorldMatrix`, `uObjCoordScale`, `uTexMatrix`, `vColor`; lighting uniforms (`LightDiffuseDir`, `LightDiffuseColor`, `LightAmbientColor`); `sTexture` + `useTexture`. | Opaque variant available (`PrimOpaqueProgram`) when alpha discard is not wanted; full shader stack disabled if GL2 unavailable/compile fails. |
| `PrimOpaqueProgram` | `prim.vsh` + `prim_opaque.fsh` | Lit textured opaque geometry pass (no discard). | Same as `PrimProgram`. | Falls back to non-opaque `PrimProgram` behavior only by call-site choice; both compile together in GL2 mode. |
| `FlexiPrimProgram` / `FlexiPrimOpaqueProgram` | `prim_flexible.vsh` + `prim.fsh`/`prim_opaque.fsh` | Flexible/deforming prim sections using `uSectionMatrices`. | Prim inputs + `uSectionMatrices[9]`, `uNumSectionMatrices`. | If not bound/drawn as flexi, renderer uses regular prim pipeline. |
| `AvatarProgram` | `avatar.vsh` + `prim.fsh` | Avatar skinning with two-bone blend and legacy lit fragment pass. | Prim inputs + avatar inputs: `vWeight`, `uJointMatrix[]`, `uJointMap[]`, `uJointMapLength`, `uUseWeight`. | If weighted skinning toggle is off (`uUseWeight=false`), uses identity blend matrix; still renders via same shader. |
| `RiggedMeshProgram` (GL2 path) | `rigged_mesh.vsh` + `prim.fsh`/`prim_opaque.fsh` | Rigged mesh skinning using packed joint vectors; lit textured output. | Prim inputs + `uBindShapeMatrix`, `uJointVectors[]`, `vWeight`, `vJoint`. | Preferred fallback when GL3 rigged program unavailable; still supports opaque/non-opaque fragment choice. |
| `RiggedMeshProgram30` (GL3 path) | `rigged_mesh_30.vsh` + `prim_30.fsh`/`prim_opaque_30.fsh` | Higher-fidelity rigged mesh path with UBO-based animation/rigging data and corrected normal matrix handling. | Prim inputs + `uBindShapeMatrix`, `vWeight`, integer `vJoint`, UBOs `AnimationData` + `RiggingData` (with required std140 offsets/strides). | If GL3 unavailable or compile fails, runtime downgrades to `RiggedMeshProgram` GL2 path. |
| `BoundingBoxProgram` (GL3) | `bounding_box_30.vsh` + `bounding_box_30.fsh` | Solid white debug/selection bounding box rendering. | `vPosition`; `uMVPMatrix`, `uObjWorldMatrix`, `uObjCoordScale`. | Disabled when GL3 shaders fail/unavailable; `RenderContext.boundingBox` set to `null`. |
| `WaterProgram` | `water.vsh` + `water.fsh` | Procedural animated water waves with diffuse + specular highlight. | `vPosition`; `uMVPMatrix`, `uObjWorldMatrix`; `vColor`; wave uniforms: `time`, `frequency[4]`, `phase[4]`, `amplitude[4]`, `direction[4]`. | No specialized alternate shader; if shaders disabled, water rendering path is unavailable with the rest of GL2 shader stack. |
| `SkyProgram` (no clouds) | `sky.vsh` + `sky_no_clouds.fsh` | Windlight-driven sky gradient + haze, no cloud texture sampling. | `vPosition`; `uMVPMatrix`; `skyColor`, `hazeHorizon`, `hazeColor`. | Used when cloud rendering option is off. |
| `SkyCloudsProgram` | `sky.vsh` + `sky.fsh` | Windlight sky with haze plus cube-map cloud noise modulation. | Sky inputs + cloud uniforms: `textureSampler`, `cloudColor`, `cloudGamma`, `cloudAdd`. | Runtime falls back to `SkyProgram` when user disables cloud rendering. |
| `StarsProgram` | `stars.vsh` + `stars.fsh` | Star field points with windlight brightness-driven alpha. | `vPosition`; `uMVPMatrix`; `uStarColor`. | No explicit shader fallback; omitted alongside full shader disable. |
| `QuadProgram` | `quad.vsh` + `quad.fsh` | 2D quad/UI sprite rendering with optional monochrome colorize + alpha discard. | `vPosition`, `vTexCoord`; `sTexture`, `uColorize`, `uColor`, `uPreTranslate`, `uScale`, `uPostTranslate`. | No specialized fallback; dependent on GL2 shaders. |
| `RawShaderProgram` | `raw.vsh` + `raw.fsh` | Blit path for regular 2D textures (camera/raw frame style input). | `vPosition`, `vTexCoord`; `uMVPMatrix`, `vTextureTransformMatrix`; sampler `vTexture`. | Only created when feature flag `z6` permits raw/external texture handling. |
| `RawShaderProgram` (external texture variant) | `external_texture.vsh` + `external_texture.fsh` | Blit path for `GL_OES_EGL_image_external` textures. | Same as raw variant, but sampler type `samplerExternalOES` and extension support required. | If external-texture feature support is absent (`z6=false`), both raw/ext programs are not created. |
| `FXAAProgram` | `fxaa.vsh` + `fxaa.fsh` | Post-process anti-aliasing compose pass using edge search + no-AA alpha-composite blend. | `vPosition`, `vTexCoord`; `uMVPMatrix`; `textureSampler`, `noAAtextureSampler`, `texcoordOffset`. | `RenderContext.useFXAA` is only enabled for GL2-capable path and user option; pass can be skipped by settings. |

## Cross-cutting runtime fallback matrix

1. **No GL2 (`hasGL20=false`)**: all shader programs are set to `null`; fixed-function/non-shader pathways are expected elsewhere.
2. **GL2 present but compile failure**: shader compile error flag is set; dependent systems (e.g., bounding box helper) are disabled.
3. **GL3 candidate but shader 3.0 compile failure**: rigged mesh and bounding box GL3 programs are disabled; renderer continues with GL2 shader set.
4. **Cloud rendering toggle off**: `SkyCloudsProgram` replaced by `SkyProgram`.
5. **External texture feature off**: raw/ext blit programs are omitted.

---

## Visual parity milestones and golden-test plan

All milestones use **paired captures**:
- **Reference**: baseline renderer (current known-good build).
- **Candidate**: branch under validation.
- **Locked scene controls**: same region/asset set, camera transform, field-of-view, animation state, day cycle time, and resolution.

### Capture protocol (applies to every milestone)

- Resolution: **1920×1080** (plus 1280×720 mobile fallback lane).
- Camera lock: deterministic camera preset JSON (position + forward/up vectors).
- Time lock: fixed windlight preset + absolute simulation timestamp.
- Frame warmup: ignore first 60 frames; capture on frame 61 to avoid shader JIT/transient texture uploads.
- File naming: `goldens/<milestone>/<scene>/<renderer>.png`.
- Diff metrics:
  - **Global**: SSIM, PSNR, RMSE.
  - **Targeted masks**: per-material/per-object ROI masks where needed (avatar body, sky dome, water plane).

### Milestone 1: Geometry + texture correctness

**Goal**
- Match object transforms, UV mapping, alpha-cutout edges, and texture sampling across prim/flexi/quad/raw passes.

**Shaders in scope**
- `prim.vsh`, `prim.fsh`, `prim_opaque.fsh`, `prim_flexible.vsh`, `quad.vsh`, `quad.fsh`, `raw.vsh`, `raw.fsh`, `external_texture.*`.

**Golden scenes**
1. Static prim gallery (opaque + alpha masked foliage).
2. Flexi object strip (multiple section matrices).
3. UI/HUD quad sheet (colorized and non-colorized).
4. Raw/external-texture blit pattern scene.

**Acceptance thresholds**
- Full-frame SSIM **≥ 0.992**.
- ROI SSIM on alpha-cutout edges **≥ 0.985**.
- UV checkerboard corner drift **≤ 0.5 px mean**, **≤ 1.0 px max**.
- Pixel mismatch ratio (|ΔRGB| > 8) **≤ 0.8%**.

### Milestone 2: Lighting parity

**Goal**
- Match diffuse/ambient response for day/night/underwater windlight conditions.

**Shaders in scope**
- Prim-family vertex + fragment shaders and sky-no-clouds baseline participation for ambient context.

**Golden scenes**
1. Outdoor noon sun, mixed normals test rig.
2. Sunset low-angle light rig.
3. Underwater view with same geometry and preset shift.

**Acceptance thresholds**
- Lighting ROI SSIM **≥ 0.990**.
- Mean CIEDE2000 (ΔE00) in lit surfaces **≤ 2.0**.
- 95th percentile ΔE00 **≤ 4.0**.
- Shadow/highlight lobe centroid shift **≤ 2 px**.

### Milestone 3: Avatars/rigging parity

**Goal**
- Match skinning deformation, joint mapping, animation playback, and rigged normal response.

**Shaders in scope**
- `avatar.vsh`, `rigged_mesh.vsh`, `rigged_mesh_30.vsh`, plus prim fragment variants.

**Golden scenes**
1. T-pose and A-pose static avatar snapshots.
2. High-motion animation clip (walk + arm swing).
3. Rigged mesh attachment stress scene (weighted accessory).
4. GL3 lane vs GL2 fallback lane side-by-side capture.

**Acceptance thresholds**
- Silhouette IoU against reference mask **≥ 0.985**.
- Joint landmark reprojection error **≤ 1.5 px mean**, **≤ 3 px max**.
- Skinned normal/light banding ROI SSIM **≥ 0.985**.
- GL3-vs-GL2 fallback delta budget: full-frame SSIM **≥ 0.975** (acknowledges normal-matrix improvements in GL3 path).

### Milestone 4: Sky/water/effects parity

**Goal**
- Match atmospheric gradients, cloud modulation, stars, and animated water highlights.

**Shaders in scope**
- `sky.vsh`, `sky.fsh`, `sky_no_clouds.fsh`, `stars.*`, `water.*`.

**Golden scenes**
1. Clear sky daytime.
2. Cloudy dusk with stars transition.
3. Open-water horizon pan (fixed path + fixed time sample points t=0, 5, 10 s).
4. Underwater water-surface view.

**Acceptance thresholds**
- Sky gradient band SSIM **≥ 0.995**.
- Cloud ROI SSIM **≥ 0.985**.
- Star luminance histogram KL divergence **≤ 0.02**.
- Water specular-track centroid drift **≤ 3 px** and temporal SSIM across sampled times **≥ 0.980**.

### Milestone 5: Optional post-processing upgrades

**Goal**
- Validate FXAA and any future post stack improvements without regressing base composition.

**Shaders in scope**
- `fxaa.vsh`, `fxaa.fsh` (+ future post shaders).

**Golden scenes**
1. High-contrast subpixel geometry chart.
2. Alpha-composite scene validating `noAAtextureSampler` blend behavior.
3. Real-world mixed scene with foliage + avatar + skyline.

**Acceptance thresholds**
- Edge alias metric improvement vs no-AA baseline: **≥ 25%** (stair-step score reduction).
- Post-FXAA full-frame SSIM against reference FXAA output **≥ 0.990**.
- No-AA layer preservation error (alpha composite ROI) **≤ 1.5%**.
- Performance guardrail (if benchmarked): frame time regression **≤ 8%** at 1080p.

---

## Golden-test implementation checklist

1. Add deterministic scene-loader presets (`tests/render/scenes/*.json`).
2. Add camera/time lock harness (`tests/render/harness/capture_config.json`).
3. Add renderer capture command:
   - `./gradlew :app:renderGoldenCapture -Pscene=<scene> -Pmilestone=<n> -Prenderer=<reference|candidate>`
4. Add diff command:
   - `./gradlew :app:renderGoldenDiff -Pmilestone=<n> -PthresholdProfile=default`
5. Emit machine-readable report:
   - `build/reports/render-diff/<milestone>.json`
6. CI gate: fail when any threshold exceeds budget.

## Suggested threshold profiles

- `strict` (release blocking): exact thresholds listed above.
- `dev` (iteration): relax SSIM by 0.005 and mismatch ratios by +0.5 percentage points.
- `gpu_compat` (known driver variance lane): keep geometric thresholds strict; relax color metrics only (ΔE00 +1.0).
