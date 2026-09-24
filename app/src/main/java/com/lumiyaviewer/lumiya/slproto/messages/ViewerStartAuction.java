package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> sim
 * start an auction. viewer fills in the appropriate date, simulator
 * validates and fills in the rest of the information to start an auction
 * on a parcel. Processing currently requires that AgentID is a god.
 *
 * <p>Template: {@code ViewerStartAuction Low 228 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ViewerStartAuction extends SLMessage {
    public AgentData AgentData_Field;
    public ParcelData ParcelData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public int LocalID; // S32
        public UUID SnapshotID; // LLUUID
    }

    public ViewerStartAuction() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleViewerStartAuction(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 228 (ViewerStartAuction).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xE4);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ParcelData_Field.LocalID);
        packUUID(byteBuffer, this.ParcelData_Field.SnapshotID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ParcelData_Field.LocalID = unpackInt(byteBuffer);
        this.ParcelData_Field.SnapshotID = unpackUUID(byteBuffer);
    }
}
