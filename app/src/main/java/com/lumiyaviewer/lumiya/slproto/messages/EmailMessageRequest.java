package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Script on simulator asks dataserver if there are any email messages
 * waiting.
 *
 * <p>Template: {@code EmailMessageRequest Low 335 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class EmailMessageRequest extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public byte[] FromAddress; // Variable 1
        public UUID ObjectID; // LLUUID
        public byte[] Subject; // Variable 1
    }

    public EmailMessageRequest() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.FromAddress.length + 17 + 1 + this.DataBlock_Field.Subject.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEmailMessageRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 335 (EmailMessageRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x4F);
        packUUID(byteBuffer, this.DataBlock_Field.ObjectID);
        packVariable(byteBuffer, this.DataBlock_Field.FromAddress, 1);
        packVariable(byteBuffer, this.DataBlock_Field.Subject, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.ObjectID = unpackUUID(byteBuffer);
        this.DataBlock_Field.FromAddress = unpackVariable(byteBuffer, 1);
        this.DataBlock_Field.Subject = unpackVariable(byteBuffer, 1);
    }
}
