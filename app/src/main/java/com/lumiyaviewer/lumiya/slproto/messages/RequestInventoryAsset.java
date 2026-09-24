package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * request permissions for agent id to get the asset for owner_id's
 * item_id.
 *
 * <p>Template: {@code RequestInventoryAsset Low 282 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestInventoryAsset extends SLMessage {
    public QueryData QueryData_Field;

    /** Block QueryData, Single. */
    public static class QueryData {
        public UUID AgentID; // LLUUID
        public UUID ItemID; // LLUUID
        public UUID OwnerID; // LLUUID
        public UUID QueryID; // LLUUID
    }

    public RequestInventoryAsset() {
        this.zeroCoded = false;
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 68;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestInventoryAsset(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 282 (RequestInventoryAsset).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x1A);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        packUUID(byteBuffer, this.QueryData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.OwnerID);
        packUUID(byteBuffer, this.QueryData_Field.ItemID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        this.QueryData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.OwnerID = unpackUUID(byteBuffer);
        this.QueryData_Field.ItemID = unpackUUID(byteBuffer);
    }
}
