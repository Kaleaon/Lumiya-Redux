package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentDataUpdate
 * Updates a viewer or simulator's impression of agent-specific information.
 * Used, for example, when an agent's group changes.
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AgentDataUpdate Low 387 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAgent::processAgentDataUpdate()} in indra/newview/llagent.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AgentDataUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var ActiveGroupID: UUID? = null
        @JvmField var AgentID: UUID? = null
        @JvmField var FirstName: ByteArray? = null
        @JvmField var GroupName: ByteArray? = null
        @JvmField var GroupPowers: Long = 0L
        @JvmField var GroupTitle: ByteArray? = null
        @JvmField var LastName: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return AgentData_Field.FirstName!!.size + 17 + 1 + AgentData_Field.LastName!!.size + 1 + AgentData_Field.GroupTitle!!.size + 16 + 8 + 1 + AgentData_Field.GroupName!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentDataUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 387 (AgentDataUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x83).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packVariable(byteBuffer, AgentData_Field.FirstName, 1)
        packVariable(byteBuffer, AgentData_Field.LastName, 1)
        packVariable(byteBuffer, AgentData_Field.GroupTitle, 1)
        packUUID(byteBuffer, AgentData_Field.ActiveGroupID)
        packLong(byteBuffer, AgentData_Field.GroupPowers)
        packVariable(byteBuffer, AgentData_Field.GroupName, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.FirstName = unpackVariable(byteBuffer, 1)
        AgentData_Field.LastName = unpackVariable(byteBuffer, 1)
        AgentData_Field.GroupTitle = unpackVariable(byteBuffer, 1)
        AgentData_Field.ActiveGroupID = unpackUUID(byteBuffer)
        AgentData_Field.GroupPowers = unpackLong(byteBuffer)
        AgentData_Field.GroupName = unpackVariable(byteBuffer, 1)
    }
}
