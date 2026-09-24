package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AttachedSoundGainChange - Sent by simulator to viewer to change an attached sounds' volume
 *
 * <p>Template: {@code AttachedSoundGainChange Medium 14 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_attached_sound_gain_change()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AttachedSoundGainChange extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public float Gain; // F32
        public UUID ObjectID; // LLUUID
    }

    public AttachedSoundGainChange() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 22;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAttachedSoundGainChange(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 14 (AttachedSoundGainChange).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x0E);
        packUUID(byteBuffer, this.DataBlock_Field.ObjectID);
        packFloat(byteBuffer, this.DataBlock_Field.Gain);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.ObjectID = unpackUUID(byteBuffer);
        this.DataBlock_Field.Gain = unpackFloat(byteBuffer);
    }
}
