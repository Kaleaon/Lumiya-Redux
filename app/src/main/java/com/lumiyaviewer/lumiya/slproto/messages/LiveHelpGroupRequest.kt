package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Request the members of the live help group needed for requesting agent.
 * userserver -> dataserver
 *
 * <p>Template: {@code LiveHelpGroupRequest Low 379 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class LiveHelpGroupRequest : SLMessage() {
    @JvmField var RequestData_Field: RequestData = RequestData()

    /** Block RequestData, Single. */
    open class RequestData {
        @JvmField var AgentID: UUID? = null
        @JvmField var RequestID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLiveHelpGroupRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 379 (LiveHelpGroupRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x7B).toByte())
        packUUID(byteBuffer, RequestData_Field.RequestID)
        packUUID(byteBuffer, RequestData_Field.AgentID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RequestData_Field.RequestID = unpackUUID(byteBuffer)
        RequestData_Field.AgentID = unpackUUID(byteBuffer)
    }
}
