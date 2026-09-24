package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ObjectExtraParams
 *
 * <p>Template: {@code ObjectExtraParams Low 99 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectExtraParams extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int ObjectLocalID; // U32
        public byte[] ParamData; // Variable 1
        public boolean ParamInUse; // BOOL
        public int ParamSize; // U32
        public int ParamType; // U16
    }

    public ObjectExtraParams() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.ObjectData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((ObjectData) it.next()).ParamData.length + 12 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectExtraParams(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 99 (ObjectExtraParams).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x63);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID);
            packShort(byteBuffer, (short) objectData.ParamType);
            packBoolean(byteBuffer, objectData.ParamInUse);
            packInt(byteBuffer, objectData.ParamSize);
            packVariable(byteBuffer, objectData.ParamData, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ObjectData objectData = new ObjectData();
            objectData.ObjectLocalID = unpackInt(byteBuffer);
            objectData.ParamType = unpackShort(byteBuffer) & 65535;
            objectData.ParamInUse = unpackBoolean(byteBuffer);
            objectData.ParamSize = unpackInt(byteBuffer);
            objectData.ParamData = unpackVariable(byteBuffer, 1);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
