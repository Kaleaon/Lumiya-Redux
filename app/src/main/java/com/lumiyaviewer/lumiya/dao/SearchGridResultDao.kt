package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class SearchGridResultDao : AbstractDao<SearchGridResult, Long> {

    object Properties {
        @JvmField val Id = Property(0, Long::class.javaObjectType, "id", true, "_id")
        @JvmField val SearchUUID = Property(1, UUID::class.java, "searchUUID", false, "SEARCH_UUID")
        @JvmField val ItemType = Property(2, Integer.TYPE, "itemType", false, "ITEM_TYPE")
        @JvmField val ItemUUID = Property(3, UUID::class.java, "itemUUID", false, "ITEM_UUID")
        @JvmField val ItemName = Property(4, String::class.java, "itemName", false, "ITEM_NAME")
        @JvmField val LevensteinDistance = Property(5, Integer.TYPE, "levensteinDistance", false, "LEVENSTEIN_DISTANCE")
        @JvmField val MemberCount = Property(6, Integer::class.javaObjectType, "memberCount", false, "MEMBER_COUNT")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, searchGridResult: SearchGridResult) {
        sqLiteStatement.clearBindings()
        val id = searchGridResult.id
        if (id != null) {
            sqLiteStatement.bindLong(1, id)
        }
        sqLiteStatement.bindString(2, searchGridResult.searchUUID.toString())
        sqLiteStatement.bindLong(3, searchGridResult.itemType.toLong())
        sqLiteStatement.bindString(4, searchGridResult.itemUUID.toString())
        sqLiteStatement.bindString(5, searchGridResult.itemName)
        sqLiteStatement.bindLong(6, searchGridResult.levensteinDistance.toLong())
        val memberCount = searchGridResult.memberCount
        if (memberCount != null) {
            sqLiteStatement.bindLong(7, memberCount.toLong())
        }
    }

    override fun getKey(searchGridResult: SearchGridResult?): Long? {
        return searchGridResult?.id
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): SearchGridResult {
        return SearchGridResult(
            if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0),
            UUID.fromString(cursor.getString(offset + 1)),
            cursor.getInt(offset + 2),
            UUID.fromString(cursor.getString(offset + 3)),
            cursor.getString(offset + 4),
            cursor.getInt(offset + 5),
            if (cursor.isNull(offset + 6)) null else cursor.getInt(offset + 6)
        )
    }

    override fun readEntity(cursor: Cursor, searchGridResult: SearchGridResult, offset: Int) {
        searchGridResult.id = if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
        searchGridResult.searchUUID = UUID.fromString(cursor.getString(offset + 1))
        searchGridResult.itemType = cursor.getInt(offset + 2)
        searchGridResult.itemUUID = UUID.fromString(cursor.getString(offset + 3))
        searchGridResult.itemName = cursor.getString(offset + 4)
        searchGridResult.levensteinDistance = cursor.getInt(offset + 5)
        searchGridResult.memberCount = if (cursor.isNull(offset + 6)) null else cursor.getInt(offset + 6)
    }

    override fun readKey(cursor: Cursor, offset: Int): Long? {
        return if (cursor.isNull(offset + 0)) null else cursor.getLong(offset + 0)
    }

    override fun updateKeyAfterInsert(searchGridResult: SearchGridResult, rowId: Long): Long {
        searchGridResult.id = rowId
        return rowId
    }

    companion object {
        const val TABLENAME = "SearchGridResults"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val str = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${str}'SearchGridResults' ('_id' INTEGER PRIMARY KEY ,'SEARCH_UUID' TEXT NOT NULL ,'ITEM_TYPE' INTEGER NOT NULL ,'ITEM_UUID' TEXT NOT NULL ,'ITEM_NAME' TEXT NOT NULL ,'LEVENSTEIN_DISTANCE' INTEGER NOT NULL ,'MEMBER_COUNT' INTEGER);")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_SearchGridResults_SEARCH_UUID ON SearchGridResults (SEARCH_UUID);")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val str = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${str}'SearchGridResults'")
        }
    }
}
