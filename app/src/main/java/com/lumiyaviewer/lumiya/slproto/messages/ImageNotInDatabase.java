package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ImageNotInDatabase
 * Simulator informs viewer that a requsted image definitely does not exist in the asset database
 *
 * <p>Template: {@code ImageNotInDatabase Low 86 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerTextureList::processImageNotInDatabase()} in indra/newview/llviewertexturelist.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ImageNotInDatabase extends SLMessage {
    public ImageID ImageID_Field;

    /** Block ImageID, Single. */
    public static class ImageID {
        public UUID ID; // LLUUID
    }

    public ImageNotInDatabase() {
        this.zeroCoded = false;
        this.ImageID_Field = new ImageID();
    }

    @Override
    public int CalcPayloadSize() {
        return 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleImageNotInDatabase(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 86 (ImageNotInDatabase).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x56);
        packUUID(byteBuffer, this.ImageID_Field.ID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ImageID_Field.ID = unpackUUID(byteBuffer);
    }
}
