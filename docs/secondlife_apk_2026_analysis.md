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

## Consequences for Lumiya Redux

The audit produces three directly actionable fixes:

1. **Capability enumeration (`slproto/caps/SLCaps.java`).** The first-party
   client drives many flows (asset fetch, simulator feature negotiation,
   profiles, maps, offline IMs, PBR materials) off per-region capabilities
   whose CAP names are stable SL protocol. Lumiya's `SLCapability` enum only
   lists a subset of what modern simulators advertise. Extend the enum with
   the generally-available modern CAPs that Lumiya will need as protocol
   modernization rolls in: `ViewerAsset`, `SimulatorFeatures`, `AgentProfile`,
   `MapLayer`, `ReadOfflineMsgs`, `MeshUploadFlag`, `RenderMaterials`,
   `GetObjectCost`, `GetObjectPhysicsData`. They are opt-in — unsupported
   CAPs continue to return `null` from `getCapability`, which is already
   handled by all call sites.

2. **Maps SLURL scheme (`slproto/SLAgentCircuit.java:getAgentSLURL`).** The
   first-party SL 2026 client emits `https://maps.secondlife.com/...` URLs;
   Lumiya still emits `http://`. Since `maps.secondlife.com` issues HSTS and
   the URL is shared by the user via chat/IM/browser intents, switch to
   `https://`.

3. **Manifest: `POST_NOTIFICATIONS` (Android 13+).** The first-party client
   declares `android.permission.POST_NOTIFICATIONS`. Lumiya Redux targets
   API 34 and uses notifications for IM / friend online / teleport offers, so
   it must declare this permission to actually display them on Android 13+.

The remaining endpoints (mobile manager login, Jupiter CDN, update/GDPR/
Freshdesk services) are first-party infrastructure and not expected to be
consumed by third-party viewers; they are documented above strictly as
reference for where the official client diverges.
