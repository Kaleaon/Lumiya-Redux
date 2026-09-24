package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ParcelClaim - change the owner of a patch of land
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelClaim Low 209 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelClaim extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;
    public ArrayList<ParcelData> ParcelData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public boolean Final; // BOOL - true if buyer is in tier
        public UUID GroupID; // LLUUID
        public boolean IsGroupOwned; // BOOL
    }

    /** Block ParcelData, Variable. */
    public static class ParcelData {
        public float East; // F32
        public float North; // F32
        public float South; // F32
        public float West; // F32
    }

    public ParcelClaim() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ParcelData_Fields.size() * 16) + 55;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelClaim(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 209 (ParcelClaim).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xD1);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.GroupID);
        packBoolean(byteBuffer, this.Data_Field.IsGroupOwned);
        packBoolean(byteBuffer, this.Data_Field.Final);
        byteBuffer.put((byte) this.ParcelData_Fields.size());
        for (ParcelData parcelData : this.ParcelData_Fields) {
            packFloat(byteBuffer, parcelData.West);
            packFloat(byteBuffer, parcelData.South);
            packFloat(byteBuffer, parcelData.East);
            packFloat(byteBuffer, parcelData.North);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.GroupID = unpackUUID(byteBuffer);
        this.Data_Field.IsGroupOwned = unpackBoolean(byteBuffer);
        this.Data_Field.Final = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ParcelData parcelData = new ParcelData();
            parcelData.West = unpackFloat(byteBuffer);
            parcelData.South = unpackFloat(byteBuffer);
            parcelData.East = unpackFloat(byteBuffer);
            parcelData.North = unpackFloat(byteBuffer);
            this.ParcelData_Fields.add(parcelData);
        }
    }
}
