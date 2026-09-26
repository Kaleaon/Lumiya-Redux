package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DEPRECATED: DirPopularQueryBackend sim->dataserver
 * Special query for the land for sale/auction panel.
 * reliable
 *
 * <p>Template: {@code DirPopularQueryBackend Low 52 Trusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
open class DirPopularQueryBackend : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var EstateID: Int = 0
        @JvmField var Godlike: Boolean = false
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 45
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirPopularQueryBackend(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 52 (DirPopularQueryBackend).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x34).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packInt(byteBuffer, QueryData_Field.EstateID)
        packBoolean(byteBuffer, QueryData_Field.Godlike)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.EstateID = unpackInt(byteBuffer)
        QueryData_Field.Godlike = unpackBoolean(byteBuffer)
    }
}
