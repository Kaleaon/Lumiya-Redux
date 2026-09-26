//! Rust counterparts for the `ui/` package Kotlin migration batch.
//!
//! Pure, deterministic algorithms and constant contracts extracted from the
//! converted `ui/` sources are mirrored directly and covered by tests.
//! Classes whose whole purpose is Android lifecycle, View/Adapter/Fragment
//! plumbing, or SharedPreferences I/O are represented as explicit
//! Android-boundary marker types instead: no logic is invented for them.

// ---------------------------------------------------------------------------
// constants: ActivityUtils — intent extra keys shared across activities.
// ---------------------------------------------------------------------------

pub mod activity_utils {
    pub const EXTRA_ACTIVE_AGENT_UUID: &str = "activeAgentUUID";
    pub const FRAGMENT_SELECTION_KEY: &str = "fragmentSelection";
}

// ---------------------------------------------------------------------------
// constants: MasterDetailsActivity — intent/bundle selection keys.
// ---------------------------------------------------------------------------

pub mod master_details_activity {
    pub const INTENT_SELECTION_KEY: &str = "selection";
    pub const WEAK_SELECTION_KEY: &str = "weakSelection";
}

// ---------------------------------------------------------------------------
// constants: ConnectedActivity — object popup notification tag.
// ---------------------------------------------------------------------------

pub mod connected_activity {
    pub const OBJECT_POPUP_NOTIFICATION: &str = "objectPopupNotification";
}

// ---------------------------------------------------------------------------
// constants: ChatterFragment — chatter ID bundle key.
// ---------------------------------------------------------------------------

pub mod chatter_fragment {
    pub const CHATTER_ID_KEY: &str = "chatterID";
}

// ---------------------------------------------------------------------------
// constants: ChatFragment — permission request codes + typing timeout.
// ---------------------------------------------------------------------------

pub mod chat_fragment {
    pub const PERMISSION_REQUEST_CODE: i32 = 500;
    pub const TYPING_TIMEOUT_MS: i64 = 5000;
}

// ---------------------------------------------------------------------------
// constants: ActiveChatsListAdapter — view type enum values.
// ---------------------------------------------------------------------------

pub mod active_chats_list_adapter {
    pub const VIEW_TYPE_COUNT: i32 = 2;
    pub const VIEW_TYPE_HEADER: i32 = 1;
    pub const VIEW_TYPE_ROW: i32 = 0;
}

// ---------------------------------------------------------------------------
// constants: NotificationChannels — notification group and channel IDs.
// ---------------------------------------------------------------------------

pub mod notification_channels {
    pub const MESSAGE_NOTIFICATION_GROUP: &str = "messageNotifications";

    #[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
    pub enum Channel {
        OnlineStatus,
        Local,
        Group,
        Im,
    }

    /// Mirrors `NotificationChannels.Channel.channelId`.
    #[must_use]
    pub fn channel_id(channel: Channel) -> &'static str {
        match channel {
            Channel::OnlineStatus => "onlineStatus",
            Channel::Local => "localChat",
            Channel::Group => "groupChat",
            Channel::Im => "privateIM",
        }
    }
}

// ---------------------------------------------------------------------------
// constants: LoginActivity — preference keys for login state persistence.
// ---------------------------------------------------------------------------

pub mod login_activity {
    pub const KEY_CLIENT_ID: &str = "client_id";
    pub const KEY_LOGIN: &str = "login";
    pub const KEY_PASSWORD: &str = "password";
    pub const KEY_SAVE_PASSWORD: &str = "save_password";
    pub const KEY_SELECTED_GRID: &str = "selected_grid";
    pub const KEY_TOS_ACCEPTED: &str = "tos_accepted";
}

// ---------------------------------------------------------------------------
// constants: WorldViewActivity — timeout millis + request codes.
// ---------------------------------------------------------------------------

pub mod world_view_activity {
    pub const BUTTONS_FADE_TIMEOUT_MILLIS: i64 = 7500;
    pub const FROM_NOTIFICATION_TAG: &str = "fromNotification";
    pub const OBJECT_DESELECT_TIMEOUT_MILLIS: i64 = 6000;
    pub const PERMISSION_AUDIO_REQUEST_CODE: i32 = 100;
    pub const TURNING_SPEED: f32 = 50.0;
}

// ---------------------------------------------------------------------------
// constants: FadingTextViewLog — stale chat timeout.
// ---------------------------------------------------------------------------

pub mod fading_text_view_log {
    pub const STALE_CHAT_TIMEOUT_MS: i64 = 5000;
}

// ---------------------------------------------------------------------------
// constants: CardboardTransitionActivity — wait interval.
// ---------------------------------------------------------------------------

pub mod cardboard_transition_activity {
    pub const WAIT_INTERVAL_MS: i64 = 250;
}

// ---------------------------------------------------------------------------
// constants: LogoutDialog — disconnect timeout.
// ---------------------------------------------------------------------------

pub mod logout_dialog {
    pub const DISCONNECT_TIMEOUT_MS: i64 = 5000;
}

// ---------------------------------------------------------------------------
// constants: OpenXrRuntimeCapabilities — preference keys and stage names.
// ---------------------------------------------------------------------------

pub mod openxr_runtime_capabilities {
    pub const OPENXR_RUNTIME_BROKER_AUTHORITY: &str = "org.khronos.openxr.runtime_broker";
    pub const OPENXR_SYSTEM_RUNTIME_BROKER_AUTHORITY: &str =
        "org.khronos.openxr.system_runtime_broker";
    pub const PREF_OPENXR_ENABLED: &str = "pref_vr_openxr_enabled";
    pub const PREF_OPENXR_STAGE: &str = "pref_vr_openxr_stage";
    pub const PREF_OPENXR_ROLLOUT_PERCENT: &str = "pref_vr_openxr_rollout_percent";
    pub const PREF_OPENXR_FORCE_ENABLE: &str = "pref_vr_openxr_force_enable";

    pub const STAGE_DISABLED: &str = "disabled";
    pub const STAGE_DOGFOOD: &str = "dogfood";
    pub const STAGE_BETA: &str = "beta";
    pub const STAGE_GENERAL: &str = "general";

    /// Mirrors `OpenXrRuntimeCapabilities.normalizePercent`: clamps to [0, 100].
    #[must_use]
    pub fn normalize_percent(raw_percent: i32) -> i32 {
        raw_percent.clamp(0, 100)
    }

    /// Mirrors `OpenXrRuntimeCapabilities.isEligibleForStage`: determines
    /// whether a device bucket qualifies for a staged rollout. The device
    /// bucket itself is Android-owned (ANDROID_ID hash), so this function
    /// takes the precomputed bucket value.
    #[must_use]
    pub fn is_eligible_for_stage(
        stage: &str,
        rollout_percent: i32,
        force_enable: bool,
        device_bucket: i32,
    ) -> bool {
        if force_enable || stage == STAGE_GENERAL {
            return true;
        }
        let effective_rollout = if stage == STAGE_DOGFOOD {
            rollout_percent.max(1).min(10)
        } else if stage == STAGE_BETA {
            rollout_percent.max(1).min(50)
        } else {
            rollout_percent
        };
        device_bucket < effective_rollout
    }
}

// ---------------------------------------------------------------------------
// constants: InventoryActivity — intent tag keys.
// ---------------------------------------------------------------------------

pub mod inventory_activity {
    pub const INITIAL_FOLDER_ID_TAG: &str = "folderID";
    pub const NAME_FILTER_TAG: &str = "nameFilter";
    pub const SAVE_INFO_INTENT_TAG: &str = "forSaveInfo";
    pub const SEARCH_ACTIVE_TAG: &str = "searchActive";
    pub const SELECT_ACTION_ASSET_TYPE: &str = "selectActionAssetType";
    pub const SELECT_ACTION_INTENT_TAG: &str = "selectAction";
    pub const SELECT_ACTION_PARAMS_TAG: &str = "selectActionParams";
    pub const SELECT_ITEM_INTENT_TAG: &str = "forSelectItem";
    pub const TRANSFER_TO_INTENT_TAG: &str = "transferToID";
    pub const TRANSFER_TO_NAME_TAG: &str = "transferToName";

    /// Mirrors `InventoryActivity.SelectAction` enum.
    #[derive(Clone, Copy, Debug, PartialEq, Eq)]
    pub enum SelectAction {
        ApplyUserProfile,
        ApplyFirstLife,
        ApplyPickImage,
    }
}

// ---------------------------------------------------------------------------
// constants: InventorySaveInfo — save type enum.
// ---------------------------------------------------------------------------

pub mod inventory_save_info {
    /// Mirrors `InventorySaveInfo.InventorySaveType`.
    #[derive(Clone, Copy, Debug, PartialEq, Eq)]
    pub enum InventorySaveType {
        NotecardItem,
        InventoryOffer,
    }
}

// ---------------------------------------------------------------------------
// constants: NotecardEditActivity — bundle keys.
// ---------------------------------------------------------------------------

pub mod notecard_edit_activity {
    pub const INVENTORY_ENTRY_KEY: &str = "inventoryEntry";
    pub const IS_SCRIPT_KEY: &str = "isScript";
    pub const PARENT_FOLDER_KEY: &str = "parentFolderUUID";
    pub const TASK_LOCAL_ID_KEY: &str = "taskLocalID";
    pub const TASK_UUID_KEY: &str = "taskUUID";
}

// ---------------------------------------------------------------------------
// constants: SettingsFragment — preference resource key.
// ---------------------------------------------------------------------------

pub mod settings_fragment {
    pub const PREF_RESOURCE_KEY: &str = "prefResourceId";
}

// ---------------------------------------------------------------------------
// constants: GroupRoleDetailsFragment / GroupRoleMembersFragment — role key.
// ---------------------------------------------------------------------------

pub mod group_role_fragment {
    pub const ROLE_ID_KEY: &str = "role_id";
}

// ---------------------------------------------------------------------------
// constants: ParcelPropertiesFragment — parcel data key.
// ---------------------------------------------------------------------------

pub mod parcel_properties_fragment {
    pub const PARCEL_DATA_KEY: &str = "parcelData";
}

// ---------------------------------------------------------------------------
// constants: AvatarPickerForInvite — group-related bundle keys.
// ---------------------------------------------------------------------------

pub mod avatar_picker_for_invite {
    pub const GROUP_ID_KEY: &str = "groupID";
    pub const GROUP_LIST_KEY: &str = "avatarGroupList";
    pub const GROUP_PROFILE_KEY: &str = "groupProfile";
    pub const GROUP_TITLES_KEY: &str = "groupTitles";
}

// ---------------------------------------------------------------------------
// behavior: ExportChatHistoryTask — filename sanitization for chat export.
// ---------------------------------------------------------------------------

/// Characters forbidden in chat-export filenames.
pub const CHAT_EXPORT_FORBIDDEN_CHARS: &str = "./\\*?:\"'~";

/// Mirrors `ExportChatHistoryTask.sanitizeFileName`: removes characters
/// forbidden in filenames, replaces non-ASCII with underscore, trims the
/// result, and falls back to `"Chat Log"` when the result is empty.
#[must_use]
pub fn sanitize_chat_export_filename(name: &str) -> String {
    let mut sb = String::with_capacity(name.len());
    for ch in name.chars() {
        if ch > '\x7F' {
            sb.push('_');
        } else if !CHAT_EXPORT_FORBIDDEN_CHARS.contains(ch) {
            sb.push(ch);
        }
    }
    let trimmed = sb.trim().to_string();
    if trimmed.is_empty() {
        "Chat Log".to_string()
    } else {
        trimmed
    }
}

// ---------------------------------------------------------------------------
// contract: ContactListType enums (duplicated in ContactsFragment and
// AvatarPickerFragment with the same variants).
// ---------------------------------------------------------------------------

/// Mirrors `ContactsFragment.ContactListType` and
/// `AvatarPickerFragment.ContactListType`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ContactListType {
    Online,
    All,
    Groups,
    Nearby,
}

// ---------------------------------------------------------------------------
// contract: GroupProfileFragment.ProfileTab / UserProfileFragment.ProfileTab
// ---------------------------------------------------------------------------

/// Mirrors `GroupProfileFragment.ProfileTab`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum GroupProfileTab {
    General,
    Members,
    Roles,
}

/// Mirrors `UserProfileFragment.ProfileTab`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum UserProfileTab {
    SecondLife,
    FirstLife,
    Groups,
    Picks,
}

// ---------------------------------------------------------------------------
// contract: CardboardActivity.ControlsPage
// ---------------------------------------------------------------------------

/// Mirrors `CardboardActivity.ControlsPage`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CardboardControlsPage {
    Main,
    Extended,
}

// ---------------------------------------------------------------------------
// boundary: Android-lifecycle/View/Fragment/Activity/Adapter marker types.
// ---------------------------------------------------------------------------

/// Marker types make Android-owned implementations explicit at the FFI seam;
/// none of these carry mirrored logic.
pub mod android_boundary {
    macro_rules! boundary_types {
        ($($name:ident),+ $(,)?) => {$(
            #[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
            pub struct $name;
        )+};
    }

    boundary_types! {
        // chat/
        ChatFragment, ChatNewActivity, ChatRecyclerAdapter, ChatterPicView,
        ChatterThumbnailData, ContactsFragment, DashedSeparatorView,
        ExportChatHistoryTask, GroupNoticeFragment, OnlineIndicatorView,
        PayUserFragment, TypingIndicatorView, AvatarPickerForInvite,
        // chat/contacts/
        ActiveChatsListAdapter, ChatterItemViewBuilder,
        ChatterListSubscriptionAdapter,
        // chat/profiles/
        GroupMainProfileTab, GroupMemberRolesFragment, GroupMembersProfileTab,
        GroupProfileFragment, GroupRoleDetailsFragment,
        GroupRoleMembersFragment, GroupRolesProfileTab,
        ParcelPropertiesFragment, PickDescriptionEditFragment,
        UserFirstLifeProfileTab, UserGroupsProfileTab, UserMainProfileTab,
        UserPickFragment, UserPicksProfileTab, UserProfileFragment,
        // common/
        ActivityUtils, ButteryProgressBar, ChatterFragment,
        ChatterNameDisplayer, ConnectedActivity, DetailsActivity,
        FragmentWithTitle, ImageAssetView, LoadingLayout,
        MasterDetailsActivity, NavDrawerActivityHelper, NavDrawerAdapter,
        RecyclerSubscribableListAdapter, SwipeDismissAdvancedBehavior,
        SwipeDismissListViewTouchListener, SwipeDismissTouchListener,
        TeleportProgressDialog, TextFieldDialogBuilder,
        TextFieldEditFragment, UserFunctionsFragment, UserListFragment,
        LoadableMonitor,
        // grids/
        GridEditDialog, GridList, ManageGridsActivity,
        // inventory/
        AssetInfoFragment, InventoryActivity, InventoryFolderAdapter,
        InventoryFragment, InventoryFragmentHelper, InventorySaveInfo,
        NotecardEditActivity, TextureViewFragment, UploadImageAsyncTask,
        // login/
        LoginActivity, LogoutDialog, TeleportSLURLActivity,
        // minimap/
        MinimapActivity, MinimapFragment, MinimapView,
        NearbyPeopleMinimapFragment,
        // myava/
        MuteListAdapter, MuteListFragment, MyAvatarFragment,
        TransactionLogAdapter, TransactionLogFragment,
        // notify/
        NotificationChannels, OnlineNotificationInfo,
        OreoNotificationChannelManager,
        // objects/
        ObjectDetailsFragment, ObjectListAdapter, ObjectPayDialog,
        ObjectSelectorFragment, TaskInventoryFragment,
        TaskInventoryListAdapter, TouchableObjectListAdapter,
        TouchableObjectsFragment,
        // objpopup/
        ObjectPopupsFragment, SingleObjectPopupFragment,
        // outfits/
        CurrentOutfitAdapter, CurrentOutfitFragment, OutfitsFragment,
        // render/
        CardboardActivity, CardboardControlsPlaceholder,
        CardboardTransitionActivity, FadingTextViewLog,
        InsetColoringLayout, WorldSurfaceView, WorldViewActivity,
        GvrVrSessionAdapter, OpenXrRuntimeCapabilities,
        // search/
        ParcelInfoFragment, SearchGridAdapter, SearchGridFragment,
        // settings/
        NotificationSettings, PreferenceSubPage, SettingsFragment,
        // avapicker/
        AvatarPickerFragment,
        // accounts/ (already Kotlin, mirrored for completeness)
        AccountEditDialog, AccountList, ManageAccountsActivity,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn activity_utils_constants() {
        assert_eq!(activity_utils::EXTRA_ACTIVE_AGENT_UUID, "activeAgentUUID");
        assert_eq!(activity_utils::FRAGMENT_SELECTION_KEY, "fragmentSelection");
    }

    #[test]
    fn notification_channel_ids() {
        use notification_channels::*;
        assert_eq!(channel_id(Channel::OnlineStatus), "onlineStatus");
        assert_eq!(channel_id(Channel::Local), "localChat");
        assert_eq!(channel_id(Channel::Group), "groupChat");
        assert_eq!(channel_id(Channel::Im), "privateIM");
    }

    #[test]
    fn login_activity_keys_are_stable() {
        assert_eq!(login_activity::KEY_LOGIN, "login");
        assert_eq!(login_activity::KEY_PASSWORD, "password");
        assert_eq!(login_activity::KEY_SAVE_PASSWORD, "save_password");
        assert_eq!(login_activity::KEY_TOS_ACCEPTED, "tos_accepted");
    }

    #[test]
    fn openxr_normalize_percent_clamps() {
        use openxr_runtime_capabilities::normalize_percent;
        assert_eq!(normalize_percent(-5), 0);
        assert_eq!(normalize_percent(0), 0);
        assert_eq!(normalize_percent(50), 50);
        assert_eq!(normalize_percent(100), 100);
        assert_eq!(normalize_percent(200), 100);
    }

    #[test]
    fn openxr_stage_eligibility() {
        use openxr_runtime_capabilities::*;

        // force_enable always qualifies
        assert!(is_eligible_for_stage(STAGE_DISABLED, 0, true, 99));

        // STAGE_GENERAL always qualifies
        assert!(is_eligible_for_stage(STAGE_GENERAL, 0, false, 99));

        // STAGE_DOGFOOD caps rollout at 10
        assert!(is_eligible_for_stage(STAGE_DOGFOOD, 100, false, 5));
        assert!(!is_eligible_for_stage(STAGE_DOGFOOD, 100, false, 15));

        // STAGE_BETA caps rollout at 50
        assert!(is_eligible_for_stage(STAGE_BETA, 100, false, 30));
        assert!(!is_eligible_for_stage(STAGE_BETA, 100, false, 60));

        // bucket exactly at threshold is not eligible
        assert!(!is_eligible_for_stage(STAGE_BETA, 50, false, 50));
    }

    #[test]
    fn sanitize_chat_export_filename_strips_forbidden_chars() {
        assert_eq!(sanitize_chat_export_filename("Hello World"), "Hello World");
        assert_eq!(sanitize_chat_export_filename("file/name.txt"), "filenametxt");
        assert_eq!(
            sanitize_chat_export_filename("test*?:\"'~chars"),
            "testchars"
        );
    }

    #[test]
    fn sanitize_chat_export_filename_replaces_non_ascii() {
        assert_eq!(sanitize_chat_export_filename("caf\u{00e9}"), "caf_");
    }

    #[test]
    fn sanitize_chat_export_filename_falls_back_to_chat_log() {
        assert_eq!(sanitize_chat_export_filename(""), "Chat Log");
        assert_eq!(sanitize_chat_export_filename("..."), "Chat Log");
        assert_eq!(sanitize_chat_export_filename("   "), "Chat Log");
    }

    #[test]
    fn world_view_timeouts_are_positive() {
        assert!(world_view_activity::BUTTONS_FADE_TIMEOUT_MILLIS > 0);
        assert!(world_view_activity::OBJECT_DESELECT_TIMEOUT_MILLIS > 0);
    }

    #[test]
    fn inventory_select_action_variants_are_distinct() {
        use inventory_activity::SelectAction;
        assert_ne!(SelectAction::ApplyUserProfile, SelectAction::ApplyFirstLife);
        assert_ne!(SelectAction::ApplyFirstLife, SelectAction::ApplyPickImage);
    }

    #[test]
    fn contact_list_type_variants() {
        assert_ne!(ContactListType::Online, ContactListType::All);
        assert_ne!(ContactListType::Groups, ContactListType::Nearby);
    }
}
