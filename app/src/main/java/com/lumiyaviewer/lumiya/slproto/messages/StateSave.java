package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Save State
 * viewer->sim
 * requires administrative access
 *
 * <p>Template: {@code StateSave Low 127 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class StateSave extends SLMessage {
    public AgentData AgentData_Field;
    public DataBlock DataBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public byte[] Filename; // Variable 1
    }

    public StateSave() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.Filename.length + 1 + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleStateSave(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 127 (StateSave).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x7F);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packVariable(byteBuffer, this.DataBlock_Field.Filename, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.DataBlock_Field.Filename = unpackVariable(byteBuffer, 1);
    }
}
