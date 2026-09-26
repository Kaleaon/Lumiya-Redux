package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * This message is sent from viewer -> simulator when the viewer wants
 * to rez an object out of inventory back to its position before it
 * last moved into the inventory
 *
 * <p>Template: {@code RezRestoreToWorld Low 425 NotTrusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class RezRestoreToWorld : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
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

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return InventoryData_Field.Name!!.size + 129 + 1 + InventoryData_Field.Description!!.size + 4 + 4 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRezRestoreToWorld(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 425 (RezRestoreToWorld).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA9).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, InventoryData_Field.ItemID)
        packUUID(byteBuffer, InventoryData_Field.FolderID)
        packUUID(byteBuffer, InventoryData_Field.CreatorID)
        packUUID(byteBuffer, InventoryData_Field.OwnerID)
        packUUID(byteBuffer, InventoryData_Field.GroupID)
        packInt(byteBuffer, InventoryData_Field.BaseMask)
        packInt(byteBuffer, InventoryData_Field.OwnerMask)
        packInt(byteBuffer, InventoryData_Field.GroupMask)
        packInt(byteBuffer, InventoryData_Field.EveryoneMask)
        packInt(byteBuffer, InventoryData_Field.NextOwnerMask)
        packBoolean(byteBuffer, InventoryData_Field.GroupOwned)
        packUUID(byteBuffer, InventoryData_Field.TransactionID)
        packByte(byteBuffer, (InventoryData_Field.Type).toByte())
        packByte(byteBuffer, (InventoryData_Field.InvType).toByte())
        packInt(byteBuffer, InventoryData_Field.Flags)
        packByte(byteBuffer, (InventoryData_Field.SaleType).toByte())
        packInt(byteBuffer, InventoryData_Field.SalePrice)
        packVariable(byteBuffer, InventoryData_Field.Name, 1)
        packVariable(byteBuffer, InventoryData_Field.Description, 1)
        packInt(byteBuffer, InventoryData_Field.CreationDate)
        packInt(byteBuffer, InventoryData_Field.CRC)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        InventoryData_Field.ItemID = unpackUUID(byteBuffer)
        InventoryData_Field.FolderID = unpackUUID(byteBuffer)
        InventoryData_Field.CreatorID = unpackUUID(byteBuffer)
        InventoryData_Field.OwnerID = unpackUUID(byteBuffer)
        InventoryData_Field.GroupID = unpackUUID(byteBuffer)
        InventoryData_Field.BaseMask = unpackInt(byteBuffer)
        InventoryData_Field.OwnerMask = unpackInt(byteBuffer)
        InventoryData_Field.GroupMask = unpackInt(byteBuffer)
        InventoryData_Field.EveryoneMask = unpackInt(byteBuffer)
        InventoryData_Field.NextOwnerMask = unpackInt(byteBuffer)
        InventoryData_Field.GroupOwned = unpackBoolean(byteBuffer)
        InventoryData_Field.TransactionID = unpackUUID(byteBuffer)
        InventoryData_Field.Type = unpackByte(byteBuffer).toInt()
        InventoryData_Field.InvType = unpackByte(byteBuffer).toInt()
        InventoryData_Field.Flags = unpackInt(byteBuffer)
        InventoryData_Field.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
        InventoryData_Field.SalePrice = unpackInt(byteBuffer)
        InventoryData_Field.Name = unpackVariable(byteBuffer, 1)
        InventoryData_Field.Description = unpackVariable(byteBuffer, 1)
        InventoryData_Field.CreationDate = unpackInt(byteBuffer)
        InventoryData_Field.CRC = unpackInt(byteBuffer)
    }
}
