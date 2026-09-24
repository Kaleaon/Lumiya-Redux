package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RequestPayPrice
 * viewer -> sim
 *
 * <p>Template: {@code RequestPayPrice Low 161 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestPayPrice extends SLMessage {
    public ObjectData ObjectData_Field;

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public UUID ObjectID; // LLUUID
    }

    public RequestPayPrice() {
        this.zeroCoded = false;
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRequestPayPrice(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 161 (RequestPayPrice).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xA1);
        packUUID(byteBuffer, this.ObjectData_Field.ObjectID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ObjectData_Field.ObjectID = unpackUUID(byteBuffer);
    }
}
