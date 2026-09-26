package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer

/**
 * SimulatorViewerTimeMessage - Allows viewer to resynch to world time
 *
 * <p>Template: {@code SimulatorViewerTimeMessage Low 150 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_time_synch()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class SimulatorViewerTimeMessage : SLMessage() {
    @JvmField var TimeInfo_Field: TimeInfo = TimeInfo()

    /** Block TimeInfo, Single. */
    open class TimeInfo {
        @JvmField var SecPerDay: Int = 0
        @JvmField var SecPerYear: Int = 0
        @JvmField var SunAngVelocity: LLVector3? = null
        @JvmField var SunDirection: LLVector3? = null
        @JvmField var SunPhase: Float = 0f
        @JvmField var UsecSinceStart: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 48
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimulatorViewerTimeMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 150 (SimulatorViewerTimeMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x96).toByte())
        packLong(byteBuffer, TimeInfo_Field.UsecSinceStart)
        packInt(byteBuffer, TimeInfo_Field.SecPerDay)
        packInt(byteBuffer, TimeInfo_Field.SecPerYear)
        packLLVector3(byteBuffer, TimeInfo_Field.SunDirection)
        packFloat(byteBuffer, TimeInfo_Field.SunPhase)
        packLLVector3(byteBuffer, TimeInfo_Field.SunAngVelocity)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TimeInfo_Field.UsecSinceStart = unpackLong(byteBuffer)
        TimeInfo_Field.SecPerDay = unpackInt(byteBuffer)
        TimeInfo_Field.SecPerYear = unpackInt(byteBuffer)
        TimeInfo_Field.SunDirection = unpackLLVector3(byteBuffer)
        TimeInfo_Field.SunPhase = unpackFloat(byteBuffer)
        TimeInfo_Field.SunAngVelocity = unpackLLVector3(byteBuffer)
    }
}
