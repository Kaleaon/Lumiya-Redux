# Rendering Tier Matrix, Diagnostics, and Rollout Gates

## Device coverage matrix

| Android API | Example OS | GPU family focus | Device class | Preferred backend | Fallback backend |
|---|---|---|---|---|---|
| 26-27 | 8.0-8.1 | Adreno 5xx, Mali G71/G72, PowerVR 7XT | low / mid | GLES2 | Legacy GLES10 |
| 28-29 | 9-10 | Adreno 6xx, Mali G76/G77, PowerVR GM9xxx | mid | GLES2 | Legacy GLES10 |
| 30-31 | 11-12 | Adreno 6xx/7xx, Mali G78, early Tensor-era Mali | mid / high | GLES3 | GLES2 |
| 32-33 | 12L-13 | Adreno 7xx, Mali G710, Immortalis-G715, Tensor Pixel GPUs | high | GLES3 | GLES2 |
| 34-35+ | 14-15+ | Adreno 7xx+, Mali G7xx/G8xx, Immortalis, Tensor | mid / high | GLES3 | GLES2 then Legacy GLES10 |

## Tiering rules

* **Low tier**: GL20 unavailable or renderer forced into legacy client-state path.
* **Mid tier**: GL20 available but GL30 unavailable/disabled.
* **High tier**: GL30 available and no shader compile errors.

## Startup diagnostics requirements

Log from both `WorldViewRenderer` and `RenderContext` at startup:

* selected `tier` (`low|mid|high`)
* selected `backend` (`legacy-gles10|gles20|gles30`)
* `fallback` reason (`none`, `gl20_unavailable`, `gl30_disabled_or_failed`, `shader_compile_errors`, etc.)

## Release gate policy

### 1) Smoke rendering scenarios (must pass)

* World load + camera orbit (outdoor daylight)
* Dense object scene (opaque + alpha blend)
* Avatar-heavy scene with rigged mesh animation
* Water/sky render path
* HUD interaction + text overlays

### 2) Performance budgets (per tier)

| Tier | Frame-time target (p95) | Memory budget (RSS delta during 10 min session) |
|---|---:|---:|
| low | <= 50 ms | <= 220 MB |
| mid | <= 33 ms | <= 280 MB |
| high | <= 25 ms | <= 360 MB |

### 3) Stability gates

* Crash-free session threshold by tier before promotion:
  * low: **99.0%**
  * mid: **99.3%**
  * high: **99.5%**

## Rollout phases

1. **Internal** (100% of internal testers)
2. **Beta staged rollout** (5% -> 20% -> 50% -> 100%)
3. **General release** (10% -> 25% -> 50% -> 100%)

Advance only if smoke + budget + crash-free thresholds hold for each phase window.

## Automatic rollback policy

On fatal init/runtime renderer errors:

* immediately disable advanced backend for current session,
* rollback to legacy backend (`gles20`, then `legacy-gles10` if needed),
* emit startup/failure diagnostics with fallback reason,
* keep renderer alive where possible instead of crashing process.
