package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * SubscribeLoad
 * spaceserver -> simulator
 * reliable
 *
 * <p>Template: {@code SubscribeLoad Low 7 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SubscribeLoad : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSubscribeLoad(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 7 (SubscribeLoad).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x07).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
