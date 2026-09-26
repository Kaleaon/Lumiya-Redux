package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * record dwell time.
 *
 * <p>Template: {@code LogDwellTime Low 18 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class LogDwellTime : SLMessage() {
    @JvmField var DwellInfo_Field: DwellInfo = DwellInfo()

    /** Block DwellInfo, Single. */
    open class DwellInfo {
        @JvmField var AgentID: UUID? = null
        @JvmField var AvgAgentsInView: Int = 0
        @JvmField var AvgViewerFPS: Int = 0
        @JvmField var Duration: Float = 0f
        @JvmField var RegionX: Int = 0
        @JvmField var RegionY: Int = 0
        @JvmField var SessionID: UUID? = null
        @JvmField var SimName: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DwellInfo_Field.SimName!!.size + 37 + 4 + 4 + 1 + 1 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLogDwellTime(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 18 (LogDwellTime).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x12).toByte())
        packUUID(byteBuffer, DwellInfo_Field.AgentID)
        packUUID(byteBuffer, DwellInfo_Field.SessionID)
        packFloat(byteBuffer, DwellInfo_Field.Duration)
        packVariable(byteBuffer, DwellInfo_Field.SimName, 1)
        packInt(byteBuffer, DwellInfo_Field.RegionX)
        packInt(byteBuffer, DwellInfo_Field.RegionY)
        packByte(byteBuffer, (DwellInfo_Field.AvgAgentsInView).toByte())
        packByte(byteBuffer, (DwellInfo_Field.AvgViewerFPS).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DwellInfo_Field.AgentID = unpackUUID(byteBuffer)
        DwellInfo_Field.SessionID = unpackUUID(byteBuffer)
        DwellInfo_Field.Duration = unpackFloat(byteBuffer)
        DwellInfo_Field.SimName = unpackVariable(byteBuffer, 1)
        DwellInfo_Field.RegionX = unpackInt(byteBuffer)
        DwellInfo_Field.RegionY = unpackInt(byteBuffer)
        DwellInfo_Field.AvgAgentsInView = unpackByte(byteBuffer).toInt() and 0xFF
        DwellInfo_Field.AvgViewerFPS = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
