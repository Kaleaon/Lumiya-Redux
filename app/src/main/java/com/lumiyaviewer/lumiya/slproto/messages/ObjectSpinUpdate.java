package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ObjectSpinUpdate
 *
 * <p>Template: {@code ObjectSpinUpdate Low 121 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectSpinUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ObjectData ObjectData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public UUID ObjectID; // LLUUID
        public LLQuaternion Rotation; // LLQuaternion
    }

    public ObjectSpinUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return 64;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleObjectSpinUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 121 (ObjectSpinUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x79);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.ObjectData_Field.ObjectID);
        packLLQuaternion(byteBuffer, this.ObjectData_Field.Rotation);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ObjectData_Field.ObjectID = unpackUUID(byteBuffer);
        this.ObjectData_Field.Rotation = unpackLLQuaternion(byteBuffer);
    }
}
