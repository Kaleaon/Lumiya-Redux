package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Get inventory item(s) - response comes through FetchInventoryReply
 *
 * <p>Template: {@code FetchInventory Low 279 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class FetchInventory : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var ItemID: UUID? = null
        @JvmField var OwnerID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (InventoryData_Fields.size * 32) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleFetchInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 279 (FetchInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x17).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((InventoryData_Fields.size.toByte()))
        for (inventoryData in InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.OwnerID)
            packUUID(byteBuffer, inventoryData.ItemID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.OwnerID = unpackUUID(byteBuffer)
            inventoryData.ItemID = unpackUUID(byteBuffer)
            InventoryData_Fields.add(inventoryData)
        }
    }
}
