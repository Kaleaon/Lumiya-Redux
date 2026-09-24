package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * quit message sent between simulators
 *
 * <p>Template: {@code AgentQuitCopy Low 85 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentQuitCopy extends SLMessage {
    public AgentData AgentData_Field;
    public FuseBlock FuseBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block FuseBlock, Single. */
    public static class FuseBlock {
        public int ViewerCircuitCode; // U32
    }

    public AgentQuitCopy() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.FuseBlock_Field = new FuseBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentQuitCopy(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 85 (AgentQuitCopy).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x55);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.FuseBlock_Field.ViewerCircuitCode);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.FuseBlock_Field.ViewerCircuitCode = unpackInt(byteBuffer);
    }
}
