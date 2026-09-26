package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * quit message sent between simulators
 *
 * <p>Template: {@code AgentQuitCopy Low 85 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentQuitCopy : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var FuseBlock_Field: FuseBlock = FuseBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block FuseBlock, Single. */
    open class FuseBlock {
        @JvmField var ViewerCircuitCode: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentQuitCopy(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 85 (AgentQuitCopy).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x55).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, FuseBlock_Field.ViewerCircuitCode)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        FuseBlock_Field.ViewerCircuitCode = unpackInt(byteBuffer)
    }
}
