package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.Iterator
import java.util.UUID

/**
 * ObjectUpdate - Sent by objects from the simulator to the viewer
 * If only one ImageID is sent for an object type that has more than
 * one face, the same image is repeated on each subsequent face.
 * NameValue is a list of name-value strings, separated by \n characters,
 * terminated by \0
 * Data is type-specific opaque data for this object
 *
 * <p>Template: {@code ObjectUpdate High 12 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_object_update()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ObjectUpdate : SLMessage() {
    var ObjectData_Fields: ArrayList<ObjectData> = ArrayList<>()
    var RegionData_Field: RegionData = null

    /** Block ObjectData, Variable. */
    open class ObjectData {
        public int CRC; // U32 - TEMPORARY HACK FOR JAMES
        public int ClickAction; // U8
        public byte[] Data; // Variable 2
        public byte[] ExtraParams; // Variable 1
        public int Flags; // U8
        public UUID FullID; // LLUUID
        public float Gain; // F32
        public int ID; // U32
        public LLVector3 JointAxisOrAnchor; // LLVector3
        public LLVector3 JointPivot; // LLVector3
        public int JointType; // U8
        public int Material; // U8
        public byte[] MediaURL; // Variable 1 - URL for web page, movie, etc.
        public byte[] NameValue; // Variable 2
        public byte[] ObjectData; // Variable 1
        public UUID OwnerID; // LLUUID - HACK object's owner id, only set if non-null sound, for muting
        public int PCode; // U8
        public byte[] PSBlock; // Variable 1
        public int ParentID; // U32
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
        public float Radius; // F32 - cutoff radius
        public LLVector3 Scale; // LLVector3
        public UUID Sound; // LLUUID
        public int State; // U8
        public byte[] Text; // Variable 1 - llSetText() hovering text
        public byte[] TextColor; // Fixed 4 - actually, a LLColor4U
        public byte[] TextureAnim; // Variable 1
        public byte[] TextureEntry; // Variable 2
        public int UpdateFlags; // U32 - see object_flags.h
    }

    /** Block RegionData, Single. */
    open class RegionData {
        public long RegionHandle; // U64
        public int TimeDilation; // U16
    }

    constructor() {
        this.zeroCoded = true
        this.RegionData_Field = RegionData()
    }
    fun CalcPayloadSize(): Int {
        var i: Int = 12
        var it: Iterator<?> = this.ObjectData_Fields.iterator()
        while (true) {
            var i2: Int = i
            if (!it.hasNext()) {
        return i2
            }
            var objectData: ObjectData = it as ObjectData.next()
            i = objectData.ExtraParams.length + objectData.ObjectData.length + 41 + 4 + 4 + 1 + 1 + 2 + 2 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 2 + 2 + 2 + 2 + objectData.TextureEntry.length + 1 + objectData.TextureAnim.length + 2 + objectData.NameValue.length + 2 + objectData.Data.length + 1 + objectData.Text.length + 4 + 1 + objectData.MediaURL.length + 1 + objectData.PSBlock.length + 1 + 16 + 16 + 4 + 1 + 4 + 1 + 12 + 12 + i2
        }
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectUpdate(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 12 (ObjectUpdate).
        byteBuffer.put(0x0C as byte)
        packLong(byteBuffer, this.RegionData_Field.RegionHandle)
        packShort(byteBuffer, this as short.RegionData_Field.TimeDilation)
        byteBuffer.put(this as byte.ObjectData_Fields.size())
        for (objectData in this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ID)
            packByte(byteBuffer, objectData as byte.State)
            packUUID(byteBuffer, objectData.FullID)
            packInt(byteBuffer, objectData.CRC)
            packByte(byteBuffer, objectData as byte.PCode)
            packByte(byteBuffer, objectData as byte.Material)
            packByte(byteBuffer, objectData as byte.ClickAction)
            packLLVector3(byteBuffer, objectData.Scale)
            packVariable(byteBuffer, objectData.ObjectData, 1)
            packInt(byteBuffer, objectData.ParentID)
            packInt(byteBuffer, objectData.UpdateFlags)
            packByte(byteBuffer, objectData as byte.PathCurve)
            packByte(byteBuffer, objectData as byte.ProfileCurve)
            packShort(byteBuffer, objectData as short.PathBegin)
            packShort(byteBuffer, objectData as short.PathEnd)
            packByte(byteBuffer, objectData as byte.PathScaleX)
            packByte(byteBuffer, objectData as byte.PathScaleY)
            packByte(byteBuffer, objectData as byte.PathShearX)
            packByte(byteBuffer, objectData as byte.PathShearY)
            packByte(byteBuffer, objectData as byte.PathTwist)
            packByte(byteBuffer, objectData as byte.PathTwistBegin)
            packByte(byteBuffer, objectData as byte.PathRadiusOffset)
            packByte(byteBuffer, objectData as byte.PathTaperX)
            packByte(byteBuffer, objectData as byte.PathTaperY)
            packByte(byteBuffer, objectData as byte.PathRevolutions)
            packByte(byteBuffer, objectData as byte.PathSkew)
            packShort(byteBuffer, objectData as short.ProfileBegin)
            packShort(byteBuffer, objectData as short.ProfileEnd)
            packShort(byteBuffer, objectData as short.ProfileHollow)
            packVariable(byteBuffer, objectData.TextureEntry, 2)
            packVariable(byteBuffer, objectData.TextureAnim, 1)
            packVariable(byteBuffer, objectData.NameValue, 2)
            packVariable(byteBuffer, objectData.Data, 2)
            packVariable(byteBuffer, objectData.Text, 1)
            packFixed(byteBuffer, objectData.TextColor, 4)
            packVariable(byteBuffer, objectData.MediaURL, 1)
            packVariable(byteBuffer, objectData.PSBlock, 1)
            packVariable(byteBuffer, objectData.ExtraParams, 1)
            packUUID(byteBuffer, objectData.Sound)
            packUUID(byteBuffer, objectData.OwnerID)
            packFloat(byteBuffer, objectData.Gain)
            packByte(byteBuffer, objectData as byte.Flags)
            packFloat(byteBuffer, objectData.Radius)
            packByte(byteBuffer, objectData as byte.JointType)
            packLLVector3(byteBuffer, objectData.JointPivot)
            packLLVector3(byteBuffer, objectData.JointAxisOrAnchor)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLongthis as byteBuffer.RegionData_Field.TimeDilation = unpackShort(byteBuffer) & 65535
        var i: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i; j++) {
            var objectData: ObjectData = ObjectData()
            objectData.ID = unpackIntobjectData as byteBuffer.State = unpackByte(byteBuffer) & 0xFF
            objectData.FullID = unpackUUIDobjectData as byteBuffer.CRC = unpackIntobjectData as byteBuffer.PCode = unpackByte(byteBuffer) & 0xFF
            objectData.Material = unpackByte(byteBuffer) & 0xFF
            objectData.ClickAction = unpackByte(byteBuffer) & 0xFF
            objectData.Scale = unpackLLVector3objectData as byteBuffer.ObjectData = unpackVariable(byteBuffer, 1)
            objectData.ParentID = unpackIntobjectData as byteBuffer.UpdateFlags = unpackIntobjectData as byteBuffer.PathCurve = unpackByte(byteBuffer) & 0xFF
            objectData.ProfileCurve = unpackByte(byteBuffer) & 0xFF
            objectData.PathBegin = unpackShort(byteBuffer) & 65535
            objectData.PathEnd = unpackShort(byteBuffer) & 65535
            objectData.PathScaleX = unpackByte(byteBuffer) & 0xFF
            objectData.PathScaleY = unpackByte(byteBuffer) & 0xFF
            objectData.PathShearX = unpackByte(byteBuffer) & 0xFF
            objectData.PathShearY = unpackByte(byteBuffer) & 0xFF
            objectData.PathTwist = unpackByteobjectData as byteBuffer.PathTwistBegin = unpackByteobjectData as byteBuffer.PathRadiusOffset = unpackByteobjectData as byteBuffer.PathTaperX = unpackByteobjectData as byteBuffer.PathTaperY = unpackByteobjectData as byteBuffer.PathRevolutions = unpackByte(byteBuffer) & 0xFF
            objectData.PathSkew = unpackByteobjectData as byteBuffer.ProfileBegin = unpackShort(byteBuffer) & 65535
            objectData.ProfileEnd = unpackShort(byteBuffer) & 65535
            objectData.ProfileHollow = unpackShort(byteBuffer) & 65535
            objectData.TextureEntry = unpackVariable(byteBuffer, 2)
            objectData.TextureAnim = unpackVariable(byteBuffer, 1)
            objectData.NameValue = unpackVariable(byteBuffer, 2)
            objectData.Data = unpackVariable(byteBuffer, 2)
            objectData.Text = unpackVariable(byteBuffer, 1)
            objectData.TextColor = unpackFixed(byteBuffer, 4)
            objectData.MediaURL = unpackVariable(byteBuffer, 1)
            objectData.PSBlock = unpackVariable(byteBuffer, 1)
            objectData.ExtraParams = unpackVariable(byteBuffer, 1)
            objectData.Sound = unpackUUIDobjectData as byteBuffer.OwnerID = unpackUUIDobjectData as byteBuffer.Gain = unpackFloatobjectData as byteBuffer.Flags = unpackByte(byteBuffer) & 0xFF
            objectData.Radius = unpackFloatobjectData as byteBuffer.JointType = unpackByte(byteBuffer) & 0xFF
            objectData.JointPivot = unpackLLVector3objectData as byteBuffer.JointAxisOrAnchor = unpackLLVector3this as byteBuffer.ObjectData_Fields.add(objectData)
        }
    }
}
