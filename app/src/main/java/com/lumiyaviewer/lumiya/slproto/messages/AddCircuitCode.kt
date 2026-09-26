package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * space->sim
 * sim->sim
 * AddCircuitCode - Tells the recipient's messaging system that this code
 * is for a legal circuit
 *
 * <p>Template: {@code AddCircuitCode Low 2 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLMessageSystem::processAddCircuitCode()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AddCircuitCode : SLMessage() {
    @JvmField var CircuitCode_Field: CircuitCode = CircuitCode()

    /** Block CircuitCode, Single. */
    open class CircuitCode {
        @JvmField var AgentID: UUID? = null
        @JvmField var Code: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAddCircuitCode(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 2 (AddCircuitCode).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x02).toByte())
        packInt(byteBuffer, CircuitCode_Field.Code)
        packUUID(byteBuffer, CircuitCode_Field.SessionID)
        packUUID(byteBuffer, CircuitCode_Field.AgentID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        CircuitCode_Field.Code = unpackInt(byteBuffer)
        CircuitCode_Field.SessionID = unpackUUID(byteBuffer)
        CircuitCode_Field.AgentID = unpackUUID(byteBuffer)
    }
}
