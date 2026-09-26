package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TransferPacket
 *
 * <p>Template: {@code TransferPacket High 17 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferPacket()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TransferPacket : SLMessage() {
    @JvmField var TransferData_Field: TransferData = TransferData()

    /** Block TransferData, Single. */
    open class TransferData {
        @JvmField var ChannelType: Int = 0
        @JvmField var Data: ByteArray? = null
        @JvmField var Packet: Int = 0
        @JvmField var Status: Int = 0
        @JvmField var TransferID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return TransferData_Field.Data!!.size + 30 + 1
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTransferPacket(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 17 (TransferPacket).
        byteBuffer.put((0x11).toByte())
        packUUID(byteBuffer, TransferData_Field.TransferID)
        packInt(byteBuffer, TransferData_Field.ChannelType)
        packInt(byteBuffer, TransferData_Field.Packet)
        packInt(byteBuffer, TransferData_Field.Status)
        packVariable(byteBuffer, TransferData_Field.Data, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TransferData_Field.TransferID = unpackUUID(byteBuffer)
        TransferData_Field.ChannelType = unpackInt(byteBuffer)
        TransferData_Field.Packet = unpackInt(byteBuffer)
        TransferData_Field.Status = unpackInt(byteBuffer)
        TransferData_Field.Data = unpackVariable(byteBuffer, 2)
    }
}
