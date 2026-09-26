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
    var AgentData_Field: AgentData = null
    var ObjectData_Field: ObjectData = null

    /** Block AgentData, Single. */
    open class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        public int AddFlags; // U32 - see object_flags.h
        public int BypassRaycast; // U8
        public int Material; // U8
        public int PCode; // U8
        public int PathBegin; // U16 - 0 to 1, quanta = 0.01
        public int PathCurve; // U8
        public int PathEnd; // U16 - 0 to 1, quanta = 0.01
        public int PathRadiusOffset; // S8 - -1 to 1, quanta = 0.01
        public int PathRevolutions; // U8 - 0 to 3, quanta = 0.015
        public int PathScaleX; // U8 - 0 to 1, quanta = 0.01
        public int PathScaleY; // U8 - 0 to 1, quanta = 0.01
        public int PathShearX; // U8 - -.5 to .5, quanta = 0.01
        public int PathShearY; // U8 - -.5 to .5, quanta = 0.01
        public int PathSkew; // S8 - -1 to 1, quanta = 0.01
        public int PathTaperX; // S8 - -1 to 1, quanta = 0.01
        public int PathTaperY; // S8 - -1 to 1, quanta = 0.01
        public int PathTwist; // S8 - -1 to 1, quanta = 0.01
        public int PathTwistBegin; // S8 - -1 to 1, quanta = 0.01
        public int ProfileBegin; // U16 - 0 to 1, quanta = 0.01
        public int ProfileCurve; // U8
        public int ProfileEnd; // U16 - 0 to 1, quanta = 0.01
        public int ProfileHollow; // U16 - 0 to 1, quanta = 0.01
        public LLVector3 RayEnd; // LLVector3
        public int RayEndIsIntersection; // U8
        public LLVector3 RayStart; // LLVector3
        public UUID RayTargetID; // LLUUID
        public LLQuaternion Rotation; // LLQuaternion
        public LLVector3 Scale; // LLVector3
        public int State; // U8
    }

    constructor() {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
        this.ObjectData_Field = ObjectData()
    }
    fun CalcPayloadSize(): Int {
        return 146
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectAdd(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 1 (ObjectAdd).
        byteBuffer.put(0xFF as byte)
        byteBuffer.put(0x01 as byte)
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packUUID(byteBuffer, this.AgentData_Field.GroupID)
        packByte(byteBuffer, this as byte.ObjectData_Field.PCode)
        packByte(byteBuffer, this as byte.ObjectData_Field.Material)
        packInt(byteBuffer, this.ObjectData_Field.AddFlags)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathCurve)
        packByte(byteBuffer, this as byte.ObjectData_Field.ProfileCurve)
        packShort(byteBuffer, this as short.ObjectData_Field.PathBegin)
        packShort(byteBuffer, this as short.ObjectData_Field.PathEnd)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathScaleX)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathScaleY)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathShearX)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathShearY)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathTwist)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathTwistBegin)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathRadiusOffset)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathTaperX)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathTaperY)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathRevolutions)
        packByte(byteBuffer, this as byte.ObjectData_Field.PathSkew)
        packShort(byteBuffer, this as short.ObjectData_Field.ProfileBegin)
        packShort(byteBuffer, this as short.ObjectData_Field.ProfileEnd)
        packShort(byteBuffer, this as short.ObjectData_Field.ProfileHollow)
        packByte(byteBuffer, this as byte.ObjectData_Field.BypassRaycast)
        packLLVector3(byteBuffer, this.ObjectData_Field.RayStart)
        packLLVector3(byteBuffer, this.ObjectData_Field.RayEnd)
        packUUID(byteBuffer, this.ObjectData_Field.RayTargetID)
        packByte(byteBuffer, this as byte.ObjectData_Field.RayEndIsIntersection)
        packLLVector3(byteBuffer, this.ObjectData_Field.Scale)
        packLLQuaternion(byteBuffer, this.ObjectData_Field.Rotation)
        packByte(byteBuffer, this as byte.ObjectData_Field.State)
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUIDthis as byteBuffer.AgentData_Field.SessionID = unpackUUIDthis as byteBuffer.AgentData_Field.GroupID = unpackUUIDthis as byteBuffer.ObjectData_Field.PCode = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.Material = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.AddFlags = unpackIntthis as byteBuffer.ObjectData_Field.PathCurve = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.ProfileCurve = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathBegin = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.PathEnd = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.PathScaleX = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathScaleY = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathShearX = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathShearY = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathTwist = unpackBytethis as byteBuffer.ObjectData_Field.PathTwistBegin = unpackBytethis as byteBuffer.ObjectData_Field.PathRadiusOffset = unpackBytethis as byteBuffer.ObjectData_Field.PathTaperX = unpackBytethis as byteBuffer.ObjectData_Field.PathTaperY = unpackBytethis as byteBuffer.ObjectData_Field.PathRevolutions = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.PathSkew = unpackBytethis as byteBuffer.ObjectData_Field.ProfileBegin = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.ProfileEnd = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.ProfileHollow = unpackShort(byteBuffer) & 65535
        this.ObjectData_Field.BypassRaycast = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.RayStart = unpackLLVector3this as byteBuffer.ObjectData_Field.RayEnd = unpackLLVector3this as byteBuffer.ObjectData_Field.RayTargetID = unpackUUIDthis as byteBuffer.ObjectData_Field.RayEndIsIntersection = unpackByte(byteBuffer) & 0xFF
        this.ObjectData_Field.Scale = unpackLLVector3this as byteBuffer.ObjectData_Field.Rotation = unpackLLQuaternionthis as byteBuffer.ObjectData_Field.State = unpackByte(byteBuffer) & 0xFF
    }
}
