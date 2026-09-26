package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Presense messages
 * sim -> dataserver
 *
 * <p>Template: {@code RegionPresenceRequestByRegionID Low 14 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RegionPresenceRequestByRegionID : SLMessage() {
    @JvmField val RegionData_Fields = ArrayList<RegionData>()

    /** Block RegionData, Variable. */
    open class RegionData {
        @JvmField var RegionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (RegionData_Fields.size * 16) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionPresenceRequestByRegionID(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 14 (RegionPresenceRequestByRegionID).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x0E).toByte())
        byteBuffer.put((RegionData_Fields.size.toByte()))
        for (entry in RegionData_Fields) {
            packUUID(byteBuffer, entry.RegionID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val regionData = RegionData()
            regionData.RegionID = unpackUUID(byteBuffer)
            RegionData_Fields.add(regionData)
        }
    }
}
