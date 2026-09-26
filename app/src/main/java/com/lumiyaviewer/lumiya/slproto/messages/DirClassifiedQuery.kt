package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DirClassifiedQuery viewer->sim
 * reliable
 *
 * <p>Template: {@code DirClassifiedQuery Low 39 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class DirClassifiedQuery : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var Category: Int = 0
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryID: UUID? = null
        @JvmField var QueryStart: Int = 0
        @JvmField var QueryText: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return QueryData_Field.QueryText!!.size + 17 + 4 + 4 + 4 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirClassifiedQuery(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 39 (DirClassifiedQuery).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x27).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packVariable(byteBuffer, QueryData_Field.QueryText, 1)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packInt(byteBuffer, QueryData_Field.Category)
        packInt(byteBuffer, QueryData_Field.QueryStart)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryText = unpackVariable(byteBuffer, 1)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.Category = unpackInt(byteBuffer)
        QueryData_Field.QueryStart = unpackInt(byteBuffer)
    }
}
