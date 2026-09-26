package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * DEPRECATED: ObjectScale
 * == Old Behavior ==
 * Set the scale on objects
 * == Reason for deprecation ==
 * Unused code path was removed in the move to Havok4
 * Object position, scale and rotation messages were already unified
 * to MultipleObjectUpdate and this message was unused cruft.
 * == New Location ==
 * MultipleObjectUpdate can be used instead.
 *
 * <p>Template: {@code ObjectScale Low 92 NotTrusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
open class ObjectScale : SLMessage() {
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
        @JvmField var Scale: LLVector3? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 16) + 37
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectScale(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 92 (ObjectScale).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x5C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID)
            packLLVector3(byteBuffer, objectData.Scale)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            objectData.Scale = unpackLLVector3(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
