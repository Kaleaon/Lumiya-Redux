package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DetachAttachmentIntoInv
 *
 * <p>Template: {@code DetachAttachmentIntoInv Low 397 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class DetachAttachmentIntoInv extends SLMessage {
    public ObjectData ObjectData_Field;

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public UUID AgentID; // LLUUID
        public UUID ItemID; // LLUUID
    }

    public DetachAttachmentIntoInv() {
        this.zeroCoded = false;
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDetachAttachmentIntoInv(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 397 (DetachAttachmentIntoInv).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x8D);
        packUUID(byteBuffer, this.ObjectData_Field.AgentID);
        packUUID(byteBuffer, this.ObjectData_Field.ItemID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ObjectData_Field.AgentID = unpackUUID(byteBuffer);
        this.ObjectData_Field.ItemID = unpackUUID(byteBuffer);
    }
}
