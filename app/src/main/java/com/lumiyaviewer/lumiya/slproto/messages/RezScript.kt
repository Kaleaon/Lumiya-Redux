package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Rez a script onto an object
 *
 * <p>Template: {@code RezScript Low 304 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RezScript : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryBlock_Field: InventoryBlock = InventoryBlock()
    @JvmField var UpdateBlock_Field: UpdateBlock = UpdateBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryBlock, Single. */
    open class InventoryBlock {
        @JvmField var BaseMask: Int = 0
        @JvmField var CRC: Int = 0
        @JvmField var CreationDate: Int = 0
        @JvmField var CreatorID: UUID? = null
        @JvmField var Description: ByteArray? = null
        @JvmField var EveryoneMask: Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var FolderID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var GroupMask: Int = 0
        @JvmField var GroupOwned: Boolean = false
        @JvmField var InvType: Int = 0
        @JvmField var ItemID: UUID? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var NextOwnerMask: Int = 0
        @JvmField var OwnerID: UUID? = null
        @JvmField var OwnerMask: Int = 0
        @JvmField var SalePrice: Int = 0
        @JvmField var SaleType: Int = 0
        @JvmField var TransactionID: UUID? = null
        @JvmField var Type: Int = 0
    }

    /** Block UpdateBlock, Single. */
    open class UpdateBlock {
        @JvmField var Enabled: Boolean = false
        @JvmField var ObjectLocalID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return InventoryBlock_Field.Name!!.size + 129 + 1 + InventoryBlock_Field.Description!!.size + 4 + 4 + 57
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRezScript(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 304 (RezScript).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x30).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packInt(byteBuffer, UpdateBlock_Field.ObjectLocalID)
        packBoolean(byteBuffer, UpdateBlock_Field.Enabled)
        packUUID(byteBuffer, InventoryBlock_Field.ItemID)
        packUUID(byteBuffer, InventoryBlock_Field.FolderID)
        packUUID(byteBuffer, InventoryBlock_Field.CreatorID)
        packUUID(byteBuffer, InventoryBlock_Field.OwnerID)
        packUUID(byteBuffer, InventoryBlock_Field.GroupID)
        packInt(byteBuffer, InventoryBlock_Field.BaseMask)
        packInt(byteBuffer, InventoryBlock_Field.OwnerMask)
        packInt(byteBuffer, InventoryBlock_Field.GroupMask)
        packInt(byteBuffer, InventoryBlock_Field.EveryoneMask)
        packInt(byteBuffer, InventoryBlock_Field.NextOwnerMask)
        packBoolean(byteBuffer, InventoryBlock_Field.GroupOwned)
        packUUID(byteBuffer, InventoryBlock_Field.TransactionID)
        packByte(byteBuffer, (InventoryBlock_Field.Type).toByte())
        packByte(byteBuffer, (InventoryBlock_Field.InvType).toByte())
        packInt(byteBuffer, InventoryBlock_Field.Flags)
        packByte(byteBuffer, (InventoryBlock_Field.SaleType).toByte())
        packInt(byteBuffer, InventoryBlock_Field.SalePrice)
        packVariable(byteBuffer, InventoryBlock_Field.Name, 1)
        packVariable(byteBuffer, InventoryBlock_Field.Description, 1)
        packInt(byteBuffer, InventoryBlock_Field.CreationDate)
        packInt(byteBuffer, InventoryBlock_Field.CRC)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        UpdateBlock_Field.ObjectLocalID = unpackInt(byteBuffer)
        UpdateBlock_Field.Enabled = unpackBoolean(byteBuffer)
        InventoryBlock_Field.ItemID = unpackUUID(byteBuffer)
        InventoryBlock_Field.FolderID = unpackUUID(byteBuffer)
        InventoryBlock_Field.CreatorID = unpackUUID(byteBuffer)
        InventoryBlock_Field.OwnerID = unpackUUID(byteBuffer)
        InventoryBlock_Field.GroupID = unpackUUID(byteBuffer)
        InventoryBlock_Field.BaseMask = unpackInt(byteBuffer)
        InventoryBlock_Field.OwnerMask = unpackInt(byteBuffer)
        InventoryBlock_Field.GroupMask = unpackInt(byteBuffer)
        InventoryBlock_Field.EveryoneMask = unpackInt(byteBuffer)
        InventoryBlock_Field.NextOwnerMask = unpackInt(byteBuffer)
        InventoryBlock_Field.GroupOwned = unpackBoolean(byteBuffer)
        InventoryBlock_Field.TransactionID = unpackUUID(byteBuffer)
        InventoryBlock_Field.Type = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.InvType = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.Flags = unpackInt(byteBuffer)
        InventoryBlock_Field.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
        InventoryBlock_Field.SalePrice = unpackInt(byteBuffer)
        InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1)
        InventoryBlock_Field.Description = unpackVariable(byteBuffer, 1)
        InventoryBlock_Field.CreationDate = unpackInt(byteBuffer)
        InventoryBlock_Field.CRC = unpackInt(byteBuffer)
    }
}
