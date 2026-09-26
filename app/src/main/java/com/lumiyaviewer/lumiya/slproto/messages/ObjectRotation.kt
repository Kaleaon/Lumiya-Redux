package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectRotation
 * viewer -> simulator
 *
 * <p>Template: {@code ObjectRotation Low 93 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectRotation : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID: Int = 0
        @JvmField var Rotation: LLQuaternion? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 16) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectRotation(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 93 (ObjectRotation).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x5D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID)
            packLLQuaternion(byteBuffer, objectData.Rotation)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            objectData.Rotation = unpackLLQuaternion(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
