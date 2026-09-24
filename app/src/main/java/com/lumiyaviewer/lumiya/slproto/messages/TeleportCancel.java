package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * TeleportCancel viewer->sim
 * reliable
 *
 * <p>Template: {@code TeleportCancel Low 72 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class TeleportCancel extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    public TeleportCancel() {
        this.zeroCoded = false;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTeleportCancel(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 72 (TeleportCancel).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x48);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packUUID(byteBuffer, this.Info_Field.SessionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.SessionID = unpackUUID(byteBuffer);
    }
}
