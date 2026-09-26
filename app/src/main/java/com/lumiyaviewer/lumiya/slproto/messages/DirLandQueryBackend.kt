package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DirLandQueryBackend sim->dataserver
 * Special query for the land for sale/auction panel.
 *
 * <p>Template: {@code DirLandQueryBackend Low 49 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class DirLandQueryBackend : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var Area: Int = 0
        @JvmField var EstateID: Int = 0
        @JvmField var Godlike: Boolean = false
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
        return 61
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirLandQueryBackend(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 49 (DirLandQueryBackend).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x31).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packInt(byteBuffer, QueryData_Field.SearchType)
        packInt(byteBuffer, QueryData_Field.Price)
        packInt(byteBuffer, QueryData_Field.Area)
        packInt(byteBuffer, QueryData_Field.QueryStart)
        packInt(byteBuffer, QueryData_Field.EstateID)
        packBoolean(byteBuffer, QueryData_Field.Godlike)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.SearchType = unpackInt(byteBuffer)
        QueryData_Field.Price = unpackInt(byteBuffer)
        QueryData_Field.Area = unpackInt(byteBuffer)
        QueryData_Field.QueryStart = unpackInt(byteBuffer)
        QueryData_Field.EstateID = unpackInt(byteBuffer)
        QueryData_Field.Godlike = unpackBoolean(byteBuffer)
    }
}
