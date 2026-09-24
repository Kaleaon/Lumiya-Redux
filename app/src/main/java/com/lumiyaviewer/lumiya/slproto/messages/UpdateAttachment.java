package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Add/Remove Attachment messages
 * Simulator informs Dataserver of new attachment or attachment asset update
 * DO NOT ALLOW THIS FROM THE VIEWER
 *
 * <p>Template: {@code UpdateAttachment Low 331 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class UpdateAttachment extends SLMessage {
    public AgentData AgentData_Field;
    public AttachmentBlock AttachmentBlock_Field;
    public InventoryData InventoryData_Field;
    public OperationData OperationData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block AttachmentBlock, Single. */
    public static class AttachmentBlock {
        public int AttachmentPoint; // U8
    }

    /** Block InventoryData, Single. */
    public static class InventoryData {
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
        public UUID OwnerID; // LLUUID - permissions
        public int OwnerMask; // U32 - permissions
        public int SalePrice; // S32
        public int SaleType; // U8
        public int Type; // S8
    }

    /** Block OperationData, Single. */
    public static class OperationData {
        public boolean AddItem; // BOOL
        public boolean UseExistingAsset; // BOOL
    }

    public UpdateAttachment() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.AttachmentBlock_Field = new AttachmentBlock();
        this.OperationData_Field = new OperationData();
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.InventoryData_Field.Name.length + 129 + 1 + this.InventoryData_Field.Description.length + 4 + 4 + 39;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUpdateAttachment(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 331 (UpdateAttachment).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x4B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packByte(byteBuffer, (byte) this.AttachmentBlock_Field.AttachmentPoint);
        packBoolean(byteBuffer, this.OperationData_Field.AddItem);
        packBoolean(byteBuffer, this.OperationData_Field.UseExistingAsset);
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
        packUUID(byteBuffer, this.InventoryData_Field.AssetID);
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
        this.AttachmentBlock_Field.AttachmentPoint = unpackByte(byteBuffer) & 0xFF;
        this.OperationData_Field.AddItem = unpackBoolean(byteBuffer);
        this.OperationData_Field.UseExistingAsset = unpackBoolean(byteBuffer);
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
        this.InventoryData_Field.AssetID = unpackUUID(byteBuffer);
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
