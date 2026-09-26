package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class ChatterDao : AbstractDao<Chatter, Long> {

    object Properties {
        @JvmField val Id = Property(0, Long::class.javaObjectType, "id", true, "_id")
        @JvmField val Type = Property(1, Integer.TYPE, "type", false, "TYPE")
        @JvmField val Uuid = Property(2, UUID::class.java, "uuid", false, "UUID")
        @JvmField val Active = Property(3, java.lang.Boolean.TYPE, "active", false, "ACTIVE")
        @JvmField val Muted = Property(4, java.lang.Boolean.TYPE, "muted", false, "MUTED")
        @JvmField val UnreadCount = Property(5, Integer.TYPE, "unreadCount", false, "UNREAD_COUNT")
        @JvmField val LastMessageID = Property(6, Long::class.javaObjectType, "lastMessageID", false, "LAST_MESSAGE_ID")
        @JvmField val LastSessionID = Property(7, UUID::class.java, "lastSessionID", false, "LAST_SESSION_ID")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, chatter: Chatter) {
        sqLiteStatement.clearBindings()
        val id = chatter.id
        if (id != null) {
            sqLiteStatement.bindLong(1, id)
        }
        sqLiteStatement.bindLong(2, chatter.type.toLong())
        val uuid = chatter.uuid
        if (uuid != null) {
            sqLiteStatement.bindString(3, uuid.toString())
        }
        sqLiteStatement.bindLong(4, if (chatter.active) 1L else 0L)
        sqLiteStatement.bindLong(5, if (chatter.muted) 1L else 0L)
        sqLiteStatement.bindLong(6, chatter.unreadCount.toLong())
        val lastMessageID = chatter.lastMessageID
        if (lastMessageID != null) {
            sqLiteStatement.bindLong(7, lastMessageID)
        }
        val lastSessionID = chatter.lastSessionID
        if (lastSessionID != null) {
            sqLiteStatement.bindString(8, lastSessionID.toString())
        }
    }

    override fun getKey(chatter: Chatter?): Long? {
        return chatter?.id
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): Chatter {
        return Chatter(
            if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0),
            cursor.getInt(offset + 1),
            if (cursor.isNull(offset + 2)) null else UUID.fromString(cursor.getString(offset + 2)),
            cursor.getShort(offset + 3).toInt() != 0,
            cursor.getShort(offset + 4).toInt() != 0,
            cursor.getInt(offset + 5),
            if (cursor.isNull(offset + 6)) null else cursor.getLong(offset + 6),
            if (cursor.isNull(offset + 7)) null else UUID.fromString(cursor.getString(offset + 7))
        )
    }

    override fun readEntity(cursor: Cursor, chatter: Chatter, offset: Int) {
        chatter.id = if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
        chatter.type = cursor.getInt(offset + 1)
        chatter.uuid = if (cursor.isNull(offset + 2)) null else UUID.fromString(cursor.getString(offset + 2))
        chatter.active = cursor.getShort(offset + 3).toInt() != 0
        chatter.muted = cursor.getShort(offset + 4).toInt() != 0
        chatter.unreadCount = cursor.getInt(offset + 5)
        chatter.lastMessageID = if (cursor.isNull(offset + 6)) null else cursor.getLong(offset + 6)
        chatter.lastSessionID = if (cursor.isNull(offset + 7)) null else UUID.fromString(cursor.getString(offset + 7))
    }

    override fun readKey(cursor: Cursor, offset: Int): Long? {
        return if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
    }

    override fun updateKeyAfterInsert(chatter: Chatter, rowId: Long): Long {
        chatter.id = rowId
        return rowId
    }

    companion object {
        const val TABLENAME = "CHATTER"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val str = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${str}'CHATTER' ('_id' INTEGER PRIMARY KEY ,'TYPE' INTEGER NOT NULL ,'UUID' TEXT,'ACTIVE' INTEGER NOT NULL ,'MUTED' INTEGER NOT NULL ,'UNREAD_COUNT' INTEGER NOT NULL ,'LAST_MESSAGE_ID' INTEGER,'LAST_SESSION_ID' TEXT);")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_CHATTER_TYPE_UUID ON CHATTER (TYPE,UUID);")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val str = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${str}'CHATTER'")
        }
    }
}
