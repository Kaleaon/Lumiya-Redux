package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Can only fit around 7 items per packet - that's the way it goes. At
 * least many bulk updates can be packed.
 * Only from dataserver->sim->viewer
 *
 * <p>Template: {@code BulkUpdateInventory Low 281 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processBulkUpdateInventory()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class BulkUpdateInventory extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<FolderData> FolderData_Fields = new ArrayList<>();
    public ArrayList<ItemData> ItemData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID TransactionID; // LLUUID
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
        public int CallbackID; // U32 - Async Response
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
        public UUID OwnerID; // LLUUID - permissions
        public int OwnerMask; // U32 - permissions
        public int SalePrice; // S32
        public int SaleType; // U8
        public int Type; // S8
    }

    public BulkUpdateInventory() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i;
        int i2 = 37;
        Iterator<?> it = this.FolderData_Fields.iterator();
        while (true) {
            i = i2;
            if (!it.hasNext()) {
                break;
            }
            i2 = ((FolderData) it.next()).Name.length + 34 + i;
        }
        int i3 = i + 1;
        Iterator<?> it2 = this.ItemData_Fields.iterator();
        while (true) {
            int i4 = i3;
            if (!it2.hasNext()) {
                return i4;
            }
            ItemData itemData = (ItemData) it2.next();
            i3 = itemData.Description.length + itemData.Name.length + 133 + 1 + 4 + 4 + i4;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleBulkUpdateInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 281 (BulkUpdateInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x19);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.TransactionID);
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
            packInt(byteBuffer, itemData.CallbackID);
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
        this.AgentData_Field.TransactionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            FolderData folderData = new FolderData();
            folderData.FolderID = unpackUUID(byteBuffer);
            folderData.ParentID = unpackUUID(byteBuffer);
            folderData.Type = unpackByte(byteBuffer);
            folderData.Name = unpackVariable(byteBuffer, 1);
            this.FolderData_Fields.add(folderData);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            ItemData itemData = new ItemData();
            itemData.ItemID = unpackUUID(byteBuffer);
            itemData.CallbackID = unpackInt(byteBuffer);
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
