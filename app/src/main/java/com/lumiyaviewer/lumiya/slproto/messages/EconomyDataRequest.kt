package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * Economy messages
 * once we use local stats, this will include a region handle
 *
 * <p>Template: {@code EconomyDataRequest Low 24 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class EconomyDataRequest : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEconomyDataRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 24 (EconomyDataRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x18).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
