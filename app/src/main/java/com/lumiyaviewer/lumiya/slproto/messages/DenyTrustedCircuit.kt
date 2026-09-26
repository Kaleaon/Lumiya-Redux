package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DenyTrustedCircuit
 * Sent :
 * - in response to failed CreateTrustedCircuit
 * - to force the remote end-point to try to establish a trusted circuit
 * - the reception of a trusted message on a non-trusted circuit
 * This allows us to re-auth a circuit if it gets closed due to timeouts or network failures.
 *
 * <p>Template: {@code DenyTrustedCircuit Low 393 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_deny_trusted_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DenyTrustedCircuit : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var EndPointID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDenyTrustedCircuit(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 393 (DenyTrustedCircuit).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x89).toByte())
        packUUID(byteBuffer, DataBlock_Field.EndPointID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.EndPointID = unpackUUID(byteBuffer)
    }
}
