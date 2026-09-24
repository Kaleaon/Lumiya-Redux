package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Search messages
 * AvatarPickerRequest
 * Get a list of names to select a person
 * viewer -> sim -> data
 * reliable
 *
 * <p>Template: {@code AvatarPickerRequest Low 26 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AvatarPickerRequest extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID QueryID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public byte[] Name; // Variable 1
    }

    public AvatarPickerRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Name.length + 1 + 52;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAvatarPickerRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 26 (AvatarPickerRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x1A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.QueryID);
        packVariable(byteBuffer, this.Data_Field.Name, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.QueryID = unpackUUID(byteBuffer);
        this.Data_Field.Name = unpackVariable(byteBuffer, 1);
    }
}
