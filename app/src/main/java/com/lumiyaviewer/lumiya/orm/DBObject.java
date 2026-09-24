package com.lumiyaviewer.lumiya.orm;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;
import android.os.Parcelable;
import java.nio.ByteBuffer;
import java.util.UUID;

public abstract class DBObject implements Parcelable {
    protected long _id;

    public static class DatabaseBindingException extends Exception {
        public DatabaseBindingException(Class<?> cls, String str) {
            super("Failed to bind " + cls.getSimpleName() + ": " + str);
        }

        public DatabaseBindingException(String str) {
            super(str);
        }
    }

    public DBObject() {
        this._id = 0L;
    }

    public DBObject(Cursor cursor) {
        loadFromCursor(cursor);
    }

    public DBObject(SQLiteDatabase sqLiteDatabase, long j) throws DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DatabaseBindingException(getClass(), "database not opened.");
        }
        Cursor query = sqLiteDatabase.query(getTableName(), getFieldNames(), "_id = ?", new String[]{Long.toString(j)}, null, null, null);
        if (!query.moveToFirst()) {
            query.close();
            throw new DatabaseBindingException(getClass(), "not found: _id = " + j);
        }
        loadFromCursor(query);
        query.close();
    }

    protected UUID UUIDfromBlob(byte[] bytes) {
        ByteBuffer wrap = ByteBuffer.wrap(bytes);
        return new UUID(wrap.getLong(), wrap.getLong());
    }

    protected byte[] UUIDtoBlob(UUID uuid) {
        ByteBuffer wrap = ByteBuffer.wrap(new byte[16]);
        wrap.putLong(uuid.getMostSignificantBits());
        wrap.putLong(uuid.getLeastSignificantBits());
        return wrap.array();
    }

    public abstract void bindInsertOrUpdate(SQLiteStatement sqLiteStatement);

    public void delete(SQLiteDatabase sqLiteDatabase) throws DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DatabaseBindingException(getClass(), "database not opened.");
        }
        if (this._id != 0) {
            sqLiteDatabase.delete(getTableName(), "_id = ?", new String[]{Long.toString(this._id)});
        }
    }

    public abstract ContentValues getContentValues();

    protected abstract String[] getFieldNames();

    public long getId() {
        return this._id;
    }

    protected abstract String getTableName();

    public abstract void loadFromCursor(Cursor cursor);

    public void reload(SQLiteDatabase sqLiteDatabase) throws DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DatabaseBindingException(getClass(), "database not opened.");
        }
        if (this._id != 0) {
            Cursor query = sqLiteDatabase.query(getTableName(), getFieldNames(), "_id = ?", new String[]{Long.toString(this._id)}, null, null, null);
            if (query.moveToFirst()) {
                loadFromCursor(query);
            }
            query.close();
        }
    }

    public void resetId() {
        this._id = 0L;
    }

    public void save(SQLiteDatabase sqLiteDatabase) throws DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DatabaseBindingException(getClass(), "database not opened.");
        }
        String tableName = getTableName();
        ContentValues contentValues = getContentValues();
        try {
            if (this._id != 0) {
                sqLiteDatabase.update(tableName, contentValues, "_id = ?", new String[]{Long.toString(this._id)});
            } else {
                this._id = sqLiteDatabase.insert(tableName, null, contentValues);
            }
        } catch (SQLiteException e) {
            DatabaseBindingException databaseBindingException = new DatabaseBindingException(getClass(), "insert or update failed");
            databaseBindingException.initCause(e);
            throw databaseBindingException;
        }
    }

    protected void updateOrInsert(SQLiteDatabase sqLiteDatabase, String str, String[] strArr) throws DatabaseBindingException {
        if (sqLiteDatabase == null) {
            throw new DatabaseBindingException(getClass(), "database not opened.");
        }
        String tableName = getTableName();
        ContentValues contentValues = getContentValues();
        try {
            if (sqLiteDatabase.update(tableName, contentValues, str, strArr) == 0) {
                this._id = sqLiteDatabase.insert(tableName, null, contentValues);
            }
        } catch (SQLiteException e) {
            DatabaseBindingException databaseBindingException = new DatabaseBindingException(getClass(), "insert or update failed");
            databaseBindingException.initCause(e);
            throw databaseBindingException;
        }
    }

    protected void updateOrInsert(SQLiteStatement sqLiteStatement, SQLiteStatement sqLiteStatement2) throws DatabaseBindingException {
        try {
            bindInsertOrUpdate(sqLiteStatement);
            if (sqLiteStatement.executeUpdateDelete() == 0) {
                bindInsertOrUpdate(sqLiteStatement2);
                this._id = sqLiteStatement2.executeInsert();
            }
        } catch (SQLiteException e) {
            DatabaseBindingException databaseBindingException = new DatabaseBindingException(getClass(), "insert or update failed");
            databaseBindingException.initCause(e);
            throw databaseBindingException;
        }
    }
}
