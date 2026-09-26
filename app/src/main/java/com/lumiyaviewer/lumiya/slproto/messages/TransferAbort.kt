package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Abort a transfer in progress (either from target->source or source->target)
 *
 * <p>Template: {@code TransferAbort Low 155 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferAbort()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TransferAbort : SLMessage() {
    @JvmField var TransferInfo_Field: TransferInfo = TransferInfo()

    /** Block TransferInfo, Single. */
    open class TransferInfo {
        @JvmField var ChannelType: Int = 0
        @JvmField var TransferID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 24
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTransferAbort(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 155 (TransferAbort).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x9B).toByte())
        packUUID(byteBuffer, TransferInfo_Field.TransferID)
        packInt(byteBuffer, TransferInfo_Field.ChannelType)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TransferInfo_Field.TransferID = unpackUUID(byteBuffer)
        TransferInfo_Field.ChannelType = unpackInt(byteBuffer)
    }
}
