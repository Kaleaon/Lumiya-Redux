package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * RequestMultipleObjects
 * viewer -> simulator
 * reliable
 * When the viewer gets a local_id/crc for an object that
 * it either doesn't have, or doesn't have the current version
 * of, it sends this upstream get get an update.
 * CacheMissType 0 => full object (viewer doesn't have it)
 * CacheMissType 1 => CRC mismatch only
 *
 * <p>Template: {@code RequestMultipleObjects Medium 3 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestMultipleObjects extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int CacheMissType; // U8
        public int ID; // U32
    }

    public RequestMultipleObjects() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 5) + 35;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestMultipleObjects(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 3 (RequestMultipleObjects).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x03);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packByte(byteBuffer, (byte) objectData.CacheMissType);
            packInt(byteBuffer, objectData.ID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.CacheMissType = unpackByte(byteBuffer) & 0xFF;
            objectData.ID = unpackInt(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
