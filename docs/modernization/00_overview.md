# 00 — Overview & Strategic Decision

## The three repos

Three codebases sit in front of us. Each contributes something the others
cannot, and each has failure modes we must design around.

**Lumiya-Redux** (this repo) — 1,481 Java files reconstructed from jadx on a
10-year-old `lumiya3.4.2.apk`. The protocol logic is battle-tested: Lumiya
ran reliably on mobile networks for a decade. The code does not compile
(~100 decompiler-artefact errors remain), and `SLAuth.SendLoginRequest` is
a JADX "method dump skipped" stub that throws `UnsupportedOperationException`
— so nothing can log in. Already has an AndroidX migration and a Room/Kotlin
incremental migration plan (`docs/kotlin-migration-plan.md`).

**Linkpoint** (`github.com/Kaleaon/Linkpoint`) — 322 Kotlin files (~93K LOC)
written Aug 2025–Apr 2026. Uses a modern stack: Kotlin 2.2.21, AGP 8.6.1,
compileSdk 35, Jetpack Compose, Filament 1.66, WebRTC, gRPC, OkHttp. It has
architectural problems documented in its own `REVIEW.md` (Feb 2026): a
5,080-line `LinkpointApp.kt` god class with 62 `lateinit var` managers,
`runBlocking` on the main thread during init causing ANR, an unbounded LLSD
parser with buffer-overflow risk, Kotlin/Compose version mismatches. As of
Apr 2026 its own `MASTER_TRACKING.md` reports several of those have been
addressed but placeholder agent/session IDs in `ObjectManager`/`ParcelManager`,
partial JPEG2000 decode, and unregistered message handlers remain.

**secondlife/viewer** (`github.com/secondlife/viewer`) — LGPL canonical
client. Normative for the protocol wire format, capability names, LLSD
semantics, and login parameter schema. Not directly reusable on Android
(desktop C++, OpenGL, dbus, llfloaters), but every protocol question ends
here.

## The decision

**Linkpoint is the chassis. Lumiya-Redux is the protocol reference.
`secondlife/viewer` is the normative spec. We do not ship two apps.**

Rationale:

1. Linkpoint is already Kotlin, Compose, Filament, and at API 35. A full
   Kotlin rewrite of Lumiya-Redux would take longer than fixing Linkpoint's
   architectural issues.
2. Linkpoint's architectural problems are known, localised, and fixable.
   They are not rewrites; they are refactors of identified files.
3. Lumiya-Redux's value is its *protocol behaviour*, not its Java source.
   The decompiled Java is the best available documentation of a client
   that actually worked on real grids. We mine it for behaviour; we do not
   merge it.
4. Upstream viewer is the single source of truth for anything neither
   Lumiya nor Linkpoint makes obvious.

## What happens to Lumiya-Redux

This repo's role changes from "reconstructed app we will ship" to
"reference tree we mine for protocol behaviour while building Linkpoint."
Concretely:

- Stop investing in making Lumiya-Redux compile. `BUILD_STATUS.md` work
  (fixing ~100 decompiler artefacts) is **de-prioritised** except where
  fixing a file is the cheapest way to read it correctly.
- Protocol references in this plan cite Lumiya-Redux files by path.
  Linkpoint PRs that modify Kotlin under a given domain should note the
  Lumiya reference file(s) they derive behaviour from.
- Eventually (Phase 9 acceptance), this repo is archived read-only with a
  pointer to Linkpoint.

## Ground rules

**G1. No protocol guessing.** If a message-template field order or a CAPS
payload shape is in question, cite upstream first (`indra/newview/`,
`indra/llmessage/`), then Lumiya (`app/src/main/java/com/lumiyaviewer/lumiya/slproto/`),
then stop and document the uncertainty in the PR. Do not invent wire
behaviour.

**G2. No running before walking.** Each phase has an acceptance test in
`13_acceptance.md`. Do not start Phase N+1 until Phase N passes. There is
one exception — Phase 7 (architecture cleanup) runs *alongside* every other
phase as touch-only refactors on files already being modified.

**G3. Every PR names its Phase and Task ID.** Commit messages and PR
titles must start with `[P<n>-<area>-<n>]`. This keeps the dependency
graph visible.

**G4. Build stays green.** A phase cannot be accepted if CI is red on the
main branch. Phase 0 pays off here: once green, any PR that reddens it
either rolls back or is blocked.

**G5. Security gates are hard.** Any LLSD / UDP input parser change lands
with a fuzz test. No exceptions. `P8-SEC-*` tasks are blocking.

**G6. Third-Party Viewer compliance is not optional.** Linden Lab's TPV
policy governs channel name, version string, logging of account
credentials, permission handling for unreleased content, and DMCA
responsiveness. See `10_phase_8_security.md`. Breaking TPV compliance means
account bans for users — a bigger failure than any bug.

**G7. The working branch strategy.** `main` is protected. Per-task branches
are `<phase>/<area>/<short>` (e.g. `p1/circuit/activate-threaded-loop`).
Squash-merge with task ID in the subject.

## What "done" means for the whole program

A user with a Second Life account can:

1. Install the APK from a signed release channel (Play Store or sideload
   update feed).
2. Log in to Agni with first/last/password or SSO.
3. See their avatar appear in their home region.
4. Move, chat locally, IM a friend, teleport to a landmark, see their
   inventory populate.
5. Close the app and reopen to the same session without re-login where
   the session cookie is still valid.
6. Do all of the above on Android 8 through 15, on devices with 4 GB RAM
   or better, with the app using less than 500 MB heap steady-state.

Everything past step 5 (rendered avatars at high fidelity, PBR materials,
voice chat, group management, estate tools, and more) is incremental.
Shipping a minimum viable client first, then layering features, is the
entire point of the phase order.

## What's out of scope, period

- LSL script editing beyond notecard-equivalent text editing.
- Building tools (object creation, linking, scripting attach).
- Estate management tools.
- Second Life marketplace integration.
- Windows/macOS/Linux desktop builds.
- iOS port (Linkpoint's `platforms/iOS/` placeholder notwithstanding).

If these ever ship, they are separate programs riding on the client.
