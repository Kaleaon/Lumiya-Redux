package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * DirPlacesReply dataserver->sim->viewer
 * If the user has specified a location, use that to compute
 * global x,y,z.  Otherwise, use center of the AABB.
 * reliable
 *
 * <p>Template: {@code DirPlacesReply Low 35 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirPlacesReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DirPlacesReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val QueryData_Fields = ArrayList<QueryData>()
    @JvmField val QueryReplies_Fields = ArrayList<QueryReplies>()
    @JvmField val StatusData_Fields = ArrayList<StatusData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block QueryData, Variable. */
    open class QueryData {
        @JvmField var QueryID: UUID? = null
    }

    /** Block QueryReplies, Variable. */
    open class QueryReplies {
        @JvmField var Auction: Boolean = false
        @JvmField var Dwell: Float = 0f
        @JvmField var ForSale: Boolean = false
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
    }

    /** Block StatusData, Variable. */
    open class StatusData {
        @JvmField var Status: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var size = (QueryData_Fields.size * 16) + 21 + 1
        val it = QueryReplies_Fields.iterator()
        while (true) {
            val size2 = size
            if (!it.hasNext()) {
                return size2 + 1 + (StatusData_Fields.size * 4)
            }
            size = it.next().Name!!.size + 17 + 1 + 1 + 4 + size2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirPlacesReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 35 (DirPlacesReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x23).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        byteBuffer.put((QueryData_Fields.size.toByte()))
        for (entry in QueryData_Fields) {
            packUUID(byteBuffer, entry.QueryID)
        }
        byteBuffer.put((QueryReplies_Fields.size.toByte()))
        for (queryReplies in QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.ParcelID)
            packVariable(byteBuffer, queryReplies.Name, 1)
            packBoolean(byteBuffer, queryReplies.ForSale)
            packBoolean(byteBuffer, queryReplies.Auction)
            packFloat(byteBuffer, queryReplies.Dwell)
        }
        byteBuffer.put((StatusData_Fields.size.toByte()))
        val iterator = StatusData_Fields.iterator()
        while (iterator.hasNext()) {
            packInt(byteBuffer, (iterator.next()).Status)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val queryData = QueryData()
            queryData.QueryID = unpackUUID(byteBuffer)
            QueryData_Fields.add(queryData)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val queryReplies = QueryReplies()
            queryReplies.ParcelID = unpackUUID(byteBuffer)
            queryReplies.Name = unpackVariable(byteBuffer, 1)
            queryReplies.ForSale = unpackBoolean(byteBuffer)
            queryReplies.Auction = unpackBoolean(byteBuffer)
            queryReplies.Dwell = unpackFloat(byteBuffer)
            QueryReplies_Fields.add(queryReplies)
        }
        val i5 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i5) {
            val statusData = StatusData()
            statusData.Status = unpackInt(byteBuffer)
            StatusData_Fields.add(statusData)
        }
    }
}
