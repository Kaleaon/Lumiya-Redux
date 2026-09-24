package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Rez a script onto an object
 *
 * <p>Template: {@code RezScript Low 304 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RezScript extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryBlock InventoryBlock_Field;
    public UpdateBlock UpdateBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryBlock, Single. */
    public static class InventoryBlock {
        public int BaseMask; // U32 - permissions
        public int CRC; // U32
        public int CreationDate; // S32
        public UUID CreatorID; // LLUUID - permissions
        public byte[] Description; // Variable 1
        public int EveryoneMask; // U32 - permissions
        public int Flags; // U32
        public UUID FolderID; // LLUUID
        public UUID GroupID; // LLUUID
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

    /** Block UpdateBlock, Single. */
    public static class UpdateBlock {
        public boolean Enabled; // BOOL - is script rezzed in enabled?
        public int ObjectLocalID; // U32 - object id in world
    }

    public RezScript() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.UpdateBlock_Field = new UpdateBlock();
        this.InventoryBlock_Field = new InventoryBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.InventoryBlock_Field.Name.length + 129 + 1 + this.InventoryBlock_Field.Description.length + 4 + 4 + 57;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRezScript(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 304 (RezScript).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x30);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packInt(byteBuffer, this.UpdateBlock_Field.ObjectLocalID);
        packBoolean(byteBuffer, this.UpdateBlock_Field.Enabled);
        packUUID(byteBuffer, this.InventoryBlock_Field.ItemID);
        packUUID(byteBuffer, this.InventoryBlock_Field.FolderID);
        packUUID(byteBuffer, this.InventoryBlock_Field.CreatorID);
        packUUID(byteBuffer, this.InventoryBlock_Field.OwnerID);
        packUUID(byteBuffer, this.InventoryBlock_Field.GroupID);
        packInt(byteBuffer, this.InventoryBlock_Field.BaseMask);
        packInt(byteBuffer, this.InventoryBlock_Field.OwnerMask);
        packInt(byteBuffer, this.InventoryBlock_Field.GroupMask);
        packInt(byteBuffer, this.InventoryBlock_Field.EveryoneMask);
        packInt(byteBuffer, this.InventoryBlock_Field.NextOwnerMask);
        packBoolean(byteBuffer, this.InventoryBlock_Field.GroupOwned);
        packUUID(byteBuffer, this.InventoryBlock_Field.TransactionID);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.Type);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.InvType);
        packInt(byteBuffer, this.InventoryBlock_Field.Flags);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.SaleType);
        packInt(byteBuffer, this.InventoryBlock_Field.SalePrice);
        packVariable(byteBuffer, this.InventoryBlock_Field.Name, 1);
        packVariable(byteBuffer, this.InventoryBlock_Field.Description, 1);
        packInt(byteBuffer, this.InventoryBlock_Field.CreationDate);
        packInt(byteBuffer, this.InventoryBlock_Field.CRC);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.UpdateBlock_Field.ObjectLocalID = unpackInt(byteBuffer);
        this.UpdateBlock_Field.Enabled = unpackBoolean(byteBuffer);
        this.InventoryBlock_Field.ItemID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.FolderID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.CreatorID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.OwnerID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.GroupID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.BaseMask = unpackInt(byteBuffer);
        this.InventoryBlock_Field.OwnerMask = unpackInt(byteBuffer);
        this.InventoryBlock_Field.GroupMask = unpackInt(byteBuffer);
        this.InventoryBlock_Field.EveryoneMask = unpackInt(byteBuffer);
        this.InventoryBlock_Field.NextOwnerMask = unpackInt(byteBuffer);
        this.InventoryBlock_Field.GroupOwned = unpackBoolean(byteBuffer);
        this.InventoryBlock_Field.TransactionID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.Type = unpackByte(byteBuffer);
        this.InventoryBlock_Field.InvType = unpackByte(byteBuffer);
        this.InventoryBlock_Field.Flags = unpackInt(byteBuffer);
        this.InventoryBlock_Field.SaleType = unpackByte(byteBuffer) & 0xFF;
        this.InventoryBlock_Field.SalePrice = unpackInt(byteBuffer);
        this.InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1);
        this.InventoryBlock_Field.Description = unpackVariable(byteBuffer, 1);
        this.InventoryBlock_Field.CreationDate = unpackInt(byteBuffer);
        this.InventoryBlock_Field.CRC = unpackInt(byteBuffer);
    }
}
