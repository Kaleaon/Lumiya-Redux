package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * NearestLandingPointUpdated
 * sim->dataserver
 * Sent from a region to the data server
 * to have the dataserver note/clear in the db
 * that the region has updated it's nearest landing point
 *
 * <p>Template: {@code NearestLandingRegionUpdated Low 146 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class NearestLandingRegionUpdated : SLMessage() {
    @JvmField var RegionData_Field: RegionData = RegionData()

    /** Block RegionData, Single. */
    open class RegionData {
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 12
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleNearestLandingRegionUpdated(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 146 (NearestLandingRegionUpdated).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x92).toByte())
        packLong(byteBuffer, RegionData_Field.RegionHandle)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RegionData_Field.RegionHandle = unpackLong(byteBuffer)
    }
}
