package com.lumiyaviewer.lumiya.orm

import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryOpenHelper
import java.io.File
import java.util.UUID

object InventoryDBManager {
    private val lock = Any()
    private val userDBs = HashMap<UUID, InventoryDB>()

    @JvmStatic
    fun getUserInventoryDB(uuid: UUID?): InventoryDB? {
        if (uuid == null) return null
        synchronized(lock) {
            var inventoryDB = userDBs[uuid]
            if (inventoryDB == null) {
                inventoryDB = InventoryDB(
                    SLInventoryOpenHelper.getInstance().openOrCreateDatabase(
                        File(
                            GlobalOptions.getInstance().getCacheDir("database"),
                            "inventory-$uuid.db"
                        ).absolutePath
                    )
                )
                userDBs[uuid] = inventoryDB
            }
            return inventoryDB
        }
    }
}
