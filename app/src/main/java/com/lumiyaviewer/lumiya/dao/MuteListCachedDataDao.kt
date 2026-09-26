package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig

class MuteListCachedDataDao : AbstractDao<MuteListCachedData, Long> {

    object Properties {
        @JvmField val Id = Property(0, Long::class.javaObjectType, "id", true, "_id")
        @JvmField val CRC = Property(1, Integer.TYPE, "CRC", false, "CRC")
        @JvmField val Data = Property(2, ByteArray::class.java, "data", false, "DATA")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, muteListCachedData: MuteListCachedData) {
        sqLiteStatement.clearBindings()
        val id = muteListCachedData.id
        if (id != null) {
            sqLiteStatement.bindLong(1, id)
        }
        sqLiteStatement.bindLong(2, muteListCachedData.crc.toLong())
        sqLiteStatement.bindBlob(3, muteListCachedData.data)
    }

    override fun getKey(muteListCachedData: MuteListCachedData?): Long? {
        return muteListCachedData?.id
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): MuteListCachedData {
        return MuteListCachedData(
            if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0),
            cursor.getInt(offset + 1),
            cursor.getBlob(offset + 2)
        )
    }

    override fun readEntity(cursor: Cursor, muteListCachedData: MuteListCachedData, offset: Int) {
        muteListCachedData.id = if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
        muteListCachedData.crc = cursor.getInt(offset + 1)
        muteListCachedData.data = cursor.getBlob(offset + 2)
    }

    override fun readKey(cursor: Cursor, offset: Int): Long? {
        return if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
    }

    override fun updateKeyAfterInsert(muteListCachedData: MuteListCachedData, rowId: Long): Long {
        muteListCachedData.id = rowId
        return rowId
    }

    companion object {
        const val TABLENAME = "MUTE_LIST_CACHED_DATA"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'MUTE_LIST_CACHED_DATA' ('_id' INTEGER PRIMARY KEY ,'CRC' INTEGER NOT NULL ,'DATA' BLOB NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'MUTE_LIST_CACHED_DATA'")
        }
    }
}
