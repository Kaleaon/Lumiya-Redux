package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * SendXferPacket - send an additional packet of an arbitrary xfer from sim -> viewer
 *
 * <p>Template: {@code SendXferPacket High 18 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code continue_file_receive()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class SendXferPacket : SLMessage() {
    @JvmField var DataPacket_Field: DataPacket = DataPacket()
    @JvmField var XferID_Field: XferID = XferID()

    /** Block DataPacket, Single. */
    open class DataPacket {
        @JvmField var Data: ByteArray? = null
    }

    /** Block XferID, Single. */
    open class XferID {
        @JvmField var ID: Long = 0L
        @JvmField var Packet: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataPacket_Field.Data!!.size + 2 + 13
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSendXferPacket(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 18 (SendXferPacket).
        byteBuffer.put((0x12).toByte())
        packLong(byteBuffer, XferID_Field.ID)
        packInt(byteBuffer, XferID_Field.Packet)
        packVariable(byteBuffer, DataPacket_Field.Data, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        XferID_Field.ID = unpackLong(byteBuffer)
        XferID_Field.Packet = unpackInt(byteBuffer)
        DataPacket_Field.Data = unpackVariable(byteBuffer, 2)
    }
}
