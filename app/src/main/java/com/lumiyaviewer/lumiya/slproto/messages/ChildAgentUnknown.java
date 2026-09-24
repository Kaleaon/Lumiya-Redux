package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * This is sent if a full child agent hasn't been accepted yet
 *
 * <p>Template: {@code ChildAgentUnknown Low 241 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ChildAgentUnknown extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    public ChildAgentUnknown() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleChildAgentUnknown(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 241 (ChildAgentUnknown).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF1);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
    }
}
