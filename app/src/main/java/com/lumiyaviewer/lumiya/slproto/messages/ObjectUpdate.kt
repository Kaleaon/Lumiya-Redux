package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
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
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()
    @JvmField var RegionData_Field: RegionData = RegionData()

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var CRC: Int = 0 // U32 - TEMPORARY HACK FOR JAMES
        @JvmField var ClickAction: Int = 0 // U8
        @JvmField var Data: ByteArray? = null // Variable 2
        @JvmField var ExtraParams: ByteArray? = null // Variable 1
        @JvmField var Flags: Int = 0 // U8
        @JvmField var FullID: UUID? = null // LLUUID
        @JvmField var Gain: Float = 0f // F32
        @JvmField var ID: Int = 0 // U32
        @JvmField var JointAxisOrAnchor: LLVector3? = null // LLVector3
        @JvmField var JointPivot: LLVector3? = null // LLVector3
        @JvmField var JointType: Int = 0 // U8
        @JvmField var Material: Int = 0 // U8
        @JvmField var MediaURL: ByteArray? = null // Variable 1 - URL for web page, movie, etc.
        @JvmField var NameValue: ByteArray? = null // Variable 2
        @JvmField var ObjectData: ByteArray? = null // Variable 1
        @JvmField var OwnerID: UUID? = null // LLUUID - HACK object's owner id, only set if non-null sound, for muting
        @JvmField var PCode: Int = 0 // U8
        @JvmField var PSBlock: ByteArray? = null // Variable 1
        @JvmField var ParentID: Int = 0 // U32
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
        @JvmField var Radius: Float = 0f // F32 - cutoff radius
        @JvmField var Scale: LLVector3? = null // LLVector3
        @JvmField var Sound: UUID? = null // LLUUID
        @JvmField var State: Int = 0 // U8
        @JvmField var Text: ByteArray? = null // Variable 1 - llSetText() hovering text
        @JvmField var TextColor: ByteArray? = null // Fixed 4 - actually, a LLColor4U
        @JvmField var TextureAnim: ByteArray? = null // Variable 1
        @JvmField var TextureEntry: ByteArray? = null // Variable 2
        @JvmField var UpdateFlags: Int = 0 // U32 - see object_flags.h
    }

    /** Block RegionData, Single. */
    open class RegionData {
        @JvmField var RegionHandle: Long = 0L // U64
        @JvmField var TimeDilation: Int = 0 // U16
    }

    init {
        this.zeroCoded = true
        this.RegionData_Field = RegionData()
    }

    override fun CalcPayloadSize(): Int {
        var i = 12
        for (entry in this.ObjectData_Fields) {
            i = entry.ExtraParams.size + entry.ObjectData.size + 41 + 4 + 4 + 1 + 1 + 2 + 2 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 2 + 2 + 2 + 2 + entry.TextureEntry.size + 1 + entry.TextureAnim.size + 2 + entry.NameValue.size + 2 + entry.Data.size + 1 + entry.Text.size + 4 + 1 + entry.MediaURL.size + 1 + entry.PSBlock.size + 1 + 16 + 16 + 4 + 1 + 4 + 1 + 12 + 12 + i
        }
        return i
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 12 (ObjectUpdate).
        byteBuffer.put((0x0C).toByte())
        packLong(byteBuffer, this.RegionData_Field.RegionHandle)
        packShort(byteBuffer, (short) this.RegionData_Field.TimeDilation)
        byteBuffer.put((this.ObjectData_Fields.size).toByte())
        for (objectData in this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ID)
            packByte(byteBuffer, (objectData.State).toByte())
            packUUID(byteBuffer, objectData.FullID)
            packInt(byteBuffer, objectData.CRC)
            packByte(byteBuffer, (objectData.PCode).toByte())
            packByte(byteBuffer, (objectData.Material).toByte())
            packByte(byteBuffer, (objectData.ClickAction).toByte())
            packLLVector3(byteBuffer, objectData.Scale)
            packVariable(byteBuffer, objectData.ObjectData, 1)
            packInt(byteBuffer, objectData.ParentID)
            packInt(byteBuffer, objectData.UpdateFlags)
            packByte(byteBuffer, (objectData.PathCurve).toByte())
            packByte(byteBuffer, (objectData.ProfileCurve).toByte())
            packShort(byteBuffer, (short) objectData.PathBegin)
            packShort(byteBuffer, (short) objectData.PathEnd)
            packByte(byteBuffer, (objectData.PathScaleX).toByte())
            packByte(byteBuffer, (objectData.PathScaleY).toByte())
            packByte(byteBuffer, (objectData.PathShearX).toByte())
            packByte(byteBuffer, (objectData.PathShearY).toByte())
            packByte(byteBuffer, (objectData.PathTwist).toByte())
            packByte(byteBuffer, (objectData.PathTwistBegin).toByte())
            packByte(byteBuffer, (objectData.PathRadiusOffset).toByte())
            packByte(byteBuffer, (objectData.PathTaperX).toByte())
            packByte(byteBuffer, (objectData.PathTaperY).toByte())
            packByte(byteBuffer, (objectData.PathRevolutions).toByte())
            packByte(byteBuffer, (objectData.PathSkew).toByte())
            packShort(byteBuffer, (short) objectData.ProfileBegin)
            packShort(byteBuffer, (short) objectData.ProfileEnd)
            packShort(byteBuffer, (short) objectData.ProfileHollow)
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
            packByte(byteBuffer, (objectData.Flags).toByte())
            packFloat(byteBuffer, objectData.Radius)
            packByte(byteBuffer, (objectData.JointType).toByte())
            packLLVector3(byteBuffer, objectData.JointPivot)
            packLLVector3(byteBuffer, objectData.JointAxisOrAnchor)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer)
        this.RegionData_Field.TimeDilation = unpackShort(byteBuffer) & 65535
        val i = byteBuffer.get().toInt() and 0xFF
        repeat(i) {
            val objectData = ObjectData()
            objectData.ID = unpackInt(byteBuffer)
            objectData.State = unpackByte(byteBuffer) & 0xFF
            objectData.FullID = unpackUUID(byteBuffer)
            objectData.CRC = unpackInt(byteBuffer)
            objectData.PCode = unpackByte(byteBuffer) & 0xFF
            objectData.Material = unpackByte(byteBuffer) & 0xFF
            objectData.ClickAction = unpackByte(byteBuffer) & 0xFF
            objectData.Scale = unpackLLVector3(byteBuffer)
            objectData.ObjectData = unpackVariable(byteBuffer, 1)
            objectData.ParentID = unpackInt(byteBuffer)
            objectData.UpdateFlags = unpackInt(byteBuffer)
            objectData.PathCurve = unpackByte(byteBuffer) & 0xFF
            objectData.ProfileCurve = unpackByte(byteBuffer) & 0xFF
            objectData.PathBegin = unpackShort(byteBuffer) & 65535
            objectData.PathEnd = unpackShort(byteBuffer) & 65535
            objectData.PathScaleX = unpackByte(byteBuffer) & 0xFF
            objectData.PathScaleY = unpackByte(byteBuffer) & 0xFF
            objectData.PathShearX = unpackByte(byteBuffer) & 0xFF
            objectData.PathShearY = unpackByte(byteBuffer) & 0xFF
            objectData.PathTwist = unpackByte(byteBuffer)
            objectData.PathTwistBegin = unpackByte(byteBuffer)
            objectData.PathRadiusOffset = unpackByte(byteBuffer)
            objectData.PathTaperX = unpackByte(byteBuffer)
            objectData.PathTaperY = unpackByte(byteBuffer)
            objectData.PathRevolutions = unpackByte(byteBuffer) & 0xFF
            objectData.PathSkew = unpackByte(byteBuffer)
            objectData.ProfileBegin = unpackShort(byteBuffer) & 65535
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
            objectData.Sound = unpackUUID(byteBuffer)
            objectData.OwnerID = unpackUUID(byteBuffer)
            objectData.Gain = unpackFloat(byteBuffer)
            objectData.Flags = unpackByte(byteBuffer) & 0xFF
            objectData.Radius = unpackFloat(byteBuffer)
            objectData.JointType = unpackByte(byteBuffer) & 0xFF
            objectData.JointPivot = unpackLLVector3(byteBuffer)
            objectData.JointAxisOrAnchor = unpackLLVector3(byteBuffer)
            this.ObjectData_Fields.add(objectData)
        }
    }
}
