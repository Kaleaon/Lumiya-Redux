package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * CompletePingCheck - used to measure circuit ping times
 *
 * <p>Template: {@code CompletePingCheck High 2 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_complete_ping_check()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class CompletePingCheck : SLMessage() {
    @JvmField var PingID_Field: PingID = PingID()

    /** Block PingID, Single. */
    open class PingID {
        @JvmField var PingID: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 2
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCompletePingCheck(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 2 (CompletePingCheck).
        byteBuffer.put((0x02).toByte())
        packByte(byteBuffer, (PingID_Field.PingID).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        PingID_Field.PingID = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
