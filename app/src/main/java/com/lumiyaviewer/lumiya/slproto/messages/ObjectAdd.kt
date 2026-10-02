package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ObjectAdd - create new object in the world
 * Simulator will assign ID and send message back to signal
 * object actually created.
 * AddFlags (see also ObjectUpdate)
 * 0x01 - use physics
 * 0x02 - create selected
 * If only one ImageID is sent for an object type that has more than
 * one face, the same image is repeated on each subsequent face.
 * Data field is opaque type-specific data for this object
 *
 * <p>Template: {@code ObjectAdd Medium 1 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectAdd : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var GroupID: UUID? = null // LLUUID
        @JvmField var SessionID: UUID? = null // LLUUID
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var AddFlags: Int = 0 // U32 - see object_flags.h
        @JvmField var BypassRaycast: Int = 0 // U8
        @JvmField var Material: Int = 0 // U8
        @JvmField var PCode: Int = 0 // U8
        @JvmField var PathBegin: Int = 0 // U16 - 0 to 1, quanta = 0.01
        @JvmField var PathCurve: Int = 0 // U8
        @JvmField var PathEnd: Int = 0 // U16 - 0 to 1, quanta = 0.01
        @JvmField var PathRadiusOffset: Int = 0 // S8 - -1 to 1, quanta = 0.01
        @JvmField var PathRevolutions: Int = 0 // U8 - 0 to 3, quanta = 0.015
        @JvmField var PathScaleX: Int = 0 // U8 - 0 to 1, quanta = 0.01
        @JvmField var PathScaleY: Int = 0 // U8 - 0 to 1, quanta = 0.01
        @JvmField var PathShearX: Int = 0 // U8 - -.5 to .5, quanta = 0.01
        @JvmField var PathShearY: Int = 0 // U8 - -.5 to .5, quanta = 0.01
        @JvmField var PathSkew: Int = 0 // S8 - -1 to 1, quanta = 0.01
        @JvmField var PathTaperX: Int = 0 // S8 - -1 to 1, quanta = 0.01
        @JvmField var PathTaperY: Int = 0 // S8 - -1 to 1, quanta = 0.01
        @JvmField var PathTwist: Int = 0 // S8 - -1 to 1, quanta = 0.01
        @JvmField var PathTwistBegin: Int = 0 // S8 - -1 to 1, quanta = 0.01
        @JvmField var ProfileBegin: Int = 0 // U16 - 0 to 1, quanta = 0.01
        @JvmField var ProfileCurve: Int = 0 // U8
        @JvmField var ProfileEnd: Int = 0 // U16 - 0 to 1, quanta = 0.01
        @JvmField var ProfileHollow: Int = 0 // U16 - 0 to 1, quanta = 0.01
        @JvmField var RayEnd: LLVector3? = null // LLVector3
        @JvmField var RayEndIsIntersection: Int = 0 // U8
        @JvmField var RayStart: LLVector3? = null // LLVector3
        @JvmField var RayTargetID: UUID? = null // LLUUID
        @JvmField var Rotation: LLQuaternion? = null // LLQuaternion
        @JvmField var Scale: LLVector3? = null // LLVector3
        @JvmField var State: Int = 0 // U8
    }

    init {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.ObjectData_Field = ObjectData()
    }

    override fun CalcPayloadSize(): Int {
        return 146
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectAdd(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 1 (ObjectAdd).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x01).toByte())
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packUUID(byteBuffer, this.AgentData_Field.GroupID)
        packByte(byteBuffer, (this.ObjectData_Field.PCode).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.Material).toByte())
        packInt(byteBuffer, this.ObjectData_Field.AddFlags)
        packByte(byteBuffer, (this.ObjectData_Field.PathCurve).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.ProfileCurve).toByte())
        packShort(byteBuffer, (short) this.ObjectData_Field.PathBegin)
        packShort(byteBuffer, (short) this.ObjectData_Field.PathEnd)
        packByte(byteBuffer, (this.ObjectData_Field.PathScaleX).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathScaleY).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathShearX).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathShearY).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathTwist).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathTwistBegin).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathRadiusOffset).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathTaperX).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathTaperY).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathRevolutions).toByte())
        packByte(byteBuffer, (this.ObjectData_Field.PathSkew).toByte())
        packShort(byteBuffer, (short) this.ObjectData_Field.ProfileBegin)
        packShort(byteBuffer, (short) this.ObjectData_Field.ProfileEnd)
        packShort(byteBuffer, (short) this.ObjectData_Field.ProfileHollow)
        packByte(byteBuffer, (this.ObjectData_Field.BypassRaycast).toByte())
        packLLVector3(byteBuffer, this.ObjectData_Field.RayStart)
        packLLVector3(byteBuffer, this.ObjectData_Field.RayEnd)
        packUUID(byteBuffer, this.ObjectData_Field.RayTargetID)
        packByte(byteBuffer, (this.ObjectData_Field.RayEndIsIntersection).toByte())
        packLLVector3(byteBuffer, this.ObjectData_Field.Scale)
        packLLQuaternion(byteBuffer, this.ObjectData_Field.Rotation)
        packByte(byteBuffer, (this.ObjectData_Field.State).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer)
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer)
        this.ObjectData_Field.PCode = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.Material = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.AddFlags = unpackInt(byteBuffer)
        this.ObjectData_Field.PathCurve = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.ProfileCurve = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathBegin = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.PathEnd = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.PathScaleX = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathScaleY = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathShearX = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathShearY = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathTwist = unpackByte(byteBuffer)
        this.ObjectData_Field.PathTwistBegin = unpackByte(byteBuffer)
        this.ObjectData_Field.PathRadiusOffset = unpackByte(byteBuffer)
        this.ObjectData_Field.PathTaperX = unpackByte(byteBuffer)
        this.ObjectData_Field.PathTaperY = unpackByte(byteBuffer)
        this.ObjectData_Field.PathRevolutions = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathSkew = unpackByte(byteBuffer)
        this.ObjectData_Field.ProfileBegin = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.ProfileEnd = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.ProfileHollow = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.BypassRaycast = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.RayStart = unpackLLVector3(byteBuffer)
        this.ObjectData_Field.RayEnd = unpackLLVector3(byteBuffer)
        this.ObjectData_Field.RayTargetID = unpackUUID(byteBuffer)
        this.ObjectData_Field.RayEndIsIntersection = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.Scale = unpackLLVector3(byteBuffer)
        this.ObjectData_Field.Rotation = unpackLLQuaternion(byteBuffer)
        this.ObjectData_Field.State = unpackByte(byteBuffer) & 0xFF
    }
}
