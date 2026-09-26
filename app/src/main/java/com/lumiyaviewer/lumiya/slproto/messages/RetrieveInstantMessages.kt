package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RetrieveInstantMessages - used to get instant messages that
 * were persisted out to the database while the user was offline
 * Sent from viewer->simulator.   Also see RetrieveIMsExtended (back-end only)
 *
 * <p>Template: {@code RetrieveInstantMessages Low 255 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RetrieveInstantMessages : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRetrieveInstantMessages(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 255 (RetrieveInstantMessages).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xFF).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
    }
}
