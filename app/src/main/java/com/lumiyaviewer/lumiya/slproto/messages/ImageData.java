package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ImageData - sent to viewer to transmit information about an image
 *
 * <p>Template: {@code ImageData High 9 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ImageData extends SLMessage {
    public ImageDataData ImageDataData_Field;
    public ImageID ImageID_Field;

    public static class ImageDataData {
        public byte[] Data; // Variable 2
    }

    /** Block ImageID, Single. */
    public static class ImageID {
        public int Codec; // U8
        public UUID ID; // LLUUID
        public int Packets; // U16
        public int Size; // U32
    }

    public ImageData() {
        this.zeroCoded = false;
        this.ImageID_Field = new ImageID();
        this.ImageDataData_Field = new ImageDataData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ImageDataData_Field.Data.length + 2 + 24;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleImageData(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 9 (ImageData).
        byteBuffer.put((byte) 0x09);
        packUUID(byteBuffer, this.ImageID_Field.ID);
        packByte(byteBuffer, (byte) this.ImageID_Field.Codec);
        packInt(byteBuffer, this.ImageID_Field.Size);
        packShort(byteBuffer, (short) this.ImageID_Field.Packets);
        packVariable(byteBuffer, this.ImageDataData_Field.Data, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ImageID_Field.ID = unpackUUID(byteBuffer);
        this.ImageID_Field.Codec = unpackByte(byteBuffer) & 0xFF;
        this.ImageID_Field.Size = unpackInt(byteBuffer);
        this.ImageID_Field.Packets = unpackShort(byteBuffer) & 65535;
        this.ImageDataData_Field.Data = unpackVariable(byteBuffer, 2);
    }
}
