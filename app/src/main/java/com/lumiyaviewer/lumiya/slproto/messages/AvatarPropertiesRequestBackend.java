package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AvatarPropertiesRequestBackend
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code AvatarPropertiesRequestBackend Low 170 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AvatarPropertiesRequestBackend extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID AvatarID; // LLUUID
        public int GodLevel; // U8
        public boolean WebProfilesDisabled; // BOOL
    }

    public AvatarPropertiesRequestBackend() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 38;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAvatarPropertiesRequestBackend(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 170 (AvatarPropertiesRequestBackend).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xAA);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.AvatarID);
        packByte(byteBuffer, (byte) this.AgentData_Field.GodLevel);
        packBoolean(byteBuffer, this.AgentData_Field.WebProfilesDisabled);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.AvatarID = unpackUUID(byteBuffer);
        this.AgentData_Field.GodLevel = unpackByte(byteBuffer) & 0xFF;
        this.AgentData_Field.WebProfilesDisabled = unpackBoolean(byteBuffer);
    }
}
