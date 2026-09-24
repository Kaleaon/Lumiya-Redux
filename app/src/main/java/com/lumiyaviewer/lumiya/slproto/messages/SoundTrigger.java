package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GUIDed Sound messages
 * SoundTrigger - Sent by simulator to viewer to trigger sound outside current region
 *
 * <p>Template: {@code SoundTrigger High 29 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code null_message_callback()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class SoundTrigger extends SLMessage {
    public SoundData SoundData_Field;

    /** Block SoundData, Single. */
    public static class SoundData {
        public float Gain; // F32
        public long Handle; // U64 - region handle
        public UUID ObjectID; // LLUUID
        public UUID OwnerID; // LLUUID
        public UUID ParentID; // LLUUID - null if this object is the parent
        public LLVector3 Position; // LLVector3 - region local
        public UUID SoundID; // LLUUID
    }

    public SoundTrigger() {
        this.zeroCoded = false;
        this.SoundData_Field = new SoundData();
    }

    @Override
    public int CalcPayloadSize() {
        return 89;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSoundTrigger(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 29 (SoundTrigger).
        byteBuffer.put((byte) 0x1D);
        packUUID(byteBuffer, this.SoundData_Field.SoundID);
        packUUID(byteBuffer, this.SoundData_Field.OwnerID);
        packUUID(byteBuffer, this.SoundData_Field.ObjectID);
        packUUID(byteBuffer, this.SoundData_Field.ParentID);
        packLong(byteBuffer, this.SoundData_Field.Handle);
        packLLVector3(byteBuffer, this.SoundData_Field.Position);
        packFloat(byteBuffer, this.SoundData_Field.Gain);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SoundData_Field.SoundID = unpackUUID(byteBuffer);
        this.SoundData_Field.OwnerID = unpackUUID(byteBuffer);
        this.SoundData_Field.ObjectID = unpackUUID(byteBuffer);
        this.SoundData_Field.ParentID = unpackUUID(byteBuffer);
        this.SoundData_Field.Handle = unpackLong(byteBuffer);
        this.SoundData_Field.Position = unpackLLVector3(byteBuffer);
        this.SoundData_Field.Gain = unpackFloat(byteBuffer);
    }
}
