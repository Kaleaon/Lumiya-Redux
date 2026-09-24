package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AttachedSound - Sent by simulator to viewer to play sound attached with an object
 *
 * <p>Template: {@code AttachedSound Medium 13 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code null_message_callback()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AttachedSound extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public int Flags; // U8
        public float Gain; // F32
        public UUID ObjectID; // LLUUID
        public UUID OwnerID; // LLUUID
        public UUID SoundID; // LLUUID
    }

    public AttachedSound() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 55;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAttachedSound(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 13 (AttachedSound).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x0D);
        packUUID(byteBuffer, this.DataBlock_Field.SoundID);
        packUUID(byteBuffer, this.DataBlock_Field.ObjectID);
        packUUID(byteBuffer, this.DataBlock_Field.OwnerID);
        packFloat(byteBuffer, this.DataBlock_Field.Gain);
        packByte(byteBuffer, (byte) this.DataBlock_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.SoundID = unpackUUID(byteBuffer);
        this.DataBlock_Field.ObjectID = unpackUUID(byteBuffer);
        this.DataBlock_Field.OwnerID = unpackUUID(byteBuffer);
        this.DataBlock_Field.Gain = unpackFloat(byteBuffer);
        this.DataBlock_Field.Flags = unpackByte(byteBuffer) & 0xFF;
    }
}
