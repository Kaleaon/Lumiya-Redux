package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * NearestLandingPointReply
 * dataserver->sim
 * Sent from the data server to a region in reply
 * to the redirectregion request stating which region
 * the requesting region should redirect teleports to if necessary
 *
 * <p>Template: {@code NearestLandingRegionReply Low 145 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class NearestLandingRegionReply : SLMessage() {
    @JvmField var LandingRegionData_Field: LandingRegionData = LandingRegionData()

    /** Block LandingRegionData, Single. */
    open class LandingRegionData {
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 12
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleNearestLandingRegionReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 145 (NearestLandingRegionReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x91).toByte())
        packLong(byteBuffer, LandingRegionData_Field.RegionHandle)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        LandingRegionData_Field.RegionHandle = unpackLong(byteBuffer)
    }
}
