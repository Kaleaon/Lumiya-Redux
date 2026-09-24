package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * TeleportLureRequest viewer->sim
 * Message from target of lure to begin the teleport process on the
 * local simulator.
 *
 * <p>Template: {@code TeleportLureRequest Low 71 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class TeleportLureRequest extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public UUID LureID; // LLUUID
        public UUID SessionID; // LLUUID
        public int TeleportFlags; // U32
    }

    public TeleportLureRequest() {
        this.zeroCoded = false;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTeleportLureRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 71 (TeleportLureRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x47);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packUUID(byteBuffer, this.Info_Field.SessionID);
        packUUID(byteBuffer, this.Info_Field.LureID);
        packInt(byteBuffer, this.Info_Field.TeleportFlags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.SessionID = unpackUUID(byteBuffer);
        this.Info_Field.LureID = unpackUUID(byteBuffer);
        this.Info_Field.TeleportFlags = unpackInt(byteBuffer);
    }
}
