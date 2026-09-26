package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * TeleportLandingStatusChanged
 * sim->dataserver
 * Sent from the region to the data server
 * to note that the region's teleportation landing status has changed
 *
 * <p>Template: {@code TeleportLandingStatusChanged Low 147 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class TeleportLandingStatusChanged : SLMessage() {
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
        messageHandler.HandleTeleportLandingStatusChanged(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 147 (TeleportLandingStatusChanged).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x93).toByte())
        packLong(byteBuffer, RegionData_Field.RegionHandle)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RegionData_Field.RegionHandle = unpackLong(byteBuffer)
    }
}
