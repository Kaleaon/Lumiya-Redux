package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * update/add someone in the mute list
 *
 * <p>Template: {@code UpdateMuteListEntry Low 263 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class UpdateMuteListEntry extends SLMessage {
    public AgentData AgentData_Field;
    public MuteData MuteData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block MuteData, Single. */
    public static class MuteData {
        public int MuteFlags; // U32
        public UUID MuteID; // LLUUID
        public byte[] MuteName; // Variable 1
        public int MuteType; // S32
    }

    public UpdateMuteListEntry() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.MuteData_Field = new MuteData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MuteData_Field.MuteName.length + 17 + 4 + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUpdateMuteListEntry(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 263 (UpdateMuteListEntry).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x07);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.MuteData_Field.MuteID);
        packVariable(byteBuffer, this.MuteData_Field.MuteName, 1);
        packInt(byteBuffer, this.MuteData_Field.MuteType);
        packInt(byteBuffer, this.MuteData_Field.MuteFlags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.MuteData_Field.MuteID = unpackUUID(byteBuffer);
        this.MuteData_Field.MuteName = unpackVariable(byteBuffer, 1);
        this.MuteData_Field.MuteType = unpackInt(byteBuffer);
        this.MuteData_Field.MuteFlags = unpackInt(byteBuffer);
    }
}
