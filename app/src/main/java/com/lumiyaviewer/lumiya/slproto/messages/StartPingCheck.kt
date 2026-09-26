package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * End fixed messages
 * StartPingCheck - used to measure circuit ping times
 * PingID is used to determine how backlogged the ping was that was
 * returned (or how hosed the other side is)
 *
 * <p>Template: {@code StartPingCheck High 1 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_start_ping_check()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class StartPingCheck : SLMessage() {
    @JvmField var PingID_Field: PingID = PingID()

    /** Block PingID, Single. */
    open class PingID {
        @JvmField var OldestUnacked: Int = 0
        @JvmField var PingID: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 6
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleStartPingCheck(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 1 (StartPingCheck).
        byteBuffer.put((0x01).toByte())
        packByte(byteBuffer, (PingID_Field.PingID).toByte())
        packInt(byteBuffer, PingID_Field.OldestUnacked)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        PingID_Field.PingID = unpackByte(byteBuffer).toInt() and 0xFF
        PingID_Field.OldestUnacked = unpackInt(byteBuffer)
    }
}
