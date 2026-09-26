package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ParcelObjectOwnersReply
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelObjectOwnersReply Low 57 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelLandObjects::processParcelObjectOwnersReply()} in indra/newview/llfloaterland.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelObjectOwnersReply : SLMessage() {
    @JvmField val Data_Fields = ArrayList<Data>()

    /** Block Data, Variable. */
    open class Data {
        @JvmField var Count: Int = 0
        @JvmField var IsGroupOwned: Boolean = false
        @JvmField var OnlineStatus: Boolean = false
        @JvmField var OwnerID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (Data_Fields.size * 22) + 5
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelObjectOwnersReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 57 (ParcelObjectOwnersReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x39).toByte())
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packUUID(byteBuffer, data.OwnerID)
            packBoolean(byteBuffer, data.IsGroupOwned)
            packInt(byteBuffer, data.Count)
            packBoolean(byteBuffer, data.OnlineStatus)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.OwnerID = unpackUUID(byteBuffer)
            data.IsGroupOwned = unpackBoolean(byteBuffer)
            data.Count = unpackInt(byteBuffer)
            data.OnlineStatus = unpackBoolean(byteBuffer)
            Data_Fields.add(data)
        }
    }
}
