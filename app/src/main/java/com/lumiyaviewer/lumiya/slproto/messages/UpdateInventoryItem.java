package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * This is used bi-directionally between sim, dataserver, and viewer.
 * THIS MESSAGE CAN NOT CREATE NEW INVENTORY ITEMS.
 *
 * <p>Template: {@code UpdateInventoryItem Low 266 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class UpdateInventoryItem extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<InventoryData> InventoryData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    /** Block InventoryData, Variable. */
    public static class InventoryData {
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
        public UUID TransactionID; // LLUUID
        public int Type; // S8
    }

    public UpdateInventoryItem() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 53;
        Iterator<?> it = this.InventoryData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            InventoryData inventoryData = (InventoryData) it.next();
            i = inventoryData.Description.length + inventoryData.Name.length + 133 + 1 + 4 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleUpdateInventoryItem(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 266 (UpdateInventoryItem).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x0A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.TransactionID);
        byteBuffer.put((byte) this.InventoryData_Fields.size());
        for (InventoryData inventoryData : this.InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.ItemID);
            packUUID(byteBuffer, inventoryData.FolderID);
            packInt(byteBuffer, inventoryData.CallbackID);
            packUUID(byteBuffer, inventoryData.CreatorID);
            packUUID(byteBuffer, inventoryData.OwnerID);
            packUUID(byteBuffer, inventoryData.GroupID);
            packInt(byteBuffer, inventoryData.BaseMask);
            packInt(byteBuffer, inventoryData.OwnerMask);
            packInt(byteBuffer, inventoryData.GroupMask);
            packInt(byteBuffer, inventoryData.EveryoneMask);
            packInt(byteBuffer, inventoryData.NextOwnerMask);
            packBoolean(byteBuffer, inventoryData.GroupOwned);
            packUUID(byteBuffer, inventoryData.TransactionID);
            packByte(byteBuffer, (byte) inventoryData.Type);
            packByte(byteBuffer, (byte) inventoryData.InvType);
            packInt(byteBuffer, inventoryData.Flags);
            packByte(byteBuffer, (byte) inventoryData.SaleType);
            packInt(byteBuffer, inventoryData.SalePrice);
            packVariable(byteBuffer, inventoryData.Name, 1);
            packVariable(byteBuffer, inventoryData.Description, 1);
            packInt(byteBuffer, inventoryData.CreationDate);
            packInt(byteBuffer, inventoryData.CRC);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.TransactionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            InventoryData inventoryData = new InventoryData();
            inventoryData.ItemID = unpackUUID(byteBuffer);
            inventoryData.FolderID = unpackUUID(byteBuffer);
            inventoryData.CallbackID = unpackInt(byteBuffer);
            inventoryData.CreatorID = unpackUUID(byteBuffer);
            inventoryData.OwnerID = unpackUUID(byteBuffer);
            inventoryData.GroupID = unpackUUID(byteBuffer);
            inventoryData.BaseMask = unpackInt(byteBuffer);
            inventoryData.OwnerMask = unpackInt(byteBuffer);
            inventoryData.GroupMask = unpackInt(byteBuffer);
            inventoryData.EveryoneMask = unpackInt(byteBuffer);
            inventoryData.NextOwnerMask = unpackInt(byteBuffer);
            inventoryData.GroupOwned = unpackBoolean(byteBuffer);
            inventoryData.TransactionID = unpackUUID(byteBuffer);
            inventoryData.Type = unpackByte(byteBuffer);
            inventoryData.InvType = unpackByte(byteBuffer);
            inventoryData.Flags = unpackInt(byteBuffer);
            inventoryData.SaleType = unpackByte(byteBuffer) & 0xFF;
            inventoryData.SalePrice = unpackInt(byteBuffer);
            inventoryData.Name = unpackVariable(byteBuffer, 1);
            inventoryData.Description = unpackVariable(byteBuffer, 1);
            inventoryData.CreationDate = unpackInt(byteBuffer);
            inventoryData.CRC = unpackInt(byteBuffer);
            this.InventoryData_Fields.add(inventoryData);
        }
    }
}
