package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class GroupRoleMemberListDao : AbstractDao<GroupRoleMemberList, UUID> {

    object Properties {
        @JvmField val GroupID = Property(0, UUID::class.java, "groupID", true, "GROUP_ID")
        @JvmField val RequestID = Property(1, UUID::class.java, "requestID", false, "REQUEST_ID")
        @JvmField val MustRevalidate = Property(2, java.lang.Boolean.TYPE, "mustRevalidate", false, "MUST_REVALIDATE")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, groupRoleMemberList: GroupRoleMemberList) {
        sqLiteStatement.clearBindings()
        val groupID = groupRoleMemberList.getGroupID()
        if (groupID != null) {
            sqLiteStatement.bindString(1, groupID.toString())
        }
        sqLiteStatement.bindString(2, groupRoleMemberList.getRequestID().toString())
        sqLiteStatement.bindLong(3, if (groupRoleMemberList.getMustRevalidate()) 1L else 0L)
    }

    override fun getKey(groupRoleMemberList: GroupRoleMemberList?): UUID? {
        return groupRoleMemberList?.getGroupID()
    }

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): GroupRoleMemberList {
        return GroupRoleMemberList(
            if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0)),
            UUID.fromString(cursor.getString(offset + 1)),
            cursor.getShort(offset + 2).toInt() != 0
        )
    }

    override fun readEntity(cursor: Cursor, groupRoleMemberList: GroupRoleMemberList, offset: Int) {
        groupRoleMemberList.setGroupID(if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0)))
        groupRoleMemberList.setRequestID(UUID.fromString(cursor.getString(offset + 1)))
        groupRoleMemberList.setMustRevalidate(cursor.getShort(offset + 2).toInt() != 0)
    }

    override fun readKey(cursor: Cursor, offset: Int): UUID? {
        return if (cursor.isNull(offset + 0)) null else UUID.fromString(cursor.getString(offset + 0))
    }

    override fun updateKeyAfterInsert(groupRoleMemberList: GroupRoleMemberList, rowId: Long): UUID? {
        return groupRoleMemberList.getGroupID()
    }

    companion object {
        const val TABLENAME = "GroupRoleMemberLists"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val ifStr = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${ifStr}'GroupRoleMemberLists' ('GROUP_ID' TEXT PRIMARY KEY ,'REQUEST_ID' TEXT NOT NULL ,'MUST_REVALIDATE' INTEGER NOT NULL );")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val ifStr = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${ifStr}'GroupRoleMemberLists'")
        }
    }
}
