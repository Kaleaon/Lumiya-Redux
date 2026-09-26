package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * dataserver -> sim
 * tell a particular simulator to finish parcel sale.
 *
 * <p>Template: {@code ParcelAuctions Low 234 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelAuctions : SLMessage() {
    @JvmField val ParcelData_Fields = ArrayList<ParcelData>()

    /** Block ParcelData, Variable. */
    open class ParcelData {
        @JvmField var ParcelID: UUID? = null
        @JvmField var WinnerID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ParcelData_Fields.size * 32) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelAuctions(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 234 (ParcelAuctions).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xEA).toByte())
        byteBuffer.put((ParcelData_Fields.size.toByte()))
        for (parcelData in ParcelData_Fields) {
            packUUID(byteBuffer, parcelData.ParcelID)
            packUUID(byteBuffer, parcelData.WinnerID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val parcelData = ParcelData()
            parcelData.ParcelID = unpackUUID(byteBuffer)
            parcelData.WinnerID = unpackUUID(byteBuffer)
            ParcelData_Fields.add(parcelData)
        }
    }
}
