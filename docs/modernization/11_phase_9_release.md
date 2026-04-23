# Phase 9 — Release Engineering

Goal: the project can cut a release at any time, on demand, with
reproducible artefacts, signed correctly, delivered through channels
that real users can install from. No more "builds on a developer's
laptop."

## Tasks

### P9-CI-01 — Release pipeline

- **Input**: Phase 0 `build.yml`.
- **Output**: Additional workflow `release.yml` triggered on tag
  push matching `v*.*.*`:
  1. Build `assembleStableRelease` bundle (AAB) and split APKs.
  2. Run full test suite, lint, spotless, detekt, Dependency-Check.
  3. Sign with release keystore retrieved from GitHub Encrypted
     Secrets (never committed).
  4. Upload AAB to Google Play internal track via `fastlane` (or
     `gradle-play-publisher`).
  5. Attach APKs + mapping.txt + R8 logs to a GitHub Release.
  6. Post release notes to repository's discussion / issue tracker.
- **Acceptance**: Tag `v0.1.0-alpha` on main → Play internal track
  receives the build within 30 min; the GitHub Release has
  downloadable sideload APKs.

### P9-SIGN-01 — Release keystore governance

- **Output**:
  - Keystore generated with 4096-bit RSA, 25-year validity.
  - Held by two named maintainers + offline backup.
  - SHA-256 fingerprint published in `README.md`.
  - Rotation plan documented: new key generated N-1 years before
    expiry; Play App Signing key held by Google (we use upload
    key + Play App Signing, which lets us rotate the upload key
    without breaking installed-app update chains).
- **Acceptance**: Rotation playbook tested in a dry run with a
  throwaway app.

### P9-CHAN-01 — Release channels

- **Output**: Four channels with distinct `applicationIdSuffix`
  (from P0-BUILD-07):
  - `dev` (com.linkpoint.dev) — continuous builds, internal only.
  - `alpha` (com.linkpoint.alpha) — weekly promotion, ≤50 testers.
  - `beta` (com.linkpoint.beta) — Play closed beta track + sideload.
  - `stable` (com.linkpoint) — Play production + sideload.
- **Acceptance**: Devices can install all four simultaneously
  without conflict.

### P9-SIDE-01 — Sideload update feed

- **Input**: Lumiya's original install base was sideload; many users
  prefer sideload; LL mobile app's update feed format documented in
  `docs/secondlife_apk_2026_analysis.md`.
- **Output**: A GitHub Pages-hosted JSON update feed at
  `https://kaleaon.github.io/linkpoint/android-version.json`
  (and `-alpha.json`, `-beta.json`) with schema:
  ```json
  {
    "channel": "stable",
    "versionCode": 42,
    "versionName": "0.4.2-stable",
    "apkUrl": "https://github.com/.../releases/download/v0.4.2/Linkpoint-0.4.2-universal.apk",
    "apkSha256": "...",
    "minOsVersion": 26,
    "releaseNotes": "..."
  }
  ```
- In-app updater polls this feed once per 24 h on app start,
  prompts the user on new-version-available, downloads to
  `cacheDir`, verifies SHA-256, hands off to the system installer
  (`ACTION_VIEW` on a `FileProvider` URI).
- **Acceptance**: Sideload users see and can install updates
  without returning to a browser.

### P9-PLAY-01 — Play Store listing

- **Output**:
  - Listing assets (icon, feature graphic, screenshots, short
    description, full description, privacy policy URL).
  - Content rating completed truthfully.
  - Data safety form completed.
  - Internal testing track live.
  - Closed beta opt-in URL published.
- **Acceptance**: Listing passes Play pre-launch review.

### P9-ROLL-01 — Rollout & rollback

- **Output**:
  - Staged rollout (1% → 5% → 25% → 100%) via Play console on
    stable track.
  - `firebase-app-distribution` or equivalent for alpha.
  - Rollback: any release can be rolled back by reverting the
    staged-rollout dial to 0% and cutting a new build with a
    higher `versionCode`. Rollback-blocking DB migrations are
    forbidden (Room migrations must be forward-only but tolerate
    downgrade to the prior version for one release; documented
    in the migration).
- **Acceptance**: Rollback playbook rehearsed in an alpha cycle.

### P9-TEL-01 — Field telemetry (opt-in)

- **Input**: Phase 7 crash reporter; Phase 8 privacy constraints.
- **Output**: On user opt-in only: anonymous session length, crash
  reports, ANR reports, renderer feature support. No user IDs,
  no SL avatar names, no location data, no chat. Retention 90
  days; aggregate reports only.
- **Acceptance**: Telemetry off by default; users can see exactly
  what would be sent on a "view outgoing telemetry" screen.

### P9-DOC-01 — User documentation

- **Output**:
  - Quick start, FAQ, troubleshooting.
  - Keyboard shortcut reference (for users with bluetooth
    keyboards).
  - Known limitations vs the desktop viewer.
  - Supported grids list (Agni, Aditi, and a curated OpenSim list
    where compatibility is tested).
- **Acceptance**: Docs linked from in-app Help screen and from the
  Play listing.

### P9-SUPPORT-01 — Support triage

- **Output**:
  - GitHub Discussions enabled for community support.
  - `SUPPORT.md` describing how to report bugs (logs, versions,
    reproduction).
  - Bug template with: device, OS, app version, grid, expected,
    actual, logs-attached.
  - "Export logs" button in-app produces a redacted bundle.
- **Acceptance**: A tester submits a bug report with the export;
  maintainers reproduce it from the bundle.

### P9-I18N-01 — Localisation pipeline

- **Input**: Linkpoint `i18n/` scaffolding.
- **Output**:
  - All user-visible strings in `strings.xml` resources (Compose
    `stringResource`).
  - Crowd-sourced translations via Weblate or equivalent.
  - Launch locales: English, Spanish, French, German, Portuguese,
    Japanese, Russian, Dutch.
  - CI verifies no hardcoded user-visible strings in `@Composable`
    functions (lint rule).
- **Acceptance**: App switches language on device-locale change;
  pseudo-locale test (`en-rXA` upside-down) reveals zero
  untranslated strings.

### P9-RETIRE-01 — Archive Lumiya-Redux

- **Input**: This repo.
- **Output**:
  - Final commit to Lumiya-Redux: README declares the project
    archived, points to Linkpoint as the successor.
  - Repository set to read-only on GitHub.
  - Issues closed with an "archived" label.
- **Acceptance**: Cross-link clear; no one wanders into the
  archived tree thinking it's active.

## Files expected to change

- `.github/workflows/release.yml` (new)
- `fastlane/` or `gradle-play-publisher` config (new)
- `docs/release-playbook.md` (new)
- `docs/user-docs/` (new)
- Repository settings (read-only on retirement)

## Exit criteria for Phase 9

- Cutting a release is a one-command / one-tag operation.
- Users on Play and on sideload can install and auto-update.
- Telemetry, crash reports, logs all work and respect privacy.
- Rollback playbook is real, not theoretical.
- Lumiya-Redux is archived with a pointer to its successor.
