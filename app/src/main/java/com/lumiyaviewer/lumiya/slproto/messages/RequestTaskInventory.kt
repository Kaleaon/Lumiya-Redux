package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RequestTaskInventory
 *
 * <p>Template: {@code RequestTaskInventory Low 289 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestTaskInventory : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var LocalID: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestTaskInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 289 (RequestTaskInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x21).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, InventoryData_Field.LocalID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        InventoryData_Field.LocalID = unpackInt(byteBuffer)
    }
}
