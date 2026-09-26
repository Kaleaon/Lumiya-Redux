package com.lumiyaviewer.lumiya.dao

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteException
import com.lumiyaviewer.lumiya.Debug

class DBOpenHelper(context: Context, name: String?, cursorFactory: SQLiteDatabase.CursorFactory?) :
    DaoMaster.DevOpenHelper(context, name, cursorFactory) {

    private fun tryUpgradeTo71(sqLiteDatabase: SQLiteDatabase, fromVersion: Int): Boolean {
        if (!shouldAttemptTargetedUpgradeTo71(fromVersion, 71)) {
            return false
        }
        return try {
            Debug.Printf("Upgrading to database version 71 from %d", fromVersion)
            sqLiteDatabase.execSQL(
                "ALTER TABLE CHAT_MESSAGE ADD COLUMN " +
                    ChatMessageDao.Properties.SyncedToGoogleDrive.columnName +
                    " INTEGER DEFAULT 0 NOT NULL;"
            )
            sqLiteDatabase.execSQL(
                "CREATE INDEX IDX_CHAT_MESSAGE__id_SYNCED_TO_GOOGLE_DRIVE ON CHAT_MESSAGE (_id,SYNCED_TO_GOOGLE_DRIVE);"
            )
            true
        } catch (e: SQLiteException) {
            Debug.Warning(e)
            false
        }
    }

    override fun onDowngrade(sqLiteDatabase: SQLiteDatabase, fromVersion: Int, toVersion: Int) {
        super.onUpgrade(sqLiteDatabase, fromVersion, toVersion)
    }

    override fun onUpgrade(sqLiteDatabase: SQLiteDatabase, fromVersion: Int, toVersion: Int) {
        val upgraded = if (toVersion == 71) tryUpgradeTo71(sqLiteDatabase, fromVersion) else false
        if (upgraded) {
            Debug.Printf("Database upgrade success.")
        } else {
            Debug.Printf("Database upgrade failed, recreating.")
            super.onUpgrade(sqLiteDatabase, fromVersion, toVersion)
        }
    }

    companion object {
        /**
         * Whether the narrow, column-adding upgrade path to schema version 71
         * applies for the given version pair. Pure decision logic, independent
         * of any database or Android state; the SQL DDL itself remains
         * Android-owned.
         */
        @JvmStatic
        fun shouldAttemptTargetedUpgradeTo71(fromVersion: Int, toVersion: Int): Boolean =
            fromVersion == 70 && toVersion == 71
    }
}
