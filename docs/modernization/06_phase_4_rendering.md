# Phase 4 — Rendering

Goal: at the end of this phase the user logs in and sees the world.
Terrain, objects, avatars, water, sky, lighting. Not beautiful yet —
correct and stable. Beautiful is Phase 4b (PBR, shadows, post).

The Filament engine is the chassis. Linkpoint already has 12 Filament
components documented in `Linkpoint/FILAMENT.md`. Phase 4 makes them
all connect to the Phase 3 asset pipeline and the Phase 2 scene data.

## Background

SL rendering reduces to six streams of data flowing into a scene:

1. **Terrain** — a 256×256 heightmap per region, with four layered
   textures blended by a per-vertex alpha mask.
2. **Prims** — procedural primitives (cube, sphere, cylinder, etc.)
   with parametric twist/shear/hollow/taper. Wire-reported via
   `ObjectUpdate` blocks. Each prim has up to 9 faces with independent
   textures/materials.
3. **Sculpts** — prims whose geometry is derived from a sculpt
   texture (essentially a displacement map).
4. **Meshes** — full triangle meshes from Phase 3's `MeshDecoder`.
5. **Avatars** — skinned meshes (default avatar skeleton 110 bones;
   bento skeletons add more) with baked texture composites and
   attachments that are themselves prims/meshes.
6. **Sky/water/clouds** — windlight parameters from
   `EnvironmentSettings` CAP; procedural shaders.

Phase 4 targets correctness across all six. PBR, shadows, and
post-processing are stretch.

## Tasks

### P4-ENGINE-01 — Filament engine lifecycle gates

- **Input**: Linkpoint `render/filament/FilamentRenderContext.kt`,
  `FilamentSurfaceView.kt`, `FilamentWorldRenderer.kt`.
- **Output**: Engine startup is deterministic and tied to Activity
  lifecycle correctly. `onCreate` → `Engine.create`;
  `surfaceCreated` → `SwapChain.create`; `onPause` →
  `SwapChain.destroy`; `onDestroy` → `Engine.destroy`. No leaks
  between activities; no double-create during config change.
- **Acceptance**: Orientation change 100 times in a loop produces
  stable native memory (±5% drift).

### P4-SCENE-01 — Region → Filament scene bridge

- **Input**: `world/Region.kt` state; `FilamentWorldDataBridge.kt`.
- **Output**: Every `ObjectUpdate` for the current region produces
  or updates a Filament `Entity` in the scene. `KillObject` removes
  it. Interpolation between `ImprovedTerseObjectUpdate` packets is
  piecewise-linear; full updates clobber.
- **Data flow**: circuit thread → `SceneUpdateQueue` (bounded 4096
  updates) → render thread dequeues in batches up to 256 per frame.
- **Acceptance**: 5,000-prim region populates the scene in <10 s and
  has ≥30 fps on reference hardware.

### P4-TERRAIN-01 — Terrain

- **Input**: `LayerData` messages (compressed 16×16 patch updates);
  upstream `indra/newview/llvlcomposition.cpp` for four-texture
  blending.
- **Output**: 16×16 terrain patches as Filament `Geometry` with a
  single material that samples four detail textures blended by the
  `TerrainDetail0..3` UUIDs from `RegionHandshake` and the per-vertex
  alpha weights from `LayerData`.
  - Patch-level frustum culling.
  - Height query API: `terrain.heightAt(x: Float, y: Float): Float`
    for avatar placement.
- **Acceptance**: Full 256×256 region terrain renders without seams;
  texture transitions match upstream viewer visually.

### P4-PRIM-01 — Procedural prims

- **Input**: `ObjectUpdate` prim parameters. Upstream
  `indra/llprimitive/llvolume.cpp` for the parametric primitive
  generator.
- **Output**: Given path/profile/twist/shear/hollow/taper parameters,
  generate a triangle mesh. Deduplicate across identical parameter
  sets (hash the parameters). Cache generated meshes in memory at
  2,000 entries LRU.
- **Acceptance**: Generated prim silhouettes match upstream viewer at
  pixel-level for the cube / sphere / cylinder / prism / torus / tube /
  ring / sculpt parameter corpus.

### P4-SCULPT-01 — Sculpted prims

- **Input**: Sculpt texture from `SculptType` field in `ObjectUpdate`;
  upstream `indra/llprimitive/llsculpt.cpp`.
- **Output**: Given a sculpt texture and a sculpt-type enum
  (sphere/plane/torus/cylinder), displace a base mesh grid by the
  texture's RGB → XYZ. Handles mirrored/inverted/pre-faceted flags.
- **Acceptance**: 20 real SL sculpts render with correct topology.

### P4-MESH-01 — Mesh rendering

- **Input**: `MeshCpuBuffers` from Phase 3; skin bind-pose.
- **Output**: Upload vertex/index buffers to Filament
  `VertexBuffer`/`IndexBuffer`; for skinned meshes, bind to the
  avatar's `Skin`. Non-skinned meshes attach directly to the prim
  entity.
- **Acceptance**: Known-good mesh content in Agni renders; face
  counts match server-reported `RenderMaterials` entries.

### P4-AVATAR-01 — Default avatar skeleton

- **Input**: SL default skeleton (`character/avatar_skeleton.xml`
  from the LL viewer); Lumiya baked avatar skin reference;
  Linkpoint `FilamentAvatarRenderer.kt`.
- **Output**: Default 26-bone skeleton implemented in
  `render/avatar/AvatarSkeleton.kt`. `Skin` built from bind-pose.
  System-layer "Ruth" avatar as fallback when no appearance set.
- **Acceptance**: A fresh account's avatar rezzes as the system Ruth
  skin with correct proportions.

### P4-AVATAR-02 — Bento skeleton + animation playback

- **Input**: Bento skeleton extension (~132 bones total);
  `AnimationDecoder` output from Phase 3.
- **Output**: Skeleton supports bento bone set. `AnimationPlayer`
  plays a clip's per-bone tracks, blends between clips by priority,
  handles ease-in/ease-out.
- **Acceptance**: Walk animation plays at the correct speed; head
  turns independently of body (simultaneous anims with different
  priorities).

### P4-AVATAR-03 — Baked textures on avatars

- **Input**: `BakedTextureFetcher` from Phase 3.
- **Output**: Baked textures applied to the avatar's skin/clothes
  material set.
- **Acceptance**: Other users' avatars visible with their intended
  skins (not grey).

### P4-ATTACH-01 — Avatar attachments

- **Input**: `AvatarAppearance` message attachment points; each
  attached object is itself an `ObjectUpdate`.
- **Output**: Attachments parent to the appropriate avatar bone;
  transforms apply local to bone space.
- **Acceptance**: Known account with a hat attachment shows the hat
  on the head.

### P4-SKY-01 — Sky and sun

- **Input**: `EnvironmentSettings` CAP response; upstream
  `indra/newview/llsettingssky.cpp`.
- **Output**: Procedural sky shader (day-night cycle, sun position,
  atmospheric scatter). Sun direction drives directional light for
  everything else.
- **Acceptance**: Sun position matches upstream viewer ±2° through a
  24-hour simulated cycle.

### P4-WATER-01 — Water

- **Input**: `EnvironmentSettings` water block.
- **Output**: Reflective water plane at region water height. Simple
  scrolling normal map for initial implementation; real reflections
  deferred to Phase 4b.
- **Acceptance**: Water renders at the correct height in a water
  region; no z-fighting with terrain under shore.

### P4-LIGHT-01 — Lighting

- **Input**: Sun from P4-SKY-01; point lights from `ObjectUpdate`
  light parameters (`LightColor`, `LightRadius`, `LightFalloff`).
- **Output**: One directional (sun) + up to 16 per-frame point lights
  (closest-to-camera selection). Ambient from sky.
- **Acceptance**: A scripted prim emitting red light illuminates
  nearby surfaces in the correct colour.

### P4-CAM-01 — Camera

- **Input**: Lumiya `ui/render/WorldViewRenderer.java` camera logic
  (first/third-person, mouselook); upstream
  `indra/newview/llviewercamera.cpp`.
- **Output**: Third-person orbit camera following the avatar;
  first-person (mouselook) toggle; free-camera (alt-drag).
  Sensitivity configurable.
- **Acceptance**: Orbit feels the same as Lumiya to a user who knows
  the latter.

### P4-PERF-01 — Performance baseline

- **Input**: `FilamentPerformanceOptimizer.kt`.
- **Output**: Frustum culling active. LOD switch based on pixel-size
  on screen. Frame budget enforced at 16.6 ms (60 fps) target;
  30 fps floor. On frame-time overrun, reduce to medium LOD
  first, then skip distant prims.
- **Acceptance**: 10,000-prim region holds ≥30 fps on reference
  hardware; ≥60 fps on Snapdragon 8 Gen 2 class.

### P4-HUD-01 — HUD attachments

- **Input**: SL HUD attachments are regular avatar attachments on
  `ATTACHMENT_HUD_*` points, rendered in screen space.
- **Output**: Render HUD-attached objects in an overlay pass with
  an orthographic camera. Attachment point drives screen anchor.
- **Acceptance**: HUD display works for the standard set of HUD
  attachment points.

### P4-PBR-01 — PBR materials (Phase 4b)

- **Input**: `RenderMaterials` CAP; upstream
  `indra/newview/llgltfmateriallist.cpp`. Filament supports glTF 2.0
  out of the box.
- **Output**: When a prim face references a material ID, fetch the
  material JSON, map to a Filament `Material` instance with
  base-color / metallic-roughness / normal / emissive / occlusion
  texture slots.
- **Acceptance**: Known PBR content in Agni renders with correct
  material response.

### P4-SHADOW-01 — Shadows (Phase 4b)

- **Input**: Filament cascaded shadow maps.
- **Output**: Sun-directional shadows, 4 cascades, soft PCF. Quality
  preset selectable.
- **Acceptance**: Avatar casts a shadow on terrain that tracks sun
  movement.

### P4-POST-01 — Post-processing (Phase 4b)

- **Input**: Filament's built-in bloom, tone mapping, FXAA, TAA.
- **Output**: Tone mapping on, bloom on, anti-aliasing configurable
  (FXAA default, TAA optional).
- **Acceptance**: No visible artefacts on the reference corpus.

## Files expected to change

- `Linkpoint/src/main/java/com/linkpoint/render/filament/*` (expand)
- `Linkpoint/src/main/java/com/linkpoint/render/avatar/*` (new)
- `Linkpoint/src/main/java/com/linkpoint/render/terrain/*`
- `Linkpoint/src/main/java/com/linkpoint/render/prims/*`
- `Linkpoint/src/main/java/com/linkpoint/render/scene/SceneUpdateQueue.kt` (new)
- Filament `.mat` sources under `Linkpoint/src/main/materials/`

## Exit criteria for Phase 4 (4a)

- Log in, see terrain, water, sky, avatars, prims, meshes.
- 30 fps floor holds in a typical region.
- Camera controls usable.
- Zero crashes in a 30-minute traversal of 5 regions.

## Exit criteria for Phase 4b

- PBR content renders correctly.
- Shadows toggle on and cost <10% fps at medium preset.
- Post-processing on by default with quality preset-controlled.
