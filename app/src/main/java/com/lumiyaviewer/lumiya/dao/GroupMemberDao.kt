package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class GroupMemberDao : AbstractDao<GroupMember, Void> {

    object Properties {
        @JvmField val GroupID = Property(0, UUID::class.java, "groupID", false, "GROUP_ID")
        @JvmField val RequestID = Property(1, UUID::class.java, "requestID", false, "REQUEST_ID")
        @JvmField val UserID = Property(2, UUID::class.java, "userID", false, "USER_ID")
        @JvmField val Contribution = Property(3, Integer.TYPE, "contribution", false, "CONTRIBUTION")
        @JvmField val OnlineStatus = Property(4, String::class.java, "onlineStatus", false, "ONLINE_STATUS")
        @JvmField val AgentPowers = Property(5, Long::class.javaPrimitiveType, "agentPowers", false, "AGENT_POWERS")
        @JvmField val Title = Property(6, String::class.java, "title", false, "TITLE")
        @JvmField val IsOwner = Property(7, java.lang.Boolean.TYPE, "isOwner", false, "IS_OWNER")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, groupMember: GroupMember) {
        sqLiteStatement.clearBindings()
        sqLiteStatement.bindString(1, groupMember.groupID.toString())
        sqLiteStatement.bindString(2, groupMember.requestID.toString())
        sqLiteStatement.bindString(3, groupMember.userID.toString())
        sqLiteStatement.bindLong(4, groupMember.contribution.toLong())
        sqLiteStatement.bindString(5, groupMember.onlineStatus)
        sqLiteStatement.bindLong(6, groupMember.agentPowers)
        sqLiteStatement.bindString(7, groupMember.title)
        sqLiteStatement.bindLong(8, if (groupMember.isOwner) 1L else 0L)
    }

    override fun getKey(groupMember: GroupMember?): Void? = null

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): GroupMember {
        return GroupMember(
            UUID.fromString(cursor.getString(offset + 0)),
            UUID.fromString(cursor.getString(offset + 1)),
            UUID.fromString(cursor.getString(offset + 2)),
            cursor.getInt(offset + 3),
            cursor.getString(offset + 4),
            cursor.getLong(offset + 5),
            cursor.getString(offset + 6),
            cursor.getShort(offset + 7).toInt() != 0
        )
    }

    override fun readEntity(cursor: Cursor, groupMember: GroupMember, offset: Int) {
        groupMember.groupID = UUID.fromString(cursor.getString(offset + 0))
        groupMember.requestID = UUID.fromString(cursor.getString(offset + 1))
        groupMember.userID = UUID.fromString(cursor.getString(offset + 2))
        groupMember.contribution = cursor.getInt(offset + 3)
        groupMember.onlineStatus = cursor.getString(offset + 4)
        groupMember.agentPowers = cursor.getLong(offset + 5)
        groupMember.title = cursor.getString(offset + 6)
        groupMember.isOwner = cursor.getShort(offset + 7).toInt() != 0
    }

    override fun readKey(cursor: Cursor, offset: Int): Void? = null

    override fun updateKeyAfterInsert(groupMember: GroupMember, rowId: Long): Void? = null

    companion object {
        const val TABLENAME = "GroupMembers"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val str = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${str}'GroupMembers' ('GROUP_ID' TEXT NOT NULL ,'REQUEST_ID' TEXT NOT NULL ,'USER_ID' TEXT NOT NULL ,'CONTRIBUTION' INTEGER NOT NULL ,'ONLINE_STATUS' TEXT NOT NULL ,'AGENT_POWERS' INTEGER NOT NULL ,'TITLE' TEXT NOT NULL ,'IS_OWNER' INTEGER NOT NULL );")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_GroupMembers_GROUP_ID_REQUEST_ID ON GroupMembers (GROUP_ID,REQUEST_ID);")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val str = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${str}'GroupMembers'")
        }
    }
}
