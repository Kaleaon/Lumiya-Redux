package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AvatarNotesReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AvatarNotesReply Low 176 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarNotesReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarNotesReply extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public byte[] Notes; // Variable 2 - string
        public UUID TargetID; // LLUUID
    }

    public AvatarNotesReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Notes.length + 18 + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarNotesReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 176 (AvatarNotesReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xB0);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.Data_Field.TargetID);
        packVariable(byteBuffer, this.Data_Field.Notes, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.Data_Field.TargetID = unpackUUID(byteBuffer);
        this.Data_Field.Notes = unpackVariable(byteBuffer, 2);
    }
}
