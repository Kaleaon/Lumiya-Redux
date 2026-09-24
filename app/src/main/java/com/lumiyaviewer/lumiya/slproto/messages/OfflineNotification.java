package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * OfflineNotification
 *
 * <p>Template: {@code OfflineNotification Low 323 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processOfflineNotification()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class OfflineNotification extends SLMessage {
    public ArrayList<AgentBlock> AgentBlock_Fields = new ArrayList<>();

    /** Block AgentBlock, Variable. */
    public static class AgentBlock {
        public UUID AgentID; // LLUUID
    }

    public OfflineNotification() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.AgentBlock_Fields.size() * 16) + 5;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleOfflineNotification(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 323 (OfflineNotification).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x43);
        byteBuffer.put((byte) this.AgentBlock_Fields.size());
        Iterator<?> it = this.AgentBlock_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((AgentBlock) it.next()).AgentID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            AgentBlock agentBlock = new AgentBlock();
            agentBlock.AgentID = unpackUUID(byteBuffer);
            this.AgentBlock_Fields.add(agentBlock);
        }
    }
}
