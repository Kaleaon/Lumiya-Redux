package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * DEPRECATED: DirPopularReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code DirPopularReply Low 53 Trusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
open class DirPopularReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()
    @JvmField val QueryReplies_Fields = ArrayList<QueryReplies>()

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
        @JvmField var Dwell: Float = 0f
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
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
                return i2
            }
            i = it.next().Name!!.size + 17 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirPopularReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 53 (DirPopularReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x35).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        byteBuffer.put((QueryReplies_Fields.size.toByte()))
        for (queryReplies in QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.ParcelID)
            packVariable(byteBuffer, queryReplies.Name, 1)
            packFloat(byteBuffer, queryReplies.Dwell)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val queryReplies = QueryReplies()
            queryReplies.ParcelID = unpackUUID(byteBuffer)
            queryReplies.Name = unpackVariable(byteBuffer, 1)
            queryReplies.Dwell = unpackFloat(byteBuffer)
            QueryReplies_Fields.add(queryReplies)
        }
    }
}
