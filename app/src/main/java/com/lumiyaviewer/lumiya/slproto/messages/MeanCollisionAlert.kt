package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * MeanCollisionAlert
 * Specifies the text to be posted in an alert dialog
 *
 * <p>Template: {@code MeanCollisionAlert Low 136 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_mean_collision_alert_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class MeanCollisionAlert : SLMessage() {
    @JvmField val MeanCollision_Fields = ArrayList<MeanCollision>()

    /** Block MeanCollision, Variable. */
    open class MeanCollision {
        @JvmField var Mag: Float = 0f
        @JvmField var Perp: UUID? = null
        @JvmField var Time: Int = 0
        @JvmField var Type: Int = 0
        @JvmField var Victim: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (MeanCollision_Fields.size * 41) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMeanCollisionAlert(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 136 (MeanCollisionAlert).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x88).toByte())
        byteBuffer.put((MeanCollision_Fields.size.toByte()))
        for (meanCollision in MeanCollision_Fields) {
            packUUID(byteBuffer, meanCollision.Victim)
            packUUID(byteBuffer, meanCollision.Perp)
            packInt(byteBuffer, meanCollision.Time)
            packFloat(byteBuffer, meanCollision.Mag)
            packByte(byteBuffer, (meanCollision.Type).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val meanCollision = MeanCollision()
            meanCollision.Victim = unpackUUID(byteBuffer)
            meanCollision.Perp = unpackUUID(byteBuffer)
            meanCollision.Time = unpackInt(byteBuffer)
            meanCollision.Mag = unpackFloat(byteBuffer)
            meanCollision.Type = unpackByte(byteBuffer).toInt() and 0xFF
            MeanCollision_Fields.add(meanCollision)
        }
    }
}
