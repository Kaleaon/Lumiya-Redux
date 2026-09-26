package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DirLandQuery viewer->sim
 * Special query for the land for sale/auction panel.
 * reliable
 *
 * <p>Template: {@code DirLandQuery Low 48 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class DirLandQuery : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var Area: Int = 0
        @JvmField var Price: Int = 0
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryID: UUID? = null
        @JvmField var QueryStart: Int = 0
        @JvmField var SearchType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 72
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirLandQuery(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 48 (DirLandQuery).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x30).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packInt(byteBuffer, QueryData_Field.SearchType)
        packInt(byteBuffer, QueryData_Field.Price)
        packInt(byteBuffer, QueryData_Field.Area)
        packInt(byteBuffer, QueryData_Field.QueryStart)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.SearchType = unpackInt(byteBuffer)
        QueryData_Field.Price = unpackInt(byteBuffer)
        QueryData_Field.Area = unpackInt(byteBuffer)
        QueryData_Field.QueryStart = unpackInt(byteBuffer)
    }
}
