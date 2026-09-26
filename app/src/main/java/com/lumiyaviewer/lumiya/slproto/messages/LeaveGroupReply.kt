package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * LeaveGroupReply
 * dataserver -> simulator -> viewer
 *
 * <p>Template: {@code LeaveGroupReply Low 348 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processLeaveGroupReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class LeaveGroupReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GroupData_Field: GroupData = GroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID: UUID? = null
        @JvmField var Success: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLeaveGroupReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 348 (LeaveGroupReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x5C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packBoolean(byteBuffer, GroupData_Field.Success)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        GroupData_Field.GroupID = unpackUUID(byteBuffer)
        GroupData_Field.Success = unpackBoolean(byteBuffer)
    }
}
