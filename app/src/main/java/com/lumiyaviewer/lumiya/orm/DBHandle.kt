package com.lumiyaviewer.lumiya.orm

import android.database.Cursor
import android.database.sqlite.SQLiteCursor
import android.database.sqlite.SQLiteCursorDriver
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteQuery

class DBHandle(private val sqliteDB: SQLiteDatabase) : SQLiteDatabase.CursorFactory {

    private inner class DBHandleCursor(
        db: SQLiteDatabase,
        driver: SQLiteCursorDriver,
        editTable: String?,
        query: SQLiteQuery
    ) : SQLiteCursor(db, driver, editTable, query)

    fun getDB(): SQLiteDatabase = sqliteDB

    override fun newCursor(
        db: SQLiteDatabase,
        driver: SQLiteCursorDriver,
        editTable: String?,
        query: SQLiteQuery
    ): Cursor {
        return DBHandleCursor(db, driver, editTable, query)
    }
}
