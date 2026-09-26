package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * get information about landmarks. Used by viewers for determining
 * the location of a landmark, and by simulators for teleport
 *
 * <p>Template: {@code RegionHandleRequest Low 309 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RegionHandleRequest : SLMessage() {
    @JvmField var RequestBlock_Field: RequestBlock = RequestBlock()

    /** Block RequestBlock, Single. */
    open class RequestBlock {
        @JvmField var RegionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionHandleRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 309 (RegionHandleRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x35).toByte())
        packUUID(byteBuffer, RequestBlock_Field.RegionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RequestBlock_Field.RegionID = unpackUUID(byteBuffer)
    }
}
