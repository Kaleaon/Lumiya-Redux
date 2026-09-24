package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ObjectAttach
 *
 * <p>Template: {@code ObjectAttach Low 112 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectAttach extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int AttachmentPoint; // U8
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public int ObjectLocalID; // U32
        public LLQuaternion Rotation; // LLQuaternion
    }

    public ObjectAttach() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 16) + 38;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectAttach(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 112 (ObjectAttach).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x70);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packByte(byteBuffer, (byte) this.AgentData_Field.AttachmentPoint);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID);
            packLLQuaternion(byteBuffer, objectData.Rotation);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.AttachmentPoint = unpackByte(byteBuffer) & 0xFF;
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.ObjectLocalID = unpackInt(byteBuffer);
            objectData.Rotation = unpackLLQuaternion(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
