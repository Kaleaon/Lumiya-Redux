package com.lumiyaviewer.lumiya.orm

import android.database.Cursor
import com.google.common.cache.CacheBuilder
import com.google.common.cache.CacheLoader
import com.google.common.cache.LoadingCache
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import java.util.AbstractList
import java.util.concurrent.ExecutionException

class InventoryEntryList : AbstractList<SLInventoryEntry?> {

    private val cursor: Cursor?
    private val entryCache: LoadingCache<Int, SLInventoryEntry>
    val folder: SLInventoryEntry?
    private val lock = Any()
    override val size: Int
    val title: String?

    constructor() {
        entryCache = buildCache()
        title = null
        cursor = null
        folder = null
        size = 0
    }

    internal constructor(title: String?, folder: SLInventoryEntry?, cursor: Cursor?) {
        entryCache = buildCache()
        this.title = title
        this.folder = folder
        this.cursor = cursor
        size = cursor?.count ?: 0
    }

    private fun buildCache(): LoadingCache<Int, SLInventoryEntry> {
        return CacheBuilder.newBuilder()
            .maximumSize(1000L)
            .weakValues()
            .build(object : CacheLoader<Int, SLInventoryEntry>() {
                override fun load(num: Int): SLInventoryEntry {
                    val c = this@InventoryEntryList.cursor
                    var entry: SLInventoryEntry? = null
                    if (c == null) {
                        entry = null
                    } else if (!c.isClosed) {
                        synchronized(this@InventoryEntryList.lock) {
                            try {
                                c.moveToPosition(num)
                                entry = SLInventoryEntry(c)
                            } catch (e: Exception) {
                                Debug.Warning(e)
                                entry = null
                            }
                        }
                    }
                    return entry ?: SLInventoryEntry()
                }
            })
    }

    fun close() {
        synchronized(lock) {
            if (cursor != null && !cursor.isClosed) {
                cursor.close()
            }
        }
    }

    override fun get(index: Int): SLInventoryEntry? {
        if (cursor != null && !cursor.isClosed) {
            return try {
                entryCache.get(index)
            } catch (e: ExecutionException) {
                Debug.Warning(e)
                null
            }
        }
        Debug.Printf(
            "InventoryEntryList: returning null for %d because cursor is %s",
            index, if (cursor == null) "null" else "closed"
        )
        return null
    }
}
