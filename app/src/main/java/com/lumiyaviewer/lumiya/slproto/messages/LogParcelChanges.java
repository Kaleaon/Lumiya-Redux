package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * sim -> dataserver
 *
 * <p>Template: {@code LogParcelChanges Low 224 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class LogParcelChanges extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ParcelData> ParcelData_Fields = new ArrayList<>();
    public RegionData RegionData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block ParcelData, Variable. */
    public static class ParcelData {
        public int Action; // S8
        public int ActualArea; // S32
        public boolean IsOwnerGroup; // BOOL
        public UUID OwnerID; // LLUUID
        public UUID ParcelID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    /** Block RegionData, Single. */
    public static class RegionData {
        public long RegionHandle; // U64
    }

    public LogParcelChanges() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.RegionData_Field = new RegionData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ParcelData_Fields.size() * 54) + 29;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleLogParcelChanges(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 224 (LogParcelChanges).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xE0);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packLong(byteBuffer, this.RegionData_Field.RegionHandle);
        byteBuffer.put((byte) this.ParcelData_Fields.size());
        for (ParcelData parcelData : this.ParcelData_Fields) {
            packUUID(byteBuffer, parcelData.ParcelID);
            packUUID(byteBuffer, parcelData.OwnerID);
            packBoolean(byteBuffer, parcelData.IsOwnerGroup);
            packInt(byteBuffer, parcelData.ActualArea);
            packByte(byteBuffer, (byte) parcelData.Action);
            packUUID(byteBuffer, parcelData.TransactionID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.RegionData_Field.RegionHandle = unpackLong(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ParcelData parcelData = new ParcelData();
            parcelData.ParcelID = unpackUUID(byteBuffer);
            parcelData.OwnerID = unpackUUID(byteBuffer);
            parcelData.IsOwnerGroup = unpackBoolean(byteBuffer);
            parcelData.ActualArea = unpackInt(byteBuffer);
            parcelData.Action = unpackByte(byteBuffer);
            parcelData.TransactionID = unpackUUID(byteBuffer);
            this.ParcelData_Fields.add(parcelData);
        }
    }
}
