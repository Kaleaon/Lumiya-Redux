package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RegionIDAndHandleReply
 *
 * <p>Template: {@code RegionIDAndHandleReply Low 310 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RegionIDAndHandleReply : SLMessage() {
    @JvmField var ReplyBlock_Field: ReplyBlock = ReplyBlock()

    /** Block ReplyBlock, Single. */
    open class ReplyBlock {
        @JvmField var RegionHandle: Long = 0L
        @JvmField var RegionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 28
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRegionIDAndHandleReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 310 (RegionIDAndHandleReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x36).toByte())
        packUUID(byteBuffer, ReplyBlock_Field.RegionID)
        packLong(byteBuffer, ReplyBlock_Field.RegionHandle)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ReplyBlock_Field.RegionID = unpackUUID(byteBuffer)
        ReplyBlock_Field.RegionHandle = unpackLong(byteBuffer)
    }
}
