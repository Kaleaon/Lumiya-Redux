package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * DEPRECATED: DirPopularQuery viewer->sim
 * Special query for the land for sale/auction panel.
 * reliable
 *
 * <p>Template: {@code DirPopularQuery Low 51 NotTrusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
open class DirPopularQuery : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDirPopularQuery(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 51 (DirPopularQuery).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x33).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
    }
}
