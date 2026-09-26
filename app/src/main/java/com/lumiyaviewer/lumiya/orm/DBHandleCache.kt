package com.lumiyaviewer.lumiya.orm

import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteException
import com.lumiyaviewer.lumiya.Debug
import java.lang.ref.PhantomReference
import java.lang.ref.ReferenceQueue
import java.util.IdentityHashMap

class DBHandleCache private constructor() {
    private val refQueue = ReferenceQueue<DBHandle>()
    private val refMap = IdentityHashMap<PhantomReference<DBHandle>, DBOpenRef>()
    private val fileMap = HashMap<String, DBOpenRef>()

    interface DBOpenHelper {
        @Throws(SQLiteException::class)
        fun openOrCreateDatabase(str: String): SQLiteDatabase
    }

    private class DBOpenRef(val fileName: String, private val sqliteDB: SQLiteDatabase) {
        private var handleCount = 0

        fun acquireReference() { handleCount++ }
        fun getDB(): SQLiteDatabase = sqliteDB
        fun releaseReference(): Int { handleCount--; return handleCount }
    }

    private object InstanceHolder {
        val Instance = DBHandleCache()
    }

    init {
        Debug.Printf("DBHandleCache: Initialized.")
    }

    @Synchronized
    fun Cleanup() {
        while (true) {
            val poll = refQueue.poll() ?: break
            val ref = refMap.remove(poll)
            if (ref != null && ref.releaseReference() <= 0) {
                val fileName = ref.fileName
                Debug.Printf("DBHandle: Closing db '%s'", fileName)
                try {
                    val db = ref.getDB()
                    if (db.isOpen) db.close()
                } catch (e: SQLiteException) {
                    Debug.Warning(e)
                }
                fileMap.remove(fileName)
            }
        }
    }

    @Synchronized
    @Throws(SQLiteException::class)
    fun OpenDB(str: String, dbOpenHelper: DBOpenHelper): DBHandle {
        var dbOpenRef = fileMap[str]
        if (dbOpenRef == null) {
            Debug.Printf("DBHandle: Opening db '%s'", str)
            dbOpenRef = DBOpenRef(str, dbOpenHelper.openOrCreateDatabase(str))
            fileMap[str] = dbOpenRef
        }
        val dbHandle = DBHandle(dbOpenRef.getDB())
        dbOpenRef.acquireReference()
        refMap[PhantomReference(dbHandle, refQueue)] = dbOpenRef
        return dbHandle
    }

    @Synchronized
    fun hasOpenHandles(): Boolean = fileMap.isNotEmpty() || refMap.isNotEmpty()

    companion object {
        @JvmStatic
        fun getInstance(): DBHandleCache = InstanceHolder.Instance
    }
}
