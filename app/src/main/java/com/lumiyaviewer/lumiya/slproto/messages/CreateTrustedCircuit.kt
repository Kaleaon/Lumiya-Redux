package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * CreateTrustedCircuit
 * Sent to establish a trust relationship between two components.
 * Only sent in response to a DenyTrustedCircuit message.
 *
 * <p>Template: {@code CreateTrustedCircuit Low 392 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_create_trusted_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class CreateTrustedCircuit : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var Digest: ByteArray? = null
        @JvmField var EndPointID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCreateTrustedCircuit(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 392 (CreateTrustedCircuit).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x88).toByte())
        packUUID(byteBuffer, DataBlock_Field.EndPointID)
        packFixed(byteBuffer, DataBlock_Field.Digest, 32)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.EndPointID = unpackUUID(byteBuffer)
        DataBlock_Field.Digest = unpackFixed(byteBuffer, 32)
    }
}
