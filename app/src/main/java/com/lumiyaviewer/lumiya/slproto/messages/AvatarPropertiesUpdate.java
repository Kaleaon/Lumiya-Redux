package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AvatarPropertiesUpdate
 * viewer -> simulator
 * reliable
 *
 * <p>Template: {@code AvatarPropertiesUpdate Low 174 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AvatarPropertiesUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public PropertiesData PropertiesData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block PropertiesData, Single. */
    public static class PropertiesData {
        public byte[] AboutText; // Variable 2 - string, up to 512
        public boolean AllowPublish; // BOOL - whether profile is externally visible or not
        public byte[] FLAboutText; // Variable 1
        public UUID FLImageID; // LLUUID
        public UUID ImageID; // LLUUID
        public boolean MaturePublish; // BOOL - profile is "mature"
        public byte[] ProfileURL; // Variable 1 - string
    }

    public AvatarPropertiesUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.PropertiesData_Field = new PropertiesData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.PropertiesData_Field.AboutText.length + 34 + 1 + this.PropertiesData_Field.FLAboutText.length + 1 + 1 + 1 + this.PropertiesData_Field.ProfileURL.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarPropertiesUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 174 (AvatarPropertiesUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xAE);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.PropertiesData_Field.ImageID);
        packUUID(byteBuffer, this.PropertiesData_Field.FLImageID);
        packVariable(byteBuffer, this.PropertiesData_Field.AboutText, 2);
        packVariable(byteBuffer, this.PropertiesData_Field.FLAboutText, 1);
        packBoolean(byteBuffer, this.PropertiesData_Field.AllowPublish);
        packBoolean(byteBuffer, this.PropertiesData_Field.MaturePublish);
        packVariable(byteBuffer, this.PropertiesData_Field.ProfileURL, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.ImageID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.FLImageID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.AboutText = unpackVariable(byteBuffer, 2);
        this.PropertiesData_Field.FLAboutText = unpackVariable(byteBuffer, 1);
        this.PropertiesData_Field.AllowPublish = unpackBoolean(byteBuffer);
        this.PropertiesData_Field.MaturePublish = unpackBoolean(byteBuffer);
        this.PropertiesData_Field.ProfileURL = unpackVariable(byteBuffer, 1);
    }
}
