# Lumiya-Redux Phase 0/1 Audit (Connections + Rendering)

Date: 2026-04-26

This document captures an initial stabilization pass focused on:

1. **Phase 0** baseline risk inventory for runtime-critical paths.
2. **Phase 1** high-confidence protocol/render correctness fixes that can be merged safely.

## Scope reviewed

- Connection stack bootstrap and circuit lifecycle (`GridConnectionService`, `SLGridConnection`, `SLConnection`, `SLCircuit`).
- LLSD/CAPS transport (`SLCaps`, `SLCapEventQueue`, `SLHTTPSConnection`, `LLSDXMLRequest`).
- Rendering frame lifecycle (`WorldViewRenderer`, `RenderContext`, `DrawableStore`, `DrawList`).

## Baseline observations

### Connection path

- Architecture is selector-based with one worker thread multiplexing simulator circuits.
- Reliability layering is explicit:
  - transport-level ACK/retry/keepalive in `SLCircuit`,
  - protocol-level ordering/reassembly in module-specific transfer code.
- CAPS event queue is independently threaded and supports graceful close behavior on teleport.

### Rendering path

- Frame flow is `onPrepareFrame` -> `onDrawFrame` -> `onFinishFrame`.
- Draw order is multi-pass (opaque, terrain, avatars, sky, translucent, overlays/HUD, optional FXAA).
- GPU feature negotiation and shader compilation fallback are centralized in `RenderContext`.

## Fixes applied in this pass

### 1) Object pick callback condition fixed

**File:** `app/src/main/java/com/lumiyaviewer/lumiya/render/WorldViewRenderer.java`

- Corrected inverted condition in `processObjectPick()`.
- Previous logic returned early when a pick result existed and only sent a message when pick result was null.
- New logic sends callback only when both conditions are satisfied:
  - `objectIntersectInfo != null`
  - `handler != null`

**Impact:** Restores expected object-picking callback delivery and prevents null pick payload dispatch.

### 2) Aspect ratio integer division fixed

**File:** `app/src/main/java/com/lumiyaviewer/lumiya/render/WorldViewRenderer.java`

- Replaced integer division `i / i2` with float division `((float) i) / ((float) i2)`.

**Impact:** Prevents incorrect projection matrix setup due to truncation in non-square viewports.

## Next recommended batches

1. Add regression tests for pick callback behavior and projection/aspect handling.
2. Add protocol conformance checks around message ACK + retry + timeout edge-cases.
3. Audit TLS policy hardening options in `SLHTTPSConnection` behind compatibility flags.

## Follow-up fixes (continuation pass)

### 3) Texture completion callback flow restored

**File:** `app/src/main/java/com/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher.java`

- Fixed `HandleImageData(...)` and `HandleImagePacket(...)` local variable flow where completion callback state was always overwritten to `null` before exiting the synchronized block.
- The fetch completion callback now correctly fires when a UDP texture transfer completes.

**Impact:** texture fetch completion handlers are delivered again for completed transfers.

### 4) Texture stall iteration typing corrected

**File:** `app/src/main/java/com/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher.java`

- Corrected map-entry iterator types in `ProcessIdle()` to match `udpTransfers` (`UUID -> TextureUDPTransfer`), and removed unnecessary casts.

**Impact:** improves type safety and removes one decompilation artifact that can break strict compilation.

### 5) Xfer listener iterator type corrected

**File:** `app/src/main/java/com/lumiyaviewer/lumiya/slproto/modules/xfer/SLXfer.java`

- Replaced invalid `OnXferReceivedListener` iterator usage in `invokeListeners()` with the actual stored type (`XferListenerInvocation`).
- Simplified dispatch call to use typed iterator values directly.

**Impact:** removes invalid symbol usage and keeps xfer completion listener invocation compile-safe.

### 6) Global memory probe variable fix

**File:** `app/src/main/java/com/lumiyaviewer/lumiya/GlobalOptions.java`

- Replaced decompilation artifact `r0` in `getTotalMemory()` with an explicitly declared accumulator (`long j`).

**Impact:** fixes unresolved-symbol compilation failure and preserves existing memory probe behavior.

### 7) Region-handle assembly fix in world-map teleport path

**File:** `app/src/main/java/com/lumiyaviewer/lumiya/slproto/modules/SLWorldMap.java`

- Removed unresolved-symbol usage in `HandleFindAgent(...)` when composing the destination region handle.
- Added an explicit Y-grid integer (`floor3`) and composed the handle from X/Y masked region origins using long-safe bit operations.

**Impact:** restores compile safety and keeps teleport-to-agent region handle construction deterministic.
