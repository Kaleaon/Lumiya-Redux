package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RemoveTaskInventory
 *
 * <p>Template: {@code RemoveTaskInventory Low 287 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RemoveTaskInventory : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var ItemID: if (UUID) = null
        @JvmField var LocalID else Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRemoveTaskInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 287 (RemoveTaskInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x1F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, InventoryData_Field.LocalID)
        packUUID(byteBuffer, InventoryData_Field.ItemID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDInventoryData_Field as byteBuffer.LocalID = unpackIntInventoryData_Field as byteBuffer.ItemID = unpackUUID(byteBuffer)
    }
}
