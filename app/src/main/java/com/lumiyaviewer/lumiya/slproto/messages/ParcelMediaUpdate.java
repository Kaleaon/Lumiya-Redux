package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelMediaUpdate
 * Sends a parcel media update to a single user
 * For global updates use the parcel manager.
 *
 * <p>Template: {@code ParcelMediaUpdate Low 420 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code parcelMediaUpdateHandler()} in indra/newview/llviewerparcelmedia.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ParcelMediaUpdate extends SLMessage {
    public DataBlockExtended DataBlockExtended_Field;
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public int MediaAutoScale; // U8
        public UUID MediaID; // LLUUID
        public byte[] MediaURL; // Variable 1 - string
    }

    /** Block DataBlockExtended, Single. */
    public static class DataBlockExtended {
        public byte[] MediaDesc; // Variable 1
        public int MediaHeight; // S32
        public int MediaLoop; // U8
        public byte[] MediaType; // Variable 1
        public int MediaWidth; // S32
    }

    public ParcelMediaUpdate() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
        this.DataBlockExtended_Field = new DataBlockExtended();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.MediaURL.length + 1 + 16 + 1 + 4 + this.DataBlockExtended_Field.MediaType.length + 1 + 1 + this.DataBlockExtended_Field.MediaDesc.length + 4 + 4 + 1;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleParcelMediaUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 420 (ParcelMediaUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA4);
        packVariable(byteBuffer, this.DataBlock_Field.MediaURL, 1);
        packUUID(byteBuffer, this.DataBlock_Field.MediaID);
        packByte(byteBuffer, (byte) this.DataBlock_Field.MediaAutoScale);
        packVariable(byteBuffer, this.DataBlockExtended_Field.MediaType, 1);
        packVariable(byteBuffer, this.DataBlockExtended_Field.MediaDesc, 1);
        packInt(byteBuffer, this.DataBlockExtended_Field.MediaWidth);
        packInt(byteBuffer, this.DataBlockExtended_Field.MediaHeight);
        packByte(byteBuffer, (byte) this.DataBlockExtended_Field.MediaLoop);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.MediaURL = unpackVariable(byteBuffer, 1);
        this.DataBlock_Field.MediaID = unpackUUID(byteBuffer);
        this.DataBlock_Field.MediaAutoScale = unpackByte(byteBuffer) & 0xFF;
        this.DataBlockExtended_Field.MediaType = unpackVariable(byteBuffer, 1);
        this.DataBlockExtended_Field.MediaDesc = unpackVariable(byteBuffer, 1);
        this.DataBlockExtended_Field.MediaWidth = unpackInt(byteBuffer);
        this.DataBlockExtended_Field.MediaHeight = unpackInt(byteBuffer);
        this.DataBlockExtended_Field.MediaLoop = unpackByte(byteBuffer) & 0xFF;
    }
}
