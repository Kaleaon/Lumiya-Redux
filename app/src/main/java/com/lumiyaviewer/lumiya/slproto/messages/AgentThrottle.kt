package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentThrottle
 *
 * <p>Template: {@code AgentThrottle Low 81 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentThrottle : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Throttle_Field: Throttle = Throttle()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var CircuitCode: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    /** Block Throttle, Single. */
    open class Throttle {
        @JvmField var GenCounter: Int = 0
        @JvmField var Throttles: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return Throttle_Field.Throttles!!.size + 5 + 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentThrottle(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 81 (AgentThrottle).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x51).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.CircuitCode)
        packInt(byteBuffer, Throttle_Field.GenCounter)
        packVariable(byteBuffer, Throttle_Field.Throttles, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.CircuitCode = unpackInt(byteBuffer)
        Throttle_Field.GenCounter = unpackInt(byteBuffer)
        Throttle_Field.Throttles = unpackVariable(byteBuffer, 1)
    }
}
