# Phase 6 — Voice

Goal: a user can join the local parcel voice channel, a private voice
call, or a group voice channel; hear other participants with proximity
attenuation; be heard; mute others and themselves. All via the modern
Second Life voice stack, which is WebRTC, replacing legacy Vivox.

## Background

Linden Lab migrated Second Life voice from Vivox to a WebRTC-based
stack in 2024. The modern voice path is:

1. Client requests voice credentials via `ProvisionVoiceAccountRequest`
   CAP → server returns a JWT or similar token + a WebRTC signaling
   endpoint URL.
2. Client requests parcel-specific voice via `ParcelVoiceInfoRequest`
   CAP → server returns a channel URI and credentials for that parcel.
3. Client opens a WebRTC peer connection to the signaling server;
   signaling exchanges SDP offer/answer; DTLS-SRTP media stream
   flows.
4. Audio from local mic → WebRTC → server (SFU) → other participants.
5. Received audio from other participants is spatialised by avatar
   position (proximity falloff).

Linkpoint has `voice/LinkpointVoiceManager.kt` (single file, 684 LOC)
and `src/main/cpp/jni/vivox_stubs.cpp` (placeholder). Full
implementation has not been done.

## Tasks

### P6-VOICE-01 — WebRTC dependency integration

- **Input**: `io.getstream:stream-webrtc-android` or the equivalent
  libwebrtc binary package.
- **Output**: WebRTC `PeerConnectionFactory` initialised once per
  process with the device's audio-device-module, echo cancellation,
  noise suppression, automatic gain control enabled.
  - Permissions: `RECORD_AUDIO` requested at first use; denied state
    surfaced as an in-app prompt with a settings deep-link.
  - Bluetooth / wired headset routing via
    `android.media.AudioManager` modes.
- **Acceptance**: A Hello-World peer-to-peer audio test between two
  emulators on the same host succeeds.

### P6-VOICE-02 — Voice credential + signaling plumbing

- **Input**: `ProvisionVoiceAccountRequest` CAP response;
  `VoiceSignalingRequest` CAP; upstream
  `indra/newview/llvoicewebrtc.cpp`.
- **Output**: `VoiceClient.connect(channelKind: ChannelKind)`:
  1. POST to the provision CAP; receive JWT + signaling endpoint.
  2. Dial signaling WebSocket.
  3. Create a `PeerConnection`; offer SDP; handle answer.
  4. On `icecandidate`, trickle through signaling.
  5. Surface `VoiceChannelState.Connecting/Live/Failed(...)` via
     `StateFlow`.
- **Channel kinds**: `Parcel(regionUuid, parcelId)`,
  `PrivateCall(peerAgentId)`, `Group(groupId)`, `Conference(sessionId)`.
- **Acceptance**: Connection to the test account's home-parcel voice
  channel reaches `Live` within 10 s.

### P6-VOICE-03 — Spatial audio

- **Input**: Other-participant avatar positions from `AvatarRepository`
  (Phase 2-ish; populated by `ObjectUpdate` avatar blocks and
  `CoarseLocationUpdate`).
- **Output**: Each remote participant's audio track feeds a spatial
  audio graph. Distance attenuation: per-SL-convention, linear
  inside 5 m, inverse-square to 20 m, silent beyond.
  - HRTF if the device supports it (Android 13+ via `AudioManager.isSpatializerAvailable`).
  - Stereo balance fallback otherwise.
- **Acceptance**: Two test accounts 3 m apart vs 15 m apart produce
  audible volume difference matching the curve ±10%.

### P6-VOICE-04 — Mic capture UI and PTT / open-mic

- **Input**: User preference voice mode (`PushToTalk` /
  `OpenMic(threshold)` / `Muted`).
- **Output**: Mic-level meter; PTT button on the HUD when PTT mode;
  voice-activity-detection with configurable threshold in open-mic
  mode; quick-mute.
- **Acceptance**: PTT mode does not transmit without button;
  open-mic auto-engages above threshold; muted mode never
  transmits.

### P6-VOICE-05 — Speaker indicators

- **Input**: WebRTC `getStats` audio-level data per participant.
- **Output**: HUD list of nearby voice participants with a "speaking
  now" indicator. Integrated into the minimap as a pulse over the
  speaker's avatar.
- **Acceptance**: Indicator tracks real speech within 100 ms.

### P6-VOICE-06 — Group voice channels

- **Input**: `ChatSessionRequest` with `voice` flag; `GroupProfile`
  capability.
- **Output**: Join / leave group voice channel. Participant list.
  Moderator controls (mute others) where user has the right.
- **Acceptance**: Join → hear → leave cycle clean in a test group.

### P6-VOICE-07 — Device routing

- **Input**: `AudioManager` device list; Android 12+
  `MediaRouter2`.
- **Output**: Device picker (earpiece / speaker / wired / BT);
  auto-switch on hot-plug; persistence of last-chosen device per
  kind.
- **Acceptance**: Plug in a BT headset during a call → switch is
  transparent; no glitch >200 ms.

### P6-VOICE-08 — Quality diagnostics

- **Input**: WebRTC stats.
- **Output**: Per-call stats surfaceable in dev screen: jitter, packet
  loss, round-trip, codec, bitrate. On persistent quality
  degradation, auto-downgrade codec (Opus bitrate).
- **Acceptance**: Simulated 5% packet-loss call produces visible
  degradation indicator without dropping the call.

### P6-VOICE-09 — Retire Vivox stubs

- **Input**: `src/main/cpp/jni/vivox_stubs.cpp`; any `voice/vivox/*`
  classes.
- **Output**: Deleted. Voice subsystem has exactly one
  implementation.
- **Acceptance**: Grep for `vivox` (case-insensitive) in code returns
  only this docs file and perhaps TPV-compliance documentation.

## Files expected to change

- `Linkpoint/src/main/java/com/linkpoint/voice/VoiceClient.kt` (rewrite)
- `Linkpoint/src/main/java/com/linkpoint/voice/SpatialAudioGraph.kt` (new)
- `Linkpoint/src/main/java/com/linkpoint/voice/VoiceStateRepository.kt` (new)
- UI: voice status on HUD, device picker in preferences
- `src/main/cpp/jni/vivox_stubs.cpp` (delete)

## Exit criteria for Phase 6

- Voice works in parcel, private call, and group channels.
- Spatial audio attenuation matches upstream.
- Quality diagnostics visible in dev flavor.
- No Vivox references remain.
