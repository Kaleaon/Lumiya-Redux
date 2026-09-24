package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * FormFriendship
 *
 * <p>Template: {@code FormFriendship Low 299 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class FormFriendship extends SLMessage {
    public AgentBlock AgentBlock_Field;

    /** Block AgentBlock, Single. */
    public static class AgentBlock {
        public UUID DestID; // LLUUID
        public UUID SourceID; // LLUUID
    }

    public FormFriendship() {
        this.zeroCoded = false;
        this.AgentBlock_Field = new AgentBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleFormFriendship(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 299 (FormFriendship).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x2B);
        packUUID(byteBuffer, this.AgentBlock_Field.SourceID);
        packUUID(byteBuffer, this.AgentBlock_Field.DestID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentBlock_Field.SourceID = unpackUUID(byteBuffer);
        this.AgentBlock_Field.DestID = unpackUUID(byteBuffer);
    }
}
