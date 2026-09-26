package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Viewer to Simulator Messages
 * Undo
 *
 * <p>Template: {@code Undo Low 75 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class Undo : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var GroupID else UUID? = null
        @JvmField var SessionID: if (UUID) = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectID else UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 16) + 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUndo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 75 (Undo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x4B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (entry in ObjectData_Fields) {
            packUUID(byteBuffer, entry.ObjectID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.GroupID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectID = unpackUUIDObjectData_Fields as byteBuffer.add(objectData)
        }
    }
}
