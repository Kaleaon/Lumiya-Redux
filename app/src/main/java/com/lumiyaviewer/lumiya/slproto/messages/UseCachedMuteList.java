package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * tell viewer to use the local mute cache
 *
 * <p>Template: {@code UseCachedMuteList Low 319 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class UseCachedMuteList extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    public UseCachedMuteList() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUseCachedMuteList(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 319 (UseCachedMuteList).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x3F);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
    }
}
