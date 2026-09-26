package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * sim -> dataserver
 *
 * <p>Template: {@code CheckParcelAuctions Low 233 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class CheckParcelAuctions : SLMessage() {
    @JvmField val RegionData_Fields = ArrayList<RegionData>()

    /** Block RegionData, Variable. */
    open class RegionData {
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (RegionData_Fields.size * 8) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCheckParcelAuctions(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 233 (CheckParcelAuctions).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xE9).toByte())
        byteBuffer.put((RegionData_Fields.size.toByte()))
        for (entry in RegionData_Fields) {
            packLong(byteBuffer, entry.RegionHandle)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val regionData = RegionData()
            regionData.RegionHandle = unpackLong(byteBuffer)
            RegionData_Fields.add(regionData)
        }
    }
}
