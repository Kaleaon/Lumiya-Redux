package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AvatarPropertiesReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AvatarPropertiesReply Low 171 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarLegacyPropertiesReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarPropertiesReply extends SLMessage {
    public AgentData AgentData_Field;
    public PropertiesData PropertiesData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID - your id
        public UUID AvatarID; // LLUUID - avatar you're asking about
    }

    /** Block PropertiesData, Single. */
    public static class PropertiesData {
        public byte[] AboutText; // Variable 2 - string, up to 512
        public byte[] BornOn; // Variable 1 - string
        public byte[] CharterMember; // Variable 1 - special - usually U8
        public byte[] FLAboutText; // Variable 1 - string
        public UUID FLImageID; // LLUUID
        public int Flags; // U32
        public UUID ImageID; // LLUUID
        public UUID PartnerID; // LLUUID
        public byte[] ProfileURL; // Variable 1 - string
    }

    public AvatarPropertiesReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.PropertiesData_Field = new PropertiesData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.PropertiesData_Field.AboutText.length + 50 + 1 + this.PropertiesData_Field.FLAboutText.length + 1 + this.PropertiesData_Field.BornOn.length + 1 + this.PropertiesData_Field.ProfileURL.length + 1 + this.PropertiesData_Field.CharterMember.length + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarPropertiesReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 171 (AvatarPropertiesReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xAB);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.AvatarID);
        packUUID(byteBuffer, this.PropertiesData_Field.ImageID);
        packUUID(byteBuffer, this.PropertiesData_Field.FLImageID);
        packUUID(byteBuffer, this.PropertiesData_Field.PartnerID);
        packVariable(byteBuffer, this.PropertiesData_Field.AboutText, 2);
        packVariable(byteBuffer, this.PropertiesData_Field.FLAboutText, 1);
        packVariable(byteBuffer, this.PropertiesData_Field.BornOn, 1);
        packVariable(byteBuffer, this.PropertiesData_Field.ProfileURL, 1);
        packVariable(byteBuffer, this.PropertiesData_Field.CharterMember, 1);
        packInt(byteBuffer, this.PropertiesData_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.AvatarID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.ImageID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.FLImageID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.PartnerID = unpackUUID(byteBuffer);
        this.PropertiesData_Field.AboutText = unpackVariable(byteBuffer, 2);
        this.PropertiesData_Field.FLAboutText = unpackVariable(byteBuffer, 1);
        this.PropertiesData_Field.BornOn = unpackVariable(byteBuffer, 1);
        this.PropertiesData_Field.ProfileURL = unpackVariable(byteBuffer, 1);
        this.PropertiesData_Field.CharterMember = unpackVariable(byteBuffer, 1);
        this.PropertiesData_Field.Flags = unpackInt(byteBuffer);
    }
}
