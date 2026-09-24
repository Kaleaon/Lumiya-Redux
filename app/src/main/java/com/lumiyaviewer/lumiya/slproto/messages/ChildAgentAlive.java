package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ChildAgentAlive
 * sent to child agents just to keep them alive
 *
 * <p>Template: {@code ChildAgentAlive High 26 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ChildAgentAlive extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public long RegionHandle; // U64
        public UUID SessionID; // LLUUID
        public int ViewerCircuitCode; // U32
    }

    public ChildAgentAlive() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 45;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleChildAgentAlive(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 26 (ChildAgentAlive).
        byteBuffer.put((byte) 0x1A);
        packLong(byteBuffer, this.AgentData_Field.RegionHandle);
        packInt(byteBuffer, this.AgentData_Field.ViewerCircuitCode);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.RegionHandle = unpackLong(byteBuffer);
        this.AgentData_Field.ViewerCircuitCode = unpackInt(byteBuffer);
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
    }
}
