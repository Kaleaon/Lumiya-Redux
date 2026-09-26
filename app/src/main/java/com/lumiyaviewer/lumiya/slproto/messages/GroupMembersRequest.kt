package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GroupMembersRequest
 * get the group members
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupMembersRequest Low 366 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupMembersRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID: if (UUID) = null
        @JvmField var RequestID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupMembersRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 366 (GroupMembersRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x6E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packUUID(byteBuffer, GroupData_Field.RequestID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDGroupData_Field as byteBuffer.GroupID = unpackUUIDGroupData_Field as byteBuffer.RequestID = unpackUUID(byteBuffer)
    }
}
