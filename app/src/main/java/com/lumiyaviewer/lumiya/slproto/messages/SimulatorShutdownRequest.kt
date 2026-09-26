package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * Simulator Shutdown Request - Tells spaceserver that a simulator is trying to shutdown
 *
 * <p>Template: {@code SimulatorShutdownRequest Low 13 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimulatorShutdownRequest : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimulatorShutdownRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 13 (SimulatorShutdownRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x0D).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
