package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AssetUploadComplete
 *
 * <p>Template: {@code AssetUploadComplete Low 334 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processUploadComplete()} in indra/llmessage/llassetstorage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AssetUploadComplete extends SLMessage {
    public AssetBlock AssetBlock_Field;

    /** Block AssetBlock, Single. */
    public static class AssetBlock {
        public boolean Success; // BOOL
        public int Type; // S8
        public UUID UUID; // LLUUID
    }

    public AssetUploadComplete() {
        this.zeroCoded = false;
        this.AssetBlock_Field = new AssetBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 22;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAssetUploadComplete(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 334 (AssetUploadComplete).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x4E);
        packUUID(byteBuffer, this.AssetBlock_Field.UUID);
        packByte(byteBuffer, (byte) this.AssetBlock_Field.Type);
        packBoolean(byteBuffer, this.AssetBlock_Field.Success);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AssetBlock_Field.UUID = unpackUUID(byteBuffer);
        this.AssetBlock_Field.Type = unpackByte(byteBuffer);
        this.AssetBlock_Field.Success = unpackBoolean(byteBuffer);
    }
}
