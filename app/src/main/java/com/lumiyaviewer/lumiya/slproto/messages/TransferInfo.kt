package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Return info about a transfer/initiate transfer (source->target)
 * Possibly should have a Params field like above
 *
 * <p>Template: {@code TransferInfo Low 154 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferInfo()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TransferInfo : SLMessage() {
    @JvmField var TransferInfoData_Field: TransferInfoData = TransferInfoData()

    open class TransferInfoData {
        @JvmField var ChannelType: Int = 0
        @JvmField var Params: ByteArray? = null
        @JvmField var Size: Int = 0
        @JvmField var Status: Int = 0
        @JvmField var TargetType: Int = 0
        @JvmField var TransferID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return TransferInfoData_Field.Params!!.size + 34 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTransferInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 154 (TransferInfo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x9A).toByte())
        packUUID(byteBuffer, TransferInfoData_Field.TransferID)
        packInt(byteBuffer, TransferInfoData_Field.ChannelType)
        packInt(byteBuffer, TransferInfoData_Field.TargetType)
        packInt(byteBuffer, TransferInfoData_Field.Status)
        packInt(byteBuffer, TransferInfoData_Field.Size)
        packVariable(byteBuffer, TransferInfoData_Field.Params, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TransferInfoData_Field.TransferID = unpackUUID(byteBuffer)
        TransferInfoData_Field.ChannelType = unpackInt(byteBuffer)
        TransferInfoData_Field.TargetType = unpackInt(byteBuffer)
        TransferInfoData_Field.Status = unpackInt(byteBuffer)
        TransferInfoData_Field.Size = unpackInt(byteBuffer)
        TransferInfoData_Field.Params = unpackVariable(byteBuffer, 2)
    }
}
