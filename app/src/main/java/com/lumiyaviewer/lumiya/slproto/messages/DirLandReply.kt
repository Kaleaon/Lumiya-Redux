package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * DirLandReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code DirLandReply Low 50 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirLandReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class DirLandReply : SLMessage() {
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
        @JvmField var ActualArea: Int = 0
        @JvmField var Auction: Boolean = false
        @JvmField var ForSale: Boolean = false
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var SalePrice: Int = 0
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
            i = it.next().Name!!.size + 17 + 1 + 1 + 4 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirLandReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 50 (DirLandReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x32).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        byteBuffer.put((QueryReplies_Fields.size.toByte()))
        for (queryReplies in QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.ParcelID)
            packVariable(byteBuffer, queryReplies.Name, 1)
            packBoolean(byteBuffer, queryReplies.Auction)
            packBoolean(byteBuffer, queryReplies.ForSale)
            packInt(byteBuffer, queryReplies.SalePrice)
            packInt(byteBuffer, queryReplies.ActualArea)
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
            queryReplies.Auction = unpackBoolean(byteBuffer)
            queryReplies.ForSale = unpackBoolean(byteBuffer)
            queryReplies.SalePrice = unpackInt(byteBuffer)
            queryReplies.ActualArea = unpackInt(byteBuffer)
            QueryReplies_Fields.add(queryReplies)
        }
    }
}
