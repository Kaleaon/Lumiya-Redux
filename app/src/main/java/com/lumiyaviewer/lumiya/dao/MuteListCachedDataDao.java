package com.lumiyaviewer.lumiya.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.DaoConfig;

public class MuteListCachedDataDao extends AbstractDao<MuteListCachedData, Long> {
    public static final String TABLENAME = "MUTE_LIST_CACHED_DATA";

    public static class Properties {
        public static final Property Id = new Property(0, Long.class, "id", true, "_id");
        public static final Property CRC = new Property(1, Integer.TYPE, "CRC", false, "CRC");
        public static final Property Data = new Property(2, byte[].class, "data", false, "DATA");
    }

    public MuteListCachedDataDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public MuteListCachedDataDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(SQLiteDatabase sQLiteDatabase, boolean z) {
        sQLiteDatabase.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "'MUTE_LIST_CACHED_DATA' ('_id' INTEGER PRIMARY KEY ,'CRC' INTEGER NOT NULL ,'DATA' BLOB NOT NULL );");
    }

    public static void dropTable(SQLiteDatabase sQLiteDatabase, boolean z) {
        sQLiteDatabase.execSQL("DROP TABLE " + (z ? "IF EXISTS " : "") + "'MUTE_LIST_CACHED_DATA'");
    }

    @Override
    public void bindValues(SQLiteStatement sQLiteStatement, MuteListCachedData muteListCachedData) {
        sQLiteStatement.clearBindings();
        Long id = muteListCachedData.getId();
        if (id != null) {
            sQLiteStatement.bindLong(1, id.longValue());
        }
        sQLiteStatement.bindLong(2, muteListCachedData.getCRC());
        sQLiteStatement.bindBlob(3, muteListCachedData.getData());
    }

    @Override
    public Long getKey(MuteListCachedData muteListCachedData) {
        if (muteListCachedData != null) {
            return muteListCachedData.getId();
        }
        return null;
    }

    @Override
    protected boolean isEntityUpdateable() {
        return true;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public MuteListCachedData readEntity(Cursor cursor, int i) {
        return new MuteListCachedData(cursor.isNull(i + 0) ? null : Long.valueOf(cursor.getLong(i + 0)), cursor.getInt(i + 1), cursor.getBlob(i + 2));
    }

    @Override
    public void readEntity(Cursor cursor, MuteListCachedData muteListCachedData, int i) {
        muteListCachedData.setId(cursor.isNull(i + 0) ? null : Long.valueOf(cursor.getLong(i + 0)));
        muteListCachedData.setCRC(cursor.getInt(i + 1));
        muteListCachedData.setData(cursor.getBlob(i + 2));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public Long readKey(Cursor cursor, int i) {
        if (cursor.isNull(i + 0)) {
            return null;
        }
        return Long.valueOf(cursor.getLong(i + 0));
    }

    @Override
    public Long updateKeyAfterInsert(MuteListCachedData muteListCachedData, long j) {
        muteListCachedData.setId(Long.valueOf(j));
        return Long.valueOf(j);
    }
}
