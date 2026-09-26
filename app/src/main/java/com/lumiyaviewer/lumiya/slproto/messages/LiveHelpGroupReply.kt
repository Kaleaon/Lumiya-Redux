package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Send down the group
 * dataserver -> userserver
 *
 * <p>Template: {@code LiveHelpGroupReply Low 380 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class LiveHelpGroupReply : SLMessage() {
    @JvmField var ReplyData_Field: ReplyData = ReplyData()

    /** Block ReplyData, Single. */
    open class ReplyData {
        @JvmField var GroupID: UUID? = null
        @JvmField var RequestID: UUID? = null
        @JvmField var Selection: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return ReplyData_Field.Selection!!.size + 33 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLiveHelpGroupReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 380 (LiveHelpGroupReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x7C).toByte())
        packUUID(byteBuffer, ReplyData_Field.RequestID)
        packUUID(byteBuffer, ReplyData_Field.GroupID)
        packVariable(byteBuffer, ReplyData_Field.Selection, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ReplyData_Field.RequestID = unpackUUID(byteBuffer)
        ReplyData_Field.GroupID = unpackUUID(byteBuffer)
        ReplyData_Field.Selection = unpackVariable(byteBuffer, 1)
    }
}
