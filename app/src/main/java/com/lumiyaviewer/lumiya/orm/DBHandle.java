package com.lumiyaviewer.lumiya.orm;

import android.database.Cursor;
import android.database.sqlite.SQLiteCursor;
import android.database.sqlite.SQLiteCursorDriver;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQuery;

public final class DBHandle implements SQLiteDatabase.CursorFactory {
    private final SQLiteDatabase sqliteDB;

    private class DBHandleCursor extends SQLiteCursor {
        public DBHandleCursor(SQLiteDatabase sqLiteDatabase, SQLiteCursorDriver sqLiteCursorDriver, String str, SQLiteQuery sqLiteQuery) {
            super(sqLiteDatabase, sqLiteCursorDriver, str, sqLiteQuery);
        }
    }

    public DBHandle(SQLiteDatabase sqLiteDatabase) {
        this.sqliteDB = sqLiteDatabase;
    }

    public final SQLiteDatabase getDB() {
        return this.sqliteDB;
    }

    @Override
    public Cursor newCursor(SQLiteDatabase sqLiteDatabase, SQLiteCursorDriver sqLiteCursorDriver, String str, SQLiteQuery sqLiteQuery) {
        return new DBHandleCursor(sqLiteDatabase, sqLiteCursorDriver, str, sqLiteQuery);
    }
}
