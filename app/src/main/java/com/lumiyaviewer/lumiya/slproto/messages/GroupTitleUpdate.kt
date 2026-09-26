package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GroupTitleUpdate
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code GroupTitleUpdate Low 377 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupTitleUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var GroupID else UUID? = null
        @JvmField var SessionID: if (UUID) = null
        @JvmField var TitleRoleID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupTitleUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 377 (GroupTitleUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x79).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, AgentData_Field.TitleRoleID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.GroupID = unpackUUIDAgentData_Field as byteBuffer.TitleRoleID = unpackUUID(byteBuffer)
    }
}
