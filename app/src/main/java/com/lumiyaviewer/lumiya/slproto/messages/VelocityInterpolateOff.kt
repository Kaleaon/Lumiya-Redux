package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * VelocityInterpolateOff
 * viewer->sim
 * requires administrative access
 *
 * <p>Template: {@code VelocityInterpolateOff Low 126 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class VelocityInterpolateOff : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleVelocityInterpolateOff(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 126 (VelocityInterpolateOff).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x7E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
    }
}
