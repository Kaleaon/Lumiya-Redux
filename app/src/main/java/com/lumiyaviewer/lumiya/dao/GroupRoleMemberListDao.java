package com.lumiyaviewer.lumiya.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.DaoConfig;
import java.util.UUID;

public class GroupRoleMemberListDao extends AbstractDao<GroupRoleMemberList, UUID> {
    public static final String TABLENAME = "GroupRoleMemberLists";

    public static class Properties {
        public static final Property GroupID = new Property(0, UUID.class, "groupID", true, "GROUP_ID");
        public static final Property RequestID = new Property(1, UUID.class, "requestID", false, "REQUEST_ID");
        public static final Property MustRevalidate = new Property(2, Boolean.TYPE, "mustRevalidate", false, "MUST_REVALIDATE");
    }

    public GroupRoleMemberListDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public GroupRoleMemberListDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "'GroupRoleMemberLists' ('GROUP_ID' TEXT PRIMARY KEY ,'REQUEST_ID' TEXT NOT NULL ,'MUST_REVALIDATE' INTEGER NOT NULL );");
    }

    public static void dropTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("DROP TABLE " + (z ? "IF EXISTS " : "") + "'GroupRoleMemberLists'");
    }

    @Override
    public void bindValues(SQLiteStatement sqLiteStatement, GroupRoleMemberList groupRoleMemberList) {
        sqLiteStatement.clearBindings();
        UUID groupID = groupRoleMemberList.getGroupID();
        if (groupID != null) {
            sqLiteStatement.bindString(1, groupID.toString());
        }
        sqLiteStatement.bindString(2, groupRoleMemberList.getRequestID().toString());
        sqLiteStatement.bindLong(3, groupRoleMemberList.getMustRevalidate() ? 1L : 0L);
    }

    @Override
    public UUID getKey(GroupRoleMemberList groupRoleMemberList) {
        if (groupRoleMemberList != null) {
            return groupRoleMemberList.getGroupID();
        }
        return null;
    }

    @Override
    protected boolean isEntityUpdateable() {
        return true;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public GroupRoleMemberList readEntity(Cursor cursor, int i) {
        return new GroupRoleMemberList(cursor.isNull(i + 0) ? null : UUID.fromString(cursor.getString(i + 0)), UUID.fromString(cursor.getString(i + 1)), cursor.getShort(i + 2) != 0);
    }

    @Override
    public void readEntity(Cursor cursor, GroupRoleMemberList groupRoleMemberList, int i) {
        groupRoleMemberList.setGroupID(cursor.isNull(i + 0) ? null : UUID.fromString(cursor.getString(i + 0)));
        groupRoleMemberList.setRequestID(UUID.fromString(cursor.getString(i + 1)));
        groupRoleMemberList.setMustRevalidate(cursor.getShort(i + 2) != 0);
    }

    @Override
    public UUID readKey(Cursor cursor, int i) {
        if (cursor.isNull(i + 0)) {
            return null;
        }
        return UUID.fromString(cursor.getString(i + 0));
    }

    @Override
    public UUID updateKeyAfterInsert(GroupRoleMemberList groupRoleMemberList, long j) {
        return groupRoleMemberList.getGroupID();
    }
}
