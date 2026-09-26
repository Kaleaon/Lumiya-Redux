package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GroupTitlesRequest
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code GroupTitlesRequest Low 375 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupTitlesRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var GroupID else UUID? = null
        @JvmField var RequestID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupTitlesRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 375 (GroupTitlesRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x77).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, AgentData_Field.RequestID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.GroupID = unpackUUIDAgentData_Field as byteBuffer.RequestID = unpackUUID(byteBuffer)
    }
}
