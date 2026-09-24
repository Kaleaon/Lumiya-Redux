package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ScriptQuestion
 * reliable
 *
 * <p>Template: {@code ScriptQuestion Low 188 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_script_question()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ScriptQuestion extends SLMessage {
    public Data Data_Field;

    /** Block Data, Single. */
    public static class Data {
        public UUID ItemID; // LLUUID
        public byte[] ObjectName; // Variable 1
        public byte[] ObjectOwner; // Variable 1
        public int Questions; // S32
        public UUID TaskID; // LLUUID
    }

    public ScriptQuestion() {
        this.zeroCoded = false;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.ObjectName.length + 33 + 1 + this.Data_Field.ObjectOwner.length + 4 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleScriptQuestion(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 188 (ScriptQuestion).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xBC);
        packUUID(byteBuffer, this.Data_Field.TaskID);
        packUUID(byteBuffer, this.Data_Field.ItemID);
        packVariable(byteBuffer, this.Data_Field.ObjectName, 1);
        packVariable(byteBuffer, this.Data_Field.ObjectOwner, 1);
        packInt(byteBuffer, this.Data_Field.Questions);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.TaskID = unpackUUID(byteBuffer);
        this.Data_Field.ItemID = unpackUUID(byteBuffer);
        this.Data_Field.ObjectName = unpackVariable(byteBuffer, 1);
        this.Data_Field.ObjectOwner = unpackVariable(byteBuffer, 1);
        this.Data_Field.Questions = unpackInt(byteBuffer);
    }
}
