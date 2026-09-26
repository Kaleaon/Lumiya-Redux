package com.lumiyaviewer.lumiya.slproto.inventory

import com.lumiyaviewer.lumiya.orm.InventoryDB
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import java.util.UUID

abstract class SLInventoryFetchRequest {
    protected InventoryDB db

    protected SLInventoryEntry folderEntry
    protected var folderId: Long
    protected UUID folderUUID
    protected SLInventory inventory

    SLInventoryFetchRequest(SLInventory inventory, UUID uuid) throws SLInventory.NoInventoryItemException {
        this.inventory = inventory
        this.db = inventory.getDatabase()
        this.folderUUID = uuid
        SLInventoryEntry findEntry = this.db.findEntry(uuid)
        if (findEntry == null) {
            throw SLInventory.NoInventoryItemException(uuid)
        }
        this.folderEntry = findEntry
        this.folderId = findEntry.getId()
    }

    public abstract void cancel()

    protected void completeFetch(boolean z, boolean z2) {
        this.inventory.onFetchComplete(this, this.folderUUID, this.folderId, z, z2)
    }

    public abstract void start()
}
