package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class FriendDao : AbstractDao<Friend, UUID> {

    object Properties {
        @JvmField val Uuid = Property(0, UUID::class.java, "uuid", true, "UUID")
        @JvmField val RightsGiven = Property(1, Integer.TYPE, "rightsGiven", false, "RIGHTS_GIVEN")
        @JvmField val RightsHas = Property(2, Integer.TYPE, "rightsHas", false, "RIGHTS_HAS")
        @JvmField val IsOnline = Property(3, java.lang.Boolean.TYPE, "isOnline", false, "IS_ONLINE")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, friend: Friend) {
        sqLiteStatement.clearBindings()
        val uuid = friend.uuid
        if (uuid != null) {
            sqLiteStatement.bindString(1, uuid.toString())
        }
        sqLiteStatement.bindLong(2, friend.rightsGiven.toLong())
        sqLiteStatement.bindLong(3, friend.rightsHas.toLong())
        sqLiteStatement.bindLong(4, if (friend.isOnline) 1L else 0L)
    }

    override fun getKey(friend: Friend?): UUID? {
        return friend?.uuid
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): Friend {
        return Friend(
            if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0)),
            cursor.getInt(offset + 1),
            cursor.getInt(offset + 2),
            cursor.getShort(offset + 3).toInt() != 0
        )
    }

    override fun readEntity(cursor: Cursor, friend: Friend, offset: Int) {
        friend.uuid = if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0))
        friend.rightsGiven = cursor.getInt(offset + 1)
        friend.rightsHas = cursor.getInt(offset + 2)
        friend.isOnline = cursor.getShort(offset + 3).toInt() != 0
    }

    override fun readKey(cursor: Cursor, offset: Int): UUID? {
        return if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0))
    }

    override fun updateKeyAfterInsert(friend: Friend, rowId: Long): UUID? {
        return friend.uuid
    }

    companion object {
        const val TABLENAME = "Friends"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'Friends' ('UUID' TEXT PRIMARY KEY ,'RIGHTS_GIVEN' INTEGER NOT NULL ,'RIGHTS_HAS' INTEGER NOT NULL ,'IS_ONLINE' INTEGER NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'Friends'")
        }
    }
}
