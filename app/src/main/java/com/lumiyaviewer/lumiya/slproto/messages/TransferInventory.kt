package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * sim -> dataserver
 * sent during agent to agent inventory transfers
 *
 * <p>Template: {@code TransferInventory Low 295 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class TransferInventory : SLMessage() {
    @JvmField var InfoBlock_Field: InfoBlock = InfoBlock()
    @JvmField val InventoryBlock_Fields = ArrayList<InventoryBlock>()

    /** Block InfoBlock, Single. */
    open class InfoBlock {
        @JvmField var DestID: UUID? = null
        @JvmField var SourceID: UUID? = null
        @JvmField var TransactionID: UUID? = null
    }

    /** Block InventoryBlock, Variable. */
    open class InventoryBlock {
        @JvmField var InventoryID: UUID? = null
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (InventoryBlock_Fields.size * 17) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTransferInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 295 (TransferInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x27).toByte())
        packUUID(byteBuffer, InfoBlock_Field.SourceID)
        packUUID(byteBuffer, InfoBlock_Field.DestID)
        packUUID(byteBuffer, InfoBlock_Field.TransactionID)
        byteBuffer.put((InventoryBlock_Fields.size.toByte()))
        for (inventoryBlock in InventoryBlock_Fields) {
            packUUID(byteBuffer, inventoryBlock.InventoryID)
            packByte(byteBuffer, (inventoryBlock.Type).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        InfoBlock_Field.SourceID = unpackUUID(byteBuffer)
        InfoBlock_Field.DestID = unpackUUID(byteBuffer)
        InfoBlock_Field.TransactionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val inventoryBlock = InventoryBlock()
            inventoryBlock.InventoryID = unpackUUID(byteBuffer)
            inventoryBlock.Type = unpackByte(byteBuffer).toInt()
            InventoryBlock_Fields.add(inventoryBlock)
        }
    }
}
