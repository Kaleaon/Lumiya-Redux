package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * LoadURL
 * sim -> viewer
 * Ask the user if they would like to load a URL
 * reliable
 *
 * <p>Template: {@code LoadURL Low 194 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_load_url()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class LoadURL extends SLMessage {
    public Data Data_Field;

    /** Block Data, Single. */
    public static class Data {
        public byte[] Message; // Variable 1
        public UUID ObjectID; // LLUUID
        public byte[] ObjectName; // Variable 1
        public UUID OwnerID; // LLUUID
        public boolean OwnerIsGroup; // BOOL
        public byte[] URL; // Variable 1
    }

    public LoadURL() {
        this.zeroCoded = false;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.ObjectName.length + 1 + 16 + 16 + 1 + 1 + this.Data_Field.Message.length + 1 + this.Data_Field.URL.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleLoadURL(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 194 (LoadURL).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xC2);
        packVariable(byteBuffer, this.Data_Field.ObjectName, 1);
        packUUID(byteBuffer, this.Data_Field.ObjectID);
        packUUID(byteBuffer, this.Data_Field.OwnerID);
        packBoolean(byteBuffer, this.Data_Field.OwnerIsGroup);
        packVariable(byteBuffer, this.Data_Field.Message, 1);
        packVariable(byteBuffer, this.Data_Field.URL, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.ObjectName = unpackVariable(byteBuffer, 1);
        this.Data_Field.ObjectID = unpackUUID(byteBuffer);
        this.Data_Field.OwnerID = unpackUUID(byteBuffer);
        this.Data_Field.OwnerIsGroup = unpackBoolean(byteBuffer);
        this.Data_Field.Message = unpackVariable(byteBuffer, 1);
        this.Data_Field.URL = unpackVariable(byteBuffer, 1);
    }
}
