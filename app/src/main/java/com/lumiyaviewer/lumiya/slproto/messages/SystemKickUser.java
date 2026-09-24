package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * SystemKickUser
 * user->space, reliable
 *
 * <p>Template: {@code SystemKickUser Low 166 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SystemKickUser extends SLMessage {
    public ArrayList<AgentInfo> AgentInfo_Fields = new ArrayList<>();

    /** Block AgentInfo, Variable. */
    public static class AgentInfo {
        public UUID AgentID; // LLUUID
    }

    public SystemKickUser() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.AgentInfo_Fields.size() * 16) + 5;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSystemKickUser(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 166 (SystemKickUser).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xA6);
        byteBuffer.put((byte) this.AgentInfo_Fields.size());
        Iterator<?> it = this.AgentInfo_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((AgentInfo) it.next()).AgentID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            AgentInfo agentInfo = new AgentInfo();
            agentInfo.AgentID = unpackUUID(byteBuffer);
            this.AgentInfo_Fields.add(agentInfo);
        }
    }
}
