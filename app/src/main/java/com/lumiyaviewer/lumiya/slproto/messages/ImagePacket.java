package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ImagePacket - follow on image data for images having > 1 packet of data
 *
 * <p>Template: {@code ImagePacket High 10 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ImagePacket extends SLMessage {
    public ImageData ImageData_Field;
    public ImageID ImageID_Field;

    /** Block ImageData, Single. */
    public static class ImageData {
        public byte[] Data; // Variable 2
    }

    /** Block ImageID, Single. */
    public static class ImageID {
        public UUID ID; // LLUUID
        public int Packet; // U16
    }

    public ImagePacket() {
        this.zeroCoded = false;
        this.ImageID_Field = new ImageID();
        this.ImageData_Field = new ImageData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ImageData_Field.Data.length + 2 + 19;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleImagePacket(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 10 (ImagePacket).
        byteBuffer.put((byte) 0x0A);
        packUUID(byteBuffer, this.ImageID_Field.ID);
        packShort(byteBuffer, (short) this.ImageID_Field.Packet);
        packVariable(byteBuffer, this.ImageData_Field.Data, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ImageID_Field.ID = unpackUUID(byteBuffer);
        this.ImageID_Field.Packet = unpackShort(byteBuffer) & 65535;
        this.ImageData_Field.Data = unpackVariable(byteBuffer, 2);
    }
}
