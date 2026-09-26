package com.lumiyaviewer.lumiya.slproto.inventory

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteException
import android.database.sqlite.SQLiteStatement
import android.os.Parcel
import android.os.Parcelable
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.orm.DBHandle
import com.lumiyaviewer.lumiya.orm.DBObject
import com.lumiyaviewer.lumiya.orm.InventoryEntryDBObject
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.utils.SimpleStringParser
import java.util.Iterator
import java.util.UUID

open class SLInventoryEntry : InventoryEntryDBObject(), Parcelable {
    @JvmStatic var CREATOR: Parcelable.Creator<SLInventoryEntry> = Parcelable.Creator<SLInventoryEntry>() {
        /* JADX WARN: Can't rename method to resolve collision */
        fun createFromParcel(parcel: Parcel): SLInventoryEntry {
            return SLInventoryEntry(parcel, null as SLInventoryEntry)
        }

        /* JADX WARN: Can't rename method to resolve collision */
        fun newArray(i: Int): Array<SLInventoryEntry> {
            return arrayOfNulls<SLInventoryEntry>(i)
        }
    }
    @JvmStatic private var DELIM_ANY: String = " \t\n"
    @JvmStatic private var DELIM_EOL: String = "\n"
    @JvmStatic var FT_ANIMATION: Int = 20
    @JvmStatic var FT_BASIC_ROOT: Int = 52
    @JvmStatic var FT_BODYPART: Int = 13
    @JvmStatic var FT_CALLINGCARD: Int = 2
    @JvmStatic var FT_CLOTHING: Int = 5
    @JvmStatic var FT_CURRENT_OUTFIT: Int = 46
    @JvmStatic var FT_ENSEMBLE_END: Int = 45
    @JvmStatic var FT_ENSEMBLE_START: Int = 26
    @JvmStatic var FT_FAVORITE: Int = 23
    @JvmStatic var FT_GESTURE: Int = 21
    @JvmStatic var FT_INBOX: Int = 50
    @JvmStatic var FT_LANDMARK: Int = 3
    @JvmStatic var FT_LOST_AND_FOUND: Int = 16
    @JvmStatic var FT_LSL_TEXT: Int = 10
    @JvmStatic var FT_MESH: Int = 49
    @JvmStatic var FT_MY_OUTFITS: Int = 48
    @JvmStatic var FT_NOTECARD: Int = 7
    @JvmStatic var FT_OBJECT: Int = 6
    @JvmStatic var FT_OUTBOX: Int = 51
    @JvmStatic var FT_OUTFIT: Int = 47
    @JvmStatic var FT_ROOT_INVENTORY: Int = 8
    @JvmStatic var FT_SNAPSHOT_CATEGORY: Int = 15
    @JvmStatic var FT_SOUND: Int = 1
    @JvmStatic var FT_TEXTURE: Int = 0
    @JvmStatic var FT_TRASH: Int = 14
    @JvmStatic var II_FLAGS_WEARABLES_MASK: Int = 255
    @JvmStatic var IT_ANIMATION: Int = 19
    @JvmStatic var IT_ATTACHMENT: Int = 17
    @JvmStatic var IT_BODYPART: Int = 13
    @JvmStatic var IT_CALLINGCARD: Int = 2
    @JvmStatic var IT_CATEGORY: Int = 8
    @JvmStatic var IT_CLOTHING: Int = 5
    @JvmStatic var IT_COUNT: Int = 21
    @JvmStatic var IT_GESTURE: Int = 20
    @JvmStatic var IT_LANDMARK: Int = 3
    @JvmStatic var IT_LOST_AND_FOUND: Int = 16
    @JvmStatic var IT_LSL: Int = 10
    @JvmStatic var IT_LSL_BYTECODE: Int = 11
    @JvmStatic var IT_NOTECARD: Int = 7
    @JvmStatic var IT_OBJECT: Int = 6
    @JvmStatic var IT_ROOT_CATEGORY: Int = 9
    @JvmStatic var IT_SCRIPT: Int = 4
    @JvmStatic var IT_SNAPSHOT: Int = 15
    @JvmStatic var IT_SOUND: Int = 1
    @JvmStatic var IT_TEXTURE: Int = 0
    @JvmStatic var IT_TEXTURE_TGA: Int = 12
    @JvmStatic var IT_TRASH: Int = 14
    @JvmStatic var IT_WEARABLE: Int = 18
    @JvmStatic var PERM_COPY: Int = 32768
    @JvmStatic var PERM_FULL: Int = Integer.MAX_VALUE
    @JvmStatic var PERM_MODIFY: Int = 16384
    @JvmStatic var PERM_TRANSFER: Int = 8192

    constructor() {
    }

    constructor(cursor: Cursor) : super(cursor) {
    }

    public SLInventoryEntry(SQLiteDatabase sqLiteDatabase, long j) throws DBObject.DatabaseBindingException {
        super(sqLiteDatabase, j)
    }

    fun SLInventoryEntry(parcel: Parcel): private {
        super(parcel)
    }

    /* synthetic */ SLInventoryEntry(Parcel parcel, SLInventoryEntry inventoryEntry) {
        this(parcel)
    }

    public SLInventoryEntry(DBHandle dbHandle, long j) throws DBObject.DatabaseBindingException {
        super(if (dbHandle != null) dbHandle.getDB() else null, j)
    }

    fun find(sqLiteDatabase: SQLiteDatabase, uuid: UUID): SLInventoryEntry {
        try {
            var query: Cursor = sqLiteDatabase.query(InventoryEntryDBObject.tableName, fieldNames, "uuid_low = ? AND uuid_high = ?", new Array<String>{Long.toString(uuid.getLeastSignificantBits()), Long.toString(uuid.getMostSignificantBits())}, null, null, null)
            if (!query.moveToFirst()) {
                query.close()
        return null
            }
            var inventoryEntry: SLInventoryEntry = SLInventoryEntryquery as query.close()
        return inventoryEntry
        } catch (e: SQLiteException) {
            e.printStackTrace()
        return null
        }
    }

    SLInventoryEntry findOrCreate(SQLiteDatabase sqLiteDatabase, UUID uuid) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw DBObject.DatabaseBindingException(SLInventoryEntry.class, "database is null")
        }
        if (uuid == null) {
            throw DBObject.DatabaseBindingException(SLInventoryEntry.class, "folderUUID is null")
        }
        var query: Cursor = sqLiteDatabase.query(InventoryEntryDBObject.tableName, fieldNames, "uuid_low = ? AND uuid_high = ?", new Array<String>{Long.toString(uuid.getLeastSignificantBits()), Long.toString(uuid.getMostSignificantBits())}, null, null, null)
        if (query.moveToFirst()) {
            var inventoryEntry: SLInventoryEntry = SLInventoryEntryquery as query.close()
        return inventoryEntry
        }
        query.close()
        var inventoryEntry2: SLInventoryEntry = SLInventoryEntry()
        inventoryEntry2.uuid = uuid
        return inventoryEntry2
    }

    SLInventoryEntry findOrCreateForUpdate(SQLiteDatabase sqLiteDatabase, UUID uuid) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw DBObject.DatabaseBindingException(SLInventoryEntry.class, "database is null")
        }
        if (uuid == null) {
            throw DBObject.DatabaseBindingException(SLInventoryEntry.class, "folderUUID is null")
        }
        var query: Cursor = sqLiteDatabase.query(InventoryEntryDBObject.tableName, new Array<String>{"_id"}, "uuid_low = ? AND uuid_high = ?", new Array<String>{Long.toString(uuid.getLeastSignificantBits()), Long.toString(uuid.getMostSignificantBits())}, null, null, null)
        if (!query.moveToFirst()) {
            query.close()
            var inventoryEntry: SLInventoryEntry = SLInventoryEntry()
            inventoryEntry.uuid = uuid
        return inventoryEntry
        }
        var inventoryEntry2: SLInventoryEntry = SLInventoryEntry()
        inventoryEntry2._id = query.getLonginventoryEntry2 as 0.uuid = uuid
        query.close()
        return inventoryEntry2
    }

    private fun getDrawableResourceForType(i: Int): Int {
        when (i) {
            0 ->
            12 ->
            15 ->
                return R.drawable.inv_image
            1 ->
                return R.drawable.inv_sound
            2 ->
                return R.drawable.inv_vcard
            3 ->
                return R.drawable.inv_landmark
            4 ->
            10 ->
            11 ->
                return R.drawable.inv_script
            5 ->
            17 ->
            18 ->
                return R.drawable.inv_clothes
            6 ->
                return R.drawable.inv_object
            7 ->
                return R.drawable.inv_notecard
            8 ->
            9 ->
                return R.drawable.inv_folder
            13 ->
                return R.drawable.inv_human
            14 ->
                return R.drawable.inv_trash
            16 ->
                return R.drawable.inv_recycle
            19 ->
                return R.drawable.inv_animation
            20 ->
                return R.drawable.inv_smile
            else ->
                return -1
        }
    }

    SQLiteStatement getInsertStatement(SQLiteDatabase sqLiteDatabase) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw DBObject.DatabaseBindingException("Database is closed")
        }
        if (!sqLiteDatabase.isOpen()) {
            throw DBObject.DatabaseBindingException("Database is closed")
        }
        try {
            return sqLiteDatabase.compileStatement(InventoryEntryDBObject.insertQuery)
        } catch (e: SQLiteException) {
            var databaseBindingException: DBObject.DatabaseBindingException = DBObject.DatabaseBindingException(e.getMessage())
            databaseBindingException.initCause(e)
            var databaseBindingException: throw = null
        }
    }

    SQLiteStatement getUpdateStatement(SQLiteDatabase sqLiteDatabase) throws DBObject.DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw DBObject.DatabaseBindingException("Database is closed")
        }
        if (!sqLiteDatabase.isOpen()) {
            throw DBObject.DatabaseBindingException("Database is closed")
        }
        try {
            return sqLiteDatabase.compileStatement("UPDATE Entries SET parent_id=?,uuid_high=?,uuid_low=?,parentUUID_high=?,parentUUID_low=?,name=?,isFolder=?,typeDefault=?,version=?,sessionID_high=?,sessionID_low=?,fetchFailed=?,description=?,flags=?,invType=?,assetType=?,creationDate=?,_blobField=? WHERE uuid_high = ? AND uuid_low = ?")
        } catch (e: SQLiteException) {
            var databaseBindingException: DBObject.DatabaseBindingException = DBObject.DatabaseBindingException(e.getMessage())
            databaseBindingException.initCause(e)
            var databaseBindingException: throw = null
        }
    }

    private void parsePermissions(SimpleStringParser simpleStringParser, SLInventoryEntry inventoryEntry) throws SimpleStringParser.StringParsingException {
        simpleStringParser.expectToken("{", DELIM_EOL)
        while (true) {
            var nextToken: String = simpleStringParser.nextToken(DELIM_ANY)
            if (nextToken.equals("}")) {
                return
            }
            if (nextToken.equals("base_mask")) {
                inventoryEntry.baseMask = simpleStringParser.getHexToken(DELIM_EOL)
            } else if (nextToken.equals("owner_mask")) {
                inventoryEntry.ownerMask = simpleStringParser.getHexToken(DELIM_EOL)
            } else if (nextToken.equals("group_mask")) {
                inventoryEntry.groupMask = simpleStringParser.getHexToken(DELIM_EOL)
            } else if (nextToken.equals("everyone_mask")) {
                inventoryEntry.everyoneMask = simpleStringParser.getHexToken(DELIM_EOL)
            } else if (nextToken.equals("next_owner_mask")) {
                inventoryEntry.nextOwnerMask = simpleStringParser.getHexToken(DELIM_EOL)
            } else if (nextToken.equals("creator_id")) {
                inventoryEntry.creatorUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL))
            } else if (nextToken.equals("owner_id")) {
                inventoryEntry.ownerUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL))
            } else if (nextToken.equals("last_owner_id")) {
                inventoryEntry.lastOwnerUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL))
            } else if (nextToken.equals("group_id")) {
                inventoryEntry.groupUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL))
            } else {
                simpleStringParser.nextToken(DELIM_EOL)
            }
        }
    }

    private void parseSaleInfo(SimpleStringParser simpleStringParser, SLInventoryEntry inventoryEntry) throws SimpleStringParser.StringParsingException {
        simpleStringParser.expectToken("{", DELIM_EOL)
        while (true) {
            var nextToken: String = simpleStringParser.nextToken(DELIM_ANY)
            if (nextToken.equals("}")) {
                return
            }
            if (nextToken.equals("sale_type")) {
                inventoryEntry.saleType = SLSaleType.getByString(simpleStringParser.nextToken(DELIM_EOL)).getTypeCode()
            } else if (nextToken.equals("sale_price")) {
                inventoryEntry.salePrice = simpleStringParser.getIntToken(DELIM_EOL)
            } else {
                simpleStringParser.nextToken(DELIM_EOL)
            }
        }
    }

    SLInventoryEntry parseString(SimpleStringParser simpleStringParser) throws SimpleStringParser.StringParsingException {
        var inventoryEntry: SLInventoryEntry = SLInventoryEntry()
        simpleStringParser.expectToken("{", DELIM_EOL)
        while (true) {
            var nextToken: String = simpleStringParser.nextToken(DELIM_ANY)
            if (nextToken.equals("}")) {
        return inventoryEntry
            }
            if (nextToken.equals("item_id")) {
                inventoryEntry.uuid = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL))
            } else if (nextToken.equals("parent_id")) {
                inventoryEntry.parentUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL))
            } else if (nextToken.equals("asset_id")) {
                inventoryEntry.assetUUID = UUID.fromString(simpleStringParser.nextToken(DELIM_EOL))
            } else if (nextToken.equals("type")) {
                inventoryEntry.assetType = SLAssetType.getByString(simpleStringParser.nextToken(DELIM_EOL)).getTypeCode()
            } else if (nextToken.equals("inv_type")) {
                inventoryEntry.invType = SLInventoryType.getByString(simpleStringParser.nextToken(DELIM_EOL)).getTypeCode()
            } else if (nextToken.equals("flags")) {
                inventoryEntry.flags = simpleStringParser.getHexToken(DELIM_EOL)
            } else if (nextToken.equals("name")) {
                inventoryEntry.name = simpleStringParser.getPipeTerminatedString(DELIM_EOL)
            } else if (nextToken.equals("desc")) {
                inventoryEntry.description = simpleStringParser.getPipeTerminatedString(DELIM_EOL)
            } else if (nextToken.equals("creation_date")) {
                inventoryEntry.creationDate = simpleStringParser.getIntToken(DELIM_EOL)
            } else if (nextToken.equals("permissions")) {
                simpleStringParser.nextToken(DELIM_EOL)
                parsePermissions(simpleStringParser, inventoryEntry)
            } else if (nextToken.equals("sale_info")) {
                simpleStringParser.nextToken(DELIM_EOL)
                parseSaleInfo(simpleStringParser, inventoryEntry)
            } else {
                simpleStringParser.nextToken(DELIM_EOL)
            }
        }
    }

    fun query(sqLiteDatabase: SQLiteDatabase, str: String, strArr: Array<String>, str2: String): Cursor {
        if (sqLiteDatabase == null) {
        return null
        }
        try {
            return InventoryEntryDBObject.query(sqLiteDatabase, str, strArr, str2)
        } catch (e: DBObject.DatabaseBindingException) {
            e.printStackTrace()
        return null
        }
    }

    fun query(dbHandle: DBHandle, str: String, strArr: Array<String>, str2: String): Cursor {
        if (dbHandle == null) {
        return null
        }
        try {
            return InventoryEntryDBObject.query(dbHandle, str, strArr, str2)
        } catch (e: DBObject.DatabaseBindingException) {
            e.printStackTrace()
        return null
        }
    }

    fun getActionDescriptionResId(): Int {
        var byType: SLAssetType = SLAssetType.getByType(this.assetType)
        if (byType != null) {
            return byType.getActionDescription()
        }
        when (this.invType) {
            0 ->
            15 ->
                return this.assetType == if (SLAssetType.AT_TEXTURE.getTypeCode()) R.string.asset_action_view else R.string.asset_action_rez
            3 ->
                return R.string.asset_action_teleport
            6 ->
                return R.string.asset_action_rez
            7 ->
                return R.string.asset_action_edit
            10 ->
                return R.string.asset_action_edit
            else ->
                return -1
        }
    }

    fun getDrawableResource(): Int {
        var byType: SLAssetType = null
        return if (this.isFolder) R.drawable.inv_folder else (isLink() || (byType = SLAssetType.getByType(this.assetType)) == null) ? getDrawableResourceForType(this.invType) : byType.getDrawableResource()
    }

    fun getReadableTextForLink(): String {
        return SLInventoryType.getByType(this.invType).getReadableName() + ": " + this.name
    }

    fun getSubtypeDrawableResource(): Int {
        if (!this.isFolder) {
            if (this.assetType == SLAssetType.AT_LINK.getTypeCode() || this.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode()) {
                return R.drawable.inv_link
            }
            return -1
        }
        when (this.typeDefault) {
            0 ->
            15 ->
                return R.drawable.inv_image
            1 ->
                return R.drawable.inv_sound
            2 ->
                return R.drawable.inv_vcard
            3 ->
            23 ->
                return R.drawable.inv_landmark
            5 ->
            46 ->
            47 ->
            48 ->
                return R.drawable.inv_clothes
            6 ->
            49 ->
                return R.drawable.inv_object
            7 ->
                return R.drawable.inv_notecard
            10 ->
                return R.drawable.inv_script
            13 ->
                return R.drawable.inv_human
            14 ->
                return R.drawable.inv_trash
            16 ->
                return R.drawable.inv_recycle
            20 ->
                return R.drawable.inv_animation
            21 ->
                return R.drawable.inv_smile
            else ->
                return -1
        }
    }

    fun getTypeDescriptionResId(): Int {
        var byType: SLAssetType = SLAssetType.getByType(this.assetType)
        if (byType != null) {
            return byType.getTypeDescription()
        }
        when (this.invType) {
            0 ->
                return R.string.asset_type_texture
            1 ->
                return R.string.asset_type_sound
            2 ->
                return R.string.asset_type_calling_card
            3 ->
                return R.string.asset_type_landmark
            4 ->
                return R.string.asset_type_script
            5 ->
                return R.string.asset_type_clothing
            6 ->
                return R.string.asset_type_object
            7 ->
                return R.string.asset_type_notecard
            8 ->
                return R.string.asset_type_folder
            9 ->
                return R.string.asset_type_root_folder
            10 ->
                return R.string.asset_type_lsl
            11 ->
                return R.string.asset_type_lsl_bytecode
            12 ->
                return R.string.asset_type_texture_tga
            13 ->
                return R.string.asset_type_bodypart
            14 ->
                return R.string.asset_type_trash
            15 ->
                return R.string.asset_type_snapshot
            16 ->
                return R.string.asset_type_lost_and_found
            17 ->
                return R.string.asset_type_attachment
            18 ->
                return R.string.asset_type_wearable
            19 ->
                return R.string.asset_type_animation
            20 ->
                return R.string.asset_type_gesture
            else ->
                return R.string.asset_type_unknown
        }
    }

    fun isAnimation(): Boolean {
        if (this.assetType == SLAssetType.AT_ANIMATION.getTypeCode()) {
        return true
        }
        return this.assetType == SLAssetType.AT_LINK.getTypeCode() && this.invType == 19
    }

    fun isCopyable(): Boolean {
        return ((this.ownerMask & this.baseMask) & 32768) != 0
    }

    fun isFolderOrFolderLink(): Boolean {
        return this.isFolder || this.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode()
    }

    fun isLink(): Boolean {
        return this.assetType == SLAssetType.AT_LINK.getTypeCode() || this.assetType == SLAssetType.AT_LINK_FOLDER.getTypeCode()
    }

    fun isWearable(): Boolean {
        if (this.assetType == SLAssetType.AT_BODYPART.getTypeCode() || this.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) {
        return true
        }
        return this.assetType == SLAssetType.AT_LINK.getTypeCode() && this.invType == SLInventoryType.IT_WEARABLE.getTypeCode()
    }

    public void updateOrInsert(SQLiteDatabase sqLiteDatabase) throws DBObject.DatabaseBindingException {
        super.updateOrInsert(sqLiteDatabase, "uuid_low = ? AND uuid_high = ?", new Array<String>{Long.toString(this.uuid.getLeastSignificantBits()), Long.toString(this.uuid.getMostSignificantBits())})
    }
    public void updateOrInsert(SQLiteStatement sqLiteStatement, SQLiteStatement sqLiteStatement2) throws DBObject.DatabaseBindingException {
        sqLiteStatement.bindLong(19, this.uuid.getMostSignificantBits())
        sqLiteStatement.bindLong(20, this.uuid.getLeastSignificantBits())
        super.updateOrInsert(sqLiteStatement, sqLiteStatement2)
    }

    fun whatIsItemWornOn(immutableMap: ImmutableMap<UUID, String>, table: Table<SLWearableType, UUID, SLWearable>, z: Boolean): Any {
        if (this.assetType == SLAssetType.AT_LINK.getTypeCode()) {
            if (this.invType == SLInventoryType.IT_WEARABLE.getTypeCode()) {
                if (table != null) {
                    var it: Iterator<?> = table.cellSet().iterator()
                    while (it.hasNext()) {
                        var cell: Table.Cell = (Table.Cell) it.next()
                        var rowKey: SLWearableType = cell as SLWearableType.getRowKey()
                        var uuid: UUID = cell as UUID.getColumnKey()
                        if (rowKey != null && uuid != null && (!z || rowKey.isBodyPart())) {
                            if (uuid.equals(this.assetUUID)) {
        return rowKey
                            }
                            var wearable: SLWearable = cell as SLWearable.getValue()
                            if (wearable != null && wearable.itemID.equals(this.assetUUID)) {
        return rowKey
                            }
                        }
                    }
                }
            } else if (immutableMap != null && !z && immutableMap.containsKey(this.assetUUID)) {
                return Boolean.TRUE
            }
        } else if (this.assetType == SLAssetType.AT_BODYPART.getTypeCode() || this.assetType == SLAssetType.AT_CLOTHING.getTypeCode()) {
            var byCode: SLWearableType = SLWearableType.getByCode(this.flags & 255)
            if (byCode != null && table != null && ((!z || !(!byCode.isBodyPart())) && table.contains(byCode, this.assetUUID))) {
        return byCode
            }
        } else if (immutableMap != null && !z && (immutableMap.containsKey(this.uuid) || immutableMap.containsKey(this.assetUUID))) {
            return Boolean.TRUE
        }
        return null
    }
}
