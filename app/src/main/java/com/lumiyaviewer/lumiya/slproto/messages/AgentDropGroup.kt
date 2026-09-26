package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentDropGroup
 * Updates the viewer / simulator that an agent is no longer part of a group
 * dataserver -> simulator -> viewer
 * dataserver -> userserver
 * reliable
 *
 * <p>Template: {@code AgentDropGroup Low 390 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAgent::processAgentDropGroup()} in indra/newview/llagent.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AgentDropGroup : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentDropGroup(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 390 (AgentDropGroup).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x86).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
    }
}
