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
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var AttachmentBlock_Field: AttachmentBlock = AttachmentBlock()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()
    @JvmField var OperationData_Field: OperationData = OperationData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var SessionID: UUID? = null // LLUUID
    }

    /** Block AttachmentBlock, Single. */
    open class AttachmentBlock {
        @JvmField var AttachmentPoint: Int = 0 // U8
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var AssetID: UUID? = null // LLUUID
        @JvmField var BaseMask: Int = 0 // U32 - permissions
        @JvmField var CRC: Int = 0 // U32
        @JvmField var CreationDate: Int = 0 // S32
        @JvmField var CreatorID: UUID? = null // LLUUID - permissions
        @JvmField var Description: ByteArray? = null // Variable 1
        @JvmField var EveryoneMask: Int = 0 // U32 - permissions
        @JvmField var Flags: Int = 0 // U32
        @JvmField var FolderID: UUID? = null // LLUUID
        @JvmField var GroupID: UUID? = null // LLUUID - permissions
        @JvmField var GroupMask: Int = 0 // U32 - permissions
        @JvmField var GroupOwned: Boolean = false // BOOL - permissions
        @JvmField var InvType: Int = 0 // S8
        @JvmField var ItemID: UUID? = null // LLUUID
        @JvmField var Name: ByteArray? = null // Variable 1
        @JvmField var NextOwnerMask: Int = 0 // U32 - permissions
        @JvmField var OwnerID: UUID? = null // LLUUID - permissions
        @JvmField var OwnerMask: Int = 0 // U32 - permissions
        @JvmField var SalePrice: Int = 0 // S32
        @JvmField var SaleType: Int = 0 // U8
        @JvmField var Type: Int = 0 // S8
    }

    /** Block OperationData, Single. */
    open class OperationData {
        @JvmField var AddItem: Boolean = false // BOOL
        @JvmField var UseExistingAsset: Boolean = false // BOOL
    }

    init {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.AttachmentBlock_Field = AttachmentBlock()
        this.OperationData_Field = OperationData()
        this.InventoryData_Field = InventoryData()
    }

    override fun CalcPayloadSize(): Int {
        return this.InventoryData_Field.Name.size + 129 + 1 + this.InventoryData_Field.Description.size + 4 + 4 + 39
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateAttachment(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 331 (UpdateAttachment).
        byteBuffer.putShort((short) 0xFFFF)
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x4B).toByte())
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packByte(byteBuffer, (this.AttachmentBlock_Field.AttachmentPoint).toByte())
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
        packByte(byteBuffer, (this.InventoryData_Field.Type).toByte())
        packByte(byteBuffer, (this.InventoryData_Field.InvType).toByte())
        packInt(byteBuffer, this.InventoryData_Field.Flags)
        packByte(byteBuffer, (this.InventoryData_Field.SaleType).toByte())
        packInt(byteBuffer, this.InventoryData_Field.SalePrice)
        packVariable(byteBuffer, this.InventoryData_Field.Name, 1)
        packVariable(byteBuffer, this.InventoryData_Field.Description, 1)
        packInt(byteBuffer, this.InventoryData_Field.CreationDate)
        packInt(byteBuffer, this.InventoryData_Field.CRC)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer)
        this.AttachmentBlock_Field.AttachmentPoint = unpackByte(byteBuffer) & 0xFF
        this.OperationData_Field.AddItem = unpackBoolean(byteBuffer)
        this.OperationData_Field.UseExistingAsset = unpackBoolean(byteBuffer)
        this.InventoryData_Field.ItemID = unpackUUID(byteBuffer)
        this.InventoryData_Field.FolderID = unpackUUID(byteBuffer)
        this.InventoryData_Field.CreatorID = unpackUUID(byteBuffer)
        this.InventoryData_Field.OwnerID = unpackUUID(byteBuffer)
        this.InventoryData_Field.GroupID = unpackUUID(byteBuffer)
        this.InventoryData_Field.BaseMask = unpackInt(byteBuffer)
        this.InventoryData_Field.OwnerMask = unpackInt(byteBuffer)
        this.InventoryData_Field.GroupMask = unpackInt(byteBuffer)
        this.InventoryData_Field.EveryoneMask = unpackInt(byteBuffer)
        this.InventoryData_Field.NextOwnerMask = unpackInt(byteBuffer)
        this.InventoryData_Field.GroupOwned = unpackBoolean(byteBuffer)
        this.InventoryData_Field.AssetID = unpackUUID(byteBuffer)
        this.InventoryData_Field.Type = unpackByte(byteBuffer)
        this.InventoryData_Field.InvType = unpackByte(byteBuffer)
        this.InventoryData_Field.Flags = unpackInt(byteBuffer)
        this.InventoryData_Field.SaleType = unpackByte(byteBuffer) & 0xFF
        this.InventoryData_Field.SalePrice = unpackInt(byteBuffer)
        this.InventoryData_Field.Name = unpackVariable(byteBuffer, 1)
        this.InventoryData_Field.Description = unpackVariable(byteBuffer, 1)
        this.InventoryData_Field.CreationDate = unpackInt(byteBuffer)
        this.InventoryData_Field.CRC = unpackInt(byteBuffer)
    }
}
