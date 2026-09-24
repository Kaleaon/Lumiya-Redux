package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ObjectDeGrab
 *
 * <p>Template: {@code ObjectDeGrab Low 119 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectDeGrab extends SLMessage {
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
        public int LocalID; // U32
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

    public ObjectDeGrab() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.SurfaceInfo_Fields.size() * 64) + 41;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectDeGrab(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 119 (ObjectDeGrab).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x77);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ObjectData_Field.LocalID);
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
        this.ObjectData_Field.LocalID = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
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
