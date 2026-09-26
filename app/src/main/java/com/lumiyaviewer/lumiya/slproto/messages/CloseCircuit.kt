package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * CloseCircuit - Tells the recipient's messaging system to close the descibed circuit
 *
 * <p>Template: {@code CloseCircuit Fixed 0xFFFFFFFD NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code close_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class CloseCircuit : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCloseCircuit(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Fixed 0xFFFFFFFD (CloseCircuit).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0xFD).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
