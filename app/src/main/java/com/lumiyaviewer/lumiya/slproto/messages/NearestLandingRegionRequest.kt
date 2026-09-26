package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * NearestLandingRegionRequest
 * sim->dataserver
 * Sent from the region to the data server
 * to request the most up to date region for the requesting
 * region to redirect teleports to
 *
 * <p>Template: {@code NearestLandingRegionRequest Low 144 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class NearestLandingRegionRequest : SLMessage() {
    @JvmField var RequestingRegionData_Field: RequestingRegionData = RequestingRegionData()

    /** Block RequestingRegionData, Single. */
    open class RequestingRegionData {
        @JvmField var RegionHandle: Long = 0L
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 12
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleNearestLandingRegionRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 144 (NearestLandingRegionRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x90).toByte())
        packLong(byteBuffer, RequestingRegionData_Field.RegionHandle)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RequestingRegionData_Field.RegionHandle = unpackLong(byteBuffer)
    }
}
