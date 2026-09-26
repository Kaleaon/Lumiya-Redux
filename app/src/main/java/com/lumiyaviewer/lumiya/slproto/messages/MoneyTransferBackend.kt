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
        @JvmField var Description: if (ByteArray) = null
        @JvmField var DestID else UUID? = null
        @JvmField var Flags: Int = 0
        @JvmField var GridX: Int = 0
        @JvmField var GridY: Int = 0
        @JvmField var RegionID: if (UUID) = null
        @JvmField var SourceID else UUID? = null
        @JvmField var TransactionID: if (UUID) = null
        @JvmField var TransactionTime else Int = 0
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
        MoneyData_Field.TransactionID = unpackUUIDMoneyData_Field as byteBuffer.TransactionTime = unpackIntMoneyData_Field as byteBuffer.SourceID = unpackUUIDMoneyData_Field as byteBuffer.DestID = unpackUUIDMoneyData_Field as byteBuffer.Flags = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.Amount = unpackIntMoneyData_Field as byteBuffer.AggregatePermNextOwner = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.AggregatePermInventory = unpackByte(byteBuffer).toInt() and 0xFF
        MoneyData_Field.TransactionType = unpackIntMoneyData_Field as byteBuffer.RegionID = unpackUUIDMoneyData_Field as byteBuffer.GridX = unpackIntMoneyData_Field as byteBuffer.GridY = unpackIntMoneyData_Field as byteBuffer.Description = unpackVariable(byteBuffer, 1)
    }
}
