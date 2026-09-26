package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * DirPeopleReply
 *
 * <p>Template: {@code DirPeopleReply Low 36 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirPeopleReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DirPeopleReply : SLMessage() {
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
        @JvmField var AgentID: UUID? = null
        @JvmField var FirstName: ByteArray? = null
        @JvmField var Group: ByteArray? = null
        @JvmField var LastName: ByteArray? = null
        @JvmField var Online: Boolean = false
        @JvmField var Reputation: Int = 0
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
            val queryReplies = it.next()
            i = queryReplies.Group!!.size + queryReplies.FirstName!!.size + 17 + 1 + queryReplies.LastName!!.size + 1 + 1 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirPeopleReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 36 (DirPeopleReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x24).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        byteBuffer.put((QueryReplies_Fields.size.toByte()))
        for (queryReplies in QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.AgentID)
            packVariable(byteBuffer, queryReplies.FirstName, 1)
            packVariable(byteBuffer, queryReplies.LastName, 1)
            packVariable(byteBuffer, queryReplies.Group, 1)
            packBoolean(byteBuffer, queryReplies.Online)
            packInt(byteBuffer, queryReplies.Reputation)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val queryReplies = QueryReplies()
            queryReplies.AgentID = unpackUUID(byteBuffer)
            queryReplies.FirstName = unpackVariable(byteBuffer, 1)
            queryReplies.LastName = unpackVariable(byteBuffer, 1)
            queryReplies.Group = unpackVariable(byteBuffer, 1)
            queryReplies.Online = unpackBoolean(byteBuffer)
            queryReplies.Reputation = unpackInt(byteBuffer)
            QueryReplies_Fields.add(queryReplies)
        }
    }
}
