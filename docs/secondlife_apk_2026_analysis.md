# Second Life Android 2026.3.1089 APK analysis

This note records what we learned from reverse-engineering the official Linden
Lab Second Life Android client (versionCode 1089, versionName 2026.3.1089,
package `com.lindenlab.secondlife`). It documents the endpoints and protocol
touchpoints that Lumiya Redux must stay compatible with, and cites the APK
artefact each claim is drawn from so future contributors can re-derive it.

## Artefact reproducibility

```
./scripts/disassemble_lumiya.sh \
  https://tmpfiles.org/dl/34855962/secondlife2026.3.1089.apk \
  artifacts/secondlife
```

Tooling used:

- `jadx` 1.5.3 (DEX to Java, AndroidManifest.xml, resources)
- `unzip` (APK structural inspection)
- `strings` + custom Python parsing over `assets/bin/Data/Managed/Metadata/global-metadata.dat`
  (IL2CPP metadata blob; the SL client is Unity + IL2CPP, so C# code is
  compiled into the native library and is not in the base APK)

The base APK does not contain `lib/<abi>/libil2cpp.so` — those are in per-ABI
split APKs. This means Ghidra/radare2 native analysis requires the
`split_config.arm64_v8a.apk` and is out of scope for this note. What we do have
is sufficient to extract endpoints, protocol hints, and manifest requirements.

## Manifest facts (`AndroidManifest.xml`)

| Key | Value |
| --- | --- |
| `package` | `com.lindenlab.secondlife` |
| `versionCode` | `1089` |
| `versionName` | `2026.3.1089` |
| `minSdkVersion` | `29` |
| `targetSdkVersion` | `35` |
| `compileSdkVersion` | `35` |

Permissions the first-party client declares that are also relevant to Lumiya:
`INTERNET`, `ACCESS_NETWORK_STATE`, `RECORD_AUDIO`, `MODIFY_AUDIO_SETTINGS`,
`CAMERA`, `BLUETOOTH`, `WAKE_LOCK`, `VIBRATE`, `POST_NOTIFICATIONS`,
`RECEIVE_BOOT_COMPLETED`, `com.android.vending.BILLING`. The first-party
client does **not** declare legacy `WRITE_EXTERNAL_STORAGE` /
`READ_EXTERNAL_STORAGE` — it relies on scoped storage, which is the expected
direction for Lumiya Redux's manifest cleanup.

## Endpoints (`assets/bin/Data/Managed/Metadata/global-metadata.dat`)

Strings extracted from the IL2CPP metadata blob. Because the blob uses
length-prefixed strings rather than NUL terminators, adjacent strings appear
concatenated in raw `strings` output; the following were confirmed with
targeted substring searches.

### Login / session

- `https://login.agni.lindenlab.com/cgi-bin/login.cgi` — legacy XMLRPC login
  endpoint is still referenced. Lumiya's existing login path remains valid.
- `https://manager.production.secondlifemobile.com/login` — new first-party
  mobile login manager (token / SSO-style). Not used by Lumiya; recorded for
  completeness.
- `https://manager.development.secondlifemobile.com/login`,
  `https://manager.premplusbeta.secondlifemobile.com/login` — dev / premium-plus
  beta variants of the same manager.

### Asset fetch (textures, meshes, animations, sounds, settings)

- `http://asset-cdn.glb.agni.lindenlab.com/?settings_id=<UUID>` —
  GLB-distributed asset CDN. Settings bundles (viewer-wide settings) are
  fetched directly from here keyed by UUID.
- The same host is used with `?animatn_id=<UUID>` and `?sound_id=<UUID>` query
  parameters for animation and sound assets.
- `https://content.jupiterproject.net/asset/agni/<UUID>/<type>` —
  "Jupiter Project" is Linden Lab's internal content delivery endpoint. The
  confirmed observed type in this build is `mesh_debug`. This supersedes
  direct per-region `GetMesh` / `GetTexture` capability fetches for clients
  that integrate with it.
- `https://asset.production.secondlifemobile.com/asset` — the first-party
  mobile app proxies generic asset fetches through this host.
- `https://asset.production.secondlifemobile.com/bake`,
  `https://content.jupiterproject.net/bake/` — avatar baking (server-side
  bake) endpoints. The simulator-side capability corresponding to upload is
  still `UploadBakedTexture` (Lumiya already uses this).

**Canonical asset query-parameter conventions** extracted from the metadata:

| Parameter | Asset type |
| --- | --- |
| `texture_id` | Texture (J2C / image) |
| `mesh_id` | Mesh |
| `animatn_id` | Animation |
| `sound_id` | Sound |
| `settings_id` | Viewer settings bundle |

These are the same query-parameter names used by simulator `ViewerAsset` /
`GetTexture` / `GetMesh` capabilities, which is what makes the CDN URL a
drop-in substitute when a CAP is unavailable.

### Other first-party endpoints (recorded but out of scope for Lumiya)

- `https://update.production.secondlifemobile.com/android-version.json`,
  `.../android-alpha-version.json` — update manifest.
- `https://gdpr.production.secondlifemobile.com/status` — GDPR consent state.
- `https://lindenlab.freshdesk.com/api/v2/tickets` — support ticket submission.
- `https://maps.secondlife.com/secondlife/<region>/<x>/<y>/<z>` — public
  SLURL maps endpoint. Used by Lumiya for `getAgentSLURL`; note the first-party
  app always uses HTTPS here.

## Upstream cross-reference: `secondlife/viewer`

The APK surfaces endpoint strings and manifest facts; the open-source viewer
at https://github.com/secondlife/viewer supplies the normative protocol
surface. Two files anchor this audit:

- `indra/newview/llviewerregion.cpp` — `LLViewerRegionImpl::buildCapabilityNames`
  is the authoritative list of per-region capability names a client requests.
  At the time of writing it enumerates 96 capability identifiers; every one
  is a bare protocol string sent in the seed-cap LLSD POST.
- `indra/newview/llaisapi.cpp` — `AISAPI::getCapNames` contributes the two
  AIS v3 inventory cap names (`InventoryAPIv3`, `LibraryAPIv3`).

Lumiya's `SLCapability` enum is kept in sync with that union. The first
section preserves the legacy CAPs Lumiya's code calls today; the second
section adds the full upstream canonical set, alphabetised. All call sites
already guard on `getCapability(...) == null`, so additions are
backwards-compatible and cost only extra entries in the LLSD request body.

## Consequences for Lumiya Redux

The audit produces three directly actionable fixes:

1. **Capability enumeration (`slproto/caps/SLCaps.java`).** The first-party
   client drives many flows (asset fetch, simulator feature negotiation,
   profiles, maps, offline IMs, PBR materials) off per-region capabilities
   whose CAP names are stable SL protocol. Expand Lumiya's `SLCapability`
   enum to the full upstream canonical set drawn from
   `LLViewerRegionImpl::buildCapabilityNames` (plus AIS caps). Unsupported
   CAPs return `null` from `getCapability`, which every call site already
   handles, so this is backwards-compatible.

2. **Maps SLURL scheme (`slproto/SLAgentCircuit.java:getAgentSLURL`).** The
   first-party SL 2026 client emits `https://maps.secondlife.com/...` URLs;
   Lumiya still emits `http://`. Since `maps.secondlife.com` issues HSTS and
   the URL is shared by the user via chat/IM/browser intents, switch to
   `https://`.

3. **Manifest: `POST_NOTIFICATIONS` (Android 13+).** The first-party client
   declares `android.permission.POST_NOTIFICATIONS`. Lumiya Redux targets
   API 34 and uses notifications for IM / friend online / teleport offers, so
   it must declare this permission to actually display them on Android 13+.

## Known protocol gap: `SLAuth.SendLoginRequest`

`app/src/main/java/com/lumiyaviewer/lumiya/slproto/auth/SLAuth.java` still
ships with the recovered `SendLoginRequest` method body replaced by a JADX
"Method dump skipped" stub that throws `UnsupportedOperationException`.
Login therefore cannot actually succeed against any grid until this method
is reconstructed.

The reply parser (`SLAuthReply.java`) is intact and tells us exactly which
XMLRPC reply fields the client must elicit from the server: `session_id`,
`secure_session_id`, `agent_id`, `circuit_code`, `sim_ip`, `sim_port`,
`seed_capability`, `login`, `next_url`, `next_method`, `message`,
`agent_appearance_service`, `inventory-root`, `buddy-list`.

Reconstruction reference in upstream `secondlife/viewer`:

- `indra/newview/llstartup.cpp` — builds the `login_to_simulator` XMLRPC
  method call and the struct of login parameters, and drives the `options`
  LLSD array that selects which reply sections the server returns (the
  field names consumed by `SLAuthReply` — `inventory-root`, `buddy-list` —
  must appear in that `options` array).
- Password hashing already lives in `SLAuth.getPasswordHash`: MD5 of the
  first 16 chars of the plaintext, prefixed `$1$`. This matches the
  upstream `LLPasswordHash` semantics.

Reconstructing `SendLoginRequest` is the single highest-leverage protocol
fix remaining; it is intentionally scoped out of this patch because it is a
non-trivial implementation and deserves its own PR with test coverage
against at least one grid's login endpoint.

## Out-of-scope first-party endpoints

The remaining endpoints (mobile manager login, Jupiter CDN, update/GDPR/
Freshdesk services) are first-party infrastructure and not expected to be
consumed by third-party viewers; they are documented above strictly as
reference for where the official client diverges.
