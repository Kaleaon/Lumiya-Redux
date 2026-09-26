package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentFOV - Update to agent's field of view, angle is vertical, single F32 float in radians
 *
 * <p>Template: {@code AgentFOV Low 82 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentFOV : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var FOVBlock_Field: FOVBlock = FOVBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var CircuitCode: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    /** Block FOVBlock, Single. */
    open class FOVBlock {
        @JvmField var GenCounter: Int = 0
        @JvmField var VerticalAngle: Float = 0f
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 48
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentFOV(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 82 (AgentFOV).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x52).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.CircuitCode)
        packInt(byteBuffer, FOVBlock_Field.GenCounter)
        packFloat(byteBuffer, FOVBlock_Field.VerticalAngle)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.CircuitCode = unpackInt(byteBuffer)
        FOVBlock_Field.GenCounter = unpackInt(byteBuffer)
        FOVBlock_Field.VerticalAngle = unpackFloat(byteBuffer)
    }
}
