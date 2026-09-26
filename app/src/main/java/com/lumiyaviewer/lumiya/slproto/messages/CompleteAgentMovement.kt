package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Login and Agent Motion
 * viewer -> sim
 * agent is coming into the region. The region should be expecting the
 * agent.
 *
 * <p>Template: {@code CompleteAgentMovement Low 249 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class CompleteAgentMovement : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var CircuitCode: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCompleteAgentMovement(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 249 (CompleteAgentMovement).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xF9).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.CircuitCode)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.CircuitCode = unpackInt(byteBuffer)
    }
}
