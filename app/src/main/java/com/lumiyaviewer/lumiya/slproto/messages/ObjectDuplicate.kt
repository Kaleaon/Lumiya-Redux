package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectDuplicate
 * viewer -> simulator
 * Makes a copy of a set of objects, offset by a given amount
 *
 * <p>Template: {@code ObjectDuplicate Low 90 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectDuplicate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()
    @JvmField var SharedData_Field: SharedData = SharedData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID: Int = 0
    }

    /** Block SharedData, Single. */
    open class SharedData {
        @JvmField var DuplicateFlags: Int = 0
        @JvmField var Offset: LLVector3? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 4) + 69
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectDuplicate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 90 (ObjectDuplicate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x5A).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packLLVector3(byteBuffer, SharedData_Field.Offset)
        packInt(byteBuffer, SharedData_Field.DuplicateFlags)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (entry in ObjectData_Fields) {
            packInt(byteBuffer, entry.ObjectLocalID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        SharedData_Field.Offset = unpackLLVector3(byteBuffer)
        SharedData_Field.DuplicateFlags = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
