package com.lumiyaviewer.lumiya.slproto.inventory;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.orm.DBObject;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory;
import com.lumiyaviewer.lumiya.slproto.messages.FetchInventoryDescendents;
import com.lumiyaviewer.lumiya.slproto.messages.InventoryDescendents;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

class SLInventoryUDPFetchRequest extends SLInventoryFetchRequest {
    private final Set<UUID> existingChildren;
    private int receivedCount;

    SLInventoryUDPFetchRequest(SLInventory inventory, UUID uuid) throws SLInventory.NoInventoryItemException {
        super(inventory, uuid);
        this.receivedCount = 0;
        this.existingChildren = new HashSet();
    }

    boolean HandleInventoryDescendents(InventoryDescendents inventoryDescendents) {
        Debug.Log("Inventory: UDP fetch: exp count " + inventoryDescendents.AgentData_Field.Descendents + ", recv count " + this.receivedCount + ",  with this: " + (this.receivedCount + inventoryDescendents.FolderData_Fields.size() + inventoryDescendents.ItemData_Fields.size()));
        int i = inventoryDescendents.AgentData_Field.Descendents;
        int i2 = 0;
        this.db.beginTransaction();
        try {
            if (this.folderEntry.version != inventoryDescendents.AgentData_Field.Version) {
                this.folderEntry.version = inventoryDescendents.AgentData_Field.Version;
                this.db.saveEntry(this.folderEntry);
            }
            for (InventoryDescendents.FolderData folderData : inventoryDescendents.FolderData_Fields) {
                if (folderData.ParentID.equals(this.folderEntry.uuid) && (folderData.FolderID.getLeastSignificantBits() != 0 || folderData.FolderID.getMostSignificantBits() != 0)) {
                    try {
                        SLInventoryEntry inventoryEntry = new SLInventoryEntry();
                        inventoryEntry.uuid = folderData.FolderID;
                        inventoryEntry.parent_id = this.folderEntry.getId();
                        inventoryEntry.name = SLMessage.stringFromVariableOEM(folderData.Name);
                        inventoryEntry.typeDefault = folderData.Type;
                        inventoryEntry.parentUUID = folderData.ParentID;
                        inventoryEntry.agentUUID = inventoryDescendents.AgentData_Field.AgentID;
                        inventoryEntry.isFolder = true;
                        inventoryEntry.updateOrInsert(this.db.getDatabase());
                        i2++;
                        if (i2 > 16) {
                            this.db.yieldIfContendedSafely();
                            i2 = 0;
                        }
                        this.existingChildren.add(inventoryEntry.uuid);
                    } catch (DBObject.DatabaseBindingException e) {
                        Debug.Warning(e);
                    }
                }
                this.receivedCount++;
            }
            for (InventoryDescendents.ItemData itemData : inventoryDescendents.ItemData_Fields) {
                if (itemData.ItemID.getLeastSignificantBits() != 0 || itemData.ItemID.getMostSignificantBits() != 0) {
                    try {
                        SLInventoryEntry inventoryEntry2 = new SLInventoryEntry();
                        inventoryEntry2.uuid = itemData.ItemID;
                        inventoryEntry2.name = SLMessage.stringFromVariableOEM(itemData.Name);
                        inventoryEntry2.description = SLMessage.stringFromVariableUTF(itemData.Description);
                        if (itemData.FolderID.equals(this.folderEntry.uuid)) {
                            inventoryEntry2.parent_id = this.folderEntry.getId();
                            inventoryEntry2.parentUUID = itemData.FolderID;
                        } else {
                            SLInventoryEntry findEntry = this.db.findEntry(itemData.FolderID);
                            if (findEntry != null) {
                                inventoryEntry2.parent_id = findEntry.getId();
                            } else {
                                inventoryEntry2.parent_id = 0L;
                            }
                            inventoryEntry2.parentUUID = itemData.FolderID;
                        }
                        inventoryEntry2.agentUUID = inventoryDescendents.AgentData_Field.AgentID;
                        inventoryEntry2.isFolder = false;
                        inventoryEntry2.assetType = itemData.Type;
                        inventoryEntry2.assetUUID = itemData.AssetID;
                        inventoryEntry2.invType = itemData.InvType;
                        inventoryEntry2.flags = itemData.Flags;
                        inventoryEntry2.creationDate = itemData.CreationDate;
                        inventoryEntry2.creatorUUID = itemData.CreatorID;
                        inventoryEntry2.groupUUID = itemData.GroupID;
                        inventoryEntry2.lastOwnerUUID = new UUID(0L, 0L);
                        inventoryEntry2.ownerUUID = itemData.OwnerID;
                        inventoryEntry2.isGroupOwned = itemData.GroupOwned;
                        inventoryEntry2.baseMask = itemData.BaseMask;
                        inventoryEntry2.ownerMask = itemData.OwnerMask;
                        inventoryEntry2.groupMask = itemData.GroupMask;
                        inventoryEntry2.everyoneMask = itemData.EveryoneMask;
                        inventoryEntry2.nextOwnerMask = itemData.NextOwnerMask;
                        inventoryEntry2.salePrice = itemData.SalePrice;
                        inventoryEntry2.saleType = itemData.SaleType;
                        inventoryEntry2.updateOrInsert(this.db.getDatabase());
                        i2++;
                        if (i2 > 16) {
                            this.db.yieldIfContendedSafely();
                            i2 = 0;
                        }
                        if (inventoryEntry2.parent_id == this.folderEntry.getId()) {
                            this.existingChildren.add(inventoryEntry2.uuid);
                        }
                    } catch (DBObject.DatabaseBindingException e2) {
                        Debug.Warning(e2);
                    }
                }
                this.receivedCount++;
            }
            this.db.setTransactionSuccessful();
        } catch (DBObject.DatabaseBindingException e3) {
            Debug.Warning(e3);
        } finally {
            this.db.endTransaction();
        }
        if (this.receivedCount < i) {
            return false;
        }
        this.db.retainChildren(this.folderEntry.getId(), this.existingChildren);
        completeFetch(true, false);
        return true;
    }

    @Override
    public void cancel() {
    }

    @Override
    public void start() {
        Debug.Log("Inventory: UDP fetching folder " + this.folderUUID.toString());
        FetchInventoryDescendents fetchInventoryDescendents = new FetchInventoryDescendents();
        fetchInventoryDescendents.AgentData_Field.AgentID = this.inventory.getCircuitInfo().agentID;
        fetchInventoryDescendents.AgentData_Field.SessionID = this.inventory.getCircuitInfo().sessionID;
        fetchInventoryDescendents.InventoryData_Field.FolderID = this.folderUUID;
        fetchInventoryDescendents.InventoryData_Field.OwnerID = this.inventory.getCircuitInfo().agentID;
        fetchInventoryDescendents.InventoryData_Field.FetchFolders = true;
        fetchInventoryDescendents.InventoryData_Field.FetchItems = true;
        fetchInventoryDescendents.isReliable = true;
        this.inventory.SendMessage(fetchInventoryDescendents);
    }
}
