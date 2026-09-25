package com.lumiyaviewer.lumiya.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.DaoConfig;
import java.util.UUID;

public class FriendDao extends AbstractDao<Friend, UUID> {
    public static final String TABLENAME = "Friends";

    public static class Properties {
        public static final Property Uuid = new Property(0, UUID.class, "uuid", true, "UUID");
        public static final Property RightsGiven = new Property(1, Integer.TYPE, "rightsGiven", false, "RIGHTS_GIVEN");
        public static final Property RightsHas = new Property(2, Integer.TYPE, "rightsHas", false, "RIGHTS_HAS");
        public static final Property IsOnline = new Property(3, Boolean.TYPE, "isOnline", false, "IS_ONLINE");
    }

    public FriendDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public FriendDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "'Friends' ('UUID' TEXT PRIMARY KEY ,'RIGHTS_GIVEN' INTEGER NOT NULL ,'RIGHTS_HAS' INTEGER NOT NULL ,'IS_ONLINE' INTEGER NOT NULL );");
    }

    public static void dropTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("DROP TABLE " + (z ? "IF EXISTS " : "") + "'Friends'");
    }

    @Override
    public void bindValues(SQLiteStatement sqLiteStatement, Friend friend) {
        sqLiteStatement.clearBindings();
        UUID uuid = friend.getUuid();
        if (uuid != null) {
            sqLiteStatement.bindString(1, uuid.toString());
        }
        sqLiteStatement.bindLong(2, friend.getRightsGiven());
        sqLiteStatement.bindLong(3, friend.getRightsHas());
        sqLiteStatement.bindLong(4, friend.isOnline ? 1L : 0L);
    }

    @Override
    public UUID getKey(Friend friend) {
        if (friend != null) {
            return friend.getUuid();
        }
        return null;
    }

    @Override
    protected boolean isEntityUpdateable() {
        return true;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public Friend readEntity(Cursor cursor, int i) {
        return new Friend(cursor.isNull(i + 0) ? null : UUID.fromString(cursor.getString(i + 0)), cursor.getInt(i + 1), cursor.getInt(i + 2), cursor.getShort(i + 3) != 0);
    }

    @Override
    public void readEntity(Cursor cursor, Friend friend, int i) {
        friend.setUuid(cursor.isNull(i + 0) ? null : UUID.fromString(cursor.getString(i + 0)));
        friend.setRightsGiven(cursor.getInt(i + 1));
        friend.setRightsHas(cursor.getInt(i + 2));
        friend.isOnline = cursor.getShort(i + 3) != 0;
    }

    @Override
    public UUID readKey(Cursor cursor, int i) {
        if (cursor.isNull(i + 0)) {
            return null;
        }
        return UUID.fromString(cursor.getString(i + 0));
    }

    @Override
    public UUID updateKeyAfterInsert(Friend friend, long j) {
        return friend.getUuid();
    }
}
