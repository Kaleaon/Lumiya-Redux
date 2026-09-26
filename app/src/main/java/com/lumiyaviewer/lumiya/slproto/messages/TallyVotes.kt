package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * TallyVotes userserver -> dataserver
 * reliable
 *
 * <p>Template: {@code TallyVotes Low 365 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class TallyVotes : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTallyVotes(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 365 (TallyVotes).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x6D).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
