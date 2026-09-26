package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentSit - Actually sit on object
 *
 * <p>Template: {@code AgentSit High 7 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentSit : SLMessage() {
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
        return 33
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentSit(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 7 (AgentSit).
        byteBuffer.put((0x07).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
    }
}
