package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * And, the money transfer
 * *NOTE: Unused as of 2010-04-06, because all back-end money transactions
 * are done with web services via L$ API.  JC
 *
 * <p>Template: {@code MoneyTransferBackend Low 312 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class MoneyTransferBackend : SLMessage() {
    @JvmField var MoneyData_Field: MoneyData = MoneyData()

    /** Block MoneyData, Single. */
    open class MoneyData {
        @JvmField var AggregatePermInventory: Int = 0
        @JvmField var AggregatePermNextOwner: Int = 0
        @JvmField var Amount: Int = 0
        @JvmField var Description: ByteArray? = null
        @JvmField var DestID: UUID? = null
        @JvmField var Flags: Int = 0
        @JvmField var GridX: Int = 0
        @JvmField var GridY: Int = 0
        @JvmField var RegionID: UUID? = null
        @JvmField var SourceID: UUID? = null
        @JvmField var TransactionID: UUID? = null
        @JvmField var TransactionTime: Int = 0
        @JvmField var TransactionType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return MoneyData_Field.Description!!.size + 88 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMoneyTransferBackend(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 312 (MoneyTransferBackend).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x38).toByte())
        packUUID(byteBuffer, MoneyData_Field.TransactionID)
        packInt(byteBuffer, MoneyData_Field.TransactionTime)
        packUUID(byteBuffer, MoneyData_Field.SourceID)
        packUUID(byteBuffer, MoneyData_Field.DestID)
        packByte(byteBuffer, (MoneyData_Field.Flags).toByte())
        packInt(byteBuffer, MoneyData_Field.Amount)
        packByte(byteBuffer, (MoneyData_Field.AggregatePermNextOwner).toByte())
        packByte(byteBuffer, (MoneyData_Field.AggregatePermInventory).toByte())
        packInt(byteBuffer, MoneyData_Field.TransactionType)
        packUUID(byteBuffer, MoneyData_Field.RegionID)
        packInt(byteBuffer, MoneyData_Field.GridX)
        packInt(byteBuffer, MoneyData_Field.GridY)
        packVariable(byteBuffer, MoneyData_Field.Description, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        MoneyData_Field.TransactionID = unpackUUID(byteBuffer)
        MoneyData_Field.TransactionTime = unpackInt(byteBuffer)
        MoneyData_Field.SourceID = unpackUUID(byteBuffer)
        MoneyData_Field.DestID = unpackUUID(byteBuffer)
        MoneyData_Field.Flags = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.Amount = unpackInt(byteBuffer)
        MoneyData_Field.AggregatePermNextOwner = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.AggregatePermInventory = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.TransactionType = unpackInt(byteBuffer)
        MoneyData_Field.RegionID = unpackUUID(byteBuffer)
        MoneyData_Field.GridX = unpackInt(byteBuffer)
        MoneyData_Field.GridY = unpackInt(byteBuffer)
        MoneyData_Field.Description = unpackVariable(byteBuffer, 1)
    }
}
