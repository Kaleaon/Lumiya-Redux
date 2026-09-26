//! Rust counterparts for the `slproto` package's pure-logic types, enums,
//! constants, and data structures extracted from the newly-converted Kotlin
//! sources.
//!
//! Kotlin remains authoritative for Android serialization. These Rust types
//! give an independently compiled inventory of the protocol's value types,
//! enum discriminants, attachment point data, asset/inventory type codes,
//! LLSD node types, mute categories, script permission masks, RLV
//! restriction variants, and core vector/quaternion math.

use std::collections::HashMap;

// ---------------------------------------------------------------------------
// types: LLVector3 — 3-component float vector with basic math.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct LLVector3 {
    pub x: f32,
    pub y: f32,
    pub z: f32,
}

impl LLVector3 {
    pub const FP_MAG_THRESHOLD: f32 = 1.0e-7;
    pub const Z_AXIS: LLVector3 = LLVector3 { x: 0.0, y: 0.0, z: 1.0 };
    pub const ZERO: LLVector3 = LLVector3 { x: 0.0, y: 0.0, z: 0.0 };

    #[must_use]
    pub const fn new(x: f32, y: f32, z: f32) -> Self {
        Self { x, y, z }
    }

    #[must_use]
    pub fn cross(a: &LLVector3, b: &LLVector3) -> LLVector3 {
        LLVector3 {
            x: a.y * b.z - b.y * a.z,
            y: a.z * b.x - b.z * a.x,
            z: a.x * b.y - b.x * a.y,
        }
    }

    #[must_use]
    pub fn lerp(a: &LLVector3, b: &LLVector3, t: f32) -> LLVector3 {
        LLVector3 {
            x: a.x + (b.x - a.x) * t,
            y: a.y + (b.y - a.y) * t,
            z: a.z + (b.z - a.z) * t,
        }
    }

    #[must_use]
    pub fn dot(&self, other: &LLVector3) -> f32 {
        self.x * other.x + self.y * other.y + self.z * other.z
    }

    #[must_use]
    pub fn magnitude_squared(&self) -> f32 {
        self.x * self.x + self.y * self.y + self.z * self.z
    }

    #[must_use]
    pub fn magnitude(&self) -> f32 {
        self.magnitude_squared().sqrt()
    }

    pub fn normalize(&mut self) {
        let mag = self.magnitude();
        if mag > Self::FP_MAG_THRESHOLD {
            let inv = 1.0 / mag;
            self.x *= inv;
            self.y *= inv;
            self.z *= inv;
        }
    }

    pub fn add(&mut self, other: &LLVector3) {
        self.x += other.x;
        self.y += other.y;
        self.z += other.z;
    }

    pub fn set(&mut self, other: &LLVector3) {
        self.x = other.x;
        self.y = other.y;
        self.z = other.z;
    }

    pub fn set_mul(&mut self, other: &LLVector3, factor: f32) {
        self.x = other.x * factor;
        self.y = other.y * factor;
        self.z = other.z * factor;
    }
}

// ---------------------------------------------------------------------------
// types: LLQuaternion — 4-component rotation quaternion.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LLQuaternion {
    pub x: f32,
    pub y: f32,
    pub z: f32,
    pub w: f32,
}

impl Default for LLQuaternion {
    fn default() -> Self {
        Self::IDENTITY
    }
}

impl LLQuaternion {
    pub const IDENTITY: LLQuaternion = LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 };

    #[must_use]
    pub const fn new(x: f32, y: f32, z: f32, w: f32) -> Self {
        Self { x, y, z, w }
    }

    #[must_use]
    pub fn magnitude_squared(&self) -> f32 {
        self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w
    }

    pub fn normalize(&mut self) {
        let mag = self.magnitude_squared().sqrt();
        if mag > LLVector3::FP_MAG_THRESHOLD {
            let inv = 1.0 / mag;
            self.x *= inv;
            self.y *= inv;
            self.z *= inv;
            self.w *= inv;
        }
    }
}

// ---------------------------------------------------------------------------
// types: LLVector2 — 2-component float vector.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct LLVector2 {
    pub x: f32,
    pub y: f32,
}

// ---------------------------------------------------------------------------
// types: LLVector4 — 4-component float vector.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct LLVector4 {
    pub x: f32,
    pub y: f32,
    pub z: f32,
    pub w: f32,
}

// ---------------------------------------------------------------------------
// inventory: SLAssetType — wire codes and string tags for asset types.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum SLAssetType {
    Texture,
    Sound,
    CallingCard,
    Landmark,
    Script,
    Clothing,
    Object,
    Notecard,
    Category,
    LslText,
    LslBytecode,
    TextureTga,
    Bodypart,
    SoundWav,
    ImageTga,
    ImageJpeg,
    Animation,
    Gesture,
    SimState,
    Link,
    LinkFolder,
    Mesh,
    Widget,
    Unknown,
}

impl SLAssetType {
    #[must_use]
    pub const fn type_code(self) -> i32 {
        match self {
            Self::Texture => 0,
            Self::Sound => 1,
            Self::CallingCard => 2,
            Self::Landmark => 3,
            Self::Script => 4,
            Self::Clothing => 5,
            Self::Object => 6,
            Self::Notecard => 7,
            Self::Category => 8,
            Self::LslText => 10,
            Self::LslBytecode => 11,
            Self::TextureTga => 12,
            Self::Bodypart => 13,
            Self::SoundWav => 17,
            Self::ImageTga => 18,
            Self::ImageJpeg => 19,
            Self::Animation => 20,
            Self::Gesture => 21,
            Self::SimState => 22,
            Self::Link => 24,
            Self::LinkFolder => 25,
            Self::Mesh => 49,
            Self::Widget => 40,
            Self::Unknown => -1,
        }
    }

    #[must_use]
    pub const fn string_code(self) -> &'static str {
        match self {
            Self::Texture => "texture",
            Self::Sound => "sound",
            Self::CallingCard => "callcard",
            Self::Landmark => "landmark",
            Self::Script => "script",
            Self::Clothing => "clothing",
            Self::Object => "object",
            Self::Notecard => "notecard",
            Self::Category => "category",
            Self::LslText => "lsltext",
            Self::LslBytecode => "lslbyte",
            Self::TextureTga => "txtr_tga",
            Self::Bodypart => "bodypart",
            Self::SoundWav => "snd_wav",
            Self::ImageTga => "img_tga",
            Self::ImageJpeg => "jpeg",
            Self::Animation => "animatn",
            Self::Gesture => "gesture",
            Self::SimState => "simstate",
            Self::Link => "link",
            Self::LinkFolder => "link_f",
            Self::Mesh => "mesh",
            Self::Widget => "widget",
            Self::Unknown => "unknown",
        }
    }

    #[must_use]
    pub fn from_type_code(code: i32) -> Self {
        match code {
            0 => Self::Texture,
            1 => Self::Sound,
            2 => Self::CallingCard,
            3 => Self::Landmark,
            4 => Self::Script,
            5 => Self::Clothing,
            6 => Self::Object,
            7 => Self::Notecard,
            8 => Self::Category,
            10 => Self::LslText,
            11 => Self::LslBytecode,
            12 => Self::TextureTga,
            13 => Self::Bodypart,
            17 => Self::SoundWav,
            18 => Self::ImageTga,
            19 => Self::ImageJpeg,
            20 => Self::Animation,
            21 => Self::Gesture,
            22 => Self::SimState,
            24 => Self::Link,
            25 => Self::LinkFolder,
            49 => Self::Mesh,
            40 => Self::Widget,
            _ => Self::Unknown,
        }
    }

    #[must_use]
    pub fn from_string_code(code: &str) -> Self {
        match code {
            "texture" => Self::Texture,
            "sound" => Self::Sound,
            "callcard" => Self::CallingCard,
            "landmark" => Self::Landmark,
            "script" => Self::Script,
            "clothing" => Self::Clothing,
            "object" => Self::Object,
            "notecard" => Self::Notecard,
            "category" => Self::Category,
            "lsltext" => Self::LslText,
            "lslbyte" => Self::LslBytecode,
            "txtr_tga" => Self::TextureTga,
            "bodypart" => Self::Bodypart,
            "snd_wav" => Self::SoundWav,
            "img_tga" => Self::ImageTga,
            "jpeg" => Self::ImageJpeg,
            "animatn" => Self::Animation,
            "gesture" => Self::Gesture,
            "simstate" => Self::SimState,
            "link" => Self::Link,
            "link_f" => Self::LinkFolder,
            "mesh" => Self::Mesh,
            "widget" => Self::Widget,
            _ => Self::Unknown,
        }
    }
}

// ---------------------------------------------------------------------------
// inventory: SLInventoryType — inventory classification codes.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum SLInventoryType {
    Texture,
    Sound,
    CallingCard,
    Landmark,
    Object,
    Notecard,
    Category,
    RootCategory,
    Lsl,
    Trash,
    Snapshot,
    Attachment,
    Wearable,
    Animation,
    Gesture,
    Mesh,
    Widget,
    Unknown,
}

impl SLInventoryType {
    #[must_use]
    pub const fn type_code(self) -> i32 {
        match self {
            Self::Texture => 0,
            Self::Sound => 1,
            Self::CallingCard => 2,
            Self::Landmark => 3,
            Self::Object => 6,
            Self::Notecard => 7,
            Self::Category => 8,
            Self::RootCategory => 9,
            Self::Lsl => 10,
            Self::Trash => 14,
            Self::Snapshot => 15,
            Self::Attachment => 17,
            Self::Wearable => 18,
            Self::Animation => 19,
            Self::Gesture => 20,
            Self::Mesh => 22,
            Self::Widget => 23,
            Self::Unknown => -1,
        }
    }

    #[must_use]
    pub const fn string_code(self) -> &'static str {
        match self {
            Self::Texture => "texture",
            Self::Sound => "sound",
            Self::CallingCard => "callcard",
            Self::Landmark => "landmark",
            Self::Object => "object",
            Self::Notecard => "notecard",
            Self::Category => "category",
            Self::RootCategory => "root",
            Self::Lsl => "script",
            Self::Trash => "trash",
            Self::Snapshot => "snapshot",
            Self::Attachment => "attach",
            Self::Wearable => "wearable",
            Self::Animation => "animation",
            Self::Gesture => "gesture",
            Self::Mesh => "mesh",
            Self::Widget => "widget",
            Self::Unknown => "unknown",
        }
    }

    #[must_use]
    pub fn from_type_code(code: i32) -> Self {
        match code {
            0 => Self::Texture,
            1 => Self::Sound,
            2 => Self::CallingCard,
            3 => Self::Landmark,
            6 => Self::Object,
            7 => Self::Notecard,
            8 => Self::Category,
            9 => Self::RootCategory,
            10 => Self::Lsl,
            14 => Self::Trash,
            15 => Self::Snapshot,
            17 => Self::Attachment,
            18 => Self::Wearable,
            19 => Self::Animation,
            20 => Self::Gesture,
            22 => Self::Mesh,
            23 => Self::Widget,
            _ => Self::Unknown,
        }
    }
}

// ---------------------------------------------------------------------------
// inventory: SLSaleType — sale classification codes.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum SLSaleType {
    Not,
    Original,
    Copy,
    Contents,
    Unknown,
}

impl SLSaleType {
    #[must_use]
    pub const fn type_code(self) -> i32 {
        match self {
            Self::Not => 0,
            Self::Original => 1,
            Self::Copy => 2,
            Self::Contents => 3,
            Self::Unknown => -1,
        }
    }

    #[must_use]
    pub const fn string_code(self) -> &'static str {
        match self {
            Self::Not => "not",
            Self::Original => "orig",
            Self::Copy => "copy",
            Self::Contents => "cntn",
            Self::Unknown => "unknown",
        }
    }

    #[must_use]
    pub fn from_type_code(code: i32) -> Self {
        match code {
            0 => Self::Not,
            1 => Self::Original,
            2 => Self::Copy,
            3 => Self::Contents,
            _ => Self::Unknown,
        }
    }
}

// ---------------------------------------------------------------------------
// types: EDeRezDestination — de-rez destination codes.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum EDeRezDestination {
    SaveIntoAgentInventory,
    AcquireToAgentInventory,
    SaveIntoTaskInventory,
    Attachment,
    TakeIntoAgentInventory,
    ForceToGodInventory,
    Trash,
    AttachmentToInv,
    AttachmentExists,
    ReturnToOwner,
    ReturnToLastOwner,
}

impl EDeRezDestination {
    #[must_use]
    pub const fn code(self) -> i32 {
        match self {
            Self::SaveIntoAgentInventory => 0,
            Self::AcquireToAgentInventory => 1,
            Self::SaveIntoTaskInventory => 2,
            Self::Attachment => 3,
            Self::TakeIntoAgentInventory => 4,
            Self::ForceToGodInventory => 5,
            Self::Trash => 6,
            Self::AttachmentToInv => 7,
            Self::AttachmentExists => 8,
            Self::ReturnToOwner => 9,
            Self::ReturnToLastOwner => 10,
        }
    }
}

// ---------------------------------------------------------------------------
// llsd: LLSDNodeType — LLSD XML element types.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum LLSDNodeType {
    Root,
    Undef,
    Boolean,
    Integer,
    Double,
    Uuid,
    String,
    Date,
    Uri,
    Binary,
    Array,
    Map,
    Key,
}

impl LLSDNodeType {
    #[must_use]
    pub const fn tag_name(self) -> &'static str {
        match self {
            Self::Root => "llsd",
            Self::Undef => "undef",
            Self::Boolean => "boolean",
            Self::Integer => "integer",
            Self::Double => "real",
            Self::Uuid => "uuid",
            Self::String => "string",
            Self::Date => "date",
            Self::Uri => "uri",
            Self::Binary => "binary",
            Self::Array => "array",
            Self::Map => "map",
            Self::Key => "key",
        }
    }

    #[must_use]
    pub fn from_tag(tag: &str) -> Option<Self> {
        match tag {
            "llsd" => Some(Self::Root),
            "undef" => Some(Self::Undef),
            "boolean" => Some(Self::Boolean),
            "integer" => Some(Self::Integer),
            "real" => Some(Self::Double),
            "uuid" => Some(Self::Uuid),
            "string" => Some(Self::String),
            "date" => Some(Self::Date),
            "uri" => Some(Self::Uri),
            "binary" => Some(Self::Binary),
            "array" => Some(Self::Array),
            "map" => Some(Self::Map),
            "key" => Some(Self::Key),
            _ => None,
        }
    }
}

// ---------------------------------------------------------------------------
// mutelist: MuteType — mute-list entry categories.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum MuteType {
    ByName,
    Agent,
    Object,
    Group,
    External,
}

impl MuteType {
    #[must_use]
    pub const fn view_order(self) -> u8 {
        match self {
            Self::ByName => 2,
            Self::Agent => 0,
            Self::Object => 1,
            Self::Group => 3,
            Self::External => 4,
        }
    }
}

// ---------------------------------------------------------------------------
// avatar: SLScriptPermissions — LSL script permission bitmasks.
// ---------------------------------------------------------------------------

pub mod script_permissions {
    pub const DEBIT: u32 = 2;
    pub const TAKE_CONTROLS: u32 = 4;
    pub const REMAP_CONTROLS: u32 = 8;
    pub const TRIGGER_ANIMATION: u32 = 16;
    pub const ATTACH: u32 = 32;
    pub const RELEASE_OWNERSHIP: u32 = 64;
    pub const CHANGE_LINKS: u32 = 128;
    pub const CHANGE_JOINTS: u32 = 256;
    pub const CHANGE_PERMISSIONS: u32 = 512;
    pub const TRACK_CAMERA: u32 = 1024;
    pub const CONTROL_CAMERA: u32 = 2048;

    #[derive(Clone, Copy, Debug, PartialEq, Eq)]
    pub struct ScriptPermission {
        pub mask: u32,
        pub message: &'static str,
    }

    pub const ALL_PERMISSIONS: &[ScriptPermission] = &[
        ScriptPermission { mask: DEBIT, message: "take Linden dollars (L$) from you" },
        ScriptPermission { mask: TAKE_CONTROLS, message: "act on your control inputs" },
        ScriptPermission { mask: REMAP_CONTROLS, message: "remap your control inputs" },
        ScriptPermission { mask: TRIGGER_ANIMATION, message: "animate your avatar" },
        ScriptPermission { mask: ATTACH, message: "attach to your avatar" },
        ScriptPermission { mask: RELEASE_OWNERSHIP, message: "release ownership and become public" },
        ScriptPermission { mask: CHANGE_LINKS, message: "link and delink from other objects" },
        ScriptPermission { mask: CHANGE_JOINTS, message: "add and remove joints with other objects" },
        ScriptPermission { mask: CHANGE_PERMISSIONS, message: "change its permissions" },
        ScriptPermission { mask: TRACK_CAMERA, message: "track your camera" },
        ScriptPermission { mask: CONTROL_CAMERA, message: "control your camera" },
    ];
}

// ---------------------------------------------------------------------------
// avatar: AvatarTextureFaceIndex — texture entry face indices.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
#[repr(u8)]
pub enum AvatarTextureFaceIndex {
    TexHeadBodypaint = 0,
    TexUpperShirt = 1,
    TexLowerPants = 2,
    TexEyesIris = 3,
    TexHair = 4,
    TexUpperBodypaint = 5,
    TexLowerBodypaint = 6,
    TexLowerShoes = 7,
    TexHeadBaked = 8,
    TexUpperBaked = 9,
    TexLowerBaked = 10,
    TexEyesBaked = 11,
    TexLowerSocks = 12,
    TexUpperJacket = 13,
    TexLowerJacket = 14,
    TexUpperGloves = 15,
    TexUpperUndershirt = 16,
    TexLowerUnderpants = 17,
    TexSkirt = 18,
    TexSkirtBaked = 19,
    TexHairBaked = 20,
    TexLowerAlpha = 21,
    TexUpperAlpha = 22,
    TexHeadAlpha = 23,
    TexEyesAlpha = 24,
    TexHairAlpha = 25,
    TexHeadTattoo = 26,
    TexUpperTattoo = 27,
    TexLowerTattoo = 28,
    TexHeadUniversalTattoo = 29,
    TexUpperUniversalTattoo = 30,
    TexLowerUniversalTattoo = 31,
    TexSkirtTattoo = 32,
    TexHairTattoo = 33,
    TexEyesTattoo = 34,
    TexLeftArmTattoo = 35,
    TexLeftLegTattoo = 36,
    TexAux1Tattoo = 37,
    TexAux2Tattoo = 38,
    TexAux3Tattoo = 39,
    TexLeftArmBaked = 40,
    TexLeftLegBaked = 41,
    TexAux1Baked = 42,
    TexAux2Baked = 43,
    TexAux3Baked = 44,
}

impl AvatarTextureFaceIndex {
    #[must_use]
    pub const fn baked_texture_name(self) -> &'static str {
        match self {
            Self::TexHeadBodypaint | Self::TexHeadBaked | Self::TexHeadAlpha
            | Self::TexHeadTattoo | Self::TexHeadUniversalTattoo => "head",
            Self::TexUpperShirt | Self::TexUpperBodypaint | Self::TexUpperBaked
            | Self::TexUpperJacket | Self::TexUpperGloves | Self::TexUpperUndershirt
            | Self::TexUpperAlpha | Self::TexUpperTattoo
            | Self::TexUpperUniversalTattoo => "upper",
            Self::TexLowerPants | Self::TexLowerBodypaint | Self::TexLowerBaked
            | Self::TexLowerShoes | Self::TexLowerSocks | Self::TexLowerJacket
            | Self::TexLowerUnderpants | Self::TexLowerAlpha
            | Self::TexLowerTattoo | Self::TexLowerUniversalTattoo => "lower",
            Self::TexEyesIris | Self::TexEyesBaked | Self::TexEyesAlpha
            | Self::TexEyesTattoo => "eyes",
            Self::TexHair | Self::TexHairBaked | Self::TexHairAlpha
            | Self::TexHairTattoo => "hair",
            Self::TexSkirt | Self::TexSkirtBaked | Self::TexSkirtTattoo => "skirt",
            Self::TexLeftArmTattoo | Self::TexLeftArmBaked => "leftarm",
            Self::TexLeftLegTattoo | Self::TexLeftLegBaked => "leftleg",
            Self::TexAux1Tattoo | Self::TexAux1Baked => "aux1",
            Self::TexAux2Tattoo | Self::TexAux2Baked => "aux2",
            Self::TexAux3Tattoo | Self::TexAux3Baked => "aux3",
        }
    }
}

// ---------------------------------------------------------------------------
// avatar: BakedTextureIndex — baked texture slots.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum BakedTextureIndex {
    Head,
    Upper,
    Lower,
    Eyes,
    Skirt,
    Hair,
}

impl BakedTextureIndex {
    #[must_use]
    pub const fn face_index(self) -> AvatarTextureFaceIndex {
        match self {
            Self::Head => AvatarTextureFaceIndex::TexHeadBaked,
            Self::Upper => AvatarTextureFaceIndex::TexUpperBaked,
            Self::Lower => AvatarTextureFaceIndex::TexLowerBaked,
            Self::Eyes => AvatarTextureFaceIndex::TexEyesBaked,
            Self::Skirt => AvatarTextureFaceIndex::TexSkirtBaked,
            Self::Hair => AvatarTextureFaceIndex::TexHairBaked,
        }
    }
}

// ---------------------------------------------------------------------------
// avatar: SLAttachmentPoint — attachment point metadata.
// ---------------------------------------------------------------------------

pub mod attachment_points {
    use super::{LLVector3, LLQuaternion};

    pub const NON_HUD_ATTACHMENT_POINTS: usize = 47;
    pub const NUM_ATTACHMENT_POINTS: usize = 56;

    #[derive(Clone, Debug)]
    pub struct AttachmentPoint {
        pub id: u8,
        pub name: &'static str,
        pub non_hud_index: i8,
        pub is_hud: bool,
        pub position: LLVector3,
        pub rotation: LLQuaternion,
    }

    pub const NON_HUD_POINT_IDS: &[u8] = &[
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
        20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 39, 40, 41, 42, 43, 44,
        45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55,
    ];

    /// Look up an attachment point by its 1-based ID.
    #[must_use]
    pub fn by_id(id: u8) -> Option<AttachmentPoint> {
        POINTS.iter().find(|p| p.id == id).cloned()
    }

    /// Look up an attachment point by name (case-sensitive).
    #[must_use]
    pub fn by_name(name: &str) -> Option<AttachmentPoint> {
        POINTS.iter().find(|p| p.name == name).cloned()
    }

    pub const POINTS: &[AttachmentPoint] = &[
        AttachmentPoint { id: 1, name: "Chest", non_hud_index: 0, is_hud: false, position: LLVector3 { x: 0.15, y: 0.0, z: -0.1 }, rotation: LLQuaternion { x: 0.5, y: 0.5, z: 0.5, w: 0.5 } },
        AttachmentPoint { id: 2, name: "Skull", non_hud_index: 1, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.15 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.707107, w: 0.707107 } },
        AttachmentPoint { id: 3, name: "Left Shoulder", non_hud_index: 2, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.08 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 4, name: "Right Shoulder", non_hud_index: 3, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.08 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 5, name: "Left Hand", non_hud_index: 4, is_hud: false, position: LLVector3 { x: 0.0, y: 0.08, z: -0.02 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 6, name: "Right Hand", non_hud_index: 5, is_hud: false, position: LLVector3 { x: 0.0, y: -0.08, z: -0.02 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 7, name: "Left Foot", non_hud_index: 6, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 8, name: "Right Foot", non_hud_index: 7, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 9, name: "Spine", non_hud_index: 8, is_hud: false, position: LLVector3 { x: -0.15, y: 0.0, z: -0.1 }, rotation: LLQuaternion { x: -0.5, y: -0.5, z: 0.5, w: 0.5 } },
        AttachmentPoint { id: 10, name: "Pelvis", non_hud_index: 9, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: -0.15 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 11, name: "Mouth", non_hud_index: 10, is_hud: false, position: LLVector3 { x: 0.12, y: 0.0, z: 0.001 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 12, name: "Chin", non_hud_index: 11, is_hud: false, position: LLVector3 { x: 0.12, y: 0.0, z: -0.04 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 13, name: "Left Ear", non_hud_index: 12, is_hud: false, position: LLVector3 { x: 0.015, y: 0.08, z: 0.017 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 14, name: "Right Ear", non_hud_index: 13, is_hud: false, position: LLVector3 { x: 0.015, y: -0.08, z: 0.017 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 15, name: "Left Eyeball", non_hud_index: 14, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 16, name: "Right Eyeball", non_hud_index: 15, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 17, name: "Nose", non_hud_index: 16, is_hud: false, position: LLVector3 { x: 0.1, y: 0.0, z: 0.05 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 18, name: "R Upper Arm", non_hud_index: 17, is_hud: false, position: LLVector3 { x: 0.01, y: -0.13, z: 0.01 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 19, name: "R Forearm", non_hud_index: 18, is_hud: false, position: LLVector3 { x: 0.0, y: -0.12, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 20, name: "L Upper Arm", non_hud_index: 19, is_hud: false, position: LLVector3 { x: 0.01, y: 0.15, z: -0.01 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 21, name: "L Forearm", non_hud_index: 20, is_hud: false, position: LLVector3 { x: 0.0, y: 0.113, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 22, name: "Right Hip", non_hud_index: 21, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 23, name: "R Upper Leg", non_hud_index: 22, is_hud: false, position: LLVector3 { x: -0.017, y: 0.041, z: -0.31 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 24, name: "R Lower Leg", non_hud_index: 23, is_hud: false, position: LLVector3 { x: -0.044, y: -0.007, z: -0.262 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 25, name: "Left Hip", non_hud_index: 24, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 26, name: "L Upper Leg", non_hud_index: 25, is_hud: false, position: LLVector3 { x: -0.019, y: -0.034, z: -0.31 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 27, name: "L Lower Leg", non_hud_index: 26, is_hud: false, position: LLVector3 { x: -0.044, y: -0.007, z: -0.261 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 28, name: "Stomach", non_hud_index: 27, is_hud: false, position: LLVector3 { x: 0.092, y: 0.0, z: 0.088 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 29, name: "Left Pec", non_hud_index: 28, is_hud: false, position: LLVector3 { x: 0.104, y: 0.082, z: 0.247 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 30, name: "Right Pec", non_hud_index: 29, is_hud: false, position: LLVector3 { x: 0.104, y: -0.082, z: 0.247 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 31, name: "Center 2", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 32, name: "Top Right", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: -0.5, z: 0.5 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 33, name: "Top", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: 0.0, z: 0.5 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 34, name: "Top Left", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: 0.5, z: 0.5 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 35, name: "Center", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 36, name: "Bottom Left", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: 0.5, z: -0.5 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 37, name: "Bottom", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: 0.0, z: -0.5 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 38, name: "Bottom Right", non_hud_index: -1, is_hud: true, position: LLVector3 { x: 0.0, y: -0.5, z: -0.5 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 39, name: "Neck", non_hud_index: 30, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 40, name: "Avatar Center", non_hud_index: 31, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 41, name: "Left Ring Finger", non_hud_index: 32, is_hud: false, position: LLVector3 { x: -0.006, y: 0.019, z: -0.002 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 42, name: "Right Ring Finger", non_hud_index: 33, is_hud: false, position: LLVector3 { x: -0.006, y: -0.019, z: -0.002 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 43, name: "Tail Base", non_hud_index: 34, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 44, name: "Tail Tip", non_hud_index: 35, is_hud: false, position: LLVector3 { x: -0.025, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 45, name: "Left Wing", non_hud_index: 36, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 46, name: "Right Wing", non_hud_index: 37, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 47, name: "Jaw", non_hud_index: 38, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 48, name: "Alt Left Ear", non_hud_index: 39, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 49, name: "Alt Right Ear", non_hud_index: 40, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 50, name: "Alt Left Eye", non_hud_index: 41, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 51, name: "Alt Right Eye", non_hud_index: 42, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 52, name: "Tongue", non_hud_index: 43, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 53, name: "Groin", non_hud_index: 44, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 54, name: "Left Hind Foot", non_hud_index: 45, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
        AttachmentPoint { id: 55, name: "Right Hind Foot", non_hud_index: 46, is_hud: false, position: LLVector3 { x: 0.0, y: 0.0, z: 0.0 }, rotation: LLQuaternion { x: 0.0, y: 0.0, z: 0.0, w: 1.0 } },
    ];
}

// ---------------------------------------------------------------------------
// rlv: RLVRestrictionType — RLV restriction categories.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum RlvRuleMatchType {
    TargetSpecifiesException,
    TargetSpecifiesRestriction,
    TargetNoExceptions,
    TargetSpecifiesAllowance,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum RlvRestrictionType {
    Detach,
    SendChat,
    RecvChat,
    SendIm,
    RecvIm,
    Tplm,
    Tploc,
    Sittp,
    Tplure,
    AcceptTp,
    ShowInv,
    ViewNote,
    Edit,
    Rez,
    Unsit,
    Sit,
    RemOutfit,
    AddOutfit,
    RedirChat,
    SendChannel,
}

impl RlvRestrictionType {
    #[must_use]
    pub const fn rule_match_type(self) -> RlvRuleMatchType {
        match self {
            Self::Detach => RlvRuleMatchType::TargetSpecifiesRestriction,
            Self::SendChat => RlvRuleMatchType::TargetNoExceptions,
            Self::RecvChat => RlvRuleMatchType::TargetSpecifiesException,
            Self::SendIm => RlvRuleMatchType::TargetSpecifiesException,
            Self::RecvIm => RlvRuleMatchType::TargetSpecifiesException,
            Self::Tplm => RlvRuleMatchType::TargetNoExceptions,
            Self::Tploc => RlvRuleMatchType::TargetNoExceptions,
            Self::Sittp => RlvRuleMatchType::TargetNoExceptions,
            Self::Tplure => RlvRuleMatchType::TargetSpecifiesException,
            Self::AcceptTp => RlvRuleMatchType::TargetSpecifiesAllowance,
            Self::ShowInv => RlvRuleMatchType::TargetNoExceptions,
            Self::ViewNote => RlvRuleMatchType::TargetNoExceptions,
            Self::Edit => RlvRuleMatchType::TargetSpecifiesException,
            Self::Rez => RlvRuleMatchType::TargetNoExceptions,
            Self::Unsit => RlvRuleMatchType::TargetNoExceptions,
            Self::Sit => RlvRuleMatchType::TargetNoExceptions,
            Self::RemOutfit => RlvRuleMatchType::TargetSpecifiesRestriction,
            Self::AddOutfit => RlvRuleMatchType::TargetSpecifiesRestriction,
            Self::RedirChat => RlvRuleMatchType::TargetSpecifiesRestriction,
            Self::SendChannel => RlvRuleMatchType::TargetSpecifiesException,
        }
    }
}

// ---------------------------------------------------------------------------
// xfer: ELLPath — LL filesystem path constants.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum ELLPath {
    None,
    UserSettings,
    AppSettings,
    PerSlAccount,
    Cache,
    Character,
    Help,
    Logs,
    Temp,
    Skins,
    TopSkin,
    ChatLogs,
    PerAccountChatLogs,
    UserSkin,
    LocalAssets,
    Executable,
    DefaultSkin,
    Fonts,
}

impl ELLPath {
    #[must_use]
    pub const fn code(self) -> u8 {
        match self {
            Self::None => 0,
            Self::UserSettings => 1,
            Self::AppSettings => 2,
            Self::PerSlAccount => 3,
            Self::Cache => 4,
            Self::Character => 5,
            Self::Help => 6,
            Self::Logs => 7,
            Self::Temp => 8,
            Self::Skins => 9,
            Self::TopSkin => 10,
            Self::ChatLogs => 11,
            Self::PerAccountChatLogs => 12,
            Self::UserSkin => 14,
            Self::LocalAssets => 15,
            Self::Executable => 16,
            Self::DefaultSkin => 17,
            Self::Fonts => 18,
        }
    }
}

// ---------------------------------------------------------------------------
// SLMessage — wire-protocol message framing constants.
// ---------------------------------------------------------------------------

pub mod message_constants {
    pub const LL_ACK_FLAG: u8 = 0x10;
    pub const LL_RELIABLE_FLAG: u8 = 0x40;
    pub const LL_RESENT_FLAG: u8 = 0x20;
    pub const LL_ZERO_CODE_FLAG: u8 = 0x80;
    pub const MAX_MESSAGE_SIZE: usize = 65536;
    pub const MAX_PAYLOAD_SIZE: usize = 1018;
    pub const MAX_TRANSMIT_SIZE: usize = 1024;
}

// ---------------------------------------------------------------------------
// wearable: SLWearableType — wearable layer categories.
// ---------------------------------------------------------------------------

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum SLWearableType {
    Shape,
    Skin,
    Hair,
    Eyes,
    Shirt,
    Pants,
    Shoes,
    Socks,
    Jacket,
    Gloves,
    Undershirt,
    Underpants,
    Skirt,
    Alpha,
    Tattoo,
    Physics,
    UniversalTattoo,
    Invalid,
}

impl SLWearableType {
    #[must_use]
    pub const fn type_code(self) -> i32 {
        match self {
            Self::Shape => 0,
            Self::Skin => 1,
            Self::Hair => 2,
            Self::Eyes => 3,
            Self::Shirt => 4,
            Self::Pants => 5,
            Self::Shoes => 6,
            Self::Socks => 7,
            Self::Jacket => 8,
            Self::Gloves => 9,
            Self::Undershirt => 10,
            Self::Underpants => 11,
            Self::Skirt => 12,
            Self::Alpha => 13,
            Self::Tattoo => 14,
            Self::Physics => 15,
            Self::UniversalTattoo => 16,
            Self::Invalid => -1,
        }
    }

    #[must_use]
    pub fn from_type_code(code: i32) -> Self {
        match code {
            0 => Self::Shape,
            1 => Self::Skin,
            2 => Self::Hair,
            3 => Self::Eyes,
            4 => Self::Shirt,
            5 => Self::Pants,
            6 => Self::Shoes,
            7 => Self::Socks,
            8 => Self::Jacket,
            9 => Self::Gloves,
            10 => Self::Undershirt,
            11 => Self::Underpants,
            12 => Self::Skirt,
            13 => Self::Alpha,
            14 => Self::Tattoo,
            15 => Self::Physics,
            16 => Self::UniversalTattoo,
            _ => Self::Invalid,
        }
    }
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn vector3_cross_product() {
        let a = LLVector3::new(1.0, 0.0, 0.0);
        let b = LLVector3::new(0.0, 1.0, 0.0);
        let c = LLVector3::cross(&a, &b);
        assert!((c.x).abs() < 1e-6);
        assert!((c.y).abs() < 1e-6);
        assert!((c.z - 1.0).abs() < 1e-6);
    }

    #[test]
    fn vector3_lerp() {
        let a = LLVector3::ZERO;
        let b = LLVector3::new(2.0, 4.0, 6.0);
        let mid = LLVector3::lerp(&a, &b, 0.5);
        assert!((mid.x - 1.0).abs() < 1e-6);
        assert!((mid.y - 2.0).abs() < 1e-6);
        assert!((mid.z - 3.0).abs() < 1e-6);
    }

    #[test]
    fn asset_type_round_trip() {
        for code in &[0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 20, 21, 49] {
            let at = SLAssetType::from_type_code(*code);
            assert_eq!(at.type_code(), *code);
        }
    }

    #[test]
    fn asset_type_string_round_trip() {
        let at = SLAssetType::from_string_code("landmark");
        assert_eq!(at, SLAssetType::Landmark);
        assert_eq!(at.string_code(), "landmark");
        assert_eq!(at.type_code(), 3);
    }

    #[test]
    fn inventory_type_round_trip() {
        let it = SLInventoryType::from_type_code(10);
        assert_eq!(it, SLInventoryType::Lsl);
        assert_eq!(it.string_code(), "script");
    }

    #[test]
    fn sale_type_codes() {
        assert_eq!(SLSaleType::Not.type_code(), 0);
        assert_eq!(SLSaleType::Original.string_code(), "orig");
        assert_eq!(SLSaleType::from_type_code(99), SLSaleType::Unknown);
    }

    #[test]
    fn derez_destination_codes() {
        assert_eq!(EDeRezDestination::Trash.code(), 6);
        assert_eq!(EDeRezDestination::ReturnToOwner.code(), 9);
    }

    #[test]
    fn llsd_node_type_round_trip() {
        assert_eq!(LLSDNodeType::from_tag("integer"), Some(LLSDNodeType::Integer));
        assert_eq!(LLSDNodeType::Integer.tag_name(), "integer");
        assert_eq!(LLSDNodeType::from_tag("nonexistent"), None);
    }

    #[test]
    fn mute_type_view_order() {
        assert_eq!(MuteType::Agent.view_order(), 0);
        assert_eq!(MuteType::External.view_order(), 4);
    }

    #[test]
    fn script_permission_masks() {
        assert_eq!(script_permissions::DEBIT, 2);
        assert_eq!(script_permissions::CONTROL_CAMERA, 2048);
        assert_eq!(script_permissions::ALL_PERMISSIONS.len(), 11);
    }

    #[test]
    fn attachment_point_lookup() {
        let chest = attachment_points::by_id(1).expect("chest point");
        assert_eq!(chest.name, "Chest");
        assert!(!chest.is_hud);

        let hud = attachment_points::by_id(35).expect("center HUD");
        assert_eq!(hud.name, "Center");
        assert!(hud.is_hud);

        assert_eq!(attachment_points::POINTS.len(), 55);
        assert_eq!(attachment_points::NON_HUD_POINT_IDS.len(), 47);
    }

    #[test]
    fn baked_texture_face_index() {
        assert_eq!(
            AvatarTextureFaceIndex::TexHeadBaked.baked_texture_name(),
            "head"
        );
        assert_eq!(
            AvatarTextureFaceIndex::TexSkirt.baked_texture_name(),
            "skirt"
        );
    }

    #[test]
    fn rlv_restriction_match_types() {
        assert_eq!(
            RlvRestrictionType::Detach.rule_match_type(),
            RlvRuleMatchType::TargetSpecifiesRestriction
        );
        assert_eq!(
            RlvRestrictionType::SendChat.rule_match_type(),
            RlvRuleMatchType::TargetNoExceptions
        );
    }

    #[test]
    fn ell_path_codes() {
        assert_eq!(ELLPath::Cache.code(), 4);
        assert_eq!(ELLPath::Fonts.code(), 18);
    }

    #[test]
    fn message_framing_constants() {
        assert_eq!(message_constants::LL_ZERO_CODE_FLAG, 0x80);
        assert_eq!(message_constants::MAX_TRANSMIT_SIZE, 1024);
    }

    #[test]
    fn wearable_type_round_trip() {
        assert_eq!(SLWearableType::from_type_code(4), SLWearableType::Shirt);
        assert_eq!(SLWearableType::Shirt.type_code(), 4);
        assert_eq!(SLWearableType::from_type_code(99), SLWearableType::Invalid);
    }
}
