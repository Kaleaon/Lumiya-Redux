package com.lumiyaviewer.lumiya.slproto.inventory

import android.content.ContentValues
import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteException
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.orm.DBHandle
import com.lumiyaviewer.lumiya.orm.DBHandleCache
import java.lang.reflect.InvocationTargetException
import java.lang.reflect.Method

open class SLInventoryOpenHelper : DBHandleCache.DBOpenHelper {
    @JvmStatic private var DB_VERSION: Int = 21

    private open class InstanceHolder {
        private SLInventoryOpenHelper Instance = SLInventoryOpenHelper()

        fun InstanceHolder(): private {
        }
    }

    private fun enableWriteAheadLogging(sqLiteDatabase: SQLiteDatabase) {
        try {
            var method: Method = sqLiteDatabase.javaClass.getMethod("enableWriteAheadLogging", arrayOfNulls<Class>(0))
            if (method != null) {
                method.invoke(sqLiteDatabase, arrayOfNulls<Object>(0))
                Debug.Printf("Write-ahead logging is supported.", arrayOfNulls<Object>(0))
            }
        } catch (e: IllegalAccessException) {
            Debug.Printf("Write-ahead logging not supported.", arrayOfNulls<Object>(0))
            e.printStackTrace()
        } catch (e2: IllegalArgumentException) {
            Debug.Printf("Write-ahead logging not supported.", arrayOfNulls<Object>(0))
            e2.printStackTrace()
        } catch (e3: NoSuchMethodException) {
            Debug.Printf("Write-ahead logging not supported.", arrayOfNulls<Object>(0))
        } catch (e4: InvocationTargetException) {
            Debug.Printf("Write-ahead logging not supported.", arrayOfNulls<Object>(0))
            e4.printStackTrace()
        }
    }

    fun getInstance(): SLInventoryOpenHelper {
        return InstanceHolder.Instance
    }

    private var initTables: Boolean(SQLiteDatabase sqLiteDatabase) throws SQLiteException {
        var z: Boolean = false
        var z2: Boolean = false
        sqLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS DBVersion (Version INTEGER);")
        var query: Cursor = sqLiteDatabase.query("DBVersion", new Array<String>{"Version"}, null, null, null, null, null)
        if (!query.moveToFirst()) {
            z = true
            z2 = true
        } else if (query.getInt(0) != 21) {
            z = false
            z2 = true
        } else {
            z = false
            z2 = false
        }
        query.close()
        if (!z2) {
            Debug.Printf("Database does not need upgrade.", arrayOfNulls<Object>(0))
        return false
        }
        Debug.Printf("Database needs upgrade.", arrayOfNulls<Object>(0))
        try {
            for (createTableStatement in SLInventoryEntry.getCreateTableStatements()) {
                Debug.Printf("Inventory init: %s", createTableStatement)
                sqLiteDatabase.execSQL(createTableStatement)
            }
            var contentValues: ContentValues = ContentValues()
            contentValues.put("Version", 21 as Integer)
            if (z) {
                sqLiteDatabase.insert("DBVersion", null, contentValues)
            } else {
                sqLiteDatabase.update("DBVersion", contentValues, null, null)
            }
            Debug.Printf("Upgraded database to version %d", 21)
        return true
        } catch (e: Exception) {
            var sqLiteException: SQLiteException = SQLiteException(e.getMessage())
            sqLiteException.initCause(e)
            var sqLiteException: throw = null
        }
    }

    fun openDB(str: String): DBHandle {
        try {
            Debug.Printf("Opening inventory DB '%s'", str)
        } catch (e: SQLiteException) {
            Debug.Warning(e)
        return null
        }
        return DBHandleCache.getInstance().OpenDB(str, this)
    }
    public SQLiteDatabase openOrCreateDatabase(String str) throws SQLiteException {
        var openOrCreateDatabase: SQLiteDatabase = SQLiteDatabase.openOrCreateDatabase(str, (SQLiteDatabase.CursorFactory) null)
        if (openOrCreateDatabase == null) {
            throw SQLiteException("DB was null")
        }
        Debug.Printf("DB file '%s' opened", str)
        enableWriteAheadLogging(openOrCreateDatabase)
        if (initTables(openOrCreateDatabase)) {
            Debug.Printf("Reopening DB file '%s'", str)
            openOrCreateDatabase.close()
            openOrCreateDatabase = SQLiteDatabase.openOrCreateDatabase(str, (SQLiteDatabase.CursorFactory) null)
            if (openOrCreateDatabase == null) {
                throw SQLiteException("DB was null")
            }
            enableWriteAheadLogging(openOrCreateDatabase)
        }
        return openOrCreateDatabase
    }
}
