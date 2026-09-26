package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * sim -> dataserver
 * This message is used to check if a user can buy a parcel. If
 * successful, the transaction is approved through a money balance reply
 * with the same transaction id.
 *
 * <p>Template: {@code RequestParcelTransfer Low 220 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RequestParcelTransfer : SLMessage() {
    @JvmField var Data_Field: Data = Data()
    @JvmField var RegionData_Field: RegionData = RegionData()

    /** Block Data, Single. */
    open class Data {
        @JvmField var ActualArea: Int = 0
        @JvmField var Amount: Int = 0
        @JvmField var BillableArea: Int = 0
        @JvmField var DestID: UUID? = null
        @JvmField var Final: Boolean = false
        @JvmField var Flags: Int = 0
        @JvmField var OwnerID: UUID? = null
        @JvmField var SourceID: UUID? = null
        @JvmField var TransactionID: UUID? = null
        @JvmField var TransactionTime: Int = 0
        @JvmField var TransactionType: Int = 0
    }

    /** Block RegionData, Single. */
    open class RegionData {
        @JvmField var GridX: Int = 0
        @JvmField var GridY: Int = 0
        @JvmField var RegionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 114
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRequestParcelTransfer(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 220 (RequestParcelTransfer).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xDC).toByte())
        packUUID(byteBuffer, Data_Field.TransactionID)
        packInt(byteBuffer, Data_Field.TransactionTime)
        packUUID(byteBuffer, Data_Field.SourceID)
        packUUID(byteBuffer, Data_Field.DestID)
        packUUID(byteBuffer, Data_Field.OwnerID)
        packByte(byteBuffer, (Data_Field.Flags).toByte())
        packInt(byteBuffer, Data_Field.TransactionType)
        packInt(byteBuffer, Data_Field.Amount)
        packInt(byteBuffer, Data_Field.BillableArea)
        packInt(byteBuffer, Data_Field.ActualArea)
        packBoolean(byteBuffer, Data_Field.Final)
        packUUID(byteBuffer, RegionData_Field.RegionID)
        packInt(byteBuffer, RegionData_Field.GridX)
        packInt(byteBuffer, RegionData_Field.GridY)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.TransactionID = unpackUUID(byteBuffer)
        Data_Field.TransactionTime = unpackInt(byteBuffer)
        Data_Field.SourceID = unpackUUID(byteBuffer)
        Data_Field.DestID = unpackUUID(byteBuffer)
        Data_Field.OwnerID = unpackUUID(byteBuffer)
        Data_Field.Flags = unpackByte(byteBuffer).toInt() and 0xFF
        Data_Field.TransactionType = unpackInt(byteBuffer)
        Data_Field.Amount = unpackInt(byteBuffer)
        Data_Field.BillableArea = unpackInt(byteBuffer)
        Data_Field.ActualArea = unpackInt(byteBuffer)
        Data_Field.Final = unpackBoolean(byteBuffer)
        RegionData_Field.RegionID = unpackUUID(byteBuffer)
        RegionData_Field.GridX = unpackInt(byteBuffer)
        RegionData_Field.GridY = unpackInt(byteBuffer)
    }
}
