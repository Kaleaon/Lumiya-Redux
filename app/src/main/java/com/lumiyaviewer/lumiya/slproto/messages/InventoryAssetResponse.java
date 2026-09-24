package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * response to RequestInventoryAsset
 * lluuid will be null if agentid in the request above cannot read asset
 *
 * <p>Template: {@code InventoryAssetResponse Low 283 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class InventoryAssetResponse extends SLMessage {
    public QueryData QueryData_Field;

    /** Block QueryData, Single. */
    public static class QueryData {
        public UUID AssetID; // LLUUID
        public boolean IsReadable; // BOOL
        public UUID QueryID; // LLUUID
    }

    public InventoryAssetResponse() {
        this.zeroCoded = false;
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleInventoryAssetResponse(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 283 (InventoryAssetResponse).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x1B);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packUUID(byteBuffer, this.QueryData_Field.AssetID);
        packBoolean(byteBuffer, this.QueryData_Field.IsReadable);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.AssetID = unpackUUID(byteBuffer);
        this.QueryData_Field.IsReadable = unpackBoolean(byteBuffer);
    }
}
