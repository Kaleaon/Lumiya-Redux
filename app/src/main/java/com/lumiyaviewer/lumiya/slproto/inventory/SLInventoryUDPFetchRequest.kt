package com.lumiyaviewer.lumiya.slproto.inventory

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.orm.DBObject
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.messages.FetchInventoryDescendents
import com.lumiyaviewer.lumiya.slproto.messages.InventoryDescendents
import java.util.HashSet
import java.util.Set
import java.util.UUID

open class SLInventoryUDPFetchRequest : SLInventoryFetchRequest() {
    private var existingChildren: MutableSet<UUID>? = null
    private var receivedCount: Int = 0

    SLInventoryUDPFetchRequest(SLInventory inventory, UUID uuid) throws SLInventory.NoInventoryItemException {
        super(inventory, uuid)
        this.receivedCount = 0
        this.existingChildren = HashSet()
    }

    fun HandleInventoryDescendents(inventoryDescendents: InventoryDescendents): Boolean {
        Debug.Log("Inventory: UDP fetch: exp count " + inventoryDescendents.AgentData_Field.Descendents + ", recv count " + this.receivedCount + ",  with this: " + (this.receivedCount + inventoryDescendents.FolderData_Fields.size() + inventoryDescendents.ItemData_Fields.size()))
        var i: Int = inventoryDescendents.AgentData_Field.Descendents
        var i2: Int = 0
        this.db.beginTransaction()
        try {
            if (this.folderEntry.version != inventoryDescendents.AgentData_Field.Version) {
                this.folderEntry.version = inventoryDescendents.AgentData_Field.Version
                this.db.saveEntry(this.folderEntry)
            }
            for (folderData in inventoryDescendents.FolderData_Fields) {
                if (folderData.ParentID.equals(this.folderEntry.uuid) && (folderData.FolderID.getLeastSignificantBits() != 0 || folderData.FolderID.getMostSignificantBits() != 0)) {
                    try {
                        var inventoryEntry: SLInventoryEntry = SLInventoryEntry()
                        inventoryEntry.uuid = folderData.FolderID
                        inventoryEntry.parent_id = this.folderEntry.getId()
                        inventoryEntry.name = SLMessage.stringFromVariableOEM(folderData.Name)
                        inventoryEntry.typeDefault = folderData.Type
                        inventoryEntry.parentUUID = folderData.ParentID
                        inventoryEntry.agentUUID = inventoryDescendents.AgentData_Field.AgentID
                        inventoryEntry.isFolder = true
                        inventoryEntry.updateOrInsert(this.db.getDatabase())
                        i2++
                        if (i2 > 16) {
                            this.db.yieldIfContendedSafely()
                            i2 = 0
                        }
                        this.existingChildren.add(inventoryEntry.uuid)
                    } catch (e: DBObject.DatabaseBindingException) {
                        Debug.Warning(e)
                    }
                }
                this.receivedCount++
            }
            for (itemData in inventoryDescendents.ItemData_Fields) {
                if (itemData.ItemID.getLeastSignificantBits() != 0 || itemData.ItemID.getMostSignificantBits() != 0) {
                    try {
                        var inventoryEntry2: SLInventoryEntry = SLInventoryEntry()
                        inventoryEntry2.uuid = itemData.ItemID
                        inventoryEntry2.name = SLMessage.stringFromVariableOEM(itemData.Name)
                        inventoryEntry2.description = SLMessage.stringFromVariableUTF(itemData.Description)
                        if (itemData.FolderID.equals(this.folderEntry.uuid)) {
                            inventoryEntry2.parent_id = this.folderEntry.getId()
                            inventoryEntry2.parentUUID = itemData.FolderID
                        } else {
                            var findEntry: SLInventoryEntry = this.db.findEntry(itemData.FolderID)
                            if (findEntry != null) {
                                inventoryEntry2.parent_id = findEntry.getId()
                            } else {
                                inventoryEntry2.parent_id = 0L
                            }
                            inventoryEntry2.parentUUID = itemData.FolderID
                        }
                        inventoryEntry2.agentUUID = inventoryDescendents.AgentData_Field.AgentID
                        inventoryEntry2.isFolder = false
                        inventoryEntry2.assetType = itemData.Type
                        inventoryEntry2.assetUUID = itemData.AssetID
                        inventoryEntry2.invType = itemData.InvType
                        inventoryEntry2.flags = itemData.Flags
                        inventoryEntry2.creationDate = itemData.CreationDate
                        inventoryEntry2.creatorUUID = itemData.CreatorID
                        inventoryEntry2.groupUUID = itemData.GroupID
                        inventoryEntry2.lastOwnerUUID = UUID(0L, 0L)
                        inventoryEntry2.ownerUUID = itemData.OwnerID
                        inventoryEntry2.isGroupOwned = itemData.GroupOwned
                        inventoryEntry2.baseMask = itemData.BaseMask
                        inventoryEntry2.ownerMask = itemData.OwnerMask
                        inventoryEntry2.groupMask = itemData.GroupMask
                        inventoryEntry2.everyoneMask = itemData.EveryoneMask
                        inventoryEntry2.nextOwnerMask = itemData.NextOwnerMask
                        inventoryEntry2.salePrice = itemData.SalePrice
                        inventoryEntry2.saleType = itemData.SaleType
                        inventoryEntry2.updateOrInsert(this.db.getDatabase())
                        i2++
                        if (i2 > 16) {
                            this.db.yieldIfContendedSafely()
                            i2 = 0
                        }
                        if (inventoryEntry2.parent_id == this.folderEntry.getId()) {
                            this.existingChildren.add(inventoryEntry2.uuid)
                        }
                    } catch (e2: DBObject.DatabaseBindingException) {
                        Debug.Warning(e2)
                    }
                }
                this.receivedCount++
            }
            this.db.setTransactionSuccessful()
        } catch (e3: DBObject.DatabaseBindingException) {
            Debug.Warning(e3)
        } finally {
            this.db.endTransaction()
        }
        if (this.receivedCount < i) {
        return false
        }
        this.db.retainChildren(this.folderEntry.getId(), this.existingChildren)
        completeFetch(true, false)
        return true
    }
    fun cancel() {
    }
    fun start() {
        Debug.Log("Inventory: UDP fetching folder " + this.folderUUID.toString())
        var fetchInventoryDescendents: FetchInventoryDescendents = FetchInventoryDescendents()
        fetchInventoryDescendents.AgentData_Field.AgentID = this.inventory.getCircuitInfo().agentID
        fetchInventoryDescendents.AgentData_Field.SessionID = this.inventory.getCircuitInfo().sessionID
        fetchInventoryDescendents.InventoryData_Field.FolderID = this.folderUUID
        fetchInventoryDescendents.InventoryData_Field.OwnerID = this.inventory.getCircuitInfo().agentID
        fetchInventoryDescendents.InventoryData_Field.FetchFolders = true
        fetchInventoryDescendents.InventoryData_Field.FetchItems = true
        fetchInventoryDescendents.isReliable = true
        this.inventory.SendMessage(fetchInventoryDescendents)
    }
}
