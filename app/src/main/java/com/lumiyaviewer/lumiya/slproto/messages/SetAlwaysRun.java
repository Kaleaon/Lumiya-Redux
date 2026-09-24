package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SetAlwaysRun
 * Lets the viewer choose between running and walking
 *
 * <p>Template: {@code SetAlwaysRun Low 88 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SetAlwaysRun extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public boolean AlwaysRun; // BOOL
        public UUID SessionID; // LLUUID
    }

    public SetAlwaysRun() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSetAlwaysRun(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 88 (SetAlwaysRun).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x58);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packBoolean(byteBuffer, this.AgentData_Field.AlwaysRun);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.AlwaysRun = unpackBoolean(byteBuffer);
    }
}
