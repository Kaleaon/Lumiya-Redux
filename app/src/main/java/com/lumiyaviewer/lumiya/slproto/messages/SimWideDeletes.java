package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SimWideDeletes
 *
 * <p>Template: {@code SimWideDeletes Low 129 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimWideDeletes extends SLMessage {
    public AgentData AgentData_Field;
    public DataBlock DataBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public int Flags; // U32
        public UUID TargetID; // LLUUID
    }

    public SimWideDeletes() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSimWideDeletes(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 129 (SimWideDeletes).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x81);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.DataBlock_Field.TargetID);
        packInt(byteBuffer, this.DataBlock_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.DataBlock_Field.TargetID = unpackUUID(byteBuffer);
        this.DataBlock_Field.Flags = unpackInt(byteBuffer);
    }
}
