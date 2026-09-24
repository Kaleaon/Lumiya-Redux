package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

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
public class ObjectAdd extends SLMessage {
    public AgentData AgentData_Field;
    public ObjectData ObjectData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
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

    public ObjectAdd() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return 146;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectAdd(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 1 (ObjectAdd).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x01);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PCode);
        packByte(byteBuffer, (byte) this.ObjectData_Field.Material);
        packInt(byteBuffer, this.ObjectData_Field.AddFlags);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathCurve);
        packByte(byteBuffer, (byte) this.ObjectData_Field.ProfileCurve);
        packShort(byteBuffer, (short) this.ObjectData_Field.PathBegin);
        packShort(byteBuffer, (short) this.ObjectData_Field.PathEnd);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathScaleX);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathScaleY);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathShearX);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathShearY);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathTwist);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathTwistBegin);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathRadiusOffset);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathTaperX);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathTaperY);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathRevolutions);
        packByte(byteBuffer, (byte) this.ObjectData_Field.PathSkew);
        packShort(byteBuffer, (short) this.ObjectData_Field.ProfileBegin);
        packShort(byteBuffer, (short) this.ObjectData_Field.ProfileEnd);
        packShort(byteBuffer, (short) this.ObjectData_Field.ProfileHollow);
        packByte(byteBuffer, (byte) this.ObjectData_Field.BypassRaycast);
        packLLVector3(byteBuffer, this.ObjectData_Field.RayStart);
        packLLVector3(byteBuffer, this.ObjectData_Field.RayEnd);
        packUUID(byteBuffer, this.ObjectData_Field.RayTargetID);
        packByte(byteBuffer, (byte) this.ObjectData_Field.RayEndIsIntersection);
        packLLVector3(byteBuffer, this.ObjectData_Field.Scale);
        packLLQuaternion(byteBuffer, this.ObjectData_Field.Rotation);
        packByte(byteBuffer, (byte) this.ObjectData_Field.State);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.ObjectData_Field.PCode = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.Material = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.AddFlags = unpackInt(byteBuffer);
        this.ObjectData_Field.PathCurve = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.ProfileCurve = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.PathBegin = unpackShort(byteBuffer) & 65535;
        this.ObjectData_Field.PathEnd = unpackShort(byteBuffer) & 65535;
        this.ObjectData_Field.PathScaleX = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.PathScaleY = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.PathShearX = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.PathShearY = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.PathTwist = unpackByte(byteBuffer);
        this.ObjectData_Field.PathTwistBegin = unpackByte(byteBuffer);
        this.ObjectData_Field.PathRadiusOffset = unpackByte(byteBuffer);
        this.ObjectData_Field.PathTaperX = unpackByte(byteBuffer);
        this.ObjectData_Field.PathTaperY = unpackByte(byteBuffer);
        this.ObjectData_Field.PathRevolutions = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.PathSkew = unpackByte(byteBuffer);
        this.ObjectData_Field.ProfileBegin = unpackShort(byteBuffer) & 65535;
        this.ObjectData_Field.ProfileEnd = unpackShort(byteBuffer) & 65535;
        this.ObjectData_Field.ProfileHollow = unpackShort(byteBuffer) & 65535;
        this.ObjectData_Field.BypassRaycast = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.RayStart = unpackLLVector3(byteBuffer);
        this.ObjectData_Field.RayEnd = unpackLLVector3(byteBuffer);
        this.ObjectData_Field.RayTargetID = unpackUUID(byteBuffer);
        this.ObjectData_Field.RayEndIsIntersection = unpackByte(byteBuffer) & 0xFF;
        this.ObjectData_Field.Scale = unpackLLVector3(byteBuffer);
        this.ObjectData_Field.Rotation = unpackLLQuaternion(byteBuffer);
        this.ObjectData_Field.State = unpackByte(byteBuffer) & 0xFF;
    }
}
