# Risk Register

This is the list of ways the program can fail. Review at the start of
every phase. A phase cannot exit until its owners have either mitigated
or explicitly accepted each risk relevant to it.

Columns: **Likelihood** (Low / Medium / High), **Impact** (Low / Medium
/ High / Critical), **Phase** where it first matters, **Mitigation**
plan, **Trigger** (what we watch for).

## Protocol risks

### R-PROT-01 — SL protocol changes without notice

- **L / I**: Low / Critical.
- **Phase**: 1–9.
- **Mitigation**: Subscribe to the upstream viewer `main` branch; CI
  job that diffs `indra/newview/llviewerregion.cpp` capability list
  weekly and opens an auto-issue on delta. Protocol conformance test
  (Phase 2 P2-MSG-01) that fails if an inbound message uses an
  unknown ID so we notice.
- **Trigger**: conformance job red; users report sudden login /
  region-cross failures.

### R-PROT-02 — Login endpoint deprecated / replaced

- **L / I**: Low / Critical.
- **Phase**: 1.
- **Mitigation**: Document both legacy XMLRPC login and the 2026
  mobile SSO login (`manager.production.secondlifemobile.com`).
  Abstract `LoginClient` over an interface so both can coexist;
  switch via server capability probe.
- **Trigger**: login fails grid-wide for all users.

### R-PROT-03 — Ghost CAPS (declared but not returned by sim)

- **L / I**: High / Low.
- **Phase**: 2.
- **Mitigation**: Every call site handles `null` from
  `CapabilityManager.get`. Acceptance tests exercise the absent-cap
  path. Log at `INFO`, not `WARN`.
- **Trigger**: spurious `WARN` spam in logs.

## Rendering / engine risks

### R-REND-01 — Filament update breaks API compatibility

- **L / I**: Medium / Medium.
- **Phase**: 4–9.
- **Mitigation**: Pin Filament to a specific version in the version
  catalogue; upgrade deliberately with a tracking issue and full
  manual render test before merge.
- **Trigger**: Filament dependency updates flagged by
  Dependency-Check.

### R-REND-02 — Mesh content beyond our LOD strategy crashes GPU

- **L / I**: Medium / High.
- **Phase**: 4.
- **Mitigation**: Hard cap on per-object vertex count (500k);
  anything above is substituted with the "placeholder huge object"
  debug mesh in dev, silently skipped in release. Monitor
  `GL_OUT_OF_MEMORY` / Filament OOM callbacks; on first occurrence,
  drop to medium LOD globally for the session.
- **Trigger**: render-thread crash reports spike after a content
  rollout.

### R-REND-03 — Bento / animesh skeleton variants we don't handle

- **L / I**: High / Low.
- **Phase**: 4.
- **Mitigation**: Start with the published bento skeleton; log
  unrecognised bone names at INFO. Users with exotic skeletons see
  partial animation rather than crash.
- **Trigger**: bug reports about specific avatar brands looking
  broken.

## Asset risks

### R-ASSET-01 — JPEG2000 OOM on large textures

- **L / I**: Medium / High.
- **Phase**: 3.
- **Mitigation**: Discard-level strategy forces higher discards
  (lower memory) when system memory is constrained
  (`ActivityManager.MemoryInfo.lowMemory`). Pre-check texture
  dimensions against a cap before allocation.
- **Trigger**: OOM crash reports tagged with textures.

### R-ASSET-02 — OpenJPEG security CVE

- **L / I**: Medium / High.
- **Phase**: 3–9.
- **Mitigation**: Track OpenJPEG upstream; Dependency-Check catches
  published CVEs; vendored build is patched within one release cycle
  of disclosure.
- **Trigger**: CVE listed in Dependency-Check report.

### R-ASSET-03 — Content-permissions leakage

- **L / I**: Medium / Critical (TPV violation).
- **Phase**: 5 & 8.
- **Mitigation**: No-copy / no-transfer permission masks are
  consulted before any export path. Runtime assertion in the export
  path refuses non-exportable content; bug bounty on the PR that
  introduces a bypass.
- **Trigger**: DMCA complaint or TPV compliance concern raised.

## Voice risks

### R-VOICE-01 — WebRTC on low-end devices drops calls

- **L / I**: High / Medium.
- **Phase**: 6.
- **Mitigation**: Fall back to Opus at 16 kbps; surface "Voice
  quality low" indicator. Allow per-user voice disable.
- **Trigger**: P6-VOICE-08 quality stats show sustained drops.

### R-VOICE-02 — Echo / feedback on speakerphone

- **L / I**: High / Medium.
- **Phase**: 6.
- **Mitigation**: Enable WebRTC AEC3; test on a low-end device with
  speakerphone; clamp speaker gain when mic is open.
- **Trigger**: user reports.

## Security risks

### R-SEC-01 — Credential leakage via log

- **L / I**: Medium / Critical.
- **Phase**: 7 & 8.
- **Mitigation**: Lint rule rejects `log` / `println` of `SLAuth*`
  objects or `SessionSnapshot`. Redaction unit tests in
  `NetworkLogger`.
- **Trigger**: any bug report that attaches a log with a password
  string.

### R-SEC-02 — Session token leakage via shared URL

- **L / I**: Low / High.
- **Phase**: 8.
- **Mitigation**: No session secrets in any `Intent` extras exposed
  to other apps. `TeleportSLURLActivity` only accepts `secondlife://`
  URIs and does not echo query strings to other components.
- **Trigger**: fuzz of intent surface.

### R-SEC-03 — Malicious LSL `llRequestURL` luring users into
credential phish

- **L / I**: Medium / Medium.
- **Phase**: 5 & 8.
- **Mitigation**: Any in-world media / web navigation opens in a
  system browser, not an in-app WebView. The login UI is
  distinctive and unreachable from any in-world entrypoint.
- **Trigger**: phishing reports.

## Build / release risks

### R-REL-01 — Release key loss

- **L / I**: Very Low / Critical.
- **Phase**: 9.
- **Mitigation**: Offline backup; two maintainers; Play App Signing
  (Google holds the signing key, we hold the upload key —
  rotatable).
- **Trigger**: key holder unavailable.

### R-REL-02 — Dependency supply-chain attack

- **L / I**: Low / Critical.
- **Phase**: 9.
- **Mitigation**: Gradle dependency verification enabled (SHA-256
  verification); no `latest.release`; `dependencyUpdates` scheduled,
  PR-reviewed. No transitive-pull of unpinned SNAPSHOT / `+`
  versions.
- **Trigger**: Gradle dependency verification fails.

### R-REL-03 — Play Store rejection

- **L / I**: Medium / High.
- **Phase**: 9.
- **Mitigation**: Pre-launch review via internal testing; Data
  Safety form truthful and audited; Privacy Policy accessible from
  the listing.
- **Trigger**: Play reviewer response.

## TPV / compliance risks

### R-TPV-01 — Channel-string impersonation by bad actor forks

- **L / I**: Medium / Medium.
- **Phase**: 9.
- **Mitigation**: Channel string is baked into signed release; fork
  must re-sign with a different certificate to masquerade.
  Publish our certificate fingerprint so LL can distinguish.
- **Trigger**: LL TPV team reports impersonation.

### R-TPV-02 — Viewer listed in LL non-compliant viewers registry

- **L / I**: Low / Critical.
- **Phase**: 9.
- **Mitigation**: Maintain cordial contact with LL TPV team;
  compliance matrix kept current; any LL concern is addressed in
  the next release.
- **Trigger**: inclusion in non-compliant list → account bans for
  users.

## Program risks

### R-PROG-01 — Single-maintainer bus factor

- **L / I**: Medium / High.
- **Phase**: 1–9.
- **Mitigation**: Documentation-heavy (this plan is part of it).
  All keys / secrets have a recovery contact. Build is
  reproducible by anyone cloning the repo.
- **Trigger**: PRs stagnate for >30 days.

### R-PROG-02 — Test account banned or disabled

- **L / I**: Low / Medium.
- **Phase**: 1–6.
- **Mitigation**: Dedicated test account not used for human play;
  observes TPV policy (no harvesting, no abuse); maintainer has
  one backup test account.
- **Trigger**: integration tests fail with `AccountDisabled`.

### R-PROG-03 — Lumiya reference source is legally encumbered

- **L / I**: Low / High.
- **Phase**: 1–9.
- **Mitigation**: The decompiled tree is used as behavioural
  reference, not verbatim copied. PRs that port Lumiya logic cite
  the upstream `secondlife/viewer` (LGPL) equivalent as the
  licensed source whenever possible. Clean-room where necessary.
- **Trigger**: DMCA takedown or legal communication.
