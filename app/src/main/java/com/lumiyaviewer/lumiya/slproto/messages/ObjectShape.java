package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ObjectShape
 *
 * <p>Template: {@code ObjectShape Low 98 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectShape extends SLMessage {
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
        public int PathBegin; // U16 - 0 to 1, quanta = 0.01
        public int PathCurve; // U8
        public int PathEnd; // U16 - 0 to 1, quanta = 0.01
        public int PathRadiusOffset; // S8 - -1 to 1, quanta = 0.01
        public int PathRevolutions; // U8 - 0 to 3, quanta = 0.015
        public int PathScaleX; // U8 - 0 to 1, quanta = 0.01
        public int PathScaleY; // U8 - 0 to 1, quanta = 0.01
        public int PathShearX; // U8 - -.5 to .5, quanta = 0.01
        public int PathShearY; // U8 - -.5 to .5, quanta = 0.01
        public int PathSkew; // S8 - -1 to 1, quanta = 0.01
        public int PathTaperX; // S8 - -1 to 1, quanta = 0.01
        public int PathTaperY; // S8 - -1 to 1, quanta = 0.01
        public int PathTwist; // S8 - -1 to 1, quanta = 0.01
        public int PathTwistBegin; // S8 - -1 to 1, quanta = 0.01
        public int ProfileBegin; // U16 - 0 to 1, quanta = 0.01
        public int ProfileCurve; // U8
        public int ProfileEnd; // U16 - 0 to 1, quanta = 0.01
        public int ProfileHollow; // U16 - 0 to 1, quanta = 0.01
    }

    public ObjectShape() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 27) + 37;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectShape(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 98 (ObjectShape).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x62);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID);
            packByte(byteBuffer, (byte) objectData.PathCurve);
            packByte(byteBuffer, (byte) objectData.ProfileCurve);
            packShort(byteBuffer, (short) objectData.PathBegin);
            packShort(byteBuffer, (short) objectData.PathEnd);
            packByte(byteBuffer, (byte) objectData.PathScaleX);
            packByte(byteBuffer, (byte) objectData.PathScaleY);
            packByte(byteBuffer, (byte) objectData.PathShearX);
            packByte(byteBuffer, (byte) objectData.PathShearY);
            packByte(byteBuffer, (byte) objectData.PathTwist);
            packByte(byteBuffer, (byte) objectData.PathTwistBegin);
            packByte(byteBuffer, (byte) objectData.PathRadiusOffset);
            packByte(byteBuffer, (byte) objectData.PathTaperX);
            packByte(byteBuffer, (byte) objectData.PathTaperY);
            packByte(byteBuffer, (byte) objectData.PathRevolutions);
            packByte(byteBuffer, (byte) objectData.PathSkew);
            packShort(byteBuffer, (short) objectData.ProfileBegin);
            packShort(byteBuffer, (short) objectData.ProfileEnd);
            packShort(byteBuffer, (short) objectData.ProfileHollow);
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
            objectData.PathCurve = unpackByte(byteBuffer) & 0xFF;
            objectData.ProfileCurve = unpackByte(byteBuffer) & 0xFF;
            objectData.PathBegin = unpackShort(byteBuffer) & 65535;
            objectData.PathEnd = unpackShort(byteBuffer) & 65535;
            objectData.PathScaleX = unpackByte(byteBuffer) & 0xFF;
            objectData.PathScaleY = unpackByte(byteBuffer) & 0xFF;
            objectData.PathShearX = unpackByte(byteBuffer) & 0xFF;
            objectData.PathShearY = unpackByte(byteBuffer) & 0xFF;
            objectData.PathTwist = unpackByte(byteBuffer);
            objectData.PathTwistBegin = unpackByte(byteBuffer);
            objectData.PathRadiusOffset = unpackByte(byteBuffer);
            objectData.PathTaperX = unpackByte(byteBuffer);
            objectData.PathTaperY = unpackByte(byteBuffer);
            objectData.PathRevolutions = unpackByte(byteBuffer) & 0xFF;
            objectData.PathSkew = unpackByte(byteBuffer);
            objectData.ProfileBegin = unpackShort(byteBuffer) & 65535;
            objectData.ProfileEnd = unpackShort(byteBuffer) & 65535;
            objectData.ProfileHollow = unpackShort(byteBuffer) & 65535;
            this.ObjectData_Fields.add(objectData);
        }
    }
}
