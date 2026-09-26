package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * dataserver -> sim
 *
 * <p>Template: {@code RegionPresenceResponse Low 16 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class RegionPresenceResponse : SLMessage() {
    @JvmField val RegionData_Fields = ArrayList<RegionData>()

    /** Block RegionData, Variable. */
    open class RegionData {
        @JvmField var ExternalRegionIP: Inet4Address? = null
        @JvmField var InternalRegionIP: Inet4Address? = null
        @JvmField var Message: ByteArray? = null
        @JvmField var RegionHandle: Long = 0L
        @JvmField var RegionID: UUID? = null
        @JvmField var RegionPort: Int = 0
        @JvmField var ValidUntil: Double = 0.0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 5
        val it = RegionData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().Message!!.size + 43 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionPresenceResponse(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 16 (RegionPresenceResponse).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x10).toByte())
        byteBuffer.put((RegionData_Fields.size.toByte()))
        for (regionData in RegionData_Fields) {
            packUUID(byteBuffer, regionData.RegionID)
            packLong(byteBuffer, regionData.RegionHandle)
            packIPAddress(byteBuffer, regionData.InternalRegionIP)
            packIPAddress(byteBuffer, regionData.ExternalRegionIP)
            packShort(byteBuffer, regionData.RegionPort.toShort())
            packDouble(byteBuffer, regionData.ValidUntil)
            packVariable(byteBuffer, regionData.Message, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val regionData = RegionData()
            regionData.RegionID = unpackUUID(byteBuffer)
            regionData.RegionHandle = unpackLong(byteBuffer)
            regionData.InternalRegionIP = unpackIPAddress(byteBuffer)
            regionData.ExternalRegionIP = unpackIPAddress(byteBuffer)
            regionData.RegionPort = unpackShort(byteBuffer).toInt() and 65535
            regionData.ValidUntil = unpackDouble(byteBuffer)
            regionData.Message = unpackVariable(byteBuffer, 1)
            RegionData_Fields.add(regionData)
        }
    }
}
