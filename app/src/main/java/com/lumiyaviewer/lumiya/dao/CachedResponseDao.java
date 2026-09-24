package com.lumiyaviewer.lumiya.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.DaoConfig;

public class CachedResponseDao extends AbstractDao<CachedResponse, String> {
    public static final String TABLENAME = "CachedResponses";

    public static class Properties {
        public static final Property Key = new Property(0, String.class, "key", true, "KEY");
        public static final Property Data = new Property(1, byte[].class, "data", false, "DATA");
        public static final Property MustRevalidate = new Property(2, Boolean.TYPE, "mustRevalidate", false, "MUST_REVALIDATE");
    }

    public CachedResponseDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public CachedResponseDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "'CachedResponses' ('KEY' TEXT PRIMARY KEY NOT NULL ,'DATA' BLOB,'MUST_REVALIDATE' INTEGER NOT NULL );");
    }

    public static void dropTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("DROP TABLE " + (z ? "IF EXISTS " : "") + "'CachedResponses'");
    }

    @Override
    public void bindValues(SQLiteStatement sqLiteStatement, CachedResponse cachedResponse) {
        sqLiteStatement.clearBindings();
        String key = cachedResponse.getKey();
        if (key != null) {
            sqLiteStatement.bindString(1, key);
        }
        byte[] data = cachedResponse.getData();
        if (data != null) {
            sqLiteStatement.bindBlob(2, data);
        }
        sqLiteStatement.bindLong(3, cachedResponse.getMustRevalidate() ? 1L : 0L);
    }

    @Override
    public String getKey(CachedResponse cachedResponse) {
        if (cachedResponse != null) {
            return cachedResponse.getKey();
        }
        return null;
    }

    @Override
    protected boolean isEntityUpdateable() {
        return true;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public CachedResponse readEntity(Cursor cursor, int i) {
        return new CachedResponse(cursor.isNull(i + 0) ? null : cursor.getString(i + 0), cursor.isNull(i + 1) ? null : cursor.getBlob(i + 1), cursor.getShort(i + 2) != 0);
    }

    @Override
    public void readEntity(Cursor cursor, CachedResponse cachedResponse, int i) {
        cachedResponse.setKey(cursor.isNull(i + 0) ? null : cursor.getString(i + 0));
        cachedResponse.setData(cursor.isNull(i + 1) ? null : cursor.getBlob(i + 1));
        cachedResponse.setMustRevalidate(cursor.getShort(i + 2) != 0);
    }

    @Override
    public String readKey(Cursor cursor, int i) {
        if (cursor.isNull(i + 0)) {
            return null;
        }
        return cursor.getString(i + 0);
    }

    @Override
    public String updateKeyAfterInsert(CachedResponse cachedResponse, long j) {
        return cachedResponse.getKey();
    }
}
