package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * PlacesReply
 * dataserver -> simulator -> viewer
 * If the user has specified a location, use that to compute
 * global x,y,z.  Otherwise, use center of the AABB.
 * reliable
 *
 * <p>Template: {@code PlacesReply Low 30 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_places_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class PlacesReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val QueryData_Fields = ArrayList<QueryData>()
    @JvmField var TransactionData_Field: TransactionData = TransactionData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var QueryID: UUID? = null
    }

    /** Block QueryData, Variable. */
    open class QueryData {
        @JvmField var ActualArea: Int = 0
        @JvmField var BillableArea: Int = 0
        @JvmField var Desc: ByteArray? = null
        @JvmField var Dwell: Float = 0f
        @JvmField var Flags: Int = 0
        @JvmField var GlobalX: Float = 0f
        @JvmField var GlobalY: Float = 0f
        @JvmField var GlobalZ: Float = 0f
        @JvmField var Name: ByteArray? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var Price: Int = 0
        @JvmField var SimName: ByteArray? = null
        @JvmField var SnapshotID: UUID? = null
    }

    /** Block TransactionData, Single. */
    open class TransactionData {
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 53
        val it = QueryData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val queryData = it.next()
            i = queryData.SimName!!.size + queryData.Name!!.size + 17 + 1 + queryData.Desc!!.size + 4 + 4 + 1 + 4 + 4 + 4 + 1 + 16 + 4 + 4 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandlePlacesReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 30 (PlacesReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x1E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.QueryID)
        packUUID(byteBuffer, TransactionData_Field.TransactionID)
        byteBuffer.put((QueryData_Fields.size.toByte()))
        for (queryData in QueryData_Fields) {
            packUUID(byteBuffer, queryData.OwnerID)
            packVariable(byteBuffer, queryData.Name, 1)
            packVariable(byteBuffer, queryData.Desc, 1)
            packInt(byteBuffer, queryData.ActualArea)
            packInt(byteBuffer, queryData.BillableArea)
            packByte(byteBuffer, (queryData.Flags).toByte())
            packFloat(byteBuffer, queryData.GlobalX)
            packFloat(byteBuffer, queryData.GlobalY)
            packFloat(byteBuffer, queryData.GlobalZ)
            packVariable(byteBuffer, queryData.SimName, 1)
            packUUID(byteBuffer, queryData.SnapshotID)
            packFloat(byteBuffer, queryData.Dwell)
            packInt(byteBuffer, queryData.Price)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.QueryID = unpackUUID(byteBuffer)
        TransactionData_Field.TransactionID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val queryData = QueryData()
            queryData.OwnerID = unpackUUID(byteBuffer)
            queryData.Name = unpackVariable(byteBuffer, 1)
            queryData.Desc = unpackVariable(byteBuffer, 1)
            queryData.ActualArea = unpackInt(byteBuffer)
            queryData.BillableArea = unpackInt(byteBuffer)
            queryData.Flags = unpackByte(byteBuffer).toInt() and 0xFF
            queryData.GlobalX = unpackFloat(byteBuffer)
            queryData.GlobalY = unpackFloat(byteBuffer)
            queryData.GlobalZ = unpackFloat(byteBuffer)
            queryData.SimName = unpackVariable(byteBuffer, 1)
            queryData.SnapshotID = unpackUUID(byteBuffer)
            queryData.Dwell = unpackFloat(byteBuffer)
            queryData.Price = unpackInt(byteBuffer)
            QueryData_Fields.add(queryData)
        }
    }
}
