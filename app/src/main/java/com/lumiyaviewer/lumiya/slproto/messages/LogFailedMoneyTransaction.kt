package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

/**
 * record lost money transactions.  This message could be generated
 * from either the simulator or the dataserver, depending on how
 * the transaction failed.
 *
 * <p>Template: {@code LogFailedMoneyTransaction Low 20 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class LogFailedMoneyTransaction : SLMessage() {
    @JvmField var TransactionData_Field: TransactionData = TransactionData()

    /** Block TransactionData, Single. */
    open class TransactionData {
        @JvmField var Amount: Int = 0
        @JvmField var DestID: UUID? = null
        @JvmField var FailureType: Int = 0
        @JvmField var Flags: Int = 0
        @JvmField var GridX: Int = 0
        @JvmField var GridY: Int = 0
        @JvmField var SimulatorIP: Inet4Address? = null
        @JvmField var SourceID: UUID? = null
        @JvmField var TransactionID: UUID? = null
        @JvmField var TransactionTime: Int = 0
        @JvmField var TransactionType: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 78
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLogFailedMoneyTransaction(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 20 (LogFailedMoneyTransaction).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x14).toByte())
        packUUID(byteBuffer, TransactionData_Field.TransactionID)
        packInt(byteBuffer, TransactionData_Field.TransactionTime)
        packInt(byteBuffer, TransactionData_Field.TransactionType)
        packUUID(byteBuffer, TransactionData_Field.SourceID)
        packUUID(byteBuffer, TransactionData_Field.DestID)
        packByte(byteBuffer, (TransactionData_Field.Flags).toByte())
        packInt(byteBuffer, TransactionData_Field.Amount)
        packIPAddress(byteBuffer, TransactionData_Field.SimulatorIP)
        packInt(byteBuffer, TransactionData_Field.GridX)
        packInt(byteBuffer, TransactionData_Field.GridY)
        packByte(byteBuffer, (TransactionData_Field.FailureType).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TransactionData_Field.TransactionID = unpackUUID(byteBuffer)
        TransactionData_Field.TransactionTime = unpackInt(byteBuffer)
        TransactionData_Field.TransactionType = unpackInt(byteBuffer)
        TransactionData_Field.SourceID = unpackUUID(byteBuffer)
        TransactionData_Field.DestID = unpackUUID(byteBuffer)
        TransactionData_Field.Flags = unpackByte(byteBuffer).toInt() and 0xFF
        TransactionData_Field.Amount = unpackInt(byteBuffer)
        TransactionData_Field.SimulatorIP = unpackIPAddress(byteBuffer)
        TransactionData_Field.GridX = unpackInt(byteBuffer)
        TransactionData_Field.GridY = unpackInt(byteBuffer)
        TransactionData_Field.FailureType = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
