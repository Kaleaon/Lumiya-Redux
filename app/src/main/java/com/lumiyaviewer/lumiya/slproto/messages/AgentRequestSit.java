package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AgentRequestSit - Try to sit on an object
 *
 * <p>Template: {@code AgentRequestSit High 6 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentRequestSit extends SLMessage {
    public AgentData AgentData_Field;
    public TargetObject TargetObject_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block TargetObject, Single. */
    public static class TargetObject {
        public LLVector3 Offset; // LLVector3
        public UUID TargetID; // LLUUID
    }

    public AgentRequestSit() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.TargetObject_Field = new TargetObject();
    }

    @Override
    public int CalcPayloadSize() {
        return 61;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentRequestSit(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 6 (AgentRequestSit).
        byteBuffer.put((byte) 0x06);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.TargetObject_Field.TargetID);
        packLLVector3(byteBuffer, this.TargetObject_Field.Offset);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.TargetObject_Field.TargetID = unpackUUID(byteBuffer);
        this.TargetObject_Field.Offset = unpackLLVector3(byteBuffer);
    }
}
