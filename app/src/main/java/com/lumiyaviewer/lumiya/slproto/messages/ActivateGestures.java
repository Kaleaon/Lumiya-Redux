package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * Gesture saves/loads
 * Tell the database that some gestures are now active
 * viewer -> sim -> data
 *
 * <p>Template: {@code ActivateGestures Low 316 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ActivateGestures extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Data> Data_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int Flags; // U32
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Variable. */
    public static class Data {
        public UUID AssetID; // LLUUID
        public int GestureFlags; // U32
        public UUID ItemID; // LLUUID
    }

    public ActivateGestures() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Data_Fields.size() * 36) + 41;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleActivateGestures(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 316 (ActivateGestures).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x3C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.Flags);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packUUID(byteBuffer, data.ItemID);
            packUUID(byteBuffer, data.AssetID);
            packInt(byteBuffer, data.GestureFlags);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.Flags = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Data data = new Data();
            data.ItemID = unpackUUID(byteBuffer);
            data.AssetID = unpackUUID(byteBuffer);
            data.GestureFlags = unpackInt(byteBuffer);
            this.Data_Fields.add(data);
        }
    }
}
