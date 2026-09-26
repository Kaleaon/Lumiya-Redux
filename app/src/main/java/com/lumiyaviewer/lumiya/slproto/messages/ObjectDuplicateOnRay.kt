package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectDuplicateOnRay
 * viewer -> simulator
 * Makes a copy of an object, using the add object raycast
 * code to abut it to other objects.
 *
 * <p>Template: {@code ObjectDuplicateOnRay Low 91 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectDuplicateOnRay : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var BypassRaycast: Boolean = false
        @JvmField var CopyCenters: Boolean = false
        @JvmField var CopyRotates: Boolean = false
        @JvmField var DuplicateFlags: Int = 0
        @JvmField var GroupID: UUID? = null
        @JvmField var RayEnd: LLVector3? = null
        @JvmField var RayEndIsIntersection: Boolean = false
        @JvmField var RayStart: LLVector3? = null
        @JvmField var RayTargetID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var ObjectLocalID: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 4) + 101
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectDuplicateOnRay(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 91 (ObjectDuplicateOnRay).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x5B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packLLVector3(byteBuffer, AgentData_Field.RayStart)
        packLLVector3(byteBuffer, AgentData_Field.RayEnd)
        packBoolean(byteBuffer, AgentData_Field.BypassRaycast)
        packBoolean(byteBuffer, AgentData_Field.RayEndIsIntersection)
        packBoolean(byteBuffer, AgentData_Field.CopyCenters)
        packBoolean(byteBuffer, AgentData_Field.CopyRotates)
        packUUID(byteBuffer, AgentData_Field.RayTargetID)
        packInt(byteBuffer, AgentData_Field.DuplicateFlags)
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (entry in ObjectData_Fields) {
            packInt(byteBuffer, entry.ObjectLocalID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        AgentData_Field.RayStart = unpackLLVector3(byteBuffer)
        AgentData_Field.RayEnd = unpackLLVector3(byteBuffer)
        AgentData_Field.BypassRaycast = unpackBoolean(byteBuffer)
        AgentData_Field.RayEndIsIntersection = unpackBoolean(byteBuffer)
        AgentData_Field.CopyCenters = unpackBoolean(byteBuffer)
        AgentData_Field.CopyRotates = unpackBoolean(byteBuffer)
        AgentData_Field.RayTargetID = unpackUUID(byteBuffer)
        AgentData_Field.DuplicateFlags = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ObjectLocalID = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
