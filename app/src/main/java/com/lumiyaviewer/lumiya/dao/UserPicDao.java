package com.lumiyaviewer.lumiya.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.DaoConfig;

public class UserPicDao extends AbstractDao<UserPic, Long> {
    public static final String TABLENAME = "USER_PIC";

    public static class Properties {
        public static final Property Id = new Property(0, Long.class, "id", true, "_id");
        public static final Property Uuid = new Property(1, String.class, "uuid", false, "UUID");
        public static final Property Bitmap = new Property(2, byte[].class, "bitmap", false, "BITMAP");
    }

    public UserPicDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public UserPicDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        String str = z ? "IF NOT EXISTS " : "";
        sqLiteDatabase.execSQL("CREATE TABLE " + str + "'USER_PIC' ('_id' INTEGER PRIMARY KEY ,'UUID' TEXT,'BITMAP' BLOB);");
        sqLiteDatabase.execSQL("CREATE INDEX " + str + "IDX_USER_PIC_UUID ON USER_PIC (UUID);");
    }

    public static void dropTable(SQLiteDatabase sqLiteDatabase, boolean z) {
        sqLiteDatabase.execSQL("DROP TABLE " + (z ? "IF EXISTS " : "") + "'USER_PIC'");
    }

    @Override
    public void bindValues(SQLiteStatement sqLiteStatement, UserPic userPic) {
        sqLiteStatement.clearBindings();
        Long id = userPic.getId();
        if (id != null) {
            sqLiteStatement.bindLong(1, id.longValue());
        }
        String uuid = userPic.getUuid();
        if (uuid != null) {
            sqLiteStatement.bindString(2, uuid);
        }
        byte[] bitmap = userPic.getBitmap();
        if (bitmap != null) {
            sqLiteStatement.bindBlob(3, bitmap);
        }
    }

    @Override
    public Long getKey(UserPic userPic) {
        if (userPic != null) {
            return userPic.getId();
        }
        return null;
    }

    @Override
    protected boolean isEntityUpdateable() {
        return true;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public UserPic readEntity(Cursor cursor, int i) {
        return new UserPic(cursor.isNull(i + 0) ? null : Long.valueOf(cursor.getLong(i + 0)), cursor.isNull(i + 1) ? null : cursor.getString(i + 1), cursor.isNull(i + 2) ? null : cursor.getBlob(i + 2));
    }

    @Override
    public void readEntity(Cursor cursor, UserPic userPic, int i) {
        userPic.setId(cursor.isNull(i + 0) ? null : Long.valueOf(cursor.getLong(i + 0)));
        userPic.setUuid(cursor.isNull(i + 1) ? null : cursor.getString(i + 1));
        userPic.setBitmap(cursor.isNull(i + 2) ? null : cursor.getBlob(i + 2));
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
    public Long updateKeyAfterInsert(UserPic userPic, long j) {
        userPic.setId(Long.valueOf(j));
        return Long.valueOf(j);
    }
}
