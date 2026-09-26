package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * ForceObjectSelect
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code ForceObjectSelect Low 205 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLSelectMgr::processForceObjectSelect()} in indra/newview/llselectmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ForceObjectSelect : SLMessage() {
    @JvmField val Data_Fields = ArrayList<Data>()
    @JvmField var Header_Field: Header = Header()

    /** Block Data, Variable. */
    open class Data {
        @JvmField var LocalID: Int = 0
    }

    /** Block Header, Single. */
    open class Header {
        @JvmField var ResetList: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Data_Fields.size * 4) + 6
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleForceObjectSelect(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 205 (ForceObjectSelect).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xCD).toByte())
        packBoolean(byteBuffer, Header_Field.ResetList)
        byteBuffer.put((Data_Fields.size.toByte()))
        for (entry in Data_Fields) {
            packInt(byteBuffer, entry.LocalID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Header_Field.ResetList = unpackBoolean(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.LocalID = unpackInt(byteBuffer)
            Data_Fields.add(data)
        }
    }
}
