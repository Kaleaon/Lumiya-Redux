package com.lumiyaviewer.lumiya.orm

import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteException
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import java.util.UUID

class InventoryDB(private val db: SQLiteDatabase) {

    fun beginTransaction() {
        db.beginTransactionNonExclusive()
    }

    @Throws(DBObject.DatabaseBindingException::class)
    fun deleteEntry(inventoryEntry: SLInventoryEntry) {
        inventoryEntry.delete(db)
    }

    fun endTransaction() {
        db.endTransaction()
    }

    fun findEntry(uuid: UUID): SLInventoryEntry? {
        return SLInventoryEntry.find(db, uuid)
    }

    fun findEntryOrCreate(uuid: UUID): SLInventoryEntry {
        val found = findEntry(uuid)
        if (found != null) return found
        val entry = SLInventoryEntry()
        entry.uuid = uuid
        return entry
    }

    fun findSpecialFolder(parentId: Long, typeDefault: Int): SLInventoryEntry? {
        val query = SLInventoryEntry.query(
            db, "isFolder AND typeDefault = ? AND parent_id = ?",
            arrayOf(typeDefault.toString(), parentId.toString()), null as String?
        )
        val entry = if (query.moveToNext()) SLInventoryEntry(query) else null
        query.close()
        return entry
    }

    fun findSpecialFolder(parentUUID: UUID, typeDefault: Int): SLInventoryEntry? {
        val query = SLInventoryEntry.query(
            db,
            "isFolder AND typeDefault = ? AND parentUUID_high = ? AND parentUUID_low = ?",
            arrayOf(
                typeDefault.toString(),
                parentUUID.mostSignificantBits.toString(),
                parentUUID.leastSignificantBits.toString()
            ),
            null as String?
        )
        val entry = if (query.moveToNext()) SLInventoryEntry(query) else null
        query.close()
        return entry
    }

    fun getDatabase(): SQLiteDatabase = db

    fun getSpecialFolderId(parentId: Long, typeDefault: Int): Long {
        return findSpecialFolder(parentId, typeDefault)?.getId() ?: 0L
    }

    fun getSpecialFolderUUID(parentId: Long, typeDefault: Int): UUID? {
        return findSpecialFolder(parentId, typeDefault)?.uuid
    }

    @Throws(DBObject.DatabaseBindingException::class)
    fun loadEntry(id: Long): SLInventoryEntry {
        return SLInventoryEntry(db, id)
    }

    fun resolveLink(entry: SLInventoryEntry?): SLInventoryEntry? {
        return if (entry == null || !entry.isLink()) entry else entry.assetUUID?.let { findEntry(it) }
    }

    fun retainChildren(parentId: Long, retainSet: Set<UUID>) {
        try {
            val query = db.query(
                InventoryEntryDBObject.tableName,
                arrayOf("_id", "uuid_low", "uuid_high"),
                "parent_id = ?",
                arrayOf(parentId.toString()),
                null, null, null
            )
            Debug.Log("retainChildren: parentId = $parentId, count = ${query.count}")
            var deleteCount = 0
            val toDelete = ArrayList<Long>()
            while (query.moveToNext()) {
                if (!retainSet.contains(UUID(query.getLong(2), query.getLong(1)))) {
                    toDelete.add(query.getLong(0))
                }
            }
            query.close()
            var attempt = 0
            while (attempt < 2) {
                try {
                    beginTransaction()
                    try {
                        var yieldCounter = 0
                        for (id in toDelete) {
                            db.delete(InventoryEntryDBObject.tableName, "_id = ?", arrayOf(id.toString()))
                            deleteCount++
                            yieldCounter++
                            if (yieldCounter >= MAX_UPDATES_PER_TRANSACTION) {
                                yieldCounter = 0
                                db.yieldIfContendedSafely()
                            }
                        }
                        setTransactionSuccessful()
                        break
                    } finally {
                        endTransaction()
                    }
                } catch (e: SQLiteException) {
                    Debug.Warning(e)
                    attempt++
                }
            }
            Debug.Log("retainChildren: parentId = $parentId, deleteCount = $deleteCount")
        } catch (e: SQLiteException) {
            Debug.Warning(e)
        }
    }

    @Throws(DBObject.DatabaseBindingException::class)
    fun saveEntry(inventoryEntry: SLInventoryEntry) {
        inventoryEntry.save(db)
    }

    fun setTransactionSuccessful() {
        db.setTransactionSuccessful()
    }

    fun yieldIfContendedSafely() {
        db.yieldIfContendedSafely()
    }

    companion object {
        const val MAX_UPDATES_PER_TRANSACTION = 16
    }
}
