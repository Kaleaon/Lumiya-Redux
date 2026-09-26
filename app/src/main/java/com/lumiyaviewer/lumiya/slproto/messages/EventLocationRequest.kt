package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * EventLocationRequest
 *
 * <p>Template: {@code EventLocationRequest Low 307 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class EventLocationRequest : SLMessage() {
    @JvmField var EventData_Field: EventData = EventData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block EventData, Single. */
    open class EventData {
        @JvmField var EventID: Int = 0
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var QueryID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 24
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEventLocationRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 307 (EventLocationRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x33).toByte())
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packInt(byteBuffer, EventData_Field.EventID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        EventData_Field.EventID = unpackInt(byteBuffer)
    }
}
