package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * This is how you remove inventory when you're not even sure what it
 * is - only it's parenting.
 *
 * <p>Template: {@code PurgeInventoryDescendents Low 285 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class PurgeInventoryDescendents : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var InventoryData_Field: InventoryData = InventoryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var FolderID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandlePurgeInventoryDescendents(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 285 (PurgeInventoryDescendents).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x1D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, InventoryData_Field.FolderID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        InventoryData_Field.FolderID = unpackUUID(byteBuffer)
    }
}
