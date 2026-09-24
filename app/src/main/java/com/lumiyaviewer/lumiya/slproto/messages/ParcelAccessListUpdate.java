package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * viewer -> sim
 * ParcelAccessListUpdate
 *
 * <p>Template: {@code ParcelAccessListUpdate Low 217 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelAccessListUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;
    public ArrayList<List> List_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int Flags; // U32
        public int LocalID; // S32
        public int Sections; // S32
        public int SequenceID; // S32
        public UUID TransactionID; // LLUUID
    }

    /** Block List, Variable. */
    public static class List {
        public int Flags; // U32
        public UUID ID; // LLUUID
        public int Time; // S32 - time_t
    }

    public ParcelAccessListUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.List_Fields.size() * 24) + 69;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelAccessListUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 217 (ParcelAccessListUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xD9);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.Data_Field.Flags);
        packInt(byteBuffer, this.Data_Field.LocalID);
        packUUID(byteBuffer, this.Data_Field.TransactionID);
        packInt(byteBuffer, this.Data_Field.SequenceID);
        packInt(byteBuffer, this.Data_Field.Sections);
        byteBuffer.put((byte) this.List_Fields.size());
        for (List list : this.List_Fields) {
            packUUID(byteBuffer, list.ID);
            packInt(byteBuffer, list.Time);
            packInt(byteBuffer, list.Flags);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.Flags = unpackInt(byteBuffer);
        this.Data_Field.LocalID = unpackInt(byteBuffer);
        this.Data_Field.TransactionID = unpackUUID(byteBuffer);
        this.Data_Field.SequenceID = unpackInt(byteBuffer);
        this.Data_Field.Sections = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            List list = new List();
            list.ID = unpackUUID(byteBuffer);
            list.Time = unpackInt(byteBuffer);
            list.Flags = unpackInt(byteBuffer);
            this.List_Fields.add(list);
        }
    }
}
