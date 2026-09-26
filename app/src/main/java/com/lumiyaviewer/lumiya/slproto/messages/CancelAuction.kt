package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Tell the dataserver that an auction has been canceled.
 *
 * <p>Template: {@code CancelAuction Low 232 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class CancelAuction : SLMessage() {
    @JvmField val ParcelData_Fields = ArrayList<ParcelData>()

    /** Block ParcelData, Variable. */
    open class ParcelData {
        @JvmField var ParcelID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ParcelData_Fields.size * 16) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCancelAuction(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 232 (CancelAuction).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xE8).toByte())
        byteBuffer.put((ParcelData_Fields.size.toByte()))
        for (entry in ParcelData_Fields) {
            packUUID(byteBuffer, entry.ParcelID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val parcelData = ParcelData()
            parcelData.ParcelID = unpackUUID(byteBuffer)
            ParcelData_Fields.add(parcelData)
        }
    }
}
