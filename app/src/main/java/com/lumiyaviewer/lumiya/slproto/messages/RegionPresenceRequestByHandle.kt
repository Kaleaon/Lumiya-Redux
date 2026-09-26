package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * sim -> dataserver
 *
 * <p>Template: {@code RegionPresenceRequestByHandle Low 15 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RegionPresenceRequestByHandle : SLMessage() {
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
        messageHandler.HandleRegionPresenceRequestByHandle(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 15 (RegionPresenceRequestByHandle).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x0F).toByte())
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
