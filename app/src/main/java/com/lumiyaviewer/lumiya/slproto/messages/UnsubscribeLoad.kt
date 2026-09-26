package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * UnsubscribeLoad
 * spaceserver -> simulator
 * reliable
 *
 * <p>Template: {@code UnsubscribeLoad Low 8 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class UnsubscribeLoad : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUnsubscribeLoad(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 8 (UnsubscribeLoad).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x08).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
