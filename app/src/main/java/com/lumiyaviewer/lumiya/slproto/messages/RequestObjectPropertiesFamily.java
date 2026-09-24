package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RequestObjectPropertiesFamily
 * Ask for extended information, such as creator, permissions, resources, etc.
 * Medium frequency because it is driven by mouse hovering over objects, which
 * occurs at high rates.
 *
 * <p>Template: {@code RequestObjectPropertiesFamily Medium 5 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestObjectPropertiesFamily extends SLMessage {
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
        public int RequestFlags; // U32
    }

    public RequestObjectPropertiesFamily() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return 54;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRequestObjectPropertiesFamily(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 5 (RequestObjectPropertiesFamily).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x05);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ObjectData_Field.RequestFlags);
        packUUID(byteBuffer, this.ObjectData_Field.ObjectID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ObjectData_Field.RequestFlags = unpackInt(byteBuffer);
        this.ObjectData_Field.ObjectID = unpackUUID(byteBuffer);
    }
}
