package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ConfirmEnableSimulator - A confirmation message sent from simulator to neighbors that the simulator
 * has successfully been enabled by the viewer
 *
 * <p>Template: {@code ConfirmEnableSimulator Medium 8 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ConfirmEnableSimulator : SLMessage() {
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
        return 34
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleConfirmEnableSimulator(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 8 (ConfirmEnableSimulator).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x08).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
    }
}
