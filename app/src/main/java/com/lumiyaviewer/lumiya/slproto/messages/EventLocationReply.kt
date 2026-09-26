package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * EventLocationReply
 *
 * <p>Template: {@code EventLocationReply Low 308 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class EventLocationReply : SLMessage() {
    @JvmField var EventData_Field: EventData = EventData()
    @JvmField var QueryData_Field: QueryData = QueryData()

    /** Block EventData, Single. */
    open class EventData {
        @JvmField var RegionID: UUID? = null
        @JvmField var RegionPos: LLVector3? = null
        @JvmField var Success: Boolean = false
    }

    /** Block QueryData, Single. */
    open class QueryData {
        @JvmField var QueryID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 49
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEventLocationReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 308 (EventLocationReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x34).toByte())
        packUUID(byteBuffer, QueryData_Field.QueryID)
        packBoolean(byteBuffer, EventData_Field.Success)
        packUUID(byteBuffer, EventData_Field.RegionID)
        packLLVector3(byteBuffer, EventData_Field.RegionPos)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        QueryData_Field.QueryID = unpackUUID(byteBuffer)
        EventData_Field.Success = unpackBoolean(byteBuffer)
        EventData_Field.RegionID = unpackUUID(byteBuffer)
        EventData_Field.RegionPos = unpackLLVector3(byteBuffer)
    }
}
