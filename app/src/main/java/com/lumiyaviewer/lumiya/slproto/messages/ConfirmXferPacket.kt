package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * ConfirmXferPacket
 *
 * <p>Template: {@code ConfirmXferPacket High 19 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_confirm_packet()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ConfirmXferPacket : SLMessage() {
    @JvmField var XferID_Field: XferID = XferID()

    /** Block XferID, Single. */
    open class XferID {
        @JvmField var ID: Long = 0L
        @JvmField var Packet: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 13
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleConfirmXferPacket(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 19 (ConfirmXferPacket).
        byteBuffer.put((0x13).toByte())
        packLong(byteBuffer, XferID_Field.ID)
        packInt(byteBuffer, XferID_Field.Packet)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        XferID_Field.ID = unpackLong(byteBuffer)
        XferID_Field.Packet = unpackInt(byteBuffer)
    }
}
