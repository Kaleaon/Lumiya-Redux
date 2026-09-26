package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Send an AlertMessage to the named agent.
 * usually dataserver->simulator
 *
 * <p>Template: {@code AgentAlertMessage Low 135 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_agent_alert_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AgentAlertMessage : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var AlertData_Field: AlertData = AlertData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block AlertData, Single. */
    open class AlertData {
        @JvmField var Message: ByteArray? = null
        @JvmField var Modal: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return AlertData_Field.Message!!.size + 2 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentAlertMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 135 (AgentAlertMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x87).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packBoolean(byteBuffer, AlertData_Field.Modal)
        packVariable(byteBuffer, AlertData_Field.Message, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AlertData_Field.Modal = unpackBoolean(byteBuffer)
        AlertData_Field.Message = unpackVariable(byteBuffer, 1)
    }
}
