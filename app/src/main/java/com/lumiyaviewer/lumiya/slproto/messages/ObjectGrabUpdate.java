package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ObjectGrabUpdate
 * TODO: Quantize this data, reduce message size.
 * TimeSinceLast could go to 1 byte, since capped
 * at 100 on sim.
 *
 * <p>Template: {@code ObjectGrabUpdate Low 118 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectGrabUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ObjectData ObjectData_Field;
    public ArrayList<SurfaceInfo> SurfaceInfo_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public LLVector3 GrabOffsetInitial; // LLVector3
        public LLVector3 GrabPosition; // LLVector3 - , region local
        public UUID ObjectID; // LLUUID
        public int TimeSinceLast; // U32
    }

    /** Block SurfaceInfo, Variable. */
    public static class SurfaceInfo {
        public LLVector3 Binormal; // LLVector3
        public int FaceIndex; // S32
        public LLVector3 Normal; // LLVector3
        public LLVector3 Position; // LLVector3
        public LLVector3 STCoord; // LLVector3
        public LLVector3 UVCoord; // LLVector3
    }

    public ObjectGrabUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.SurfaceInfo_Fields.size() * 64) + 81;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectGrabUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 118 (ObjectGrabUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x76);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.ObjectData_Field.ObjectID);
        packLLVector3(byteBuffer, this.ObjectData_Field.GrabOffsetInitial);
        packLLVector3(byteBuffer, this.ObjectData_Field.GrabPosition);
        packInt(byteBuffer, this.ObjectData_Field.TimeSinceLast);
        byteBuffer.put((byte) this.SurfaceInfo_Fields.size());
        for (SurfaceInfo surfaceInfo : this.SurfaceInfo_Fields) {
            packLLVector3(byteBuffer, surfaceInfo.UVCoord);
            packLLVector3(byteBuffer, surfaceInfo.STCoord);
            packInt(byteBuffer, surfaceInfo.FaceIndex);
            packLLVector3(byteBuffer, surfaceInfo.Position);
            packLLVector3(byteBuffer, surfaceInfo.Normal);
            packLLVector3(byteBuffer, surfaceInfo.Binormal);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ObjectData_Field.ObjectID = unpackUUID(byteBuffer);
        this.ObjectData_Field.GrabOffsetInitial = unpackLLVector3(byteBuffer);
        this.ObjectData_Field.GrabPosition = unpackLLVector3(byteBuffer);
        this.ObjectData_Field.TimeSinceLast = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            SurfaceInfo surfaceInfo = new SurfaceInfo();
            surfaceInfo.UVCoord = unpackLLVector3(byteBuffer);
            surfaceInfo.STCoord = unpackLLVector3(byteBuffer);
            surfaceInfo.FaceIndex = unpackInt(byteBuffer);
            surfaceInfo.Position = unpackLLVector3(byteBuffer);
            surfaceInfo.Normal = unpackLLVector3(byteBuffer);
            surfaceInfo.Binormal = unpackLLVector3(byteBuffer);
            this.SurfaceInfo_Fields.add(surfaceInfo);
        }
    }
}
