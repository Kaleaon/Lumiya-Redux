package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * sim -> viewer
 *
 * <p>Template: {@code MapItemReply Low 411 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLWorldMapMessage::processMapItemReply()} in indra/newview/llworldmapmessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class MapItemReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Data_Fields = ArrayList<Data>()
    @JvmField var RequestData_Field: RequestData = RequestData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var Flags: Int = 0
    }

    /** Block Data, Variable. */
    open class Data {
        @JvmField var Extra: Int = 0
        @JvmField var Extra2: Int = 0
        @JvmField var ID: UUID? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var X: Int = 0
        @JvmField var Y: Int = 0
    }

    /** Block RequestData, Single. */
    open class RequestData {
        @JvmField var ItemType: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 29
        val it = Data_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().Name!!.size + 33 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMapItemReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 411 (MapItemReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x9B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packInt(byteBuffer, AgentData_Field.Flags)
        packInt(byteBuffer, RequestData_Field.ItemType)
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packInt(byteBuffer, data.X)
            packInt(byteBuffer, data.Y)
            packUUID(byteBuffer, data.ID)
            packInt(byteBuffer, data.Extra)
            packInt(byteBuffer, data.Extra2)
            packVariable(byteBuffer, data.Name, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.Flags = unpackInt(byteBuffer)
        RequestData_Field.ItemType = unpackInt(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.X = unpackInt(byteBuffer)
            data.Y = unpackInt(byteBuffer)
            data.ID = unpackUUID(byteBuffer)
            data.Extra = unpackInt(byteBuffer)
            data.Extra2 = unpackInt(byteBuffer)
            data.Name = unpackVariable(byteBuffer, 1)
            Data_Fields.add(data)
        }
    }
}
