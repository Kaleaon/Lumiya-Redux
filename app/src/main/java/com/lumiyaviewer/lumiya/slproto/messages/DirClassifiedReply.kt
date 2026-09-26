package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * DirClassifiedReply dataserver->sim->viewer
 * reliable
 *
 * <p>Template: {@code DirClassifiedReply Low 41 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirClassifiedReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DirClassifiedReply : SLMessage() {
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
        @JvmField var ClassifiedFlags: Int = 0
        @JvmField var ClassifiedID: UUID? = null
        @JvmField var CreationDate: Int = 0
        @JvmField var ExpirationDate: Int = 0
        @JvmField var Name: ByteArray? = null
        @JvmField var PriceForListing: Int = 0
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
            i = it.next().Name!!.size + 17 + 1 + 4 + 4 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirClassifiedReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 41 (DirClassifiedReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x29).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        byteBuffer.put((QueryReplies_Fields.size.toByte()))
        for (queryReplies in QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.ClassifiedID)
            packVariable(byteBuffer, queryReplies.Name, 1)
            packByte(byteBuffer, (queryReplies.ClassifiedFlags).toByte())
            packInt(byteBuffer, queryReplies.CreationDate)
            packInt(byteBuffer, queryReplies.ExpirationDate)
            packInt(byteBuffer, queryReplies.PriceForListing)
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
            queryReplies.ClassifiedID = unpackUUID(byteBuffer)
            queryReplies.Name = unpackVariable(byteBuffer, 1)
            queryReplies.ClassifiedFlags = unpackByte(byteBuffer).toInt() and 0xFF
            queryReplies.CreationDate = unpackInt(byteBuffer)
            queryReplies.ExpirationDate = unpackInt(byteBuffer)
            queryReplies.PriceForListing = unpackInt(byteBuffer)
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
