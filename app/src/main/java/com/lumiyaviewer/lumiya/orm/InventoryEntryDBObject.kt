package com.lumiyaviewer.lumiya.orm

import android.content.ContentValues
import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import android.os.Parcel
import android.os.Parcelable
import java.nio.ByteBuffer
import java.util.UUID

open class InventoryEntryDBObject : DBObject, Parcelable {

    @JvmField var agentUUID: UUID? = null
    @JvmField var assetType: Int = 0
    @JvmField var assetUUID: UUID? = null
    @JvmField var baseMask: Int = 0
    @JvmField var creationDate: Int = 0
    @JvmField var creatorUUID: UUID? = null
    @JvmField var description: String? = null
    @JvmField var everyoneMask: Int = 0
    @JvmField var fetchFailed: Boolean = false
    @JvmField var flags: Int = 0
    @JvmField var groupMask: Int = 0
    @JvmField var groupUUID: UUID? = null
    @JvmField var invType: Int = 0
    @JvmField var isFolder: Boolean = false
    @JvmField var isGroupOwned: Boolean = false
    @JvmField var lastOwnerUUID: UUID? = null
    @JvmField var name: String? = null
    @JvmField var nextOwnerMask: Int = 0
    @JvmField var ownerMask: Int = 0
    @JvmField var ownerUUID: UUID? = null
    @JvmField var parentUUID: UUID? = null
    @JvmField var parent_id: Long = 0
    @JvmField var salePrice: Int = 0
    @JvmField var saleType: Int = 0
    @JvmField var sessionID: UUID? = null
    @JvmField var typeDefault: Int = 0
    @JvmField var uuid: UUID? = null
    @JvmField var version: Int = 0

    constructor()

    constructor(cursor: Cursor) : super(cursor)

    @Throws(DatabaseBindingException::class)
    constructor(sqLiteDatabase: SQLiteDatabase, id: Long) : super(sqLiteDatabase, id)

    protected constructor(parcel: Parcel) {
        this._id = parcel.readLong()
        this.parent_id = parcel.readLong()
        this.uuid = UUID(parcel.readLong(), parcel.readLong())
        this.agentUUID = UUID(parcel.readLong(), parcel.readLong())
        this.parentUUID = UUID(parcel.readLong(), parcel.readLong())
        this.name = parcel.readString()
        this.isFolder = parcel.readByte().toInt() != 0
        this.typeDefault = parcel.readInt()
        this.version = parcel.readInt()
        this.sessionID = UUID(parcel.readLong(), parcel.readLong())
        this.fetchFailed = parcel.readByte().toInt() != 0
        this.description = parcel.readString()
        this.flags = parcel.readInt()
        this.invType = parcel.readInt()
        this.assetType = parcel.readInt()
        this.assetUUID = UUID(parcel.readLong(), parcel.readLong())
        this.creationDate = parcel.readInt()
        this.creatorUUID = UUID(parcel.readLong(), parcel.readLong())
        this.ownerUUID = UUID(parcel.readLong(), parcel.readLong())
        this.groupUUID = UUID(parcel.readLong(), parcel.readLong())
        this.lastOwnerUUID = UUID(parcel.readLong(), parcel.readLong())
        this.isGroupOwned = parcel.readByte().toInt() != 0
        this.baseMask = parcel.readInt()
        this.groupMask = parcel.readInt()
        this.ownerMask = parcel.readInt()
        this.nextOwnerMask = parcel.readInt()
        this.everyoneMask = parcel.readInt()
        this.saleType = parcel.readInt()
        this.salePrice = parcel.readInt()
    }

    override fun bindInsertOrUpdate(sqLiteStatement: SQLiteStatement) {
        sqLiteStatement.bindLong(1, parent_id)
        if (uuid != null) {
            sqLiteStatement.bindLong(2, uuid!!.mostSignificantBits)
            sqLiteStatement.bindLong(3, uuid!!.leastSignificantBits)
        } else {
            sqLiteStatement.bindLong(2, 0L)
            sqLiteStatement.bindLong(3, 0L)
        }
        if (parentUUID != null) {
            sqLiteStatement.bindLong(4, parentUUID!!.mostSignificantBits)
            sqLiteStatement.bindLong(5, parentUUID!!.leastSignificantBits)
        } else {
            sqLiteStatement.bindLong(4, 0L)
            sqLiteStatement.bindLong(5, 0L)
        }
        if (name != null) {
            sqLiteStatement.bindString(6, name!!)
        } else {
            sqLiteStatement.bindNull(6)
        }
        sqLiteStatement.bindLong(7, if (isFolder) 1 else 0)
        sqLiteStatement.bindLong(8, typeDefault.toLong())
        sqLiteStatement.bindLong(9, version.toLong())
        if (sessionID != null) {
            sqLiteStatement.bindLong(10, sessionID!!.mostSignificantBits)
            sqLiteStatement.bindLong(11, sessionID!!.leastSignificantBits)
        } else {
            sqLiteStatement.bindLong(10, 0L)
            sqLiteStatement.bindLong(11, 0L)
        }
        sqLiteStatement.bindLong(12, if (fetchFailed) 1 else 0)
        if (description != null) {
            sqLiteStatement.bindString(13, description!!)
        } else {
            sqLiteStatement.bindNull(13)
        }
        sqLiteStatement.bindLong(14, flags.toLong())
        sqLiteStatement.bindLong(15, invType.toLong())
        sqLiteStatement.bindLong(16, assetType.toLong())
        sqLiteStatement.bindLong(17, creationDate.toLong())
        val wrap = ByteBuffer.wrap(ByteArray(BLOB_FIELD_SIZE))
        putUuidToBuffer(wrap, agentUUID)
        putUuidToBuffer(wrap, assetUUID)
        putUuidToBuffer(wrap, creatorUUID)
        putUuidToBuffer(wrap, ownerUUID)
        putUuidToBuffer(wrap, groupUUID)
        putUuidToBuffer(wrap, lastOwnerUUID)
        wrap.put((if (isGroupOwned) 1 else 0).toByte())
        wrap.putInt(baseMask)
        wrap.putInt(groupMask)
        wrap.putInt(ownerMask)
        wrap.putInt(nextOwnerMask)
        wrap.putInt(everyoneMask)
        wrap.putInt(saleType)
        wrap.putInt(salePrice)
        sqLiteStatement.bindBlob(18, wrap.array())
    }

    override fun describeContents(): Int = 0

    override fun getContentValues(): ContentValues {
        val contentValues = ContentValues()
        contentValues.put("parent_id", parent_id)
        if (uuid != null) {
            contentValues.put("uuid_high", uuid!!.mostSignificantBits)
            contentValues.put("uuid_low", uuid!!.leastSignificantBits)
        } else {
            contentValues.put("uuid_high", 0L)
            contentValues.put("uuid_low", 0L)
        }
        if (parentUUID != null) {
            contentValues.put("parentUUID_high", parentUUID!!.mostSignificantBits)
            contentValues.put("parentUUID_low", parentUUID!!.leastSignificantBits)
        } else {
            contentValues.put("parentUUID_high", 0L)
            contentValues.put("parentUUID_low", 0L)
        }
        contentValues.put("name", name)
        contentValues.put("isFolder", isFolder)
        contentValues.put("typeDefault", typeDefault)
        contentValues.put("version", version)
        if (sessionID != null) {
            contentValues.put("sessionID_high", sessionID!!.mostSignificantBits)
            contentValues.put("sessionID_low", sessionID!!.leastSignificantBits)
        } else {
            contentValues.put("sessionID_high", 0L)
            contentValues.put("sessionID_low", 0L)
        }
        contentValues.put("fetchFailed", fetchFailed)
        contentValues.put("description", description)
        contentValues.put("flags", flags)
        contentValues.put("invType", invType)
        contentValues.put("assetType", assetType)
        contentValues.put("creationDate", creationDate)
        val wrap = ByteBuffer.wrap(ByteArray(BLOB_FIELD_SIZE))
        putUuidToBuffer(wrap, agentUUID)
        putUuidToBuffer(wrap, assetUUID)
        putUuidToBuffer(wrap, creatorUUID)
        putUuidToBuffer(wrap, ownerUUID)
        putUuidToBuffer(wrap, groupUUID)
        putUuidToBuffer(wrap, lastOwnerUUID)
        wrap.put((if (isGroupOwned) 1 else 0).toByte())
        wrap.putInt(baseMask)
        wrap.putInt(groupMask)
        wrap.putInt(ownerMask)
        wrap.putInt(nextOwnerMask)
        wrap.putInt(everyoneMask)
        wrap.putInt(saleType)
        wrap.putInt(salePrice)
        contentValues.put("_blobField", wrap.array())
        return contentValues
    }

    override fun getFieldNames(): Array<String> = fieldNames

    override fun getTableName(): String = tableName

    override fun loadFromCursor(cursor: Cursor) {
        this._id = cursor.getLong(0)
        this.parent_id = cursor.getLong(1)
        this.uuid = UUID(cursor.getLong(2), cursor.getLong(3))
        this.parentUUID = UUID(cursor.getLong(4), cursor.getLong(5))
        this.name = cursor.getString(6)
        this.isFolder = cursor.getInt(7) != 0
        this.typeDefault = cursor.getInt(8)
        this.version = cursor.getInt(9)
        this.sessionID = UUID(cursor.getLong(10), cursor.getLong(11))
        this.fetchFailed = cursor.getInt(12) != 0
        this.description = cursor.getString(13)
        this.flags = cursor.getInt(14)
        this.invType = cursor.getInt(15)
        this.assetType = cursor.getInt(16)
        this.creationDate = cursor.getInt(17)
        val wrap = ByteBuffer.wrap(cursor.getBlob(18))
        this.agentUUID = UUID(wrap.long, wrap.long)
        this.assetUUID = UUID(wrap.long, wrap.long)
        this.creatorUUID = UUID(wrap.long, wrap.long)
        this.ownerUUID = UUID(wrap.long, wrap.long)
        this.groupUUID = UUID(wrap.long, wrap.long)
        this.lastOwnerUUID = UUID(wrap.long, wrap.long)
        this.isGroupOwned = wrap.get().toInt() != 0
        this.baseMask = wrap.int
        this.groupMask = wrap.int
        this.ownerMask = wrap.int
        this.nextOwnerMask = wrap.int
        this.everyoneMask = wrap.int
        this.saleType = wrap.int
        this.salePrice = wrap.int
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeLong(_id)
        parcel.writeLong(parent_id)
        writeUuidToParcel(parcel, uuid)
        writeUuidToParcel(parcel, agentUUID)
        writeUuidToParcel(parcel, parentUUID)
        parcel.writeString(name)
        parcel.writeByte((if (isFolder) 1 else 0).toByte())
        parcel.writeInt(typeDefault)
        parcel.writeInt(version)
        writeUuidToParcel(parcel, sessionID)
        parcel.writeByte((if (fetchFailed) 1 else 0).toByte())
        parcel.writeString(description)
        parcel.writeInt(flags)
        parcel.writeInt(invType)
        parcel.writeInt(assetType)
        writeUuidToParcel(parcel, assetUUID)
        parcel.writeInt(creationDate)
        writeUuidToParcel(parcel, creatorUUID)
        writeUuidToParcel(parcel, ownerUUID)
        writeUuidToParcel(parcel, groupUUID)
        writeUuidToParcel(parcel, lastOwnerUUID)
        parcel.writeByte((if (isGroupOwned) 1 else 0).toByte())
        parcel.writeInt(baseMask)
        parcel.writeInt(groupMask)
        parcel.writeInt(ownerMask)
        parcel.writeInt(nextOwnerMask)
        parcel.writeInt(everyoneMask)
        parcel.writeInt(saleType)
        parcel.writeInt(salePrice)
    }

    companion object {
        // Protocol-derived schema notes (for Room migration and regression review):
        // - parent_id / parentUUID_* / uuid_* map to inventory hierarchy identity
        //   from secondlife/viewer indra/llinventory and InventoryData blocks in
        //   UpdateInventoryItem/CreateInventoryItem message definitions.
        // - invType / assetType / typeDefault map to LLInventoryType + LLAssetType.
        // - flags / creationDate / description map to InventoryData metadata fields.
        // - _blobField packs agent/asset/creator/owner/group UUIDs, permission masks,
        //   and sale info from message_template inventory update payloads.

        /** Size of the packed blob field: 6 UUIDs (16 bytes each = 96) + 1 byte isGroupOwned + 7 ints (28 bytes) = 125 */
        private const val BLOB_FIELD_SIZE = 125

        @JvmField
        val insertQuery = "INSERT INTO Entries (parent_id,uuid_high,uuid_low,parentUUID_high,parentUUID_low,name,isFolder,typeDefault,version,sessionID_high,sessionID_low,fetchFailed,description,flags,invType,assetType,creationDate,_blobField) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
        const val insertUpdateParamCount = 18

        @JvmField
        val tableName = "Entries"

        @JvmField
        val updateQuery = "UPDATE Entries SET parent_id=?,uuid_high=?,uuid_low=?,parentUUID_high=?,parentUUID_low=?,name=?,isFolder=?,typeDefault=?,version=?,sessionID_high=?,sessionID_low=?,fetchFailed=?,description=?,flags=?,invType=?,assetType=?,creationDate=?,_blobField=?"

        @JvmStatic
        protected val fieldNames = arrayOf(
            "_id", "parent_id", "uuid_high", "uuid_low", "parentUUID_high", "parentUUID_low",
            "name", "isFolder", "typeDefault", "version", "sessionID_high", "sessionID_low",
            "fetchFailed", "description", "flags", "invType", "assetType", "creationDate", "_blobField"
        )

        @JvmField
        val CREATOR: Parcelable.Creator<InventoryEntryDBObject> = object : Parcelable.Creator<InventoryEntryDBObject> {
            override fun createFromParcel(parcel: Parcel): InventoryEntryDBObject {
                return InventoryEntryDBObject(parcel)
            }

            override fun newArray(size: Int): Array<InventoryEntryDBObject?> = arrayOfNulls(size)
        }

        @JvmStatic
        @Throws(DBObject.DatabaseBindingException::class)
        fun query(sqLiteDatabase: SQLiteDatabase?, str: String?, strArr: Array<String>?, str2: String?): Cursor {
            if (sqLiteDatabase == null) {
                throw DBObject.DatabaseBindingException("Database not opened")
            }
            return sqLiteDatabase.query(tableName, fieldNames, str, strArr, null, null, str2)
        }

        @JvmStatic
        @Throws(DBObject.DatabaseBindingException::class)
        fun query(dbHandle: DBHandle?, str: String?, strArr: Array<String>?, str2: String?): Cursor {
            if (dbHandle == null) {
                throw DBObject.DatabaseBindingException("Database not opened")
            }
            return dbHandle.getDB().queryWithFactory(dbHandle, false, tableName, fieldNames, str, strArr, null, null, str2, null)
        }

        @JvmStatic
        fun getCreateTableStatements(): Array<String> {
            return arrayOf(
                "DROP TABLE IF EXISTS Entries;",
                "CREATE TABLE Entries (_id INTEGER PRIMARY KEY,parent_id BIGINT,uuid_high BIGINT,uuid_low BIGINT,parentUUID_high BIGINT,parentUUID_low BIGINT,name TEXT,isFolder BOOLEAN,typeDefault INTEGER,version INTEGER,sessionID_high BIGINT,sessionID_low BIGINT,fetchFailed BOOLEAN,description TEXT,flags INTEGER,invType INTEGER,assetType INTEGER,creationDate INTEGER,_blobField BLOB);",
                "CREATE INDEX Entries_parent_id ON Entries (parent_id);",
                "CREATE INDEX Entries_uuid ON Entries (uuid_high, uuid_low);"
            )
        }

        private fun putUuidToBuffer(buffer: ByteBuffer, uuid: UUID?) {
            if (uuid != null) {
                buffer.putLong(uuid.mostSignificantBits)
                buffer.putLong(uuid.leastSignificantBits)
            } else {
                buffer.putLong(0L)
                buffer.putLong(0L)
            }
        }

        private fun writeUuidToParcel(parcel: Parcel, uuid: UUID?) {
            if (uuid != null) {
                parcel.writeLong(uuid.mostSignificantBits)
                parcel.writeLong(uuid.leastSignificantBits)
            } else {
                parcel.writeLong(0L)
                parcel.writeLong(0L)
            }
        }
    }
}
