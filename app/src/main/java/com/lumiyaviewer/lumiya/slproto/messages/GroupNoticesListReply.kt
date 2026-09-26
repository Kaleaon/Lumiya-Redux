package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupNoticesListReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupNoticesListReply Low 59 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelGroupNotices::processGroupNoticesListReply()} in indra/newview/llpanelgroupnotices.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupNoticesListReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Data_Fields = ArrayList<Data>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
    }

    /** Block Data, Variable. */
    open class Data {
        @JvmField var AssetType: Int = 0
        @JvmField var FromName: ByteArray? = null
        @JvmField var HasAttachment: Boolean = false
        @JvmField var NoticeID: UUID? = null
        @JvmField var Subject: ByteArray? = null
        @JvmField var Timestamp: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 37
        val it = Data_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val data = it.next()
            i = data.Subject!!.size + data.FromName!!.size + 22 + 2 + 1 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupNoticesListReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 59 (GroupNoticesListReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x3B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packUUID(byteBuffer, data.NoticeID)
            packInt(byteBuffer, data.Timestamp)
            packVariable(byteBuffer, data.FromName, 2)
            packVariable(byteBuffer, data.Subject, 2)
            packBoolean(byteBuffer, data.HasAttachment)
            packByte(byteBuffer, (data.AssetType).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.NoticeID = unpackUUID(byteBuffer)
            data.Timestamp = unpackInt(byteBuffer)
            data.FromName = unpackVariable(byteBuffer, 2)
            data.Subject = unpackVariable(byteBuffer, 2)
            data.HasAttachment = unpackBoolean(byteBuffer)
            data.AssetType = unpackByte(byteBuffer).toInt() and 0xFF
            Data_Fields.add(data)
        }
    }
}
