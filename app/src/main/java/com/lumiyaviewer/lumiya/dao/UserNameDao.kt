package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class UserNameDao : AbstractDao<UserName, UUID> {

    object Properties {
        @JvmField val Uuid = Property(0, UUID::class.java, "uuid", true, "UUID")
        @JvmField val UserName = Property(1, String::class.java, "userName", false, "USER_NAME")
        @JvmField val DisplayName = Property(2, String::class.java, "displayName", false, "DISPLAY_NAME")
        @JvmField val IsBadUUID = Property(3, java.lang.Boolean.TYPE, "isBadUUID", false, "IS_BAD_UUID")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, userName: UserName) {
        sqLiteStatement.clearBindings()
        val uuid = userName.uuid
        if (uuid != null) {
            sqLiteStatement.bindString(1, uuid.toString())
        }
        val un = userName.userName
        if (un != null) {
            sqLiteStatement.bindString(2, un)
        }
        val displayName = userName.displayName
        if (displayName != null) {
            sqLiteStatement.bindString(3, displayName)
        }
        sqLiteStatement.bindLong(4, if (userName.isBadUUID) 1L else 0L)
    }

    override fun getKey(userName: UserName?): UUID? {
        return userName?.uuid
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): UserName {
        return UserName(
            if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0)),
            if (cursor.isNull(offset + 1)) null else cursor.getString(offset + 1),
            if (cursor.isNull(offset + 2)) null else cursor.getString(offset + 2),
            cursor.getShort(offset + 3).toInt() != 0
        )
    }

    override fun readEntity(cursor: Cursor, userName: UserName, offset: Int) {
        userName.uuid = if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0))
        userName.userName = if (cursor.isNull(offset + 1)) null else cursor.getString(offset + 1)
        userName.displayName = if (cursor.isNull(offset + 2)) null else cursor.getString(offset + 2)
        userName.isBadUUID = cursor.getShort(offset + 3).toInt() != 0
    }

    override fun readKey(cursor: Cursor, offset: Int): UUID? {
        return if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0))
    }

    override fun updateKeyAfterInsert(userName: UserName, rowId: Long): UUID? {
        return userName.uuid
    }

    companion object {
        const val TABLENAME = "UserNames"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'UserNames' ('UUID' TEXT PRIMARY KEY ,'USER_NAME' TEXT,'DISPLAY_NAME' TEXT,'IS_BAD_UUID' INTEGER NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'UserNames'")
        }
    }
}
