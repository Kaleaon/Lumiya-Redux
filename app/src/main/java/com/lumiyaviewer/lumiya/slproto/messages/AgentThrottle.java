package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AgentThrottle
 *
 * <p>Template: {@code AgentThrottle Low 81 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentThrottle extends SLMessage {
    public AgentData AgentData_Field;
    public Throttle Throttle_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int CircuitCode; // U32
        public UUID SessionID; // LLUUID
    }

    /** Block Throttle, Single. */
    public static class Throttle {
        public int GenCounter; // U32
        public byte[] Throttles; // Variable 1
    }

    public AgentThrottle() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Throttle_Field = new Throttle();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Throttle_Field.Throttles.length + 5 + 40;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAgentThrottle(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 81 (AgentThrottle).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x51);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.CircuitCode);
        packInt(byteBuffer, this.Throttle_Field.GenCounter);
        packVariable(byteBuffer, this.Throttle_Field.Throttles, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.CircuitCode = unpackInt(byteBuffer);
        this.Throttle_Field.GenCounter = unpackInt(byteBuffer);
        this.Throttle_Field.Throttles = unpackVariable(byteBuffer, 1);
    }
}
