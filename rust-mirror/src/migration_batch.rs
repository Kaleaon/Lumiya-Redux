//! Rust counterparts for the 100-source Kotlin migration batch.
//!
//! Pure values and algorithms are implemented directly. Android/JVM-owned
//! classes are represented as explicit boundary types or traits so callers do
//! not accidentally assume that Android framework behavior exists in Rust.

use std::collections::HashMap;
use std::hash::Hash;

pub const NUM_AVATAR_PARAMS: usize = 218;
pub const F_DEG_TO_RAD: f32 = 0.017_453_292;
pub const F_PI: f32 = std::f32::consts::PI;

pub mod build_config {
    pub const APPLICATION_ID: &str = "com.lumiyaviewer.lumiya";
    pub const VERSION_CODE: u32 = 66;
    pub const VERSION_NAME: &str = "3.4.2";
}

pub mod voice_build_config {
    pub const APPLICATION_ID: &str = "com.lumiyaviewer.lumiya.voice.common";
    pub const VERSION_CODE: u32 = 1;
    pub const VERSION_NAME: &str = "1.0";
}

pub mod request_codes {
    pub const ALERT_RINGTONE: u16 = 2;
    pub const FOLDER_FOR_COPY: u16 = 8;
    pub const FOLDER_FOR_MOVE: u16 = 7;
    pub const FOLDER_FOR_SAVE: u16 = 9;
    pub const ITEM_FOR_TRANSFER: u16 = 6;
    pub const LOGIN_TO_GRID: u16 = 4;
    pub const NOTIFICATION_CHANNEL_SETTINGS: u16 = 11;
    pub const SELECT_ACCOUNT: u16 = 3;
    pub const SELECT_GRID: u16 = 2;
    pub const SELECT_PICTURE_FOR_UPLOAD: u16 = 10;
    pub const TERMS_OF_SERVICE: u16 = 5;
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Hash)]
pub struct SubscriptionSingleKey;

pub trait SimpleRequestHandler<K>: RequestHandler<K> {
    fn on_request_cancelled(&mut self, _key: &K) {}
}

pub trait RequestHandler<K> {
    fn on_request(&mut self, key: &K);
    fn on_request_cancelled(&mut self, key: &K);
}

pub trait RequestHandlerLimits {
    fn max_requests_in_flight(&self) -> usize;
    fn request_timeout_millis(&self) -> u64;
    fn is_request_cancellable(&self) -> bool;
}

pub trait ResultHandler<K, T> {
    type Error;
    fn on_result_data(&mut self, key: K, data: T);
    fn on_result_error(&mut self, key: K, error: Self::Error);
}

pub trait RequestSource<K, T> {
    type Results: ResultHandler<K, T>;
    fn attach_request_handler(&mut self, handler: Box<dyn RequestHandler<K>>) -> Self::Results;
    fn detach_request_handler(&mut self);
}

pub trait RequestQueue<K, T>: RequestSource<K, T> {
    fn next_request(&mut self) -> Option<K>;
    fn return_request(&mut self, key: K);
    fn wait_for_request(&mut self) -> Option<K>;
}

pub trait Subscribable<K, T> {
    type Subscription;
    fn subscribe(&mut self, key: K, callback: Box<dyn FnMut(&T)>) -> Self::Subscription;
}

pub trait GlTexture {
    fn set_as_texture(&self) -> u32;
    fn dimensions(&self) -> (u32, u32);
    fn component_count(&self) -> u8;
    fn byte(&self, index: usize) -> u8;
    fn rgb(&self, index: usize) -> u32;
}

pub trait SlMessageEventListener<M> {
    fn on_message_acknowledged(&mut self, message: &M);
    fn on_message_timeout(&mut self, message: &M);
}

pub trait InlineListEntry<T> {
    fn next(&self) -> Option<&T>;
    fn previous(&self) -> Option<&T>;
    fn request_entry_removal(&mut self);
}

pub trait ChatterDisplayInfo<C, B, U> {
    type Id;
    fn build_view(&self, context: &C, builder: &mut B, user_manager: &U);
    fn chatter_id(&self, user_manager: &U) -> Self::Id;
    fn display_name(&self) -> Option<&str>;
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct SlTaskInventory<E> {
    pub entries: Vec<E>,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct CircuitInfo {
    pub agent_id: [u8; 16],
    pub session_id: [u8; 16],
    pub circuit_code: u32,
    pub socket_address: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ExportResult {
    pub output_file: String,
    pub raw_text: String,
    pub raw_text_title: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct CurrentLocationInfo<P, V> {
    pub parcel: Option<P>,
    pub nearby_users: usize,
    pub in_chat_range_users: usize,
    pub parcel_voice_channel: Option<V>,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct MyAvatarState {
    pub flying: bool,
    pub sitting_on: i32,
    pub sitting: bool,
    pub has_huds: bool,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct UnreadMessageInfo<M> {
    pub unread_count: usize,
    pub last_message: Option<M>,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct SlPrimObjectDisplayInfo {
    pub local_id: u32,
    pub touchable: bool,
    pub payable: bool,
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct SlObjectPrimInfo;

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct LlsdUndefined;

macro_rules! mirror_errors {
    ($($name:ident),+ $(,)?) => {$ (
        #[derive(Clone, Debug, PartialEq, Eq)]
        pub struct $name(pub String);
        impl std::fmt::Display for $name {
            fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
                formatter.write_str(&self.0)
            }
        }
        impl std::error::Error for $name {}
    )+ };
}

mirror_errors! {
    AssetFormatError, CreateFailureError, LlsdError, LlsdInvalidKeyError,
    LlsdValueTypeError, LlsdXmlError, ShaderCompileError, UnsupportedObjectTypeError
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct EventHandlerAnnotation;
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct LlsdSerializedAnnotation;
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct SlMessageHandlerAnnotation;
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct SlEventQueueMessageHandlerAnnotation;

#[derive(Clone, Debug)]
pub struct InternPool<T> {
    values: HashMap<T, T>,
}

impl<T> Default for InternPool<T> {
    fn default() -> Self {
        Self {
            values: HashMap::new(),
        }
    }
}

impl<T: Clone + Eq + Hash> InternPool<T> {
    pub fn intern(&mut self, value: T) -> T {
        self.values.entry(value.clone()).or_insert(value).clone()
    }
}

#[must_use]
pub fn identity_matrix() -> [f32; 16] {
    [
        1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0,
    ]
}

#[derive(Clone, Debug, Default, PartialEq)]
pub struct HeadTransformCompat {
    pub last_yaw: f32,
    pub neutral_yaw: f32,
    pub pitch_degrees: f32,
    pub use_buttons_yaw: f32,
    pub yaw_degrees: f32,
    pub rotation_quaternion: [f32; 4],
    pub translation: [f32; 4],
    pub head_transform: [f32; 16],
    pub right_vector_raw: [f32; 4],
    pub right_vector: [f32; 4],
    pub euler_angles: [f32; 3],
    pub neutral_yaw_valid: bool,
    pub view_extra_yaw: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TouchHudEvent {
    pub x: f32,
    pub y: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AnimationTiming {
    pub running_time: f32,
    pub in_animation_time: f32,
    pub in_factor: f32,
    pub out_factor: f32,
}

impl Default for AnimationTiming {
    fn default() -> Self {
        Self {
            running_time: 0.0,
            in_animation_time: 0.0,
            in_factor: 0.0,
            out_factor: 1.0,
        }
    }
}

impl AnimationTiming {
    #[must_use]
    pub fn has_stopped(self) -> bool {
        self.out_factor <= 0.0
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SpatialBox {
    pub x: f32,
    pub y: f32,
    pub size: f32,
    pub x_size: f32,
    pub y_size: f32,
    pub z_size: f32,
}

#[derive(Clone, Debug, PartialEq)]
pub struct SpatialListEntry<T> {
    pub data: T,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct DrawableTextParams {
    pub text: String,
    pub background_color: i32,
}

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Vector3d {
    pub x: f64,
    pub y: f64,
    pub z: f64,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MeshIndex {
    Hair,
    Head,
    Eyelash,
    UpperBody,
    LowerBody,
    EyeballLeft,
    EyeballRight,
    Skirt,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MoveControl {
    Forward,
    Backward,
    Left,
    Right,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ChatterListType {
    FriendsOnline,
    Friends,
    Active,
    Groups,
    Nearby,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct AssetData {
    pub status: i32,
    pub data: Vec<u8>,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct HoverText {
    pub text: String,
    pub color: i32,
}

impl HoverText {
    #[must_use]
    pub fn same_text(&self, other: Option<&Self>) -> bool {
        other.is_some_and(|value| value.text == self.text)
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PayInfo {
    pub default_price: i32,
    pub prices: Option<Vec<i32>>,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct EventActiveChattersChanged {
    pub agent_id: [u8; 16],
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct EventUserOnlineStatusChanged {
    pub agent_id: [u8; 16],
    pub user_id: [u8; 16],
    pub is_online: bool,
}

#[derive(Clone, Debug, PartialEq)]
pub struct BakeLayerSet<L> {
    pub baked_texture_index: usize,
    pub width: u32,
    pub height: u32,
    pub clear_alpha: bool,
    pub layers: Vec<L>,
    pub mask_layers: Vec<L>,
}

#[derive(Clone, Debug, PartialEq)]
pub struct MeshJointTranslations<B: Eq + Hash> {
    pub pelvis_offset: f32,
    pub joint_translations: HashMap<B, [f32; 3]>,
}

#[derive(Clone, Debug, PartialEq)]
pub struct MeshWeightsBuffer {
    pub joint_indices: Vec<u8>,
    pub weights: Vec<f32>,
}

impl MeshWeightsBuffer {
    #[must_use]
    pub fn with_vertex_count(count: usize) -> Self {
        Self {
            joint_indices: vec![0; count * 4],
            weights: vec![0.0; count * 4],
        }
    }
}

#[must_use]
pub fn lerp(first: f32, second: f32, factor: f32) -> f32 {
    (second - first).mul_add(factor, first)
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum RlvRestriction {
    AcceptTeleport,
    AddOutfit,
    Edit,
    ReceiveChat,
    ReceiveIm,
    Rez,
    SendChannel,
    SendChat,
    SendIm,
    ShowInventory,
    TeleportLandmark,
    TeleportLocation,
    TeleportLure,
    TeleportSit,
    Unsit,
    ViewNotecard,
}

pub trait RlvCommand {
    fn restriction(&self) -> RlvRestriction;
    fn can_have_exceptions(&self) -> bool;
}

macro_rules! restriction_commands {
    ($($name:ident => ($restriction:ident, $exceptions:literal)),+ $(,)?) => {$ (
        #[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
        pub struct $name;
        impl RlvCommand for $name {
            fn restriction(&self) -> RlvRestriction { RlvRestriction::$restriction }
            fn can_have_exceptions(&self) -> bool { $exceptions }
        }
    )+ };
}

restriction_commands! {
    RlvCmdAcceptTeleport => (AcceptTeleport, true),
    RlvCmdAddOutfit => (AddOutfit, true),
    RlvCmdEditObjects => (Edit, true),
    RlvCmdRecvChat => (ReceiveChat, true),
    RlvCmdRecvIm => (ReceiveIm, true),
    RlvCmdRezObjects => (Rez, false),
    RlvCmdSendChannel => (SendChannel, true),
    RlvCmdSendChat => (SendChat, false),
    RlvCmdSendIm => (SendIm, true),
    RlvCmdShowInventory => (ShowInventory, false),
    RlvCmdTeleportLandmark => (TeleportLandmark, false),
    RlvCmdTeleportLocation => (TeleportLocation, false),
    RlvCmdTeleportLure => (TeleportLure, true),
    RlvCmdTeleportSit => (TeleportSit, false),
    RlvCmdUnsit => (Unsit, false),
    RlvCmdViewNotecard => (ViewNotecard, false),
}

pub trait VrPose {
    fn quaternion(&self) -> [f32; 4];
    fn translation(&self) -> [f32; 3];
    fn head_view(&self) -> [f32; 16];
    fn euler_angles(&self) -> [f32; 3];
    fn right_vector(&self) -> [f32; 3];
}

pub trait VrEye {
    fn eye_type(&self) -> u8;
    fn viewport(&self) -> [i32; 4];
    fn perspective(&self, near: f32, far: f32) -> [f32; 16];
    fn is_projection_changed(&self) -> bool;
}

pub trait VrRuntime {
    type Session;
    fn runtime_id(&self) -> &str;
    fn create_session(&self) -> Self::Session;
}

/// Marker types make Android-owned implementations explicit at the FFI seam.
pub mod android_boundary {
    macro_rules! boundary_types {
        ($($name:ident),+ $(,)?) => {$ (
            #[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
            pub struct $name;
        )+ };
    }

    boundary_types! {
        ActiveChattersFragment, AudioIntentReceiver, CardboardRuntime, ChatEventOverlay,
        ConnectionFragment, EventHandler, FlexiPrimProgram, FragmentActivityFactory,
        FriendListFragment, GlLoadedTextTexture, GlResource, GlSizedResource,
        GroupListFragment, LicenseChecker, MemoryLimitedStartingExecutor, MyProfileFragment,
        NearbyUsersFragment, OnInterceptTouchEventListener, OpenXrSessionFactory,
        PrimProgram, PriorityRunnable, SettingsSubPageFragment, SlEventQueueMessageHandler,
        SlMessageHandler, UploadImageParams
    }
}

#[cfg(test)]
mod tests {
    use super::{lerp, AnimationTiming, RlvCmdSendChat, RlvCmdSendIm, RlvCommand, RlvRestriction};

    #[test]
    fn pure_algorithms_match_the_kotlin_contracts() {
        assert!((lerp(10.0, 20.0, 0.25) - 12.5).abs() < f32::EPSILON);
        assert!(!AnimationTiming::default().has_stopped());
        assert!(AnimationTiming {
            out_factor: 0.0,
            ..AnimationTiming::default()
        }
        .has_stopped());
    }

    #[test]
    fn rlv_command_metadata_preserves_exception_rules() {
        assert_eq!(RlvCmdSendIm.restriction(), RlvRestriction::SendIm);
        assert!(RlvCmdSendIm.can_have_exceptions());
        assert!(!RlvCmdSendChat.can_have_exceptions());
    }
}
