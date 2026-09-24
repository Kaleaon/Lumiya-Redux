package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * backend implementation which tracks if the user is a god.
 *
 * <p>Template: {@code AvatarPickerRequestBackend Low 27 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AvatarPickerRequestBackend extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int GodLevel; // U8
        public UUID QueryID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public byte[] Name; // Variable 1
    }

    public AvatarPickerRequestBackend() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Name.length + 1 + 53;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarPickerRequestBackend(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 27 (AvatarPickerRequestBackend).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x1B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.QueryID);
        packByte(byteBuffer, (byte) this.AgentData_Field.GodLevel);
        packVariable(byteBuffer, this.Data_Field.Name, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.QueryID = unpackUUID(byteBuffer);
        this.AgentData_Field.GodLevel = unpackByte(byteBuffer) & 0xFF;
        this.Data_Field.Name = unpackVariable(byteBuffer, 1);
    }
}
