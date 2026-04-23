# Lumiya Modernization Master Plan

A split-document plan for the full modernization of the Lumiya Android viewer
into a shippable, Kotlin-first Second Life / OpenSim client. Each file is
self-contained; read them in order the first time, then use this index.

## How to use this plan

- **Phases are sequential dependencies, not calendar estimates.** A phase
  gates the next only on its acceptance criteria, not on a date. Do not
  start Phase N+1 until Phase N's acceptance tests pass.
- **Every task has a unique ID** of the form `P<phase>-<area>-<n>` (e.g.
  `P1-CIRCUIT-03`). Cite these in commit messages, branch names, and PRs.
- **Acceptance criteria** are in `13_acceptance.md`. Don't call a task done
  without them.
- **Risks** live in `12_risks.md`. Re-read before starting each phase.

## Documents

| # | File | What it covers |
| --- | --- | --- |
| 00 | [`00_overview.md`](00_overview.md) | Strategic decision: which repo is the chassis, which is the reference, which retires. Ground rules. |
| 01 | [`01_inventory.md`](01_inventory.md) | Concrete state of Lumiya-Redux, Linkpoint, upstream `secondlife/viewer`. What exists, what doesn't. |
| 02 | [`02_phase_0_baseline.md`](02_phase_0_baseline.md) | Green build on CI. Single source of truth for dependency versions. Smoke-installable APK. |
| 03 | [`03_phase_1_circuit_and_login.md`](03_phase_1_circuit_and_login.md) | Login to Agni, UDP circuit, CAPS fetch, event-queue long-poll. "Connects and stays connected." |
| 04 | [`04_phase_2_protocol_parity.md`](04_phase_2_protocol_parity.md) | Message template parity, LLSD hardening, CAPS call-site coverage, inventory AIS v3. |
| 05 | [`05_phase_3_assets.md`](05_phase_3_assets.md) | JPEG2000, meshes, animations, sounds, baking, asset cache, CDN fallback. |
| 06 | [`06_phase_4_rendering.md`](06_phase_4_rendering.md) | Filament pipeline: terrain, objects, rigged avatars, PBR, shadows, water, sky. |
| 07 | [`07_phase_5_ux.md`](07_phase_5_ux.md) | Chat, IM, groups, friends, profiles, inventory UI, maps, teleport, preferences. |
| 08 | [`08_phase_6_voice.md`](08_phase_6_voice.md) | WebRTC voice stack replacing Vivox. Spatial audio, group channels. |
| 09 | [`09_phase_7_architecture.md`](09_phase_7_architecture.md) | Decompose god-class, DI, thread-safety, lifecycle scopes, error plumbing. |
| 10 | [`10_phase_8_security.md`](10_phase_8_security.md) | LLSD fuzzing, MFA, TLS, scoped storage, permissions, TPV policy compliance. |
| 11 | [`11_phase_9_release.md`](11_phase_9_release.md) | CI, signing, reproducible builds, Play Store / sideload update channel. |
| 12 | [`12_risks.md`](12_risks.md) | Risk register with likelihood, impact, mitigation, owners. |
| 13 | [`13_acceptance.md`](13_acceptance.md) | Per-phase acceptance checklists. The done-or-not-done test. |

## Ground truth references

When a plan item references "upstream" it means `github.com/secondlife/viewer`
(the LGPL Linden Lab viewer). When it references "Lumiya" it means the
decompiled Java in this repo under `app/` and `recovered/`. When it references
"Linkpoint" it means `github.com/Kaleaon/Linkpoint` — the prior 2025
modernization attempt whose Kotlin scaffolding we keep and whose mistakes we
avoid.

## What this plan is not

It is not a time estimate, not a budget, and not an org chart. It is a
dependency-ordered work breakdown with explicit gates. Someone with access to
a real grid login and the patience to work the list can ship against it.
