package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * EjectGroupMemberReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code EjectGroupMemberReply Low 346 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processEjectGroupMemberReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class EjectGroupMemberReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var EjectData_Field: EjectData = EjectData()
    @JvmField var GroupData_Field: GroupData = GroupData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block EjectData, Single. */
    open class EjectData {
        @JvmField var Success: Boolean = false
    }

    /** Block GroupData, Single. */
    open class GroupData {
        @JvmField var GroupID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEjectGroupMemberReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 346 (EjectGroupMemberReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x5A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, GroupData_Field.GroupID)
        packBoolean(byteBuffer, EjectData_Field.Success)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        GroupData_Field.GroupID = unpackUUID(byteBuffer)
        EjectData_Field.Success = unpackBoolean(byteBuffer)
    }
}
