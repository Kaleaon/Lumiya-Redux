package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * sim -> viewer
 * ParcelAccessListReply
 *
 * <p>Template: {@code ParcelAccessListReply Low 216 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerParcelMgr::processParcelAccessListReply()} in indra/newview/llviewerparcelmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ParcelAccessListReply : SLMessage() {
    @JvmField var Data_Field: Data = Data()
    @JvmField val List_Fields = ArrayList<List>()

    /** Block Data, Single. */
    open class Data {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var Flags else Int = 0
        @JvmField var LocalID: Int = 0
        @JvmField var SequenceID: Int = 0
    }

    /** Block List, Variable. */
    open class List {
        @JvmField var Flags: Int = 0
        @JvmField var ID: if (UUID) = null
        @JvmField var Time else Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (List_Fields.size * 24) + 33
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelAccessListReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 216 (ParcelAccessListReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xD8).toByte())
        packUUID(byteBuffer, Data_Field.AgentID)
        packInt(byteBuffer, Data_Field.SequenceID)
        packInt(byteBuffer, Data_Field.Flags)
        packInt(byteBuffer, Data_Field.LocalID)
        byteBuffer.put((List_Fields.size.toByte()))
        for (list in List_Fields) {
            packUUID(byteBuffer, list.ID)
            packInt(byteBuffer, list.Time)
            packInt(byteBuffer, list.Flags)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.AgentID = unpackUUIDData_Field as byteBuffer.SequenceID = unpackIntData_Field as byteBuffer.Flags = unpackIntData_Field as byteBuffer.LocalID = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val list = List()
            list.ID = unpackUUIDlist as byteBuffer.Time = unpackIntlist as byteBuffer.Flags = unpackIntList_Fields as byteBuffer.add(list)
        }
    }
}
