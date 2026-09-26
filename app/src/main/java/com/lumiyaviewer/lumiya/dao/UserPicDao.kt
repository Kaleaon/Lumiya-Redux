package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig

class UserPicDao : AbstractDao<UserPic, Long> {

    object Properties {
        @JvmField val Id = Property(0, Long::class.javaObjectType, "id", true, "_id")
        @JvmField val Uuid = Property(1, String::class.java, "uuid", false, "UUID")
        @JvmField val Bitmap = Property(2, ByteArray::class.java, "bitmap", false, "BITMAP")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, userPic: UserPic) {
        sqLiteStatement.clearBindings()
        val id = userPic.id
        if (id != null) {
            sqLiteStatement.bindLong(1, id)
        }
        val uuid = userPic.uuid
        if (uuid != null) {
            sqLiteStatement.bindString(2, uuid)
        }
        val bitmap = userPic.bitmap
        if (bitmap != null) {
            sqLiteStatement.bindBlob(3, bitmap)
        }
    }

    override fun getKey(userPic: UserPic?): Long? {
        return userPic?.id
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): UserPic {
        return UserPic(
            if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0),
            if (cursor.isNull(offset + 1)) null else cursor.getString(offset + 1),
            if (cursor.isNull(offset + 2)) null else cursor.getBlob(offset + 2)
        )
    }

    override fun readEntity(cursor: Cursor, userPic: UserPic, offset: Int) {
        userPic.id = if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
        userPic.uuid = if (cursor.isNull(offset + 1)) null else cursor.getString(offset + 1)
        userPic.bitmap = if (cursor.isNull(offset + 2)) null else cursor.getBlob(offset + 2)
    }

    override fun readKey(cursor: Cursor, offset: Int): Long? {
        return if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
    }

    override fun updateKeyAfterInsert(userPic: UserPic, rowId: Long): Long {
        userPic.id = rowId
        return rowId
    }

    companion object {
        const val TABLENAME = "USER_PIC"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val str = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${str}'USER_PIC' ('_id' INTEGER PRIMARY KEY ,'UUID' TEXT,'BITMAP' BLOB);")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_USER_PIC_UUID ON USER_PIC (UUID);")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val str = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${str}'USER_PIC'")
        }
    }
}
