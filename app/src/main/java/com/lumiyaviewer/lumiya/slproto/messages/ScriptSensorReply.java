package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ScriptSensorReply - returns the request script search information back to the requester
 *
 * <p>Template: {@code ScriptSensorReply Low 248 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ScriptSensorReply extends SLMessage {
    public Requester Requester_Field;
    public ArrayList<SensedData> SensedData_Fields = new ArrayList<>();

    /** Block Requester, Single. */
    public static class Requester {
        public UUID SourceID; // LLUUID
    }

    /** Block SensedData, Variable. */
    public static class SensedData {
        public UUID GroupID; // LLUUID
        public byte[] Name; // Variable 1
        public UUID ObjectID; // LLUUID
        public UUID OwnerID; // LLUUID
        public LLVector3 Position; // LLVector3
        public float Range; // F32
        public LLQuaternion Rotation; // LLQuaternion
        public int Type; // S32
        public LLVector3 Velocity; // LLVector3
    }

    public ScriptSensorReply() {
        this.zeroCoded = true;
        this.Requester_Field = new Requester();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 21;
        Iterator<?> it = this.SensedData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((SensedData) it.next()).Name.length + 85 + 4 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleScriptSensorReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 248 (ScriptSensorReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF8);
        packUUID(byteBuffer, this.Requester_Field.SourceID);
        byteBuffer.put((byte) this.SensedData_Fields.size());
        for (SensedData sensedData : this.SensedData_Fields) {
            packUUID(byteBuffer, sensedData.ObjectID);
            packUUID(byteBuffer, sensedData.OwnerID);
            packUUID(byteBuffer, sensedData.GroupID);
            packLLVector3(byteBuffer, sensedData.Position);
            packLLVector3(byteBuffer, sensedData.Velocity);
            packLLQuaternion(byteBuffer, sensedData.Rotation);
            packVariable(byteBuffer, sensedData.Name, 1);
            packInt(byteBuffer, sensedData.Type);
            packFloat(byteBuffer, sensedData.Range);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Requester_Field.SourceID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            SensedData sensedData = new SensedData();
            sensedData.ObjectID = unpackUUID(byteBuffer);
            sensedData.OwnerID = unpackUUID(byteBuffer);
            sensedData.GroupID = unpackUUID(byteBuffer);
            sensedData.Position = unpackLLVector3(byteBuffer);
            sensedData.Velocity = unpackLLVector3(byteBuffer);
            sensedData.Rotation = unpackLLQuaternion(byteBuffer);
            sensedData.Name = unpackVariable(byteBuffer, 1);
            sensedData.Type = unpackInt(byteBuffer);
            sensedData.Range = unpackFloat(byteBuffer);
            this.SensedData_Fields.add(sensedData);
        }
    }
}
