package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code RequestRegionInfo Low 141 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestRegionInfo : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestRegionInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 141 (RequestRegionInfo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x8D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUID(byteBuffer)
    }
}
