package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ChangeInventoryItemFlags
 *
 * <p>Template: {@code ChangeInventoryItemFlags Low 271 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ChangeInventoryItemFlags : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val InventoryData_Fields = ArrayList<InventoryData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
        @JvmField var Flags: Int = 0
        @JvmField var ItemID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (InventoryData_Fields.size * 20) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChangeInventoryItemFlags(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 271 (ChangeInventoryItemFlags).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x0F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((InventoryData_Fields.size.toByte()))
        for (inventoryData in InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.ItemID)
            packInt(byteBuffer, inventoryData.Flags)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryData = InventoryData()
            inventoryData.ItemID = unpackUUID(byteBuffer)
            inventoryData.Flags = unpackInt(byteBuffer)
            InventoryData_Fields.add(inventoryData)
        }
    }
}
