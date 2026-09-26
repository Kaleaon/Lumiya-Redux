package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * viewer->sim
 * UseCircuitCode - Attempts to provide the recipient with IP and Port
 * info. In the case of viewers, the id is the session id. For other
 * machines it may be null. The session id will always be the session
 * id of the process, which every server will generate on startup and
 * the viewer will be handed after login.
 *
 * <p>Template: {@code UseCircuitCode Low 3 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLMessageSystem::processUseCircuitCode()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class UseCircuitCode : SLMessage() {
    @JvmField var CircuitCode_Field: CircuitCode = CircuitCode()

    /** Block CircuitCode, Single. */
    open class CircuitCode {
        @JvmField var Code: Int = 0
        @JvmField var ID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUseCircuitCode(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 3 (UseCircuitCode).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x03).toByte())
        packInt(byteBuffer, CircuitCode_Field.Code)
        packUUID(byteBuffer, CircuitCode_Field.SessionID)
        packUUID(byteBuffer, CircuitCode_Field.ID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        CircuitCode_Field.Code = unpackInt(byteBuffer)
        CircuitCode_Field.SessionID = unpackUUID(byteBuffer)
        CircuitCode_Field.ID = unpackUUID(byteBuffer)
    }
}
