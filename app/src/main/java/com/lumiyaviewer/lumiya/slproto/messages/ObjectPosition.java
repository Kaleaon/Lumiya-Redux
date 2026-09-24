package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * DEPRECATED: ObjectPosition
 * == Old Behavior ==
 * Set the position on objects
 * == Reason for deprecation ==
 * Unused code path was removed in the move to Havok4
 * Object position, scale and rotation messages were already unified
 * to MultipleObjectUpdate and this message was unused cruft.
 * == New Location ==
 * MultipleObjectUpdate can be used instead.
 *
 * <p>Template: {@code ObjectPosition Medium 4 NotTrusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
public class ObjectPosition extends SLMessage {
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
        public LLVector3 Position; // LLVector3 - region
    }

    public ObjectPosition() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 16) + 35;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectPosition(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 4 (ObjectPosition).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x04);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packInt(byteBuffer, objectData.ObjectLocalID);
            packLLVector3(byteBuffer, objectData.Position);
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
            objectData.Position = unpackLLVector3(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
