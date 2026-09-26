package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * tell viewer to use the local mute cache
 *
 * <p>Template: {@code UseCachedMuteList Low 319 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class UseCachedMuteList : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUseCachedMuteList(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 319 (UseCachedMuteList).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x3F).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
    }
}
