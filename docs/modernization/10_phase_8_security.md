# Phase 8 — Security & Compliance

Goal: the app is safe to ship to real users. Their credentials are
protected, their data is handled lawfully, their device isn't an
attack surface, and the app complies with Linden Lab's Third-Party
Viewer policy.

Security lands throughout prior phases (LLSD fuzzing in Phase 2; MFA
storage in Phase 5). Phase 8 is the consolidated audit + remediation
pass.

## Tasks

### P8-SEC-01 — LLSD + message parser fuzzing (already seeded in P2)

- **Input**: Phase 2 bounds + Jazzer entrypoint.
- **Output**: Fuzz corpus checked in under
  `src/test/resources/fuzz/llsd/`. CI runs corpus-driven fuzz
  (deterministic) every build, and a 5-minute exploratory fuzz on
  PRs touching parser code. Crash → fail build.
- **Acceptance**: Zero-crash fuzz for a continuous 24-hour run on a
  CI cron job.

### P8-SEC-02 — UDP message parser fuzzing

- **Input**: Phase 1 circuit + Phase 2 message parsers.
- **Output**: Fuzzer for each message parser; malformed block counts,
  oversized variable-length fields, negative lengths, EOF mid-field.
- **Acceptance**: Same as P8-SEC-01, for every message ID.

### P8-SEC-03 — TLS posture

- **Input**: Linkpoint `SSLHelper.kt`; REVIEW.md §4.
- **Output**:
  - Minimum TLS 1.2 on every connection; TLS 1.3 preferred.
  - `okhttp3.CertificatePinner` for login/CAPS hosts:
    `login.agni.lindenlab.com`, `login.aditi.lindenlab.com`.
    Pin to SPKI hashes, not certificates. Rotate yearly; build fails
    loudly after expiry.
  - `networkSecurityConfig.xml` disallows cleartext for any host;
    debug override only in dev flavor.
  - Document the Akamai CDN hostname-verifier exception in
    `SSLHelper.kt` and constrain it to specific hostnames.
- **Acceptance**: MITM proxy (mitmproxy with a trusted CA added only
  to dev) cannot decrypt release-flavor traffic; dev can.

### P8-SEC-04 — Credential storage

- **Input**: Linkpoint `SecurePreferences.kt`; REVIEW.md §3
  (MFA storage falls back to plaintext).
- **Output**:
  - All credentials stored via `EncryptedSharedPreferences` with
    `AES256_GCM`.
  - MFA hash storage has **no** plaintext fallback. On
    `GeneralSecurityException`, the storage fails closed; the user
    is prompted to re-authenticate.
  - No credentials logged at any level.
  - Memory hygiene: `CharArray`/`ByteArray` for passwords, cleared
    after use.
- **Acceptance**: Static analysis (MobSF or equivalent) reports zero
  "hardcoded credential" findings; runtime `adb shell run-as
  com.linkpoint.release cat shared_prefs/...` shows only encrypted
  blobs.

### P8-SEC-05 — Biometric auth gate

- **Input**: `androidx.biometric.BiometricPrompt`.
- **Output**: "Require biometric on launch" preference. If on, the
  stored credential is wrapped with a `Cipher` obtained only after
  biometric challenge, per the standard Android keystore
  hardware-key flow.
- **Acceptance**: Phone with biometric enrolled → launch with
  preference on → biometric prompt required before login fills.

### P8-SEC-06 — Runtime permissions

- **Input**: Android 13+ permission model.
- **Output**: Runtime-requested permissions:
  `RECORD_AUDIO` (lazy, at first voice-channel join),
  `CAMERA` (lazy, at first snapshot-upload attempt),
  `POST_NOTIFICATIONS` (at first chat or social event),
  `READ_MEDIA_IMAGES` (lazy, at first texture-upload attempt).
- No permission request on first launch. A rationale screen before
  each prompt explains why.
- **Acceptance**: Permission-denied paths all have graceful UX
  fallbacks with a deep-link to settings.

### P8-SEC-07 — Scoped storage

- **Input**: Android 10+ scoped storage; legacy Lumiya used
  `WRITE_EXTERNAL_STORAGE`.
- **Output**: No `WRITE_EXTERNAL_STORAGE` in the manifest. All
  user-facing file I/O via `MediaStore` (snapshots → Pictures) or
  `Storage Access Framework` (file export). Cache under
  `context.cacheDir` and `context.noBackupFilesDir`.
- **Acceptance**: Manifest permission audit clean on Android 14.

### P8-SEC-08 — App-signing and integrity

- **Input**: Play Store app-signing; optional Google Play Integrity
  API.
- **Output**:
  - Release APKs signed with APK Signing v3 + v4.
  - Debug APKs signed with a repo-committed debug key so anyone can
    reproduce CI builds.
  - Release key is held only by two named maintainers + a recovery
    copy in a KMS of choice.
  - Key rotation plan documented.
- **Acceptance**: `apksigner verify --print-certs` on a release APK
  shows the expected SHA-256 fingerprint (published in the README).

### P8-SEC-09 — Network logging redaction

- **Input**: Linkpoint `NetworkLogger.kt`.
- **Output**: Sensitive fields redacted at source:
  `Authorization`, `Cookie`, `Set-Cookie`, XMLRPC `passwd` value,
  `viewer_digest`, `mfa_hash`, `token`, `secure_session_id`.
  Redaction done in a single `headerRedactor` and `bodyRedactor`;
  unit-tested.
- **Acceptance**: A test that logs a full login round-trip and
  asserts the log contains none of the above values.

### P8-SEC-10 — Dependency vulnerability scan

- **Output**: CI job runs OWASP Dependency-Check or an equivalent
  weekly. High/critical findings open tracking issues automatically
  and block release builds until triaged.
- **Acceptance**: Report visible in CI. First run produces an
  actionable triage list; subsequent runs have zero unreviewed
  high/critical.

### P8-SEC-11 — Source secrets scan

- **Output**: `gitleaks` or equivalent runs on every push. Known
  patterns for LL API keys, Vivox creds (if any history), test
  credentials.
- **Acceptance**: Clean repo history; policy file documents allowed
  patterns.

### P8-TPV-01 — Third-Party Viewer policy audit

- **Input**: LL TPV policy; Linkpoint's existing
  `THIRD_PARTY_VIEWER_POLICY_COMPLIANCE.md`.
- **Output**: Audited policy compliance matrix:
  - **Channel string** — identifies the viewer uniquely to LL.
    Set in `AuthParams.viewerChannel = "Linkpoint"`. Never
    impersonate another viewer.
  - **Version reporting** — `viewerVersion` set from build metadata
    (P0-BUILD-07). Publicly accessible changelog.
  - **No account harvesting** — the app must not send credentials
    anywhere other than the grid's login endpoint. Unit test
    asserts this.
  - **No server-side exploit tooling** — no packet-forgery UI,
    no estate tools beyond user's own parcel, no
    gray-goo countermeasures.
  - **DMCA contact** — published in `PRIVACY_POLICY.md` and
    in-app About screen.
  - **Respect for content permissions** — the client does not
    cache textures marked "no-copy" on-permission-boundary;
    does not allow the user to save to gallery a texture whose
    owner permissions do not permit export.
  - **Logging ToS** — show the current SL ToS at first login and
    retain acceptance (respect `next_method` ToS gate).
- **Acceptance**: Matrix published in-repo; user-visible "Compliance"
  screen linkable from About; DMCA contact address routed to a real
  mailbox; every policy item has a test or documented manual
  verification.

### P8-TPV-02 — Content-permissions respect

- **Input**: Prim / inventory permission masks.
- **Output**:
  - UI never offers export / save-as / copy-to-clipboard on content
    whose permissions deny it.
  - Cache persistence for no-copy/no-trans items is memory-only; not
    persisted across process death.
- **Acceptance**: Attempt to export a no-transfer item; UX blocks
  with a user-readable message.

### P8-PRIV-01 — Privacy disclosures

- **Output**:
  - `PRIVACY_POLICY.md` updated to reflect actual data flows:
    credentials → grid only; crash reports → self-hosted Sentry with
    PII redaction; no analytics; no advertising; no third-party
    trackers.
  - In-app "Privacy" screen summarising the same.
  - Google Play Data Safety form completed truthfully.
- **Acceptance**: Human review of privacy disclosures vs actual
  traffic (captured via mitmproxy) matches to the item.

### P8-ACC-01 — Account recovery + self-service

- **Output**: The app does not store a recoverable plaintext
  password; "forgot password" routes to the grid's password-reset
  URL. "Log out everywhere" is offered when the session has
  elevated privileges.
- **Acceptance**: User-facing flows verified manually.

## Files expected to change

- `Linkpoint/src/main/AndroidManifest.xml` (permissions)
- `Linkpoint/src/main/res/xml/network_security_config.xml`
- `Linkpoint/src/main/java/com/linkpoint/auth/*` (biometric, MFA)
- `Linkpoint/src/main/java/com/linkpoint/network/SSLHelper.kt`
- `Linkpoint/src/main/java/com/linkpoint/network/NetworkLogger.kt`
- `.github/workflows/security.yml` (new)
- Top-level docs `PRIVACY_POLICY.md`, `THIRD_PARTY_VIEWER_POLICY_COMPLIANCE.md`

## Exit criteria for Phase 8

- LLSD + UDP message fuzz clean 24 h.
- TLS posture: MITM on release flavor impossible.
- Credential storage: no plaintext fallback; biometric available.
- Permissions: runtime, lazy, rationale-backed.
- Dep + secrets scan: green.
- TPV compliance: documented, linked, tested.
