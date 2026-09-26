package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * PlacesQuery
 * Used for getting a list of places for the group land panel
 * and the user land holdings panel.  NOT for the directory.
 * The dataserver now implements the "/agent/<agent-id>/owned-land"
 * endpoint as a replacement for PlacesQuery and PlacesReply.
 * This has not yet been exposed in the viewer through a capability...
 * but this message's days are numbered.
 *
 * <p>Template: {@code PlacesQuery Low 29 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class PlacesQuery : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()
    @JvmField var TransactionData_Field: TransactionData = TransactionData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var QueryID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var Category: Int = 0
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryText: ByteArray? = null
        @JvmField var SimName: ByteArray? = null
    }

    /** Block TransactionData, Single. */
    open class TransactionData {
        @JvmField var TransactionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return QueryData_Field.QueryText!!.size + 1 + 4 + 1 + 1 + QueryData_Field.SimName!!.size + 68
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandlePlacesQuery(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 29 (PlacesQuery).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x1D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.QueryID)
        packUUID(byteBuffer, TransactionData_Field.TransactionID)
        packVariable(byteBuffer, QueryData_Field.QueryText, 1)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packByte(byteBuffer, (QueryData_Field.Category).toByte())
        packVariable(byteBuffer, QueryData_Field.SimName, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.QueryID = unpackUUID(byteBuffer)
        TransactionData_Field.TransactionID = unpackUUID(byteBuffer)
        QueryData_Field.QueryText = unpackVariable(byteBuffer, 1)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.Category = unpackByte(byteBuffer).toInt()
        QueryData_Field.SimName = unpackVariable(byteBuffer, 1)
    }
}
