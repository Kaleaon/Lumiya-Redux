package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * Health Message
 * Tells viewer what agent health is
 *
 * <p>Template: {@code HealthMessage Low 138 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_health_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class HealthMessage : SLMessage() {
    @JvmField var HealthData_Field: HealthData = HealthData()

    /** Block HealthData, Single. */
    open class HealthData {
        @JvmField var Health: Float = 0f
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 8
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleHealthMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 138 (HealthMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x8A).toByte())
        packFloat(byteBuffer, HealthData_Field.Health)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        HealthData_Field.Health = unpackFloat(byteBuffer)
    }
}
