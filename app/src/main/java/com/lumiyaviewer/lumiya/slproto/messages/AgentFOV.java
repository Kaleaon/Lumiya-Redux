package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AgentFOV - Update to agent's field of view, angle is vertical, single F32 float in radians
 *
 * <p>Template: {@code AgentFOV Low 82 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentFOV extends SLMessage {
    public AgentData AgentData_Field;
    public FOVBlock FOVBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int CircuitCode; // U32
        public UUID SessionID; // LLUUID
    }

    /** Block FOVBlock, Single. */
    public static class FOVBlock {
        public int GenCounter; // U32
        public float VerticalAngle; // F32
    }

    public AgentFOV() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.FOVBlock_Field = new FOVBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 48;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentFOV(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 82 (AgentFOV).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x52);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.CircuitCode);
        packInt(byteBuffer, this.FOVBlock_Field.GenCounter);
        packFloat(byteBuffer, this.FOVBlock_Field.VerticalAngle);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.CircuitCode = unpackInt(byteBuffer);
        this.FOVBlock_Field.GenCounter = unpackInt(byteBuffer);
        this.FOVBlock_Field.VerticalAngle = unpackFloat(byteBuffer);
    }
}
