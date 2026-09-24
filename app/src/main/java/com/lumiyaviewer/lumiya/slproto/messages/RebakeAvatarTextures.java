package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RebakeAvatarTextures
 * simulator -> viewer request when a temporary baked avatar texture is not found
 *
 * <p>Template: {@code RebakeAvatarTextures Low 87 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RebakeAvatarTextures extends SLMessage {
    public TextureData TextureData_Field;

    /** Block TextureData, Single. */
    public static class TextureData {
        public UUID TextureID; // LLUUID
    }

    public RebakeAvatarTextures() {
        this.zeroCoded = false;
        this.TextureData_Field = new TextureData();
    }

    @Override
    public int CalcPayloadSize() {
        return 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRebakeAvatarTextures(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 87 (RebakeAvatarTextures).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x57);
        packUUID(byteBuffer, this.TextureData_Field.TextureID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TextureData_Field.TextureID = unpackUUID(byteBuffer);
    }
}
