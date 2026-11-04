package com.lumiyaviewer.lumiya.orm

import android.app.Application
import android.database.sqlite.SQLiteDatabase
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryOpenHelper
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.util.UUID

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [34], application = Application::class)
class InventoryDBTest {
    private lateinit var db: SQLiteDatabase
    private lateinit var inventoryDB: InventoryDB

    @Before
    fun setUp() {
        db = SQLiteDatabase.create(null)
        val openHelper = SLInventoryOpenHelper(db)
        openHelper.onCreate(db)
        inventoryDB = InventoryDB(db)
    }

    @Test
    fun testRetainChildrenBatchedDelete() {
        val parentId = 100L
        val retainSet = mutableSetOf<UUID>()
        val keepUuid = UUID.randomUUID()
        retainSet.add(keepUuid)

        val keepEntry = inventoryDB.findEntryOrCreate(keepUuid)
        keepEntry.parent_id = parentId
        inventoryDB.saveEntry(keepEntry)

        for (i in 0 until 1200) {
            val staleUuid = UUID.randomUUID()
            val entry = inventoryDB.findEntryOrCreate(staleUuid)
            entry.parent_id = parentId
            inventoryDB.saveEntry(entry)
        }

        val queryBefore = db.rawQuery("SELECT COUNT(*) FROM inventory WHERE parent_id = ?", arrayOf(parentId.toString()))
        queryBefore.moveToFirst()
        assertEquals(1201, queryBefore.getInt(0))
        queryBefore.close()

        inventoryDB.retainChildren(parentId, retainSet)

        val queryAfter = db.rawQuery("SELECT COUNT(*) FROM inventory WHERE parent_id = ?", arrayOf(parentId.toString()))
        queryAfter.moveToFirst()
        assertEquals(1, queryAfter.getInt(0))
        queryAfter.close()

        val foundKeep = inventoryDB.findEntry(keepUuid)
        assertNotNull(foundKeep)
    }
}
