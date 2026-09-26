package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class UserDao : AbstractDao<User, Long> {

    object Properties {
        @JvmField val Id = Property(0, Long::class.javaObjectType, "id", true, "_id")
        @JvmField val Uuid = Property(1, UUID::class.java, "uuid", false, "UUID")
        @JvmField val UserName = Property(2, String::class.java, "userName", false, "USER_NAME")
        @JvmField val DisplayName = Property(3, String::class.java, "displayName", false, "DISPLAY_NAME")
        @JvmField val BadUUID = Property(4, java.lang.Boolean.TYPE, "badUUID", false, "BAD_UUID")
        @JvmField val IsFriend = Property(5, java.lang.Boolean.TYPE, "isFriend", false, "IS_FRIEND")
        @JvmField val RightsGiven = Property(6, Integer.TYPE, "rightsGiven", false, "RIGHTS_GIVEN")
        @JvmField val RightsHas = Property(7, Integer.TYPE, "rightsHas", false, "RIGHTS_HAS")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, user: User) {
        sqLiteStatement.clearBindings()
        val id = user.id
        if (id != null) {
            sqLiteStatement.bindLong(1, id)
        }
        val uuid = user.uuid
        if (uuid != null) {
            sqLiteStatement.bindString(2, uuid.toString())
        }
        val userName = user.userName
        if (userName != null) {
            sqLiteStatement.bindString(3, userName)
        }
        val displayName = user.getDisplayName()
        if (displayName != null) {
            sqLiteStatement.bindString(4, displayName)
        }
        sqLiteStatement.bindLong(5, if (user.badUUID) 1L else 0L)
        sqLiteStatement.bindLong(6, if (user.isFriend) 1L else 0L)
        sqLiteStatement.bindLong(7, user.rightsGiven.toLong())
        sqLiteStatement.bindLong(8, user.rightsHas.toLong())
    }

    override fun getKey(user: User?): Long? {
        return user?.id
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): User {
        return User(
            if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0),
            if (cursor.isNull(offset + 1)) null else UUID.fromString(cursor.getString(offset + 1)),
            if (cursor.isNull(offset + 2)) null else cursor.getString(offset + 2),
            if (cursor.isNull(offset + 3)) null else cursor.getString(offset + 3),
            cursor.getShort(offset + 4).toInt() != 0,
            cursor.getShort(offset + 5).toInt() != 0,
            cursor.getInt(offset + 6),
            cursor.getInt(offset + 7)
        )
    }

    override fun readEntity(cursor: Cursor, user: User, offset: Int) {
        user.id = if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
        user.uuid = if (cursor.isNull(offset + 1)) null else UUID.fromString(cursor.getString(offset + 1))
        user.userName = if (cursor.isNull(offset + 2)) null else cursor.getString(offset + 2)
        user.setDisplayName(if (cursor.isNull(offset + 3)) null else cursor.getString(offset + 3))
        user.badUUID = cursor.getShort(offset + 4).toInt() != 0
        user.isFriend = cursor.getShort(offset + 5).toInt() != 0
        user.rightsGiven = cursor.getInt(offset + 6)
        user.rightsHas = cursor.getInt(offset + 7)
    }

    override fun readKey(cursor: Cursor, offset: Int): Long? {
        return if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
    }

    override fun updateKeyAfterInsert(user: User, rowId: Long): Long {
        user.id = rowId
        return rowId
    }

    companion object {
        const val TABLENAME = "Users"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val str = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${str}'Users' ('_id' INTEGER PRIMARY KEY ,'UUID' TEXT,'USER_NAME' TEXT,'DISPLAY_NAME' TEXT,'BAD_UUID' INTEGER NOT NULL ,'IS_FRIEND' INTEGER NOT NULL ,'RIGHTS_GIVEN' INTEGER NOT NULL ,'RIGHTS_HAS' INTEGER NOT NULL );")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_Users_UUID ON Users (UUID);")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val str = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${str}'Users'")
        }
    }
}
