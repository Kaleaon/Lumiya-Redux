package com.lumiyaviewer.lumiya.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.DaoConfig;
import java.util.UUID;

public class GroupRoleMemberDao extends AbstractDao<GroupRoleMember, Void> {
    public static final String TABLENAME = "GroupRoleMembers";

    public static class Properties {
        public static final Property GroupID = new Property(0, UUID.class, "groupID", false, "GROUP_ID");
        public static final Property RequestID = new Property(1, UUID.class, "requestID", false, "REQUEST_ID");
        public static final Property RoleID = new Property(2, UUID.class, "roleID", false, "ROLE_ID");
        public static final Property UserID = new Property(3, UUID.class, "userID", false, "USER_ID");
    }

    public GroupRoleMemberDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public GroupRoleMemberDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        String str = z ? "IF NOT EXISTS " : "";
        sqLiteDatabase.execSQL("CREATE TABLE " + str + "'GroupRoleMembers' ('GROUP_ID' TEXT NOT NULL ,'REQUEST_ID' TEXT NOT NULL ,'ROLE_ID' TEXT NOT NULL ,'USER_ID' TEXT NOT NULL );");
        sqLiteDatabase.execSQL("CREATE INDEX " + str + "IDX_GroupRoleMembers_GROUP_ID_ROLE_ID_REQUEST_ID ON GroupRoleMembers (GROUP_ID,ROLE_ID,REQUEST_ID);");
    }

    public static void dropTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("DROP TABLE " + (z ? "IF EXISTS " : "") + "'GroupRoleMembers'");
    }

    @Override
    public void bindValues(SQLiteStatement sqLiteStatement, GroupRoleMember groupRoleMember) {
        sqLiteStatement.clearBindings();
        sqLiteStatement.bindString(1, groupRoleMember.getGroupID().toString());
        sqLiteStatement.bindString(2, groupRoleMember.getRequestID().toString());
        sqLiteStatement.bindString(3, groupRoleMember.getRoleID().toString());
        sqLiteStatement.bindString(4, groupRoleMember.getUserID().toString());
    }

    @Override
    public Void getKey(GroupRoleMember groupRoleMember) {
        return null;
    }

    @Override
    protected boolean isEntityUpdateable() {
        return true;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public GroupRoleMember readEntity(Cursor cursor, int i) {
        return new GroupRoleMember(UUID.fromString(cursor.getString(i + 0)), UUID.fromString(cursor.getString(i + 1)), UUID.fromString(cursor.getString(i + 2)), UUID.fromString(cursor.getString(i + 3)));
    }

    @Override
    public void readEntity(Cursor cursor, GroupRoleMember groupRoleMember, int i) {
        groupRoleMember.setGroupID(UUID.fromString(cursor.getString(i + 0)));
        groupRoleMember.setRequestID(UUID.fromString(cursor.getString(i + 1)));
        groupRoleMember.setRoleID(UUID.fromString(cursor.getString(i + 2)));
        groupRoleMember.setUserID(UUID.fromString(cursor.getString(i + 3)));
    }

    @Override
    public Void readKey(Cursor cursor, int i) {
        return null;
    }

    @Override
    public Void updateKeyAfterInsert(GroupRoleMember groupRoleMember, long j) {
        return null;
    }
}
