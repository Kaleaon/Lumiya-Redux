//! Rust counterparts for the batch-4 (dao + orm) Kotlin migration.
//!
//! Pure, deterministic algorithms and data shapes extracted from these
//! sources are mirrored directly and covered by tests.  Classes whose whole
//! purpose is Android lifecycle, SQLite DDL, greenDAO boilerplate, or
//! Parcelable serialization are represented as explicit Android-boundary
//! marker types instead: no logic is invented for them.

// ---------------------------------------------------------------------------
// constants: DaoMaster schema version
// ---------------------------------------------------------------------------

/// greenDAO schema version from `DaoMaster.SCHEMA_VERSION`.
pub const SCHEMA_VERSION: i32 = 71;

// ---------------------------------------------------------------------------
// constants: InventoryEntryDBObject blob layout
// ---------------------------------------------------------------------------

/// Size of the packed `_blobField` in `InventoryEntryDBObject`.
/// Layout: 6 UUIDs (16 bytes each = 96) + 1 byte `isGroupOwned` + 7 i32s (28 bytes) = 125.
pub const INVENTORY_BLOB_FIELD_SIZE: usize = 125;

/// Number of bind parameters for insert/update in `InventoryEntryDBObject`.
pub const INVENTORY_INSERT_UPDATE_PARAM_COUNT: usize = 18;

// ---------------------------------------------------------------------------
// constants: DAO table names (mirrors the `TABLENAME` companion vals)
// ---------------------------------------------------------------------------

pub const TABLE_CACHED_ASSETS: &str = "CachedAssets";
pub const TABLE_CACHED_RESPONSES: &str = "CachedResponses";
pub const TABLE_CHAT_MESSAGE: &str = "CHAT_MESSAGE";
pub const TABLE_CHATTER: &str = "CHATTER";
pub const TABLE_FRIENDS: &str = "Friends";
pub const TABLE_GROUP_MEMBERS: &str = "GroupMembers";
pub const TABLE_GROUP_MEMBER_LISTS: &str = "GroupMemberLists";
pub const TABLE_GROUP_ROLE_MEMBERS: &str = "GroupRoleMembers";
pub const TABLE_GROUP_ROLE_MEMBER_LISTS: &str = "GroupRoleMemberLists";
pub const TABLE_MONEY_TRANSACTION: &str = "MONEY_TRANSACTION";
pub const TABLE_MUTE_LIST_CACHED_DATA: &str = "MUTE_LIST_CACHED_DATA";
pub const TABLE_SEARCH_GRID_RESULTS: &str = "SearchGridResults";
pub const TABLE_USERS: &str = "Users";
pub const TABLE_USER_NAMES: &str = "UserNames";
pub const TABLE_USER_PIC: &str = "USER_PIC";
pub const TABLE_INVENTORY_ENTRIES: &str = "Entries";

// ---------------------------------------------------------------------------
// constants: InventoryDB batch size
// ---------------------------------------------------------------------------

/// Maximum updates per SQLite transaction before yielding, from `InventoryDB`.
pub const MAX_UPDATES_PER_TRANSACTION: usize = 16;

// ---------------------------------------------------------------------------
// behavior: User.nameNeedsFetching — pure predicate
// ---------------------------------------------------------------------------

/// Mirrors `User.nameNeedsFetching()`:
/// Returns `true` when a user-name fetch is needed (both name slots are
/// incomplete *and* the UUID is not flagged as bad).
#[must_use]
pub fn user_name_needs_fetching(
    user_name: Option<&str>,
    display_name: Option<&str>,
    bad_uuid: bool,
) -> bool {
    if user_name.is_none() || display_name.is_none() {
        !bad_uuid
    } else {
        false
    }
}

// ---------------------------------------------------------------------------
// behavior: InventoryEntryDBObject blob pack/unpack
// ---------------------------------------------------------------------------

/// A UUID stored as two i64 halves, matching the JVM `UUID(msb, lsb)` layout.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct UuidPair {
    pub most_significant_bits: i64,
    pub least_significant_bits: i64,
}

/// The fields packed inside `InventoryEntryDBObject._blobField`.
#[derive(Debug, Clone, PartialEq, Eq, Default)]
pub struct InventoryBlobFields {
    pub agent_uuid: UuidPair,
    pub asset_uuid: UuidPair,
    pub creator_uuid: UuidPair,
    pub owner_uuid: UuidPair,
    pub group_uuid: UuidPair,
    pub last_owner_uuid: UuidPair,
    pub is_group_owned: bool,
    pub base_mask: i32,
    pub group_mask: i32,
    pub owner_mask: i32,
    pub next_owner_mask: i32,
    pub everyone_mask: i32,
    pub sale_type: i32,
    pub sale_price: i32,
}

/// Packs `InventoryBlobFields` into a 125-byte big-endian blob, matching the
/// `ByteBuffer.wrap(new byte[125])` + `putLong`/`putInt`/`put` sequence in
/// `InventoryEntryDBObject.bindInsertOrUpdate` and `getContentValues`.
#[must_use]
pub fn pack_inventory_blob(fields: &InventoryBlobFields) -> [u8; INVENTORY_BLOB_FIELD_SIZE] {
    let mut buf = [0u8; INVENTORY_BLOB_FIELD_SIZE];
    let mut pos = 0;

    for uuid in &[
        fields.agent_uuid,
        fields.asset_uuid,
        fields.creator_uuid,
        fields.owner_uuid,
        fields.group_uuid,
        fields.last_owner_uuid,
    ] {
        buf[pos..pos + 8].copy_from_slice(&uuid.most_significant_bits.to_be_bytes());
        pos += 8;
        buf[pos..pos + 8].copy_from_slice(&uuid.least_significant_bits.to_be_bytes());
        pos += 8;
    }

    buf[pos] = if fields.is_group_owned { 1 } else { 0 };
    pos += 1;

    for val in &[
        fields.base_mask,
        fields.group_mask,
        fields.owner_mask,
        fields.next_owner_mask,
        fields.everyone_mask,
        fields.sale_type,
        fields.sale_price,
    ] {
        buf[pos..pos + 4].copy_from_slice(&val.to_be_bytes());
        pos += 4;
    }

    debug_assert_eq!(pos, INVENTORY_BLOB_FIELD_SIZE);
    buf
}

/// Unpacks a 125-byte big-endian blob into `InventoryBlobFields`, matching the
/// `ByteBuffer.wrap(cursor.getBlob(18))` sequence in
/// `InventoryEntryDBObject.loadFromCursor`.
///
/// Returns `None` if the slice length is not exactly 125.
#[must_use]
pub fn unpack_inventory_blob(blob: &[u8]) -> Option<InventoryBlobFields> {
    if blob.len() != INVENTORY_BLOB_FIELD_SIZE {
        return None;
    }

    let mut pos = 0;

    let read_i64 = |p: &mut usize| -> i64 {
        let v = i64::from_be_bytes(blob[*p..*p + 8].try_into().unwrap());
        *p += 8;
        v
    };

    let read_uuid = |p: &mut usize| -> UuidPair {
        UuidPair {
            most_significant_bits: read_i64(p),
            least_significant_bits: read_i64(p),
        }
    };

    let agent_uuid = read_uuid(&mut pos);
    let asset_uuid = read_uuid(&mut pos);
    let creator_uuid = read_uuid(&mut pos);
    let owner_uuid = read_uuid(&mut pos);
    let group_uuid = read_uuid(&mut pos);
    let last_owner_uuid = read_uuid(&mut pos);

    let is_group_owned = blob[pos] != 0;
    pos += 1;

    let read_i32 = |p: &mut usize| -> i32 {
        let v = i32::from_be_bytes(blob[*p..*p + 4].try_into().unwrap());
        *p += 4;
        v
    };

    let base_mask = read_i32(&mut pos);
    let group_mask = read_i32(&mut pos);
    let owner_mask = read_i32(&mut pos);
    let next_owner_mask = read_i32(&mut pos);
    let everyone_mask = read_i32(&mut pos);
    let sale_type = read_i32(&mut pos);
    let sale_price = read_i32(&mut pos);

    debug_assert_eq!(pos, INVENTORY_BLOB_FIELD_SIZE);

    Some(InventoryBlobFields {
        agent_uuid,
        asset_uuid,
        creator_uuid,
        owner_uuid,
        group_uuid,
        last_owner_uuid,
        is_group_owned,
        base_mask,
        group_mask,
        owner_mask,
        next_owner_mask,
        everyone_mask,
        sale_type,
        sale_price,
    })
}

// ---------------------------------------------------------------------------
// Android-boundary marker types (no extractable logic)
// ---------------------------------------------------------------------------

/// Marker: `InventoryEntryDBObject` — Parcelable + DBObject with SQLite DDL
/// and blob serialization.  The pack/unpack logic is extracted above.
pub struct InventoryEntryDBObjectMarker;

/// Marker: `CachedAssetDao` — greenDAO DAO for `CachedAssets` table.
pub struct CachedAssetDaoMarker;

/// Marker: `CachedResponseDao` — greenDAO DAO for `CachedResponses` table.
pub struct CachedResponseDaoMarker;

/// Marker: `ChatMessage` — greenDAO entity with 30 fields.
pub struct ChatMessageMarker;

/// Marker: `ChatMessageDao` — greenDAO DAO for `CHAT_MESSAGE` table.
pub struct ChatMessageDaoMarker;

/// Marker: `Chatter` — greenDAO entity with 8 fields.
pub struct ChatterMarker;

/// Marker: `ChatterDao` — greenDAO DAO for `CHATTER` table.
pub struct ChatterDaoMarker;

/// Marker: `DaoMaster` — greenDAO `AbstractDaoMaster`, schema version 71.
pub struct DaoMasterMarker;

/// Marker: `DaoSession` — greenDAO `AbstractDaoSession`, 15 DAO instances.
pub struct DaoSessionMarker;

/// Marker: `FriendDao` — greenDAO DAO for `Friends` table.
pub struct FriendDaoMarker;

/// Marker: `GroupMemberDao` — greenDAO DAO for `GroupMembers` table.
pub struct GroupMemberDaoMarker;

/// Marker: `GroupMemberListDao` — greenDAO DAO for `GroupMemberLists` table.
pub struct GroupMemberListDaoMarker;

/// Marker: `GroupRoleMemberDao` — greenDAO DAO for `GroupRoleMembers` table.
pub struct GroupRoleMemberDaoMarker;

/// Marker: `GroupRoleMemberListDao` — greenDAO DAO for `GroupRoleMemberLists` table.
pub struct GroupRoleMemberListDaoMarker;

/// Marker: `MoneyTransactionDao` — greenDAO DAO for `MONEY_TRANSACTION` table.
pub struct MoneyTransactionDaoMarker;

/// Marker: `MuteListCachedDataDao` — greenDAO DAO for `MUTE_LIST_CACHED_DATA` table.
pub struct MuteListCachedDataDaoMarker;

/// Marker: `SearchGridResultDao` — greenDAO DAO for `SearchGridResults` table.
pub struct SearchGridResultDaoMarker;

/// Marker: `User` — greenDAO entity implementing `ChatterDisplayInfo`.
pub struct UserMarker;

/// Marker: `UserDao` — greenDAO DAO for `Users` table.
pub struct UserDaoMarker;

/// Marker: `UserNameDao` — greenDAO DAO for `UserNames` table.
pub struct UserNameDaoMarker;

/// Marker: `UserPicDao` — greenDAO DAO for `USER_PIC` table.
pub struct UserPicDaoMarker;

// ---------------------------------------------------------------------------
// tests
// ---------------------------------------------------------------------------

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_user_name_needs_fetching() {
        // Both names present -> false regardless of bad_uuid
        assert!(!user_name_needs_fetching(Some("alice"), Some("Alice"), false));
        assert!(!user_name_needs_fetching(Some("alice"), Some("Alice"), true));

        // Missing user_name -> true unless bad_uuid
        assert!(user_name_needs_fetching(None, Some("Alice"), false));
        assert!(!user_name_needs_fetching(None, Some("Alice"), true));

        // Missing display_name -> true unless bad_uuid
        assert!(user_name_needs_fetching(Some("alice"), None, false));
        assert!(!user_name_needs_fetching(Some("alice"), None, true));

        // Both missing -> true unless bad_uuid
        assert!(user_name_needs_fetching(None, None, false));
        assert!(!user_name_needs_fetching(None, None, true));
    }

    #[test]
    fn test_inventory_blob_roundtrip() {
        let fields = InventoryBlobFields {
            agent_uuid: UuidPair {
                most_significant_bits: 0x0102030405060708,
                least_significant_bits: 0x090a0b0c0d0e0f10,
            },
            asset_uuid: UuidPair {
                most_significant_bits: 0x1112131415161718,
                least_significant_bits: 0x191a1b1c1d1e1f20,
            },
            creator_uuid: UuidPair {
                most_significant_bits: 0x2122232425262728,
                least_significant_bits: 0x292a2b2c2d2e2f30,
            },
            owner_uuid: UuidPair {
                most_significant_bits: 0x3132333435363738,
                least_significant_bits: 0x393a3b3c3d3e3f40,
            },
            group_uuid: UuidPair {
                most_significant_bits: 0x4142434445464748,
                least_significant_bits: 0x494a4b4c4d4e4f50,
            },
            last_owner_uuid: UuidPair {
                most_significant_bits: 0x5152535455565758,
                least_significant_bits: 0x595a5b5c5d5e5f60,
            },
            is_group_owned: true,
            base_mask: 0x7FFFFFFF,
            group_mask: 0x00040000,
            owner_mask: 0x7FFFFFFF,
            next_owner_mask: 0x0004E000,
            everyone_mask: 0x00000000,
            sale_type: 0,
            sale_price: 10,
        };

        let packed = pack_inventory_blob(&fields);
        assert_eq!(packed.len(), INVENTORY_BLOB_FIELD_SIZE);

        let unpacked = unpack_inventory_blob(&packed).unwrap();
        assert_eq!(unpacked, fields);
    }

    #[test]
    fn test_inventory_blob_unpack_wrong_size() {
        assert!(unpack_inventory_blob(&[0u8; 0]).is_none());
        assert!(unpack_inventory_blob(&[0u8; 124]).is_none());
        assert!(unpack_inventory_blob(&[0u8; 126]).is_none());
    }

    #[test]
    fn test_inventory_blob_default() {
        let fields = InventoryBlobFields::default();
        let packed = pack_inventory_blob(&fields);
        // All zeros except position 96 (is_group_owned = false = 0)
        assert!(packed.iter().all(|&b| b == 0));
        let unpacked = unpack_inventory_blob(&packed).unwrap();
        assert_eq!(unpacked, fields);
    }
}
