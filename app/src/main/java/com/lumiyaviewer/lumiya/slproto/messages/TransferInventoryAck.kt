package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * dataserver -> sim
 * InventoryID is the id of the inventory object that the end user
 * should discard if they deny the transfer.
 *
 * <p>Template: {@code TransferInventoryAck Low 296 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class TransferInventoryAck : SLMessage() {
    @JvmField var InfoBlock_Field: InfoBlock = InfoBlock()

    /** Block InfoBlock, Single. */
    open class InfoBlock {
        @JvmField var InventoryID: UUID? = null
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTransferInventoryAck(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 296 (TransferInventoryAck).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x28).toByte())
        packUUID(byteBuffer, InfoBlock_Field.TransactionID)
        packUUID(byteBuffer, InfoBlock_Field.InventoryID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        InfoBlock_Field.TransactionID = unpackUUID(byteBuffer)
        InfoBlock_Field.InventoryID = unpackUUID(byteBuffer)
    }
}
