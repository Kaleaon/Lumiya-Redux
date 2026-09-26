package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import androidx.core.app.NotificationCompat
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig

class CachedAssetDao : AbstractDao<CachedAsset, String> {

    object Properties {
        @JvmField val Key = Property(0, String::class.java, "key", true, "KEY")
        @JvmField val Status = Property(1, Integer.TYPE, NotificationCompat.CATEGORY_STATUS, false, "STATUS")
        @JvmField val Data = Property(2, ByteArray::class.java, "data", false, "DATA")
        @JvmField val MustRevalidate = Property(3, java.lang.Boolean.TYPE, "mustRevalidate", false, "MUST_REVALIDATE")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, cachedAsset: CachedAsset) {
        sqLiteStatement.clearBindings()
        val key = cachedAsset.key
        if (key != null) {
            sqLiteStatement.bindString(1, key)
        }
        sqLiteStatement.bindLong(2, cachedAsset.status.toLong())
        val data = cachedAsset.data
        if (data != null) {
            sqLiteStatement.bindBlob(3, data)
        }
        sqLiteStatement.bindLong(4, if (cachedAsset.mustRevalidate) 1L else 0L)
    }

    override fun getKey(cachedAsset: CachedAsset?): String? {
        return cachedAsset?.key
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): CachedAsset {
        return CachedAsset(
            if (cursor.isNull(offset + 0)) null else cursor.getString(offset + 0),
            cursor.getInt(offset + 1),
            if (cursor.isNull(offset + 2)) null else cursor.getBlob(offset + 2),
            cursor.getShort(offset + 3).toInt() != 0
        )
    }

    override fun readEntity(cursor: Cursor, cachedAsset: CachedAsset, offset: Int) {
        cachedAsset.key = if (cursor.isNull(offset + 0)) null else cursor.getString(offset + 0)
        cachedAsset.status = cursor.getInt(offset + 1)
        cachedAsset.data = if (cursor.isNull(offset + 2)) null else cursor.getBlob(offset + 2)
        cachedAsset.mustRevalidate = cursor.getShort(offset + 3).toInt() != 0
    }

    override fun readKey(cursor: Cursor, offset: Int): String? {
        return if (cursor.isNull(offset + 0)) null else cursor.getString(offset + 0)
    }

    override fun updateKeyAfterInsert(cachedAsset: CachedAsset, rowId: Long): String? {
        return cachedAsset.key
    }

    companion object {
        const val TABLENAME = "CachedAssets"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'CachedAssets' ('KEY' TEXT PRIMARY KEY NOT NULL ,'STATUS' INTEGER NOT NULL ,'DATA' BLOB,'MUST_REVALIDATE' INTEGER NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'CachedAssets'")
        }
    }
}
