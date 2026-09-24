package com.lumiyaviewer.lumiya.slproto.inventory;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.orm.DBHandle;
import com.lumiyaviewer.lumiya.orm.DBHandleCache;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class SLInventoryOpenHelper implements DBHandleCache.DBOpenHelper {
    private static final int DB_VERSION = 21;

    private static class InstanceHolder {
        private static final SLInventoryOpenHelper Instance = new SLInventoryOpenHelper();

        private InstanceHolder() {
        }
    }

    private void enableWriteAheadLogging(SQLiteDatabase sqLiteDatabase) {
        try {
            Method method = sqLiteDatabase.getClass().getMethod("enableWriteAheadLogging", new Class[0]);
            if (method != null) {
                method.invoke(sqLiteDatabase, new Object[0]);
                Debug.Printf("Write-ahead logging is supported.", new Object[0]);
            }
        } catch (IllegalAccessException e) {
            Debug.Printf("Write-ahead logging not supported.", new Object[0]);
            e.printStackTrace();
        } catch (IllegalArgumentException e2) {
            Debug.Printf("Write-ahead logging not supported.", new Object[0]);
            e2.printStackTrace();
        } catch (NoSuchMethodException e3) {
            Debug.Printf("Write-ahead logging not supported.", new Object[0]);
        } catch (InvocationTargetException e4) {
            Debug.Printf("Write-ahead logging not supported.", new Object[0]);
            e4.printStackTrace();
        }
    }

    public static SLInventoryOpenHelper getInstance() {
        return InstanceHolder.Instance;
    }

    private boolean initTables(SQLiteDatabase sqLiteDatabase) throws SQLiteException {
        boolean z;
        boolean z2;
        sqLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS DBVersion (Version INTEGER);");
        Cursor query = sqLiteDatabase.query("DBVersion", new String[]{"Version"}, null, null, null, null, null);
        if (!query.moveToFirst()) {
            z = true;
            z2 = true;
        } else if (query.getInt(0) != 21) {
            z = false;
            z2 = true;
        } else {
            z = false;
            z2 = false;
        }
        query.close();
        if (!z2) {
            Debug.Printf("Database does not need upgrade.", new Object[0]);
            return false;
        }
        Debug.Printf("Database needs upgrade.", new Object[0]);
        try {
            for (String createTableStatement : SLInventoryEntry.getCreateTableStatements()) {
                Debug.Printf("Inventory init: %s", createTableStatement);
                sqLiteDatabase.execSQL(createTableStatement);
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("Version", (Integer) 21);
            if (z) {
                sqLiteDatabase.insert("DBVersion", null, contentValues);
            } else {
                sqLiteDatabase.update("DBVersion", contentValues, null, null);
            }
            Debug.Printf("Upgraded database to version %d", 21);
            return true;
        } catch (Exception e) {
            SQLiteException sqLiteException = new SQLiteException(e.getMessage());
            sqLiteException.initCause(e);
            throw sqLiteException;
        }
    }

    public synchronized DBHandle openDB(String str) {
        try {
            Debug.Printf("Opening inventory DB '%s'", str);
        } catch (SQLiteException e) {
            Debug.Warning(e);
            return null;
        }
        return DBHandleCache.getInstance().OpenDB(str, this);
    }

    @Override
    public SQLiteDatabase openOrCreateDatabase(String str) throws SQLiteException {
        SQLiteDatabase openOrCreateDatabase = SQLiteDatabase.openOrCreateDatabase(str, (SQLiteDatabase.CursorFactory) null);
        if (openOrCreateDatabase == null) {
            throw new SQLiteException("DB was null");
        }
        Debug.Printf("DB file '%s' opened", str);
        enableWriteAheadLogging(openOrCreateDatabase);
        if (initTables(openOrCreateDatabase)) {
            Debug.Printf("Reopening DB file '%s'", str);
            openOrCreateDatabase.close();
            openOrCreateDatabase = SQLiteDatabase.openOrCreateDatabase(str, (SQLiteDatabase.CursorFactory) null);
            if (openOrCreateDatabase == null) {
                throw new SQLiteException("DB was null");
            }
            enableWriteAheadLogging(openOrCreateDatabase);
        }
        return openOrCreateDatabase;
    }
}
