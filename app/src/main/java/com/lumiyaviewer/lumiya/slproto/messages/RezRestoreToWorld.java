package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * This message is sent from viewer -> simulator when the viewer wants
 * to rez an object out of inventory back to its position before it
 * last moved into the inventory
 *
 * <p>Template: {@code RezRestoreToWorld Low 425 NotTrusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class RezRestoreToWorld extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryData InventoryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Single. */
    public static class InventoryData {
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
        public UUID OwnerID; // LLUUID - permissions
        public int OwnerMask; // U32 - permissions
        public int SalePrice; // S32
        public int SaleType; // U8
        public UUID TransactionID; // LLUUID
        public int Type; // S8
    }

    public RezRestoreToWorld() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.InventoryData_Field.Name.length + 129 + 1 + this.InventoryData_Field.Description.length + 4 + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRezRestoreToWorld(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 425 (RezRestoreToWorld).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA9);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.InventoryData_Field.ItemID);
        packUUID(byteBuffer, this.InventoryData_Field.FolderID);
        packUUID(byteBuffer, this.InventoryData_Field.CreatorID);
        packUUID(byteBuffer, this.InventoryData_Field.OwnerID);
        packUUID(byteBuffer, this.InventoryData_Field.GroupID);
        packInt(byteBuffer, this.InventoryData_Field.BaseMask);
        packInt(byteBuffer, this.InventoryData_Field.OwnerMask);
        packInt(byteBuffer, this.InventoryData_Field.GroupMask);
        packInt(byteBuffer, this.InventoryData_Field.EveryoneMask);
        packInt(byteBuffer, this.InventoryData_Field.NextOwnerMask);
        packBoolean(byteBuffer, this.InventoryData_Field.GroupOwned);
        packUUID(byteBuffer, this.InventoryData_Field.TransactionID);
        packByte(byteBuffer, (byte) this.InventoryData_Field.Type);
        packByte(byteBuffer, (byte) this.InventoryData_Field.InvType);
        packInt(byteBuffer, this.InventoryData_Field.Flags);
        packByte(byteBuffer, (byte) this.InventoryData_Field.SaleType);
        packInt(byteBuffer, this.InventoryData_Field.SalePrice);
        packVariable(byteBuffer, this.InventoryData_Field.Name, 1);
        packVariable(byteBuffer, this.InventoryData_Field.Description, 1);
        packInt(byteBuffer, this.InventoryData_Field.CreationDate);
        packInt(byteBuffer, this.InventoryData_Field.CRC);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.InventoryData_Field.ItemID = unpackUUID(byteBuffer);
        this.InventoryData_Field.FolderID = unpackUUID(byteBuffer);
        this.InventoryData_Field.CreatorID = unpackUUID(byteBuffer);
        this.InventoryData_Field.OwnerID = unpackUUID(byteBuffer);
        this.InventoryData_Field.GroupID = unpackUUID(byteBuffer);
        this.InventoryData_Field.BaseMask = unpackInt(byteBuffer);
        this.InventoryData_Field.OwnerMask = unpackInt(byteBuffer);
        this.InventoryData_Field.GroupMask = unpackInt(byteBuffer);
        this.InventoryData_Field.EveryoneMask = unpackInt(byteBuffer);
        this.InventoryData_Field.NextOwnerMask = unpackInt(byteBuffer);
        this.InventoryData_Field.GroupOwned = unpackBoolean(byteBuffer);
        this.InventoryData_Field.TransactionID = unpackUUID(byteBuffer);
        this.InventoryData_Field.Type = unpackByte(byteBuffer);
        this.InventoryData_Field.InvType = unpackByte(byteBuffer);
        this.InventoryData_Field.Flags = unpackInt(byteBuffer);
        this.InventoryData_Field.SaleType = unpackByte(byteBuffer) & 0xFF;
        this.InventoryData_Field.SalePrice = unpackInt(byteBuffer);
        this.InventoryData_Field.Name = unpackVariable(byteBuffer, 1);
        this.InventoryData_Field.Description = unpackVariable(byteBuffer, 1);
        this.InventoryData_Field.CreationDate = unpackInt(byteBuffer);
        this.InventoryData_Field.CRC = unpackInt(byteBuffer);
    }
}
