# Phase 3 — Assets

Goal: the viewer can fetch, decode, and cache every asset type SL can
hand it: textures (JPEG2000), meshes (collada-packed LLSD), animations
(BVH-derived binary), sounds (Ogg Vorbis), notecards (plain text),
landmarks, settings bundles, and avatar-baked textures. Asset fetches
respect bandwidth, run off the UI thread, and share a bounded cache
that survives process death.

## Background

Second Life asset fetch has five parallel paths, all of which a modern
viewer must support:

1. **UDP `RequestImage` / `ImagePacket`** — classic streamed JPEG2000
   over the circuit. Slow but universal. Lumiya still uses this in
   `SLTextureFetcher.java`.
2. **HTTP `GetTexture` / `GetMesh` CAP** — per-region HTTP fetch,
   returns raw J2C/LLSD. Preferred on most sims.
3. **HTTP `ViewerAsset` CAP** — modern unified CAP, type inferred from
   query param (`texture_id`, `mesh_id`, `animatn_id`, `sound_id`,
   `settings_id`). Replaces the per-type caps above where the sim
   supports it.
4. **Glb asset CDN** — `asset-cdn.glb.agni.lindenlab.com/?<type>_id=<uuid>`.
   Documented in `docs/secondlife_apk_2026_analysis.md`. CDN-cached,
   low-latency; use as fallback when CAP paths fail.
5. **Jupiter Project CDN** — `content.jupiterproject.net/asset/agni/<uuid>/<type>`.
   First-party mobile client uses it; third parties may use it if
   public.

The fetcher picks path 3 if available, else 2, else 1, with CDN fallback
for anonymous/cacheable types (textures, sounds, anims).

## Tasks

### P3-TEX-01 — JPEG2000 decoder

- **Input**: Linkpoint `src/main/cpp/j2k_decoder.cpp` and
  `openjpeg_real_implementation.cpp`; `docs/Basis_Universal_Integration.md`;
  upstream `indra/llimage/llimagej2c*.cpp`.
- **Output**: Complete OpenJPEG 2.5.x integration with a Kotlin-facing
  `J2cDecoder.decode(bytes: ByteArray, discardLevel: Int): Bitmap`
  API. Discard-level support is required — SL sends textures in a
  JPEG2000 layered codestream where discarding the top N layers
  yields a lower-resolution image quickly.
- **Steps**:
  1. Resolve the `openjpeg-ndk26-static:2.5.0-beta-4` dep (Phase 0)
     by vendoring OpenJPEG 2.5.3 source under `third_party/openjpeg/`
     and building with CMake against NDK r26.
  2. `src/main/cpp/j2c/` — JNI bridge with a clean ABI:
     `long nativeOpen(byte[] bytes)`, `int nativeWidth(long)`,
     `int nativeHeight(long)`, `int nativeComponentCount(long)`,
     `int nativeDiscardLevels(long)`,
     `bitmap nativeDecodeLevel(long, int level)`,
     `void nativeClose(long)`. Handles are JNI-side pointers with
     ownership tracked on the Kotlin side via a `use` block.
  3. Discard-level strategy: start at `discard = min(discardLevels,
     3)` for off-screen textures; promote to `discard = 0` when the
     object enters the near-field frustum.
  4. Memory: decoded output buffers are pooled; `J2cDecoder`
     returns an `AndroidBitmap` writing directly into a pre-allocated
     `ARGB_8888` bitmap of the level's dimensions.
- **Acceptance**: 500 assorted SL textures of varying size decode
  without error; mean decode time <80 ms on Snapdragon 778-class
  hardware at `discard=0`; zero native leaks under `Instruments`-style
  tracking over 10,000 decodes.

### P3-TEX-02 — Texture fetcher pipeline

- **Input**: Lumiya `SLTextureFetcher.java`; upstream
  `indra/newview/lltexturefetch.cpp`.
- **Output**: `TextureFetcher` class with:
  - Priority queue (enum `TexturePriority.UI_CRITICAL`, `NEAR_SELF`,
    `NEAR_OTHERS`, `FAR`, `PREFETCH`).
  - Parallelism: bounded at 4 concurrent HTTP + 1 UDP slot.
  - Dispatch order: HTTP CAP → CDN → UDP (UDP only if HTTP fails
    twice).
  - Discard-level escalation: first pass fetches to
    `discard=preferredDiscard`, subsequent passes upgrade toward 0
    on visibility change.
  - Cancellation: if a texture leaves frustum for >5 s, in-flight
    fetch is cancelled and slot returned.
- **Storage**: Two-tier cache.
  - L1: in-memory `LruCache<UUID, Bitmap>` sized at 25% of runtime
    heap.
  - L2: on-disk at `getCacheDir()/textures/<uuid>.j2c` capped at
    2 GB; LRU-evicted by mtime.
- **Acceptance**: Scripted walk through a populated region; 500
  unique texture requests resolve in <30 s; cache hit rate on a
  second walk of the same region is ≥85%.

### P3-MESH-01 — Mesh decoder

- **Input**: `GetMesh` CAP response format (LLSD "header" + per-LOD
  zlib-compressed vertex/index streams). Upstream
  `indra/llprimitive/lldaeloader.cpp` and
  `indra/llprimitive/llmeshrepository.cpp`.
- **Output**: `MeshDecoder.decode(bytes: ByteArray, targetLod: Int): MeshCpuBuffers`
  where `MeshCpuBuffers` holds float arrays of positions, normals,
  tangents, UVs, bone indices, bone weights, and index buffers per
  face.
- **LOD rules**:
  - SL mesh assets have up to 4 LODs: `high`, `medium`, `low`,
    `lowest`. The LLSD header includes offsets + sizes for each.
  - Also a `physics_shape` and optional `skin` block.
  - `skin` carries bone bind-pose matrices and alternate-bind-shape
    blend shapes.
- **Acceptance**: A corpus of 50 real SL mesh assets decodes correctly
  (assert vertex count matches upstream-decoded ground truth); mean
  decode time <40 ms per LOD on reference hardware.

### P3-MESH-02 — Mesh cache

- **Input**: P3-MESH-01 output.
- **Output**: On-disk cache at `getCacheDir()/meshes/<uuid>-<lod>.bin`
  with decoded CPU buffers (skip re-decoding LLSD + zlib). Bounded
  1 GB, LRU.
- **Acceptance**: Second view of the same region has zero mesh HTTP
  traffic for unchanged assets.

### P3-ANIM-01 — Animation decoder

- **Input**: SL animation binary format (documented on
  `wiki.secondlife.com/wiki/Internal_Animation_Format`); Lumiya
  `slproto/animation/` if present; upstream
  `indra/llcharacter/llbvhloader.cpp` and
  `indra/llcharacter/llkeyframemotion.cpp`.
- **Output**: `AnimationDecoder.decode(bytes: ByteArray): AnimationClip`
  where `AnimationClip` is a keyframed skeletal animation:
  per-bone position and rotation tracks, priority, ease-in/ease-out,
  loop flag, constraint list.
- **Acceptance**: 50 standard SL animations decode; playback on a
  skinned avatar in Phase 4 produces equivalent visible motion to
  the upstream viewer.

### P3-SOUND-01 — Sound fetch and playback

- **Input**: SL sound format (Ogg Vorbis with a 16-byte SL header,
  per upstream `indra/newview/llvoiceclient.cpp` and
  `indra/newview/llaudiosource.cpp`).
- **Output**: `SoundFetcher` fetches via the same cap fallback
  ordering as textures; `AndroidAudioSource` wraps
  `android.media.MediaPlayer` or `ExoPlayer` for playback.
  Spatialisation: distance attenuation, rolloff factor from the
  owning object's `SoundGain`. Max 16 concurrent sounds.
- **Acceptance**: Walk past a known-sound-emitting object in Agni;
  volume attenuates smoothly with distance.

### P3-BAKE-01 — Avatar-baked texture fetch

- **Input**: Upstream `indra/newview/llavatarappearance.cpp`;
  `UpdateAvatarAppearance` CAP.
- **Output**: When an `AvatarAppearance` message arrives, the
  fetcher obtains the per-region bake-URL from the
  `agent_appearance_service` field in `SLAuthReply` (or from
  region caps), and fetches the baked composites for head / upper /
  lower / eyes / hair / skirt / aux.
  - HTTP GET `{agent_appearance_service}/<agent_id>/<baked_type>?<ver>`.
  - Caches identically to other textures.
- **Acceptance**: Rezzing into a populated region shows avatars with
  non-grey skins within 10 s (once P4 rendering is live).

### P3-INV-02 — Inventory item asset resolution

- **Input**: `InventoryEntry` from Phase 2 AIS cache.
- **Output**: Given an inventory item (notecard, texture, animation,
  object, etc.) the UI can request the underlying asset. Notecard →
  text via `CopyInventoryFromNotecard` CAP. Texture/animation/sound →
  direct fetch.
- **Acceptance**: Open a known notecard from test inventory; contents
  match what the upstream viewer displays.

### P3-UPLOAD-01 — Asset upload pipeline (texture, anim, sound)

- **Input**: `NewFileAgentInventory` CAP. Upstream
  `indra/newview/llviewermenufile.cpp` upload path.
- **Output**: Two-step upload:
  1. POST LLSD `{ asset_type: "texture", ... }` to
     `NewFileAgentInventory` — server returns an `uploader` URL and
     `state`.
  2. POST asset bytes to `uploader`. Server returns final `asset_id`
     + folder placement.
- Cost handling: some uploads cost L$; the reply carries a cost
  estimate. Phase 3 shows the estimate to the user and aborts on
  insufficient balance; Phase 5 UI wires payment confirmation.
- **Acceptance**: Upload a 512×512 PNG (re-encoded to J2C client-side)
  to test account; see it appear in the upstream viewer's inventory.

### P3-CACHE-01 — Unified asset cache accounting

- **Input**: All of the above.
- **Output**: `AssetCache` facade shared across textures/meshes/
  anims/sounds. Enforces a combined cap (default 4 GB) and reports
  usage to the diagnostics surface. LRU across categories with a
  priority bias (UI-critical textures outlast far-field sounds).
- **Acceptance**: Filling the cache to cap does not thrash (<10%
  churn per minute under steady state).

### P3-BAND-01 — Bandwidth shaping

- **Input**: `AgentThrottle` message; user preference "bandwidth".
- **Output**: The bandwidth bucket allocation follows Lumiya's
  defaults initially, with later tuning:
  - 500 kbps total default, configurable 150 kbps–10 Mbps.
  - Allocation: resend 10%, land 10%, wind 10%, cloud 10%, task
    25%, texture 30%, asset 5%.
- **Acceptance**: Setting total throttle to 1 Mbps in a busy region
  keeps UDP receive rate <110 kB/s.

## Files expected to change

- `Linkpoint/src/main/cpp/j2c/` (expand)
- `Linkpoint/src/main/java/com/linkpoint/assets/J2cDecoder.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/assets/TextureFetcher.kt`
- `Linkpoint/src/main/java/com/linkpoint/assets/MeshDecoder.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/assets/MeshCache.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/assets/AnimationDecoder.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/assets/SoundFetcher.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/avatar/BakedTextureFetcher.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/assets/AssetCache.kt`
- `Linkpoint/src/main/java/com/linkpoint/assets/UploadClient.kt` (new)

## Exit criteria for Phase 3

- Textures, meshes, animations, sounds for a populated Agni region
  all fetch and decode correctly.
- Cache honours limits and survives process death.
- Zero native memory leaks over a 30-minute traversal test.
- Texture upload round-trip succeeds from the test account.
