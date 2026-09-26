package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * RequestTrustedCircuit
 * If the destination does not trust the sender, a Deny is sent back.
 *
 * <p>Template: {@code RequestTrustedCircuit Low 394 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code null_message_callback()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class RequestTrustedCircuit : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestTrustedCircuit(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 394 (RequestTrustedCircuit).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x8A).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
