package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * This message is sent when a derez succeeds, but there's no way to
 * know, since no inventory is created on the viewer. For example, when
 * saving into task inventory.
 *
 * <p>Template: {@code DeRezAck Low 292 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_derez_ack()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DeRezAck : SLMessage() {
    @JvmField var TransactionData_Field: TransactionData = TransactionData()

    /** Block TransactionData, Single. */
    open class TransactionData {
        @JvmField var Success: Boolean = false
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 21
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDeRezAck(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 292 (DeRezAck).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x24).toByte())
        packUUID(byteBuffer, TransactionData_Field.TransactionID)
        packBoolean(byteBuffer, TransactionData_Field.Success)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TransactionData_Field.TransactionID = unpackUUID(byteBuffer)
        TransactionData_Field.Success = unpackBoolean(byteBuffer)
    }
}
