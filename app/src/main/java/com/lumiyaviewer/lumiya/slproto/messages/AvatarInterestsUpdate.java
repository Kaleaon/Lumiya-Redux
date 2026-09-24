package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AvatarInterestsUpdate
 * viewer -> simulator
 * reliable
 *
 * <p>Template: {@code AvatarInterestsUpdate Low 175 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AvatarInterestsUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public PropertiesData PropertiesData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block PropertiesData, Single. */
    public static class PropertiesData {
        public byte[] LanguagesText; // Variable 1 - string
        public int SkillsMask; // U32
        public byte[] SkillsText; // Variable 1 - string
        public int WantToMask; // U32
        public byte[] WantToText; // Variable 1 - string
    }

    public AvatarInterestsUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.PropertiesData_Field = new PropertiesData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.PropertiesData_Field.WantToText.length + 5 + 4 + 1 + this.PropertiesData_Field.SkillsText.length + 1 + this.PropertiesData_Field.LanguagesText.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAvatarInterestsUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 175 (AvatarInterestsUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xAF);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.PropertiesData_Field.WantToMask);
        packVariable(byteBuffer, this.PropertiesData_Field.WantToText, 1);
        packInt(byteBuffer, this.PropertiesData_Field.SkillsMask);
        packVariable(byteBuffer, this.PropertiesData_Field.SkillsText, 1);
        packVariable(byteBuffer, this.PropertiesData_Field.LanguagesText, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.WantToMask = unpackInt(byteBuffer);
        this.PropertiesData_Field.WantToText = unpackVariable(byteBuffer, 1);
        this.PropertiesData_Field.SkillsMask = unpackInt(byteBuffer);
        this.PropertiesData_Field.SkillsText = unpackVariable(byteBuffer, 1);
        this.PropertiesData_Field.LanguagesText = unpackVariable(byteBuffer, 1);
    }
}
