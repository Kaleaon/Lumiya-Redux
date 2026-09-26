package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ChildAgentAlive
 * sent to child agents just to keep them alive
 *
 * <p>Template: {@code ChildAgentAlive High 26 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ChildAgentAlive : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var RegionHandle: Long = 0L
        @JvmField var SessionID: UUID? = null
        @JvmField var ViewerCircuitCode: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 45
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChildAgentAlive(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 26 (ChildAgentAlive).
        byteBuffer.put((0x1A).toByte())
        packLong(byteBuffer, AgentData_Field.RegionHandle)
        packInt(byteBuffer, AgentData_Field.ViewerCircuitCode)
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.RegionHandle = unpackLong(byteBuffer)
        AgentData_Field.ViewerCircuitCode = unpackInt(byteBuffer)
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
    }
}
