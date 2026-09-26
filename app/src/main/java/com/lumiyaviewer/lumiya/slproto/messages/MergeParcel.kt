package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * sim -> dataserver
 * Merges some of the database information for parcels (dwell).
 *
 * <p>Template: {@code MergeParcel Low 223 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class MergeParcel : SLMessage() {
    @JvmField var MasterParcelData_Field: MasterParcelData = MasterParcelData()
    @JvmField val SlaveParcelData_Fields = ArrayList<SlaveParcelData>()

    /** Block MasterParcelData, Single. */
    open class MasterParcelData {
        @JvmField var MasterID: UUID? = null
    }

    /** Block SlaveParcelData, Variable. */
    open class SlaveParcelData {
        @JvmField var SlaveID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (SlaveParcelData_Fields.size * 16) + 21
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMergeParcel(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 223 (MergeParcel).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xDF).toByte())
        packUUID(byteBuffer, MasterParcelData_Field.MasterID)
        byteBuffer.put((SlaveParcelData_Fields.size.toByte()))
        for (entry in SlaveParcelData_Fields) {
            packUUID(byteBuffer, entry.SlaveID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        MasterParcelData_Field.MasterID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val slaveParcelData = SlaveParcelData()
            slaveParcelData.SlaveID = unpackUUID(byteBuffer)
            SlaveParcelData_Fields.add(slaveParcelData)
        }
    }
}
