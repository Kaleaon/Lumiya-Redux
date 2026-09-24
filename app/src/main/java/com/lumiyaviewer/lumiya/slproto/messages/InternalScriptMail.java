package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Script on simulator sends mail to another script
 *
 * <p>Template: {@code InternalScriptMail Medium 16 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class InternalScriptMail extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public byte[] Body; // Variable 2
        public byte[] From; // Variable 1
        public byte[] Subject; // Variable 1
        public UUID To; // LLUUID
    }

    public InternalScriptMail() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.From.length + 1 + 16 + 1 + this.DataBlock_Field.Subject.length + 2 + this.DataBlock_Field.Body.length + 2;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleInternalScriptMail(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 16 (InternalScriptMail).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x10);
        packVariable(byteBuffer, this.DataBlock_Field.From, 1);
        packUUID(byteBuffer, this.DataBlock_Field.To);
        packVariable(byteBuffer, this.DataBlock_Field.Subject, 1);
        packVariable(byteBuffer, this.DataBlock_Field.Body, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.From = unpackVariable(byteBuffer, 1);
        this.DataBlock_Field.To = unpackUUID(byteBuffer);
        this.DataBlock_Field.Subject = unpackVariable(byteBuffer, 1);
        this.DataBlock_Field.Body = unpackVariable(byteBuffer, 2);
    }
}
