package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * FreezeUser
 * Freeze someone who is on my land.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code FreezeUser Low 168 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class FreezeUser extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int Flags; // U32
        public UUID TargetID; // LLUUID
    }

    public FreezeUser() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleFreezeUser(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 168 (FreezeUser).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xA8);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.TargetID);
        packInt(byteBuffer, this.Data_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.TargetID = unpackUUID(byteBuffer);
        this.Data_Field.Flags = unpackInt(byteBuffer);
    }
}
