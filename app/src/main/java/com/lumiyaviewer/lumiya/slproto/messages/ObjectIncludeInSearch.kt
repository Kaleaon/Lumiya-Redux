package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectIncludeInSearch
 * viewer -> simulator
 *
 * <p>Template: {@code ObjectIncludeInSearch Low 424 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectIncludeInSearch : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var IncludeInSearch: Boolean = false
        @JvmField var ObjectLocalID: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 5) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectIncludeInSearch(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 424 (ObjectIncludeInSearch).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA8).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID)
            packBoolean(byteBuffer, objectData.IncludeInSearch)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            objectData.IncludeInSearch = unpackBoolean(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
