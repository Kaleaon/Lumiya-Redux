package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * PreloadSound - Sent by simulator to viewer to preload sound for an object
 *
 * <p>Template: {@code PreloadSound Medium 15 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_preload_sound()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class PreloadSound extends SLMessage {
    public ArrayList<DataBlock> DataBlock_Fields = new ArrayList<>();

    /** Block DataBlock, Variable. */
    public static class DataBlock {
        public UUID ObjectID; // LLUUID
        public UUID OwnerID; // LLUUID
        public UUID SoundID; // LLUUID
    }

    public PreloadSound() {
        this.zeroCoded = false;
    }

    @Override
    public int CalcPayloadSize() {
        return (this.DataBlock_Fields.size() * 48) + 3;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandlePreloadSound(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 15 (PreloadSound).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x0F);
        byteBuffer.put((byte) this.DataBlock_Fields.size());
        for (DataBlock dataBlock : this.DataBlock_Fields) {
            packUUID(byteBuffer, dataBlock.ObjectID);
            packUUID(byteBuffer, dataBlock.OwnerID);
            packUUID(byteBuffer, dataBlock.SoundID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            DataBlock dataBlock = new DataBlock();
            dataBlock.ObjectID = unpackUUID(byteBuffer);
            dataBlock.OwnerID = unpackUUID(byteBuffer);
            dataBlock.SoundID = unpackUUID(byteBuffer);
            this.DataBlock_Fields.add(dataBlock);
        }
    }
}
