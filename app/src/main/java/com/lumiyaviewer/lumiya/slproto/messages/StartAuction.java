package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * sim -> dataserver
 * Once all of the data has been gathered,
 *
 * <p>Template: {@code StartAuction Low 229 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class StartAuction extends SLMessage {
    public AgentData AgentData_Field;
    public ParcelData ParcelData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public byte[] Name; // Variable 1 - string
        public UUID ParcelID; // LLUUID
        public UUID SnapshotID; // LLUUID
    }

    public StartAuction() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ParcelData_Field.Name.length + 33 + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleStartAuction(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 229 (StartAuction).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xE5);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.ParcelData_Field.ParcelID);
        packUUID(byteBuffer, this.ParcelData_Field.SnapshotID);
        packVariable(byteBuffer, this.ParcelData_Field.Name, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.ParcelData_Field.ParcelID = unpackUUID(byteBuffer);
        this.ParcelData_Field.SnapshotID = unpackUUID(byteBuffer);
        this.ParcelData_Field.Name = unpackVariable(byteBuffer, 1);
    }
}
