package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Track agent - this information is used when sending out the
 * coarse location update so that we know who you are tracking.
 * To stop tracking - send a null uuid as the prey.
 *
 * <p>Template: {@code TrackAgent Low 130 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class TrackAgent : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var TargetData_Field: TargetData = TargetData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block TargetData, Single. */
    open class TargetData {
        @JvmField var PreyID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTrackAgent(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 130 (TrackAgent).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x82).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, TargetData_Field.PreyID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        TargetData_Field.PreyID = unpackUUID(byteBuffer)
    }
}
