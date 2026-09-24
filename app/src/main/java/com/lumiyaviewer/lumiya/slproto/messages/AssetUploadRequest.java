package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Asset storage messages
 * current assumes an existing UUID, need to enhance for new assets
 *
 * <p>Template: {@code AssetUploadRequest Low 333 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AssetUploadRequest extends SLMessage {
    public AssetBlock AssetBlock_Field;

    /** Block AssetBlock, Single. */
    public static class AssetBlock {
        public byte[] AssetData; // Variable 2 - Optional: the actual asset data if the whole thing will fit it this packet
        public boolean StoreLocal; // BOOL
        public boolean Tempfile; // BOOL
        public UUID TransactionID; // LLUUID
        public int Type; // S8
    }

    public AssetUploadRequest() {
        this.zeroCoded = false;
        this.AssetBlock_Field = new AssetBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.AssetBlock_Field.AssetData.length + 21 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAssetUploadRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 333 (AssetUploadRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x4D);
        packUUID(byteBuffer, this.AssetBlock_Field.TransactionID);
        packByte(byteBuffer, (byte) this.AssetBlock_Field.Type);
        packBoolean(byteBuffer, this.AssetBlock_Field.Tempfile);
        packBoolean(byteBuffer, this.AssetBlock_Field.StoreLocal);
        packVariable(byteBuffer, this.AssetBlock_Field.AssetData, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AssetBlock_Field.TransactionID = unpackUUID(byteBuffer);
        this.AssetBlock_Field.Type = unpackByte(byteBuffer);
        this.AssetBlock_Field.Tempfile = unpackBoolean(byteBuffer);
        this.AssetBlock_Field.StoreLocal = unpackBoolean(byteBuffer);
        this.AssetBlock_Field.AssetData = unpackVariable(byteBuffer, 2);
    }
}
