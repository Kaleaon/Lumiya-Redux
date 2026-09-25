package com.lumiyaviewer.lumiya.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.DaoConfig;
import java.util.UUID;

public class UserNameDao extends AbstractDao<UserName, UUID> {
    public static final String TABLENAME = "UserNames";

    public static class Properties {
        public static final Property Uuid = new Property(0, UUID.class, "uuid", true, "UUID");
        public static final Property UserName = new Property(1, String.class, "userName", false, "USER_NAME");
        public static final Property DisplayName = new Property(2, String.class, "displayName", false, "DISPLAY_NAME");
        public static final Property IsBadUUID = new Property(3, Boolean.TYPE, "isBadUUID", false, "IS_BAD_UUID");
    }

    public UserNameDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public UserNameDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "'UserNames' ('UUID' TEXT PRIMARY KEY ,'USER_NAME' TEXT,'DISPLAY_NAME' TEXT,'IS_BAD_UUID' INTEGER NOT NULL );");
    }

    public static void dropTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("DROP TABLE " + (z ? "IF EXISTS " : "") + "'UserNames'");
    }

    @Override
    public void bindValues(SQLiteStatement sqLiteStatement, UserName userName) {
        sqLiteStatement.clearBindings();
        UUID uuid = userName.getUuid();
        if (uuid != null) {
            sqLiteStatement.bindString(1, uuid.toString());
        }
        String userName2 = userName.getUserName();
        if (userName2 != null) {
            sqLiteStatement.bindString(2, userName2);
        }
        String displayName = userName.getDisplayName();
        if (displayName != null) {
            sqLiteStatement.bindString(3, displayName);
        }
        sqLiteStatement.bindLong(4, userName.isBadUUID ? 1L : 0L);
    }

    @Override
    public UUID getKey(UserName userName) {
        if (userName != null) {
            return userName.getUuid();
        }
        return null;
    }

    @Override
    protected boolean isEntityUpdateable() {
        return true;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public UserName readEntity(Cursor cursor, int i) {
        return new UserName(cursor.isNull(i + 0) ? null : UUID.fromString(cursor.getString(i + 0)), cursor.isNull(i + 1) ? null : cursor.getString(i + 1), cursor.isNull(i + 2) ? null : cursor.getString(i + 2), cursor.getShort(i + 3) != 0);
    }

    @Override
    public void readEntity(Cursor cursor, UserName userName, int i) {
        userName.setUuid(cursor.isNull(i + 0) ? null : UUID.fromString(cursor.getString(i + 0)));
        userName.setUserName(cursor.isNull(i + 1) ? null : cursor.getString(i + 1));
        userName.setDisplayName(cursor.isNull(i + 2) ? null : cursor.getString(i + 2));
        userName.isBadUUID = cursor.getShort(i + 3) != 0;
    }

    @Override
    public UUID readKey(Cursor cursor, int i) {
        if (cursor.isNull(i + 0)) {
            return null;
        }
        return UUID.fromString(cursor.getString(i + 0));
    }

    @Override
    public UUID updateKeyAfterInsert(UserName userName, long j) {
        return userName.getUuid();
    }
}
