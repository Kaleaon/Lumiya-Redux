package com.lumiyaviewer.lumiya.dao

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteStatement
import de.greenrobot.dao.AbstractDao
import de.greenrobot.dao.Property
import de.greenrobot.dao.internal.DaoConfig
import java.util.UUID

class GroupRoleMemberDao : AbstractDao<GroupRoleMember, Void> {

    object Properties {
        @JvmField val GroupID = Property(0, UUID::class.java, "groupID", false, "GROUP_ID")
        @JvmField val RequestID = Property(1, UUID::class.java, "requestID", false, "REQUEST_ID")
        @JvmField val RoleID = Property(2, UUID::class.java, "roleID", false, "ROLE_ID")
        @JvmField val UserID = Property(3, UUID::class.java, "userID", false, "USER_ID")
    }

    constructor(daoConfig: DaoConfig) : super(daoConfig)

    constructor(daoConfig: DaoConfig, daoSession: DaoSession) : super(daoConfig, daoSession)

    override fun bindValues(sqLiteStatement: SQLiteStatement, groupRoleMember: GroupRoleMember) {
        sqLiteStatement.clearBindings()
        sqLiteStatement.bindString(1, groupRoleMember.groupID.toString())
        sqLiteStatement.bindString(2, groupRoleMember.requestID.toString())
        sqLiteStatement.bindString(3, groupRoleMember.roleID.toString())
        sqLiteStatement.bindString(4, groupRoleMember.userID.toString())
    }

    override fun getKey(groupRoleMember: GroupRoleMember?): Void? = null

    override fun isEntityUpdateable(): Boolean = true

    override fun readEntity(cursor: Cursor, offset: Int): GroupRoleMember {
        return GroupRoleMember(
            UUID.fromString(cursor.getString(offset + 0)),
            UUID.fromString(cursor.getString(offset + 1)),
            UUID.fromString(cursor.getString(offset + 2)),
            UUID.fromString(cursor.getString(offset + 3))
        )
    }

    override fun readEntity(cursor: Cursor, groupRoleMember: GroupRoleMember, offset: Int) {
        groupRoleMember.groupID = UUID.fromString(cursor.getString(offset + 0))
        groupRoleMember.requestID = UUID.fromString(cursor.getString(offset + 1))
        groupRoleMember.roleID = UUID.fromString(cursor.getString(offset + 2))
        groupRoleMember.userID = UUID.fromString(cursor.getString(offset + 3))
    }

    override fun readKey(cursor: Cursor, offset: Int): Void? = null

    override fun updateKeyAfterInsert(groupRoleMember: GroupRoleMember, rowId: Long): Void? = null

    companion object {
        const val TABLENAME = "GroupRoleMembers"

        @JvmStatic
        fun createTable(sqLiteDatabase: SQLiteDatabase, ifNotExists: Boolean) {
            val str = if (ifNotExists) "IF NOT EXISTS " else ""
            sqLiteDatabase.execSQL("CREATE TABLE ${str}'GroupRoleMembers' ('GROUP_ID' TEXT NOT NULL ,'REQUEST_ID' TEXT NOT NULL ,'ROLE_ID' TEXT NOT NULL ,'USER_ID' TEXT NOT NULL );")
            sqLiteDatabase.execSQL("CREATE INDEX ${str}IDX_GroupRoleMembers_GROUP_ID_ROLE_ID_REQUEST_ID ON GroupRoleMembers (GROUP_ID,ROLE_ID,REQUEST_ID);")
        }

        @JvmStatic
        fun dropTable(sqLiteDatabase: SQLiteDatabase, ifExists: Boolean) {
            val str = if (ifExists) "IF EXISTS " else ""
            sqLiteDatabase.execSQL("DROP TABLE ${str}'GroupRoleMembers'")
        }
    }
}
