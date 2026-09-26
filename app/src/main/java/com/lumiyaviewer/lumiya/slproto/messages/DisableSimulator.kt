package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * DisableThisSimulator - Tells a viewer not to expect data from this simulator anymore
 *
 * <p>Template: {@code DisableSimulator Low 152 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_disable_simulator()} in indra/newview/llworld.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DisableSimulator : SLMessage() {
    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDisableSimulator(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 152 (DisableSimulator).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x98).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
