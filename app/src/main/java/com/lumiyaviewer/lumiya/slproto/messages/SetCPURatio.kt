package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * SetChildCount - Sent to launcher to adjust nominal child count
 * Simulator sends this increase the sim/cpu ratio on startup
 *
 * <p>Template: {@code SetCPURatio Low 327 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SetCPURatio : SLMessage() {
    @JvmField var Data_Field: Data = Data()

    /** Block Data, Single. */
    open class Data {
        @JvmField var Ratio: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetCPURatio(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 327 (SetCPURatio).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x47).toByte())
        packByte(byteBuffer, (Data_Field.Ratio).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.Ratio = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
