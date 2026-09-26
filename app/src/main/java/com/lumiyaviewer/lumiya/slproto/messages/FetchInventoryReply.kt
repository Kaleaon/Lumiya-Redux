package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * response to fetch inventory
 *
 * <p>Template: {@code FetchInventoryReply Low 280 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class FetchInventoryReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var AssetID else UUID? = null
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
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 21
        val it = InventoryData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val inventoryData = it.next()
            i = inventoryData.Description!!.size + inventoryData.Name!!.size + 129 + 1 + 4 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleFetchInventoryReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 280 (FetchInventoryReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x18).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        byteBuffer.put((InventoryData_Fields.size.toByte()))
        for (inventoryData in InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.ItemID)
            packUUID(byteBuffer, inventoryData.FolderID)
            packUUID(byteBuffer, inventoryData.CreatorID)
            packUUID(byteBuffer, inventoryData.OwnerID)
            packUUID(byteBuffer, inventoryData.GroupID)
            packInt(byteBuffer, inventoryData.BaseMask)
            packInt(byteBuffer, inventoryData.OwnerMask)
            packInt(byteBuffer, inventoryData.GroupMask)
            packInt(byteBuffer, inventoryData.EveryoneMask)
            packInt(byteBuffer, inventoryData.NextOwnerMask)
            packBoolean(byteBuffer, inventoryData.GroupOwned)
            packUUID(byteBuffer, inventoryData.AssetID)
            packByte(byteBuffer, (inventoryData.Type).toByte())
            packByte(byteBuffer, (inventoryData.InvType).toByte())
            packInt(byteBuffer, inventoryData.Flags)
            packByte(byteBuffer, (inventoryData.SaleType).toByte())
            packInt(byteBuffer, inventoryData.SalePrice)
            packVariable(byteBuffer, inventoryData.Name, 1)
            packVariable(byteBuffer, inventoryData.Description, 1)
            packInt(byteBuffer, inventoryData.CreationDate)
            packInt(byteBuffer, inventoryData.CRC)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.ItemID = unpackUUIDinventoryData as byteBuffer.FolderID = unpackUUIDinventoryData as byteBuffer.CreatorID = unpackUUIDinventoryData as byteBuffer.OwnerID = unpackUUIDinventoryData as byteBuffer.GroupID = unpackUUIDinventoryData as byteBuffer.BaseMask = unpackIntinventoryData as byteBuffer.OwnerMask = unpackIntinventoryData as byteBuffer.GroupMask = unpackIntinventoryData as byteBuffer.EveryoneMask = unpackIntinventoryData as byteBuffer.NextOwnerMask = unpackIntinventoryData as byteBuffer.GroupOwned = unpackBooleaninventoryData as byteBuffer.AssetID = unpackUUIDinventoryData as byteBuffer.Type = unpackByte(byteBuffer).toInt()
            inventoryData.InvType = unpackByte(byteBuffer).toInt()
            inventoryData.Flags = unpackIntinventoryData as byteBuffer.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
            inventoryData.SalePrice = unpackIntinventoryData as byteBuffer.Name = unpackVariable(byteBuffer, 1)
            inventoryData.Description = unpackVariable(byteBuffer, 1)
            inventoryData.CreationDate = unpackIntinventoryData as byteBuffer.CRC = unpackIntInventoryData_Fields as byteBuffer.add(inventoryData)
        }
    }
}
