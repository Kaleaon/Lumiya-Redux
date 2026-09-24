package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Requests for possessions, acquisition, money, etc
 * request for mute list
 *
 * <p>Template: {@code MuteListRequest Low 262 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MuteListRequest extends SLMessage {
    public AgentData AgentData_Field;
    public MuteData MuteData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block MuteData, Single. */
    public static class MuteData {
        public int MuteCRC; // U32
    }

    public MuteListRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.MuteData_Field = new MuteData();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleMuteListRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 262 (MuteListRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x06);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.MuteData_Field.MuteCRC);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.MuteData_Field.MuteCRC = unpackInt(byteBuffer);
    }
}
