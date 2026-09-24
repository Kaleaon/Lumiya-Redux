package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * return inventory segment.
 * *NOTE: This could be compressed more since we already know the
 * parent_id for folders and the folder_id for items, but this is
 * reasonable until we heve server side inventory.
 *
 * <p>Template: {@code InventoryDescendents Low 278 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class InventoryDescendents extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<FolderData> FolderData_Fields = new ArrayList<>();
    public ArrayList<ItemData> ItemData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int Descendents; // S32 - count to help with caching
        public UUID FolderID; // LLUUID
        public UUID OwnerID; // LLUUID - owner of the folders creatd.
        public int Version; // S32 - version of the folder for caching
    }

    /** Block FolderData, Variable. */
    public static class FolderData {
        public UUID FolderID; // LLUUID
        public byte[] Name; // Variable 1
        public UUID ParentID; // LLUUID
        public int Type; // S8
    }

    /** Block ItemData, Variable. */
    public static class ItemData {
        public UUID AssetID; // LLUUID
        public int BaseMask; // U32 - permissions
        public int CRC; // U32
        public int CreationDate; // S32
        public UUID CreatorID; // LLUUID - permissions
        public byte[] Description; // Variable 1
        public int EveryoneMask; // U32 - permissions
        public int Flags; // U32
        public UUID FolderID; // LLUUID
        public UUID GroupID; // LLUUID - permissions
        public int GroupMask; // U32 - permissions
        public boolean GroupOwned; // BOOL - permissions
        public int InvType; // S8
        public UUID ItemID; // LLUUID
        public byte[] Name; // Variable 1
        public int NextOwnerMask; // U32 - permissions
        public UUID OwnerID; // LLUUID - owner of the folders creatd.
        public int OwnerMask; // U32 - permissions
        public int SalePrice; // S32
        public int SaleType; // U8
        public int Type; // S8
    }

    public InventoryDescendents() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i;
        int i2 = 61;
        Iterator<?> it = this.FolderData_Fields.iterator();
        while (true) {
            i = i2;
            if (!it.hasNext()) {
                break;
            }
            i2 = ((FolderData) it.next()).Name.length + 34 + i;
        }
        int i3 = i + 1;
        Iterator<?> iterator = this.ItemData_Fields.iterator();
        while (true) {
            int i4 = i3;
            if (!iterator.hasNext()) {
                return i4;
            }
            ItemData itemData = (ItemData) iterator.next();
            i3 = itemData.Description.length + itemData.Name.length + 129 + 1 + 4 + 4 + i4;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleInventoryDescendents(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 278 (InventoryDescendents).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x16);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.FolderID);
        packUUID(byteBuffer, this.AgentData_Field.OwnerID);
        packInt(byteBuffer, this.AgentData_Field.Version);
        packInt(byteBuffer, this.AgentData_Field.Descendents);
        byteBuffer.put((byte) this.FolderData_Fields.size());
        for (FolderData folderData : this.FolderData_Fields) {
            packUUID(byteBuffer, folderData.FolderID);
            packUUID(byteBuffer, folderData.ParentID);
            packByte(byteBuffer, (byte) folderData.Type);
            packVariable(byteBuffer, folderData.Name, 1);
        }
        byteBuffer.put((byte) this.ItemData_Fields.size());
        for (ItemData itemData : this.ItemData_Fields) {
            packUUID(byteBuffer, itemData.ItemID);
            packUUID(byteBuffer, itemData.FolderID);
            packUUID(byteBuffer, itemData.CreatorID);
            packUUID(byteBuffer, itemData.OwnerID);
            packUUID(byteBuffer, itemData.GroupID);
            packInt(byteBuffer, itemData.BaseMask);
            packInt(byteBuffer, itemData.OwnerMask);
            packInt(byteBuffer, itemData.GroupMask);
            packInt(byteBuffer, itemData.EveryoneMask);
            packInt(byteBuffer, itemData.NextOwnerMask);
            packBoolean(byteBuffer, itemData.GroupOwned);
            packUUID(byteBuffer, itemData.AssetID);
            packByte(byteBuffer, (byte) itemData.Type);
            packByte(byteBuffer, (byte) itemData.InvType);
            packInt(byteBuffer, itemData.Flags);
            packByte(byteBuffer, (byte) itemData.SaleType);
            packInt(byteBuffer, itemData.SalePrice);
            packVariable(byteBuffer, itemData.Name, 1);
            packVariable(byteBuffer, itemData.Description, 1);
            packInt(byteBuffer, itemData.CreationDate);
            packInt(byteBuffer, itemData.CRC);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.FolderID = unpackUUID(byteBuffer);
        this.AgentData_Field.OwnerID = unpackUUID(byteBuffer);
        this.AgentData_Field.Version = unpackInt(byteBuffer);
        this.AgentData_Field.Descendents = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            FolderData folderData = new FolderData();
            folderData.FolderID = unpackUUID(byteBuffer);
            folderData.ParentID = unpackUUID(byteBuffer);
            folderData.Type = unpackByte(byteBuffer);
            folderData.Name = unpackVariable(byteBuffer, 1);
            this.FolderData_Fields.add(folderData);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            ItemData itemData = new ItemData();
            itemData.ItemID = unpackUUID(byteBuffer);
            itemData.FolderID = unpackUUID(byteBuffer);
            itemData.CreatorID = unpackUUID(byteBuffer);
            itemData.OwnerID = unpackUUID(byteBuffer);
            itemData.GroupID = unpackUUID(byteBuffer);
            itemData.BaseMask = unpackInt(byteBuffer);
            itemData.OwnerMask = unpackInt(byteBuffer);
            itemData.GroupMask = unpackInt(byteBuffer);
            itemData.EveryoneMask = unpackInt(byteBuffer);
            itemData.NextOwnerMask = unpackInt(byteBuffer);
            itemData.GroupOwned = unpackBoolean(byteBuffer);
            itemData.AssetID = unpackUUID(byteBuffer);
            itemData.Type = unpackByte(byteBuffer);
            itemData.InvType = unpackByte(byteBuffer);
            itemData.Flags = unpackInt(byteBuffer);
            itemData.SaleType = unpackByte(byteBuffer) & 0xFF;
            itemData.SalePrice = unpackInt(byteBuffer);
            itemData.Name = unpackVariable(byteBuffer, 1);
            itemData.Description = unpackVariable(byteBuffer, 1);
            itemData.CreationDate = unpackInt(byteBuffer);
            itemData.CRC = unpackInt(byteBuffer);
            this.ItemData_Fields.add(itemData);
        }
    }
}
