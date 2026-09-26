package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Add/Remove Attachment messages
 * Simulator informs Dataserver of new attachment or attachment asset update
 * DO NOT ALLOW THIS FROM THE VIEWER
 *
 * <p>Template: {@code UpdateAttachment Low 331 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateAttachment : SLMessage() {
    var AgentData_Field: AgentData = null
    var AttachmentBlock_Field: AttachmentBlock = null
    var InventoryData_Field: InventoryData = null
    var OperationData_Field: OperationData = null

    /** Block AgentData, Single. */
    open class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block AttachmentBlock, Single. */
    open class AttachmentBlock {
        public int AttachmentPoint; // U8
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
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
    open class OperationData {
        public boolean AddItem; // BOOL
        public boolean UseExistingAsset; // BOOL
    }

    constructor() {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.AttachmentBlock_Field = AttachmentBlock()
        this.OperationData_Field = OperationData()
        this.InventoryData_Field = InventoryData()
    }
    fun CalcPayloadSize(): Int {
        return this.InventoryData_Field.Name.length + 129 + 1 + this.InventoryData_Field.Description.length + 4 + 4 + 39
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateAttachment(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 331 (UpdateAttachment).
        byteBuffer.putShort(0xFFFF as short)
        byteBuffer.put(0x01 as byte)
        byteBuffer.put(0x4B as byte)
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packByte(byteBuffer, this as byte.AttachmentBlock_Field.AttachmentPoint)
        packBoolean(byteBuffer, this.OperationData_Field.AddItem)
        packBoolean(byteBuffer, this.OperationData_Field.UseExistingAsset)
        packUUID(byteBuffer, this.InventoryData_Field.ItemID)
        packUUID(byteBuffer, this.InventoryData_Field.FolderID)
        packUUID(byteBuffer, this.InventoryData_Field.CreatorID)
        packUUID(byteBuffer, this.InventoryData_Field.OwnerID)
        packUUID(byteBuffer, this.InventoryData_Field.GroupID)
        packInt(byteBuffer, this.InventoryData_Field.BaseMask)
        packInt(byteBuffer, this.InventoryData_Field.OwnerMask)
        packInt(byteBuffer, this.InventoryData_Field.GroupMask)
        packInt(byteBuffer, this.InventoryData_Field.EveryoneMask)
        packInt(byteBuffer, this.InventoryData_Field.NextOwnerMask)
        packBoolean(byteBuffer, this.InventoryData_Field.GroupOwned)
        packUUID(byteBuffer, this.InventoryData_Field.AssetID)
        packByte(byteBuffer, this as byte.InventoryData_Field.Type)
        packByte(byteBuffer, this as byte.InventoryData_Field.InvType)
        packInt(byteBuffer, this.InventoryData_Field.Flags)
        packByte(byteBuffer, this as byte.InventoryData_Field.SaleType)
        packInt(byteBuffer, this.InventoryData_Field.SalePrice)
        packVariable(byteBuffer, this.InventoryData_Field.Name, 1)
        packVariable(byteBuffer, this.InventoryData_Field.Description, 1)
        packInt(byteBuffer, this.InventoryData_Field.CreationDate)
        packInt(byteBuffer, this.InventoryData_Field.CRC)
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUIDthis as byteBuffer.AgentData_Field.SessionID = unpackUUIDthis as byteBuffer.AttachmentBlock_Field.AttachmentPoint = unpackByte(byteBuffer) & 0xFF
        this.OperationData_Field.AddItem = unpackBooleanthis as byteBuffer.OperationData_Field.UseExistingAsset = unpackBooleanthis as byteBuffer.InventoryData_Field.ItemID = unpackUUIDthis as byteBuffer.InventoryData_Field.FolderID = unpackUUIDthis as byteBuffer.InventoryData_Field.CreatorID = unpackUUIDthis as byteBuffer.InventoryData_Field.OwnerID = unpackUUIDthis as byteBuffer.InventoryData_Field.GroupID = unpackUUIDthis as byteBuffer.InventoryData_Field.BaseMask = unpackIntthis as byteBuffer.InventoryData_Field.OwnerMask = unpackIntthis as byteBuffer.InventoryData_Field.GroupMask = unpackIntthis as byteBuffer.InventoryData_Field.EveryoneMask = unpackIntthis as byteBuffer.InventoryData_Field.NextOwnerMask = unpackIntthis as byteBuffer.InventoryData_Field.GroupOwned = unpackBooleanthis as byteBuffer.InventoryData_Field.AssetID = unpackUUIDthis as byteBuffer.InventoryData_Field.Type = unpackBytethis as byteBuffer.InventoryData_Field.InvType = unpackBytethis as byteBuffer.InventoryData_Field.Flags = unpackIntthis as byteBuffer.InventoryData_Field.SaleType = unpackByte(byteBuffer) & 0xFF
        this.InventoryData_Field.SalePrice = unpackIntthis as byteBuffer.InventoryData_Field.Name = unpackVariable(byteBuffer, 1)
        this.InventoryData_Field.Description = unpackVariable(byteBuffer, 1)
        this.InventoryData_Field.CreationDate = unpackIntthis as byteBuffer.InventoryData_Field.CRC = unpackInt(byteBuffer)
    }
}
