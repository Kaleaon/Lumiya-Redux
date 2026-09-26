package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * FormFriendship
 *
 * <p>Template: {@code FormFriendship Low 299 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class FormFriendship : SLMessage() {
    @JvmField var AgentBlock_Field: AgentBlock = AgentBlock()

    /** Block AgentBlock, Single. */
    open class AgentBlock {
        @JvmField var DestID: UUID? = null
        @JvmField var SourceID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleFormFriendship(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 299 (FormFriendship).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x2B).toByte())
        packUUID(byteBuffer, AgentBlock_Field.SourceID)
        packUUID(byteBuffer, AgentBlock_Field.DestID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentBlock_Field.SourceID = unpackUUID(byteBuffer)
        AgentBlock_Field.DestID = unpackUUID(byteBuffer)
    }
}
