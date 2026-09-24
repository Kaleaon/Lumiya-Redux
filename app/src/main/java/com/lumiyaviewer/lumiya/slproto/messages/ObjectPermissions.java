package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ObjectPermissions
 * Field - see llpermissionsflags.h
 * If Set is true, tries to turn on bits in mask.
 * If set is false, tries to turn off bits in mask.
 * BUG: This just forces the permissions field.
 *
 * <p>Template: {@code ObjectPermissions Low 105 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectPermissions extends SLMessage {
    public AgentData AgentData_Field;
    public HeaderData HeaderData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block HeaderData, Single. */
    public static class HeaderData {
        public boolean Override; // BOOL - God-bit.
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int Field; // U8
        public int Mask; // U32
        public int ObjectLocalID; // U32
        public int Set; // U8
    }

    public ObjectPermissions() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.HeaderData_Field = new HeaderData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 10) + 38;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectPermissions(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 105 (ObjectPermissions).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x69);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packBoolean(byteBuffer, this.HeaderData_Field.Override);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID);
            packByte(byteBuffer, (byte) objectData.Field);
            packByte(byteBuffer, (byte) objectData.Set);
            packInt(byteBuffer, objectData.Mask);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.HeaderData_Field.Override = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.ObjectLocalID = unpackInt(byteBuffer);
            objectData.Field = unpackByte(byteBuffer) & 0xFF;
            objectData.Set = unpackByte(byteBuffer) & 0xFF;
            objectData.Mask = unpackInt(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
