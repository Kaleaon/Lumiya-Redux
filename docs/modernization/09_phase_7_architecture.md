# Phase 7 — Architecture

Goal: the app's internal structure supports the next ten years of
changes without collapsing under its own weight. No god classes, clean
dependency boundaries, deterministic lifecycles, testable seams.

This phase runs **alongside** Phases 1–6 as touch-only refactoring on
files already being edited — but has dedicated milestones that are
gates in their own right, below.

## Why this phase is overlaid, not sequential

Linkpoint's REVIEW.md identifies the god-class problem (`LinkpointApp.kt`
5,080 LOC, 62 `lateinit var`s). Attempting a single Big Refactor at any
one point will conflict with every other PR in flight. Instead, each
Phase-N task that touches the god class extracts its concern into a
proper module as part of that task. The milestones below are the
explicit checkpoints where we count extraction progress.

## Principles

1. **No singletons accessed as global state.** All dependencies flow
   through DI. Hilt (Dagger) is the chosen DI container — already a
   common Android choice, compile-time-verified, plays well with
   Compose.
2. **Lifecycle-aware coroutine scopes.** `LifecycleAwareScopeManager`
   already exists in Linkpoint but unused. Adopt it. Scopes tied to
   `Application`, `Activity`, `ViewModel`, and `Region`. The
   application-scoped scope never survives beyond process death.
3. **Immutable state, explicit transitions.** State-holders expose
   `StateFlow<Immutable>` and accept inputs via explicit methods.
   Internal mutation uses a single `MutableStateFlow` per
   state-holder with copy-on-write semantics.
4. **No `runBlocking` outside tests.**
5. **Thread ownership is documented.** Every class header says which
   thread(s) its methods may be called on. Lint rule enforces this
   via `@CircuitThread`/`@MainThread`/`@AnyThread` annotations.
6. **Errors are types, not exceptions.** `Result<T, DomainError>`
   or sealed-class returns; exceptions reserved for programmer
   errors. Network/transport errors are domain values.

## Tasks

### P7-DI-01 — Hilt setup

- **Output**: Hilt DI framework added. `@HiltAndroidApp` on
  `LinkpointApp`. `@Module` / `@InstallIn` bindings for: `OkHttpClient`,
  `Room` database, `WorkManager`, and each repository.
  ViewModels via `@HiltViewModel`.
- **Migration**: Each time a subsystem in the god class is touched by
  a Phase N task, extract it into a proper `@Singleton` class and
  remove its `lateinit var` from `LinkpointApp`. Commit message
  references both the Phase N ticket and `P7-DI-01`.
- **Acceptance**: `LinkpointApp` shrinks by ≥10% per month; reaches
  <1,000 lines by Phase 9.

### P7-GOD-01 — Tear down `LinkpointApp` god class

- **Input**: `LinkpointApp.kt`, REVIEW.md §2.
- **Output**: `LinkpointApp` contains only:
  - Hilt entry point.
  - Process-wide initialization (logger, crash reporter, app startup
    traces).
  - Wiring `ProcessLifecycleOwner` to a `SessionManager`.
  - Nothing else.
- **Milestones** (one per quarter-ish):
  - M1: Extract network / UDP handler registration →
    `ProtocolHandlerRegistry`.
  - M2: Extract manager initialization → `ManagerFactory`.
  - M3: Extract session state → `SessionManager`.
  - M4: Extract cleanup → `CleanupCoordinator`.
- **Acceptance**: Final `LinkpointApp.kt` <300 lines. Every surviving
  member is a top-level factory wired via Hilt.

### P7-THREAD-01 — Thread ownership annotations + lint

- **Output**: `@CircuitThread` / `@RenderThread` / `@MainThread` /
  `@AnyThread` annotations (or reuse AndroidX equivalents where
  applicable). Custom lint rule rejects cross-thread calls without
  explicit dispatch.
- **Acceptance**: Lint green across the tree; documented exceptions
  (where a class legitimately spans threads) carry justifying
  comments.

### P7-STATE-01 — State-holder pattern

- **Output**: Guideline doc and one reference implementation:
  `FriendsRepository` (Phase 2) rewritten as a textbook
  `MutableStateFlow`-backed holder; all repositories subsequently
  follow the pattern.
- **Acceptance**: All repositories pass a "no shared mutable state"
  lint rule (no `var` fields other than the single `MutableStateFlow`).

### P7-ERR-01 — Typed errors throughout network

- **Input**: REVIEW.md §3 CRITICAL-1 (silent failures) and §3
  blocking coroutine ops.
- **Output**: Sealed `LinkpointError` hierarchy:
  - `LinkpointError.Transport.TimedOut`
  - `LinkpointError.Transport.DnsFailed`
  - `LinkpointError.Transport.TlsFailed`
  - `LinkpointError.Auth.BadCredentials`
  - `LinkpointError.Auth.MfaRequired`
  - `LinkpointError.Protocol.Malformed(cause)`
  - `LinkpointError.Protocol.ServerErrored(code, body)`
  - `LinkpointError.State.StaleVersion`
  - `LinkpointError.Unknown(cause)`
- All suspend API return types are `Result<T, LinkpointError>` or
  equivalent Kotlin Arrow `Either`. Never `throws`.
- **Acceptance**: `grep -r "throw " --include="*.kt" Linkpoint/src/main/java/com/linkpoint/network/ Linkpoint/src/main/java/com/linkpoint/protocol/`
  returns zero non-test matches.

### P7-LIFE-01 — Lifecycle scopes activated

- **Input**: Linkpoint `util/LifecycleAwareScopeManager.kt`.
- **Output**: Every coroutine launch picks an appropriate scope:
  - Process lifetime: `Application.appScope`.
  - Activity lifetime: per-Activity via `lifecycleScope`.
  - ViewModel: `viewModelScope`.
  - Region: `Region.regionScope` cancelled on region cross.
- **Acceptance**: Zero `GlobalScope` usages in production code. Every
  `launch`/`async` targets a named scope.

### P7-MOD-01 — Module split

- **Output**: Single `:Linkpoint` module becomes:
  - `:app` — Activities, Application, Compose UI.
  - `:protocol` — UDP circuit, LLSD, messages, CAPS.
  - `:network` — OkHttp client, DNS, TLS.
  - `:assets` — asset fetchers, decoders.
  - `:render` — Filament integration.
  - `:domain` — repositories + models.
  - `:storage` — Room, DataStore.
  - `:voice` — WebRTC integration.
  - `:util` — shared utilities.
- **Rules**: `:app` depends on everything; `:protocol` depends on
  `:network` + `:util`; `:domain` depends on `:protocol`;
  `:render` depends on `:domain` + `:assets`.
- **Acceptance**: Full rebuild after a change isolated to one module
  re-compiles only that module's dependants.

### P7-LOG-01 — Structured logging

- **Output**: Timber (or a minimal equivalent) with structured
  fields: `tag`, `level`, `event`, `fields`. Log sinks:
  - Debug: logcat.
  - Release: ring buffer in memory + optional file export
    (user-initiated, for bug reports).
  - Never: network bodies containing credentials, asset UUIDs that
    identify paid content, avatar positions outside dev builds
    (privacy).
- **Acceptance**: Release builds write nothing to logcat except
  `WARN`/`ERROR`. Redaction rules enforced via lint.

### P7-CRASH-01 — Crash reporting

- **Output**: Integrate a privacy-respecting crash reporter
  (Sentry OSS or equivalent self-hosted). User opt-in at first
  launch; opt-out toggle in Me → Privacy. No PII in stack traces.
- **Acceptance**: A forced crash in dev flavor produces a server-side
  report with stack + device metadata; release flavor requires the
  opt-in flag.

### P7-ANR-01 — ANR prevention

- **Output**: `StrictMode` thread policy enabled in dev flavor
  (`detectDiskReads`, `detectDiskWrites`, `detectNetwork`,
  `penaltyLog`). CI job `assembleDevDebug` + Monkey run: zero
  `StrictMode` violations permitted.
- **Acceptance**: Monkey 1,000-event run produces zero ANR and zero
  StrictMode violation.

## Files expected to change

- Gradle module reorganisation (`build.gradle.kts` per new module)
- Hilt modules scattered by feature
- `LinkpointApp.kt` progressively shrinks
- Log infrastructure under `util/log/`

## Exit criteria for Phase 7

- `LinkpointApp.kt` <300 lines.
- No `runBlocking`, no `GlobalScope`, no `throws` in production
  suspend APIs.
- Module graph clean; cycles zero.
- Lint rules enforced in CI.
