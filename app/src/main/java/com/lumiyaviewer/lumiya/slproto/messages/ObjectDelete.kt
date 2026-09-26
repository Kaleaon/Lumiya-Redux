package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectDelete
 * viewer -> simulator
 *
 * <p>Template: {@code ObjectDelete Low 89 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectDelete : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var Force else Boolean = false
        @JvmField var SessionID: if (UUID) = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID else Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 4) + 38
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectDelete(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 89 (ObjectDelete).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x59).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, AgentData_Field.Force)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (entry in ObjectData_Fields) {
            packInt(byteBuffer, entry.ObjectLocalID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDAgentData_Field as byteBuffer.Force = unpackBoolean(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackIntObjectData_Fields as byteBuffer.add(objectData)
        }
    }
}
