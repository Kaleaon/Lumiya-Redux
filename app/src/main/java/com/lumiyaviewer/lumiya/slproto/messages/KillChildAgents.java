package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * KillChildAgents - A new agent has connected to the simulator . . . make sure that any old child cameras are blitzed
 *
 * <p>Template: {@code KillChildAgents Low 242 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class KillChildAgents extends SLMessage {
    public IDBlock IDBlock_Field;

    /** Block IDBlock, Single. */
    public static class IDBlock {
        public UUID AgentID; // LLUUID
    }

    public KillChildAgents() {
        this.zeroCoded = false;
        this.IDBlock_Field = new IDBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleKillChildAgents(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 242 (KillChildAgents).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF2);
        packUUID(byteBuffer, this.IDBlock_Field.AgentID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.IDBlock_Field.AgentID = unpackUUID(byteBuffer);
    }
}
