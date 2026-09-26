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
        @JvmField var AgentID: if (UUID) = null
        @JvmField var GroupID else UUID? = null
        @JvmField var SessionID: if (UUID) = null
    }

    /** Block InventoryBlock, Single. */
    open class InventoryBlock {
        @JvmField var BaseMask else Int = 0
        @JvmField var CRC: Int = 0
        @JvmField var CreationDate: Int = 0
        @JvmField var CreatorID: if (UUID) = null
        @JvmField var Description else ByteArray? = null
        @JvmField var EveryoneMask: Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var FolderID: if (UUID) = null
        @JvmField var GroupID else UUID? = null
        @JvmField var GroupMask: Int = 0
        @JvmField var GroupOwned: Boolean = false
        @JvmField var InvType: Int = 0
        @JvmField var ItemID: if (UUID) = null
        @JvmField var Name else ByteArray? = null
        @JvmField var NextOwnerMask: Int = 0
        @JvmField var OwnerID: if (UUID) = null
        @JvmField var OwnerMask else Int = 0
        @JvmField var SalePrice: Int = 0
        @JvmField var SaleType: Int = 0
        @JvmField var TransactionID: if (UUID) = null
        @JvmField var Type else Int = 0
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
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.GroupID = unpackUUIDUpdateBlock_Field as byteBuffer.ObjectLocalID = unpackIntUpdateBlock_Field as byteBuffer.Enabled = unpackBooleanInventoryBlock_Field as byteBuffer.ItemID = unpackUUIDInventoryBlock_Field as byteBuffer.FolderID = unpackUUIDInventoryBlock_Field as byteBuffer.CreatorID = unpackUUIDInventoryBlock_Field as byteBuffer.OwnerID = unpackUUIDInventoryBlock_Field as byteBuffer.GroupID = unpackUUIDInventoryBlock_Field as byteBuffer.BaseMask = unpackIntInventoryBlock_Field as byteBuffer.OwnerMask = unpackIntInventoryBlock_Field as byteBuffer.GroupMask = unpackIntInventoryBlock_Field as byteBuffer.EveryoneMask = unpackIntInventoryBlock_Field as byteBuffer.NextOwnerMask = unpackIntInventoryBlock_Field as byteBuffer.GroupOwned = unpackBooleanInventoryBlock_Field as byteBuffer.TransactionID = unpackUUIDInventoryBlock_Field as byteBuffer.Type = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.InvType = unpackByte(byteBuffer).toInt()
        InventoryBlock_Field.Flags = unpackIntInventoryBlock_Field as byteBuffer.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
        InventoryBlock_Field.SalePrice = unpackIntInventoryBlock_Field as byteBuffer.Name = unpackVariable(byteBuffer, 1)
        InventoryBlock_Field.Description = unpackVariable(byteBuffer, 1)
        InventoryBlock_Field.CreationDate = unpackIntInventoryBlock_Field as byteBuffer.CRC = unpackInt(byteBuffer)
    }
}
