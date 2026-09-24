package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AgentUpdate - Camera info sent from viewer to simulator
 * or, more simply, two axes and compute cross product
 * State data is temporary, indicates current behavior state:
 * 0 = walking
 * 1 = mouselook
 * 2 = typing
 * Center is region local (JNC 8.16.2001)
 * Camera center is region local (JNC 8.29.2001)
 *
 * <p>Template: {@code AgentUpdate High 4 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentUpdate extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public LLQuaternion BodyRotation; // LLQuaternion
        public LLVector3 CameraAtAxis; // LLVector3
        public LLVector3 CameraCenter; // LLVector3
        public LLVector3 CameraLeftAxis; // LLVector3
        public LLVector3 CameraUpAxis; // LLVector3
        public int ControlFlags; // U32
        public float Far; // F32
        public int Flags; // U8
        public LLQuaternion HeadRotation; // LLQuaternion
        public UUID SessionID; // LLUUID
        public int State; // U8
    }

    public AgentUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 115;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 4 (AgentUpdate).
        byteBuffer.put((byte) 0x04);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packLLQuaternion(byteBuffer, this.AgentData_Field.BodyRotation);
        packLLQuaternion(byteBuffer, this.AgentData_Field.HeadRotation);
        packByte(byteBuffer, (byte) this.AgentData_Field.State);
        packLLVector3(byteBuffer, this.AgentData_Field.CameraCenter);
        packLLVector3(byteBuffer, this.AgentData_Field.CameraAtAxis);
        packLLVector3(byteBuffer, this.AgentData_Field.CameraLeftAxis);
        packLLVector3(byteBuffer, this.AgentData_Field.CameraUpAxis);
        packFloat(byteBuffer, this.AgentData_Field.Far);
        packInt(byteBuffer, this.AgentData_Field.ControlFlags);
        packByte(byteBuffer, (byte) this.AgentData_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.BodyRotation = unpackLLQuaternion(byteBuffer);
        this.AgentData_Field.HeadRotation = unpackLLQuaternion(byteBuffer);
        this.AgentData_Field.State = unpackByte(byteBuffer) & 0xFF;
        this.AgentData_Field.CameraCenter = unpackLLVector3(byteBuffer);
        this.AgentData_Field.CameraAtAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.CameraLeftAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.CameraUpAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.Far = unpackFloat(byteBuffer);
        this.AgentData_Field.ControlFlags = unpackInt(byteBuffer);
        this.AgentData_Field.Flags = unpackByte(byteBuffer) & 0xFF;
    }
}
