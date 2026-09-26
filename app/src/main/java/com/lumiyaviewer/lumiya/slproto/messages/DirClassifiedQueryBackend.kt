package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DirClassifiedQueryBackend sim->dataserver
 * reliable
 *
 * <p>Template: {@code DirClassifiedQueryBackend Low 40 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class DirClassifiedQueryBackend : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var Category: Int = 0
        @JvmField var EstateID: Int = 0
        @JvmField var Godlike: Boolean = false
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryID: UUID? = null
        @JvmField var QueryStart: Int = 0
        @JvmField var QueryText: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return QueryData_Field.QueryText!!.size + 17 + 4 + 4 + 4 + 1 + 4 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirClassifiedQueryBackend(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 40 (DirClassifiedQueryBackend).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x28).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packVariable(byteBuffer, QueryData_Field.QueryText, 1)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packInt(byteBuffer, QueryData_Field.Category)
        packInt(byteBuffer, QueryData_Field.EstateID)
        packBoolean(byteBuffer, QueryData_Field.Godlike)
        packInt(byteBuffer, QueryData_Field.QueryStart)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryText = unpackVariable(byteBuffer, 1)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.Category = unpackInt(byteBuffer)
        QueryData_Field.EstateID = unpackInt(byteBuffer)
        QueryData_Field.Godlike = unpackBoolean(byteBuffer)
        QueryData_Field.QueryStart = unpackInt(byteBuffer)
    }
}
