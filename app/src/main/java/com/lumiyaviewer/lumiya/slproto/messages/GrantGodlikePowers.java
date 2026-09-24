package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * At the simulator, turn the godlike bit on.
 * At the viewer, show the god menu.
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GrantGodlikePowers Low 258 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_grant_godlike_powers()} in indra/newview/llviewermenu.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GrantGodlikePowers extends SLMessage {
    public AgentData AgentData_Field;
    public GrantData GrantData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block GrantData, Single. */
    public static class GrantData {
        public int GodLevel; // U8
        public UUID Token; // LLUUID - checked on sim, ignored on viewer
    }

    public GrantGodlikePowers() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GrantData_Field = new GrantData();
    }

    @Override
    public int CalcPayloadSize() {
        return 53;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGrantGodlikePowers(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 258 (GrantGodlikePowers).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x02);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packByte(byteBuffer, (byte) this.GrantData_Field.GodLevel);
        packUUID(byteBuffer, this.GrantData_Field.Token);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.GrantData_Field.GodLevel = unpackByte(byteBuffer) & 0xFF;
        this.GrantData_Field.Token = unpackUUID(byteBuffer);
    }
}
