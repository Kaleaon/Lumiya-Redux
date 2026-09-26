package com.lumiyaviewer.lumiya.orm

import android.content.ContentValues
import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteException
import android.database.sqlite.SQLiteStatement
import android.os.Parcelable
import java.nio.ByteBuffer
import java.util.UUID

abstract class DBObject : Parcelable {
    @JvmField
    protected var _id: Long = 0L

    class DatabaseBindingException : Exception {
        constructor(cls: Class<*>, str: String) : super("Failed to bind ${cls.simpleName}: $str")
        constructor(str: String) : super(str)
    }

    constructor() {
        _id = 0L
    }

    constructor(cursor: Cursor) {
        loadFromCursor(cursor)
    }

    @Throws(DatabaseBindingException::class)
    constructor(db: SQLiteDatabase?, id: Long) {
        if (db == null) throw DatabaseBindingException(javaClass, "database not opened.")
        val query = db.query(getTableName(), getFieldNames(), "_id = ?", arrayOf(id.toString()), null, null, null)
        if (!query.moveToFirst()) {
            query.close()
            throw DatabaseBindingException(javaClass, "not found: _id = $id")
        }
        loadFromCursor(query)
        query.close()
    }

    protected fun UUIDfromBlob(bytes: ByteArray): UUID {
        val bb = ByteBuffer.wrap(bytes)
        return UUID(bb.long, bb.long)
    }

    protected fun UUIDtoBlob(uuid: UUID): ByteArray {
        val bb = ByteBuffer.wrap(ByteArray(16))
        bb.putLong(uuid.mostSignificantBits)
        bb.putLong(uuid.leastSignificantBits)
        return bb.array()
    }

    abstract fun bindInsertOrUpdate(statement: SQLiteStatement)

    @Throws(DatabaseBindingException::class)
    open fun delete(db: SQLiteDatabase?) {
        if (db == null) throw DatabaseBindingException(javaClass, "database not opened.")
        if (_id != 0L) {
            db.delete(getTableName(), "_id = ?", arrayOf(_id.toString()))
        }
    }

    abstract fun getContentValues(): ContentValues
    protected abstract fun getFieldNames(): Array<String>

    fun getId(): Long = _id

    protected abstract fun getTableName(): String

    abstract fun loadFromCursor(cursor: Cursor)

    @Throws(DatabaseBindingException::class)
    fun reload(db: SQLiteDatabase?) {
        if (db == null) throw DatabaseBindingException(javaClass, "database not opened.")
        if (_id != 0L) {
            val query = db.query(getTableName(), getFieldNames(), "_id = ?", arrayOf(_id.toString()), null, null, null)
            if (query.moveToFirst()) {
                loadFromCursor(query)
            }
            query.close()
        }
    }

    fun resetId() {
        _id = 0L
    }

    @Throws(DatabaseBindingException::class)
    open fun save(db: SQLiteDatabase?) {
        if (db == null) throw DatabaseBindingException(javaClass, "database not opened.")
        val tableName = getTableName()
        val contentValues = getContentValues()
        try {
            if (_id != 0L) {
                db.update(tableName, contentValues, "_id = ?", arrayOf(_id.toString()))
            } else {
                _id = db.insert(tableName, null, contentValues)
            }
        } catch (e: SQLiteException) {
            val ex = DatabaseBindingException(javaClass, "insert or update failed")
            ex.initCause(e)
            throw ex
        }
    }

    @Throws(DatabaseBindingException::class)
    protected fun updateOrInsert(db: SQLiteDatabase?, whereClause: String, whereArgs: Array<String>) {
        if (db == null) throw DatabaseBindingException(javaClass, "database not opened.")
        val tableName = getTableName()
        val contentValues = getContentValues()
        try {
            if (db.update(tableName, contentValues, whereClause, whereArgs) == 0) {
                _id = db.insert(tableName, null, contentValues)
            }
        } catch (e: SQLiteException) {
            val ex = DatabaseBindingException(javaClass, "insert or update failed")
            ex.initCause(e)
            throw ex
        }
    }

    @Throws(DatabaseBindingException::class)
    protected fun updateOrInsert(updateStatement: SQLiteStatement, insertStatement: SQLiteStatement) {
        try {
            bindInsertOrUpdate(updateStatement)
            if (updateStatement.executeUpdateDelete() == 0) {
                bindInsertOrUpdate(insertStatement)
                _id = insertStatement.executeInsert()
            }
        } catch (e: SQLiteException) {
            val ex = DatabaseBindingException(javaClass, "insert or update failed")
            ex.initCause(e)
            throw ex
        }
    }
}
