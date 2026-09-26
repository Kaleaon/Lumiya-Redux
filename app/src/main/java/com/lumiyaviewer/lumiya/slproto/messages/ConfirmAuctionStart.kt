package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * dataserver -> sim
 *
 * <p>Template: {@code ConfirmAuctionStart Low 230 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ConfirmAuctionStart : SLMessage() {
    @JvmField var AuctionData_Field: AuctionData = AuctionData()

    /** Block AuctionData, Single. */
    open class AuctionData {
        @JvmField var AuctionID: Int = 0
        @JvmField var ParcelID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 24
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleConfirmAuctionStart(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 230 (ConfirmAuctionStart).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xE6).toByte())
        packUUID(byteBuffer, AuctionData_Field.ParcelID)
        packInt(byteBuffer, AuctionData_Field.AuctionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AuctionData_Field.ParcelID = unpackUUID(byteBuffer)
        AuctionData_Field.AuctionID = unpackInt(byteBuffer)
    }
}
