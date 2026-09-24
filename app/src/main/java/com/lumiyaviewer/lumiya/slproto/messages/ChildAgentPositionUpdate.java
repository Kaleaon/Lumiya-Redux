package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ChildAgentPositionUpdate
 * sent to child agents just to keep them alive
 *
 * <p>Template: {@code ChildAgentPositionUpdate High 27 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ChildAgentPositionUpdate extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public LLVector3 AgentPos; // LLVector3
        public LLVector3 AgentVel; // LLVector3
        public LLVector3 AtAxis; // LLVector3
        public LLVector3 Center; // LLVector3
        public boolean ChangedGrid; // BOOL
        public LLVector3 LeftAxis; // LLVector3
        public long RegionHandle; // U64
        public UUID SessionID; // LLUUID
        public LLVector3 Size; // LLVector3
        public LLVector3 UpAxis; // LLVector3
        public int ViewerCircuitCode; // U32
    }

    public ChildAgentPositionUpdate() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 130;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleChildAgentPositionUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 27 (ChildAgentPositionUpdate).
        byteBuffer.put((byte) 0x1B);
        packLong(byteBuffer, this.AgentData_Field.RegionHandle);
        packInt(byteBuffer, this.AgentData_Field.ViewerCircuitCode);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packLLVector3(byteBuffer, this.AgentData_Field.AgentPos);
        packLLVector3(byteBuffer, this.AgentData_Field.AgentVel);
        packLLVector3(byteBuffer, this.AgentData_Field.Center);
        packLLVector3(byteBuffer, this.AgentData_Field.Size);
        packLLVector3(byteBuffer, this.AgentData_Field.AtAxis);
        packLLVector3(byteBuffer, this.AgentData_Field.LeftAxis);
        packLLVector3(byteBuffer, this.AgentData_Field.UpAxis);
        packBoolean(byteBuffer, this.AgentData_Field.ChangedGrid);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.RegionHandle = unpackLong(byteBuffer);
        this.AgentData_Field.ViewerCircuitCode = unpackInt(byteBuffer);
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.AgentPos = unpackLLVector3(byteBuffer);
        this.AgentData_Field.AgentVel = unpackLLVector3(byteBuffer);
        this.AgentData_Field.Center = unpackLLVector3(byteBuffer);
        this.AgentData_Field.Size = unpackLLVector3(byteBuffer);
        this.AgentData_Field.AtAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.LeftAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.UpAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.ChangedGrid = unpackBoolean(byteBuffer);
    }
}
