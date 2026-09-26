package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class GroupMemberListDao : AbstractDao<GroupMemberList, UUID> {

    object Properties {
        @JvmField val GroupID = Property(0, UUID::class.java, "groupID", true, "GROUP_ID")
        @JvmField val RequestID = Property(1, UUID::class.java, "requestID", false, "REQUEST_ID")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, groupMemberList: GroupMemberList) {
        sqLiteStatement.clearBindings()
        val groupID = groupMemberList.groupID
        if (groupID != null) {
            sqLiteStatement.bindString(1, groupID.toString())
        }
        sqLiteStatement.bindString(2, groupMemberList.requestID.toString())
    }

    override fun getKey(groupMemberList: GroupMemberList?): UUID? {
        return groupMemberList?.groupID
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): GroupMemberList {
        return GroupMemberList(
            if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0)),
            UUID.fromString(cursor.getString(offset + 1))
        )
    }

    override fun readEntity(cursor: Cursor, groupMemberList: GroupMemberList, offset: Int) {
        groupMemberList.groupID = if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0))
        groupMemberList.requestID = UUID.fromString(cursor.getString(offset + 1))
    }

    override fun readKey(cursor: Cursor, offset: Int): UUID? {
        return if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0))
    }

    override fun updateKeyAfterInsert(groupMemberList: GroupMemberList, rowId: Long): UUID? {
        return groupMemberList.groupID
    }

    companion object {
        const val TABLENAME = "GroupMemberLists"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'GroupMemberLists' ('GROUP_ID' TEXT PRIMARY KEY ,'REQUEST_ID' TEXT NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'GroupMemberLists'")
        }
    }
}
