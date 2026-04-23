# Phase 5 — User Experience

Goal: every surface a real user touches is implemented, designed with
Material 3, and wired to the Phase 1–4 plumbing. No dark UI patterns;
no half-implementations. If a feature is listed here and is not
complete, it is hidden behind the dev-flavor feature flag.

## Background

Lumiya's UI is the feature spec. It is a well-loved app; people used it
for a decade because the UX respected a mobile user's time. The modern
equivalent keeps the same mental model — chat-first, inventory-second,
world-third — with Compose-native navigation and gesture affordances.

## Tasks

### P5-NAV-01 — App-wide navigation skeleton

- **Input**: Jetpack Compose Navigation 2.x; Material 3.
- **Output**: Single-activity app. `MainActivity` hosts a
  `NavHostController`. Top-level destinations in a bottom nav bar:
  `World`, `Chat`, `Friends`, `Inventory`, `Me`. Per-destination
  nested graphs.
- **Acceptance**: Back-stack behaviour matches Material guidelines
  (pop to start on re-tap of current tab).

### P5-AUTH-01 — Login screen

- **Input**: Phase 1 `LoginClient`.
- **Output**: Username / password form; grid picker (Agni / Aditi /
  OpenSim custom URL); "remember me" toggle; MFA TOTP entry on
  demand; ToS gate when server replies `next_method`. Display-name
  preview on success before proceeding.
  - Credentials stored via `EncryptedSharedPreferences`; "remember
    me" persists only `username` and `gridName` unless biometric
    auth is configured, in which case the full credential is gated
    by `androidx.biometric.BiometricPrompt`.
- **Acceptance**: All flows — success, bad password, ToS required,
  MFA required, maintenance mode — render the correct next screen.

### P5-WORLD-01 — World view

- **Input**: Phase 4 renderer.
- **Output**: Full-screen Filament surface with overlay HUD: chat
  ticker (last 3 local chat lines), compass, minimap, quick-action
  buttons (fly / land / sit / stand / gestures). Pinch to zoom;
  drag to rotate camera; two-finger drag to pan. Long-press on a
  prim → selection with actions (sit / buy / touch / profile).
- **Acceptance**: Gesture recognizers feel native; no dropped events
  during camera orbits.

### P5-CHAT-01 — Chat UI

- **Input**: Phase 2 `LocalChatRepository`, `ImRepository`.
- **Output**:
  - Local chat: threaded list, 1,000-line cap, input at bottom with
    `@mention` autocomplete of nearby avatars.
  - IM: conversation list screen; per-conversation screen with
    typing indicator, read receipts (where server supports),
    offline-message indicator.
  - Group chat: identical to IM but with member list and scroll-up
    to history (bounded; SL doesn't keep server-side history).
  - Notifications: Android notification channel "Chat" with proper
    grouping (one notification per conversation) and direct reply
    action.
- **Acceptance**: Send / receive / history / notifications all
  exercised against test accounts.

### P5-FRIEND-01 — Friends screen

- **Input**: Phase 2 `FriendsRepository`.
- **Output**: List of friends with online indicator, quick actions
  (IM, teleport-to, teleport-request, offer-teleport, pay, remove).
  Per-friend screen showing profile + shared location if both
  sides' map rights are granted.
- **Acceptance**: Online transitions update within 2 s. All quick
  actions succeed against the test pair.

### P5-INV-01 — Inventory screen

- **Input**: Phase 2 AIS Room storage.
- **Output**: Tree view (Compose `LazyColumn` with expand/collapse)
  over the inventory Room entities. Search by name (sub-string,
  case-insensitive). Filters by type (textures / notecards /
  objects / etc.). Item actions: open (notecard), wear (clothing),
  rez (object), copy/paste/delete (respecting permissions).
- **Performance**: >50,000 items must scroll at 60 fps. Diffing via
  `LazyColumn` keys.
- **Acceptance**: Test account's full inventory loads and is usable.

### P5-OUTFIT-01 — Outfits

- **Input**: `BOM` (baking-on-mesh) state; Linkpoint
  `inventory/OutfitManager.kt` (currently placeholder).
- **Output**: Outfit picker shows "Current Outfit" folder contents;
  "Wear Outfit" applies; "Take Off" removes. Visible real-time
  change on local avatar (with Phase 3 re-bake path).
- **Acceptance**: Swap to a saved outfit; upstream viewer observing
  the same account sees the swap in <15 s.

### P5-MAP-01 — Map

- **Input**: `MapLayer` CAP; `MapBlockReply`, `MapItemReply` messages;
  Lumiya `ui/minimap/MinimapActivity.java`.
- **Output**: Two views:
  - **Minimap** — small overlay showing current region + immediate
    neighbours, avatar positions (friends highlighted), mainland
    continent preview.
  - **Full map** — full-screen pan/zoom of the world grid, region
    names, teleport-anywhere tap.
- **Acceptance**: Tap a region on full map → teleport succeeds.

### P5-TP-01 — Teleport flows

- **Input**: `TeleportStart`, `TeleportProgress`, `TeleportFinish`,
  `TeleportLocal`, `TeleportLureRequest`, `TeleportLureReply`.
- **Output**: All teleport flavours (direct, landmark, lure,
  home, SLURL intent from another app) show progress → splash →
  arrival. No bald "teleporting..." spinners; show region name and
  loading textures as they resolve.
- **Acceptance**: Lumiya's Manhattan-teleport test (traverse 20
  named mainland regions in sequence) completes without error.

### P5-PROFILE-01 — Profiles

- **Input**: `AgentProfile` CAP.
- **Output**: Profile viewer for any agent by UUID. Second Life tab
  (pic, name, about, groups, rating). Interests tab (skills, want-to,
  languages). 1st-life tab (optional text).
- **Acceptance**: Own profile editable; round-trip save verified via
  upstream viewer.

### P5-SEARCH-01 — Search

- **Input**: `AvatarPickerSearch`, `SearchStatRequest`,
  `FindExperienceByName`, `ParcelDirectory` CAPs.
- **Output**: Tabbed search (People / Places / Events / Groups / 
  Classifieds) hitting the respective caps.
- **Acceptance**: Search for a known-public place name returns the
  correct region.

### P5-PAY-01 — Payment flow

- **Input**: `MoneyBalanceRequest`, `MoneyTransferRequest` messages;
  upstream L$ UX.
- **Output**: Pay dialog with recipient / amount / memo; balance
  update toast on completion. L$ balance visible on the Me tab.
- **Acceptance**: Send L$1 to a second test account; receive
  confirmation in both directions.

### P5-ME-01 — Me / preferences

- **Input**: `AgentPreferences` CAP; local preferences.
- **Output**:
  - Account: current user + logout.
  - Appearance: quick outfit switcher.
  - Privacy: online status visibility, map visibility, profile
    visibility per-friend.
  - Graphics: renderer preset (Low/Med/High), draw distance,
    max avatars displayed.
  - Bandwidth: total throttle, per-bucket advanced view.
  - Notifications: per-channel mute.
  - Voice: device selection, mute, spatial audio on/off.
- **Acceptance**: Every setting persists and takes effect on change
  without restart where possible.

### P5-GROUP-01 — Group management

- **Input**: Phase 2 `GroupsRepository`.
- **Output**: Per-group screen with member list, roles, abilities,
  group notices inbox, group chat join.
- **Acceptance**: Join a group, leave a group, send a notice with a
  sufficient-rights account.

### P5-NOTIF-01 — Notification center

- **Input**: Android notifications; in-app `NotificationCenter` for
  toast-style transient notices.
- **Output**: Unified notification model. IM / friend request /
  teleport offer / group notice / payment received all surface
  consistently. Runtime `POST_NOTIFICATIONS` permission request
  gated on Android 13+. Channel groups: Chat, Social, Economy,
  System.
- **Acceptance**: All notification types ring through, both
  foreground and background.

### P5-MEDIA-01 — Parcel media / audio stream

- **Input**: Parcel's `MediaURL` / `MusicURL`.
- **Output**: Floating play control when entering a parcel with
  a stream. Respects the user's "auto-play media" preference.
- **Acceptance**: A known streaming parcel plays audio on entry if
  auto-play on; button required otherwise.

### P5-GESTURE-01 — Gestures

- **Input**: Lumiya `ui/gestures/` (if present); SL gesture assets.
- **Output**: Gesture list; quick-activate bar on world HUD;
  keyboard shortcut assignment (for external keyboards).
- **Acceptance**: A gesture that plays a local animation + a sound +
  types a chat line executes correctly.

### P5-ACC-01 — Accessibility

- **Input**: Material 3 accessibility guidance.
- **Output**: Content descriptions on all icon buttons; font scaling
  respects system setting; minimum touch targets 48 dp; colour
  contrast AA; TalkBack pass-through on chat.
- **Acceptance**: Manual Accessibility Scanner pass with zero
  `Critical` findings.

### P5-THEME-01 — Theming

- **Input**: Material You dynamic colour (Android 12+);
  Lumiya brand colors as fallback on older Android.
- **Output**: Light / dark / system themes; dynamic-colour extraction
  on Android 12+; user toggle in Me → Appearance.
- **Acceptance**: Every screen readable in both themes.

## Files expected to change

- Extensive Compose additions under `Linkpoint/src/main/java/com/linkpoint/ui/`
- `Linkpoint/src/main/res/values/themes.xml`
- Navigation graphs under `ui/navigation/`
- ViewModels co-located with screens

## Exit criteria for Phase 5

- Every task above has a live screen, tested at least once end-to-end
  against a real grid.
- Accessibility scanner green.
- No `TODO`/`FIXME` banners visible to users.
