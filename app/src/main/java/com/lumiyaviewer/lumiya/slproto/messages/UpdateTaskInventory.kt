package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * These messages are viewer->simulator requests to update a task's
 * inventory.
 * if Key == 0, itemid is the key. if Key == 1, assetid is the key.
 *
 * <p>Template: {@code UpdateTaskInventory Low 286 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateTaskInventory : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()
    @JvmField var UpdateData_Field: UpdateData = UpdateData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var BaseMask: Int = 0
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

    /** Block UpdateData, Single. */
    open class UpdateData {
        @JvmField var Key: Int = 0
        @JvmField var LocalID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return InventoryData_Field.Name!!.size + 129 + 1 + InventoryData_Field.Description!!.size + 4 + 4 + 41
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateTaskInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 286 (UpdateTaskInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x1E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, UpdateData_Field.LocalID)
        packByte(byteBuffer, (UpdateData_Field.Key).toByte())
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
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDUpdateData_Field as byteBuffer.LocalID = unpackIntUpdateData_Field as byteBuffer.Key = unpackByte(byteBuffer).toInt() and 0xFF
        InventoryData_Field.ItemID = unpackUUIDInventoryData_Field as byteBuffer.FolderID = unpackUUIDInventoryData_Field as byteBuffer.CreatorID = unpackUUIDInventoryData_Field as byteBuffer.OwnerID = unpackUUIDInventoryData_Field as byteBuffer.GroupID = unpackUUIDInventoryData_Field as byteBuffer.BaseMask = unpackIntInventoryData_Field as byteBuffer.OwnerMask = unpackIntInventoryData_Field as byteBuffer.GroupMask = unpackIntInventoryData_Field as byteBuffer.EveryoneMask = unpackIntInventoryData_Field as byteBuffer.NextOwnerMask = unpackIntInventoryData_Field as byteBuffer.GroupOwned = unpackBooleanInventoryData_Field as byteBuffer.TransactionID = unpackUUIDInventoryData_Field as byteBuffer.Type = unpackByte(byteBuffer).toInt()
        InventoryData_Field.InvType = unpackByte(byteBuffer).toInt()
        InventoryData_Field.Flags = unpackIntInventoryData_Field as byteBuffer.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
        InventoryData_Field.SalePrice = unpackIntInventoryData_Field as byteBuffer.Name = unpackVariable(byteBuffer, 1)
        InventoryData_Field.Description = unpackVariable(byteBuffer, 1)
        InventoryData_Field.CreationDate = unpackIntInventoryData_Field as byteBuffer.CRC = unpackInt(byteBuffer)
    }
}
