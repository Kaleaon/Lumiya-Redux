package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * notification for login and logout.
 * source_sim -> dest_viewer
 *
 * <p>Template: {@code OnlineNotification Low 322 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processOnlineNotification()} in indra/newview/llcallingcard.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class OnlineNotification extends SLMessage {
    public ArrayList<AgentBlock> AgentBlock_Fields = new ArrayList<>();

    /** Block AgentBlock, Variable. */
    public static class AgentBlock {
        public UUID AgentID; // LLUUID
    }

    public OnlineNotification() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.AgentBlock_Fields.size() * 16) + 5;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleOnlineNotification(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 322 (OnlineNotification).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x42);
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
