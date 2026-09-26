package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * System operations and maintenance
 * spaceserver -> sim
 * tell a particular simulator to rename a parcel
 *
 * <p>Template: {@code ParcelRename Low 402 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelRename : SLMessage() {
    @JvmField val ParcelData_Fields = ArrayList<ParcelData>()

    /** Block ParcelData, Variable. */
    open class ParcelData {
        @JvmField var NewName: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 5
        val it = ParcelData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().NewName!!.size + 17 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelRename(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 402 (ParcelRename).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x92).toByte())
        byteBuffer.put((ParcelData_Fields.size.toByte()))
        for (parcelData in ParcelData_Fields) {
            packUUID(byteBuffer, parcelData.ParcelID)
            packVariable(byteBuffer, parcelData.NewName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val parcelData = ParcelData()
            parcelData.ParcelID = unpackUUID(byteBuffer)
            parcelData.NewName = unpackVariable(byteBuffer, 1)
            ParcelData_Fields.add(parcelData)
        }
    }
}
