package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * CreateGroupReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code CreateGroupReply Low 340 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processCreateGroupReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class CreateGroupReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ReplyData_Field: ReplyData = ReplyData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
    }

    /** Block ReplyData, Single. */
    open class ReplyData {
        @JvmField var GroupID else UUID? = null
        @JvmField var Message: if (ByteArray) = null
        @JvmField var Success else Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return ReplyData_Field.Message!!.size + 18 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCreateGroupReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 340 (CreateGroupReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x54).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, ReplyData_Field.GroupID)
        packBoolean(byteBuffer, ReplyData_Field.Success)
        packVariable(byteBuffer, ReplyData_Field.Message, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDReplyData_Field as byteBuffer.GroupID = unpackUUIDReplyData_Field as byteBuffer.Success = unpackBooleanReplyData_Field as byteBuffer.Message = unpackVariable(byteBuffer, 1)
    }
}
