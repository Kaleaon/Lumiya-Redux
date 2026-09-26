package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * DirEventsReply
 *
 * <p>Template: {@code DirEventsReply Low 37 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirEventsReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DirEventsReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()
    @JvmField val QueryReplies_Fields = ArrayList<QueryReplies>()
    @JvmField val StatusData_Fields = ArrayList<StatusData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var QueryID: UUID? = null
    }

    /** Block QueryReplies, Variable. */
    open class QueryReplies {
        @JvmField var Date: ByteArray? = null
        @JvmField var EventFlags: Int = 0
        @JvmField var EventID: Int = 0
        @JvmField var Name: ByteArray? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var UnixTime: Int = 0
    }

    /** Block StatusData, Variable. */
    open class StatusData {
        @JvmField var Status: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 37
        val it = QueryReplies_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2 + 1 + (StatusData_Fields.size * 4)
            }
            val queryReplies = it.next()
            i = queryReplies.Date!!.size + queryReplies.Name!!.size + 17 + 4 + 1 + 4 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirEventsReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 37 (DirEventsReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x25).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        byteBuffer.put((QueryReplies_Fields.size.toByte()))
        for (queryReplies in QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.OwnerID)
            packVariable(byteBuffer, queryReplies.Name, 1)
            packInt(byteBuffer, queryReplies.EventID)
            packVariable(byteBuffer, queryReplies.Date, 1)
            packInt(byteBuffer, queryReplies.UnixTime)
            packInt(byteBuffer, queryReplies.EventFlags)
        }
        byteBuffer.put((StatusData_Fields.size.toByte()))
        for (entry in StatusData_Fields) {
            packInt(byteBuffer, entry.Status)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val queryReplies = QueryReplies()
            queryReplies.OwnerID = unpackUUID(byteBuffer)
            queryReplies.Name = unpackVariable(byteBuffer, 1)
            queryReplies.EventID = unpackInt(byteBuffer)
            queryReplies.Date = unpackVariable(byteBuffer, 1)
            queryReplies.UnixTime = unpackInt(byteBuffer)
            queryReplies.EventFlags = unpackInt(byteBuffer)
            QueryReplies_Fields.add(queryReplies)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val statusData = StatusData()
            statusData.Status = unpackInt(byteBuffer)
            StatusData_Fields.add(statusData)
        }
    }
}
