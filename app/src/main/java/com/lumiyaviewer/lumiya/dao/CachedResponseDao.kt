package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig

class CachedResponseDao : AbstractDao<CachedResponse, String> {

    object Properties {
        @JvmField val Key = Property(0, String::class.java, "key", true, "KEY")
        @JvmField val Data = Property(1, ByteArray::class.java, "data", false, "DATA")
        @JvmField val MustRevalidate = Property(2, java.lang.Boolean.TYPE, "mustRevalidate", false, "MUST_REVALIDATE")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, cachedResponse: CachedResponse) {
        sqLiteStatement.clearBindings()
        val key = cachedResponse.key
        if (key != null) {
            sqLiteStatement.bindString(1, key)
        }
        val data = cachedResponse.data
        if (data != null) {
            sqLiteStatement.bindBlob(2, data)
        }
        sqLiteStatement.bindLong(3, if (cachedResponse.mustRevalidate) 1L else 0L)
    }

    override fun getKey(cachedResponse: CachedResponse?): String? {
        return cachedResponse?.key
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): CachedResponse {
        return CachedResponse(
            if (cursor.isNull(offset + 0)) null else cursor.getString(offset + 0),
            if (cursor.isNull(offset + 1)) null else cursor.getBlob(offset + 1),
            cursor.getShort(offset + 2).toInt() != 0
        )
    }

    override fun readEntity(cursor: Cursor, cachedResponse: CachedResponse, offset: Int) {
        cachedResponse.key = if (cursor.isNull(offset + 0)) null else cursor.getString(offset + 0)
        cachedResponse.data = if (cursor.isNull(offset + 1)) null else cursor.getBlob(offset + 1)
        cachedResponse.mustRevalidate = cursor.getShort(offset + 2).toInt() != 0
    }

    override fun readKey(cursor: Cursor, offset: Int): String? {
        return if (cursor.isNull(offset + 0)) null else cursor.getString(offset + 0)
    }

    override fun updateKeyAfterInsert(cachedResponse: CachedResponse, rowId: Long): String? {
        return cachedResponse.key
    }

    companion object {
        const val TABLENAME = "CachedResponses"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'CachedResponses' ('KEY' TEXT PRIMARY KEY NOT NULL ,'DATA' BLOB,'MUST_REVALIDATE' INTEGER NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'CachedResponses'")
        }
    }
}
