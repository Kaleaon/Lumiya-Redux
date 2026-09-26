package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * New Transfer system
 * Request a new transfer (target->source)
 *
 * <p>Template: {@code TransferRequest Low 153 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferRequest()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TransferRequest : SLMessage() {
    @JvmField var TransferInfo_Field: TransferInfo = TransferInfo()

    /** Block TransferInfo, Single. */
    open class TransferInfo {
        @JvmField var ChannelType: Int = 0
        @JvmField var Params: ByteArray? = null
        @JvmField var Priority: Float = 0f
        @JvmField var SourceType: Int = 0
        @JvmField var TransferID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return TransferInfo_Field.Params!!.size + 30 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTransferRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 153 (TransferRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x99).toByte())
        packUUID(byteBuffer, TransferInfo_Field.TransferID)
        packInt(byteBuffer, TransferInfo_Field.ChannelType)
        packInt(byteBuffer, TransferInfo_Field.SourceType)
        packFloat(byteBuffer, TransferInfo_Field.Priority)
        packVariable(byteBuffer, TransferInfo_Field.Params, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TransferInfo_Field.TransferID = unpackUUID(byteBuffer)
        TransferInfo_Field.ChannelType = unpackInt(byteBuffer)
        TransferInfo_Field.SourceType = unpackInt(byteBuffer)
        TransferInfo_Field.Priority = unpackFloat(byteBuffer)
        TransferInfo_Field.Params = unpackVariable(byteBuffer, 2)
    }
}
