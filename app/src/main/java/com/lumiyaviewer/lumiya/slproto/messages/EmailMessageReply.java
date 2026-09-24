package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Dataserver gives simulator the oldest email message in the queue, along with
 * how many messages are left in the queue.  And passes back the filter used to request emails.
 *
 * <p>Template: {@code EmailMessageReply Low 336 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class EmailMessageReply extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public byte[] Data; // Variable 2
        public byte[] FromAddress; // Variable 1
        public byte[] MailFilter; // Variable 1
        public int More; // U32
        public UUID ObjectID; // LLUUID
        public byte[] Subject; // Variable 1
        public int Time; // U32
    }

    public EmailMessageReply() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.FromAddress.length + 25 + 1 + this.DataBlock_Field.Subject.length + 2 + this.DataBlock_Field.Data.length + 1 + this.DataBlock_Field.MailFilter.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleEmailMessageReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 336 (EmailMessageReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x50);
        packUUID(byteBuffer, this.DataBlock_Field.ObjectID);
        packInt(byteBuffer, this.DataBlock_Field.More);
        packInt(byteBuffer, this.DataBlock_Field.Time);
        packVariable(byteBuffer, this.DataBlock_Field.FromAddress, 1);
        packVariable(byteBuffer, this.DataBlock_Field.Subject, 1);
        packVariable(byteBuffer, this.DataBlock_Field.Data, 2);
        packVariable(byteBuffer, this.DataBlock_Field.MailFilter, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.ObjectID = unpackUUID(byteBuffer);
        this.DataBlock_Field.More = unpackInt(byteBuffer);
        this.DataBlock_Field.Time = unpackInt(byteBuffer);
        this.DataBlock_Field.FromAddress = unpackVariable(byteBuffer, 1);
        this.DataBlock_Field.Subject = unpackVariable(byteBuffer, 1);
        this.DataBlock_Field.Data = unpackVariable(byteBuffer, 2);
        this.DataBlock_Field.MailFilter = unpackVariable(byteBuffer, 1);
    }
}
