package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Remove a mute list entry.
 *
 * <p>Template: {@code RemoveMuteListEntry Low 264 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RemoveMuteListEntry extends SLMessage {
    public AgentData AgentData_Field;
    public MuteData MuteData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block MuteData, Single. */
    public static class MuteData {
        public UUID MuteID; // LLUUID
        public byte[] MuteName; // Variable 1
    }

    public RemoveMuteListEntry() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.MuteData_Field = new MuteData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MuteData_Field.MuteName.length + 17 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRemoveMuteListEntry(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 264 (RemoveMuteListEntry).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x08);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.MuteData_Field.MuteID);
        packVariable(byteBuffer, this.MuteData_Field.MuteName, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.MuteData_Field.MuteID = unpackUUID(byteBuffer);
        this.MuteData_Field.MuteName = unpackVariable(byteBuffer, 1);
    }
}
