package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

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
public class ObjectUpdate extends SLMessage {
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();
    public RegionData RegionData_Field;

    /** Block ObjectData, Variable. */
    public static class ObjectData {
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
    public static class RegionData {
        public long RegionHandle; // U64
        public int TimeDilation; // U16
    }

    public ObjectUpdate() {
        this.zeroCoded = true;
        this.RegionData_Field = new RegionData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 12;
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            ObjectData objectData = (ObjectData) it.next();
            i = objectData.ExtraParams.length + objectData.ObjectData.length + 41 + 4 + 4 + 1 + 1 + 2 + 2 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 2 + 2 + 2 + 2 + objectData.TextureEntry.length + 1 + objectData.TextureAnim.length + 2 + objectData.NameValue.length + 2 + objectData.Data.length + 1 + objectData.Text.length + 4 + 1 + objectData.MediaURL.length + 1 + objectData.PSBlock.length + 1 + 16 + 16 + 4 + 1 + 4 + 1 + 12 + 12 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 12 (ObjectUpdate).
        byteBuffer.put((byte) 0x0C);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
        packShort(byteBuffer, (short) this.RegionData_Field.TimeDilation);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ID);
            packByte(byteBuffer, (byte) objectData.State);
            packUUID(byteBuffer, objectData.FullID);
            packInt(byteBuffer, objectData.CRC);
            packByte(byteBuffer, (byte) objectData.PCode);
            packByte(byteBuffer, (byte) objectData.Material);
            packByte(byteBuffer, (byte) objectData.ClickAction);
            packLLVector3(byteBuffer, objectData.Scale);
            packVariable(byteBuffer, objectData.ObjectData, 1);
            packInt(byteBuffer, objectData.ParentID);
            packInt(byteBuffer, objectData.UpdateFlags);
            packByte(byteBuffer, (byte) objectData.PathCurve);
            packByte(byteBuffer, (byte) objectData.ProfileCurve);
            packShort(byteBuffer, (short) objectData.PathBegin);
            packShort(byteBuffer, (short) objectData.PathEnd);
            packByte(byteBuffer, (byte) objectData.PathScaleX);
            packByte(byteBuffer, (byte) objectData.PathScaleY);
            packByte(byteBuffer, (byte) objectData.PathShearX);
            packByte(byteBuffer, (byte) objectData.PathShearY);
            packByte(byteBuffer, (byte) objectData.PathTwist);
            packByte(byteBuffer, (byte) objectData.PathTwistBegin);
            packByte(byteBuffer, (byte) objectData.PathRadiusOffset);
            packByte(byteBuffer, (byte) objectData.PathTaperX);
            packByte(byteBuffer, (byte) objectData.PathTaperY);
            packByte(byteBuffer, (byte) objectData.PathRevolutions);
            packByte(byteBuffer, (byte) objectData.PathSkew);
            packShort(byteBuffer, (short) objectData.ProfileBegin);
            packShort(byteBuffer, (short) objectData.ProfileEnd);
            packShort(byteBuffer, (short) objectData.ProfileHollow);
            packVariable(byteBuffer, objectData.TextureEntry, 2);
            packVariable(byteBuffer, objectData.TextureAnim, 1);
            packVariable(byteBuffer, objectData.NameValue, 2);
            packVariable(byteBuffer, objectData.Data, 2);
            packVariable(byteBuffer, objectData.Text, 1);
            packFixed(byteBuffer, objectData.TextColor, 4);
            packVariable(byteBuffer, objectData.MediaURL, 1);
            packVariable(byteBuffer, objectData.PSBlock, 1);
            packVariable(byteBuffer, objectData.ExtraParams, 1);
            packUUID(byteBuffer, objectData.Sound);
            packUUID(byteBuffer, objectData.OwnerID);
            packFloat(byteBuffer, objectData.Gain);
            packByte(byteBuffer, (byte) objectData.Flags);
            packFloat(byteBuffer, objectData.Radius);
            packByte(byteBuffer, (byte) objectData.JointType);
            packLLVector3(byteBuffer, objectData.JointPivot);
            packLLVector3(byteBuffer, objectData.JointAxisOrAnchor);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
        this.RegionData_Field.TimeDilation = unpackShort(byteBuffer) & 65535;
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ObjectData objectData = new ObjectData();
            objectData.ID = unpackInt(byteBuffer);
            objectData.State = unpackByte(byteBuffer) & 0xFF;
            objectData.FullID = unpackUUID(byteBuffer);
            objectData.CRC = unpackInt(byteBuffer);
            objectData.PCode = unpackByte(byteBuffer) & 0xFF;
            objectData.Material = unpackByte(byteBuffer) & 0xFF;
            objectData.ClickAction = unpackByte(byteBuffer) & 0xFF;
            objectData.Scale = unpackLLVector3(byteBuffer);
            objectData.ObjectData = unpackVariable(byteBuffer, 1);
            objectData.ParentID = unpackInt(byteBuffer);
            objectData.UpdateFlags = unpackInt(byteBuffer);
            objectData.PathCurve = unpackByte(byteBuffer) & 0xFF;
            objectData.ProfileCurve = unpackByte(byteBuffer) & 0xFF;
            objectData.PathBegin = unpackShort(byteBuffer) & 65535;
            objectData.PathEnd = unpackShort(byteBuffer) & 65535;
            objectData.PathScaleX = unpackByte(byteBuffer) & 0xFF;
            objectData.PathScaleY = unpackByte(byteBuffer) & 0xFF;
            objectData.PathShearX = unpackByte(byteBuffer) & 0xFF;
            objectData.PathShearY = unpackByte(byteBuffer) & 0xFF;
            objectData.PathTwist = unpackByte(byteBuffer);
            objectData.PathTwistBegin = unpackByte(byteBuffer);
            objectData.PathRadiusOffset = unpackByte(byteBuffer);
            objectData.PathTaperX = unpackByte(byteBuffer);
            objectData.PathTaperY = unpackByte(byteBuffer);
            objectData.PathRevolutions = unpackByte(byteBuffer) & 0xFF;
            objectData.PathSkew = unpackByte(byteBuffer);
            objectData.ProfileBegin = unpackShort(byteBuffer) & 65535;
            objectData.ProfileEnd = unpackShort(byteBuffer) & 65535;
            objectData.ProfileHollow = unpackShort(byteBuffer) & 65535;
            objectData.TextureEntry = unpackVariable(byteBuffer, 2);
            objectData.TextureAnim = unpackVariable(byteBuffer, 1);
            objectData.NameValue = unpackVariable(byteBuffer, 2);
            objectData.Data = unpackVariable(byteBuffer, 2);
            objectData.Text = unpackVariable(byteBuffer, 1);
            objectData.TextColor = unpackFixed(byteBuffer, 4);
            objectData.MediaURL = unpackVariable(byteBuffer, 1);
            objectData.PSBlock = unpackVariable(byteBuffer, 1);
            objectData.ExtraParams = unpackVariable(byteBuffer, 1);
            objectData.Sound = unpackUUID(byteBuffer);
            objectData.OwnerID = unpackUUID(byteBuffer);
            objectData.Gain = unpackFloat(byteBuffer);
            objectData.Flags = unpackByte(byteBuffer) & 0xFF;
            objectData.Radius = unpackFloat(byteBuffer);
            objectData.JointType = unpackByte(byteBuffer) & 0xFF;
            objectData.JointPivot = unpackLLVector3(byteBuffer);
            objectData.JointAxisOrAnchor = unpackLLVector3(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
