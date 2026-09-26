package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * EventGodDelete
 * viewer -> simulator
 * simulator -> dataserver
 * QueryData is used to resend a search result after the deletion
 * reliable
 *
 * <p>Template: {@code EventGodDelete Low 183 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class EventGodDelete : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var EventData_Field: EventData = EventData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block EventData, Single. */
    open class EventData {
        @JvmField var EventID: Int = 0
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var QueryFlags: Int = 0
        @JvmField var QueryID: UUID? = null
        @JvmField var QueryStart: Int = 0
        @JvmField var QueryText: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return QueryData_Field.QueryText!!.size + 17 + 4 + 4 + 40
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEventGodDelete(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 183 (EventGodDelete).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xB7).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, EventData_Field.EventID)
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packVariable(byteBuffer, QueryData_Field.QueryText, 1)
        packInt(byteBuffer, QueryData_Field.QueryFlags)
        packInt(byteBuffer, QueryData_Field.QueryStart)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        EventData_Field.EventID = unpackInt(byteBuffer)
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        QueryData_Field.QueryText = unpackVariable(byteBuffer, 1)
        QueryData_Field.QueryFlags = unpackInt(byteBuffer)
        QueryData_Field.QueryStart = unpackInt(byteBuffer)
    }
}
