package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * TeleportLandmarkRequest viewer->sim
 * teleport to landmark asset ID destination. use LLUUD::null for home.
 *
 * <p>Template: {@code TeleportLandmarkRequest Low 65 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class TeleportLandmarkRequest extends SLMessage {
    public Info Info_Field;

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public UUID LandmarkID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    public TeleportLandmarkRequest() {
        this.zeroCoded = true;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTeleportLandmarkRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 65 (TeleportLandmarkRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x41);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packUUID(byteBuffer, this.Info_Field.SessionID);
        packUUID(byteBuffer, this.Info_Field.LandmarkID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.SessionID = unpackUUID(byteBuffer);
        this.Info_Field.LandmarkID = unpackUUID(byteBuffer);
    }
}
