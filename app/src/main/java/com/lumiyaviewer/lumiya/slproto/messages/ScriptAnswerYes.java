package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ScriptAnswerYes
 * reliable
 *
 * <p>Template: {@code ScriptAnswerYes Low 132 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ScriptAnswerYes extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public UUID ItemID; // LLUUID
        public int Questions; // S32
        public UUID TaskID; // LLUUID
    }

    public ScriptAnswerYes() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 72;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleScriptAnswerYes(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 132 (ScriptAnswerYes).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x84);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.TaskID);
        packUUID(byteBuffer, this.Data_Field.ItemID);
        packInt(byteBuffer, this.Data_Field.Questions);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.TaskID = unpackUUID(byteBuffer);
        this.Data_Field.ItemID = unpackUUID(byteBuffer);
        this.Data_Field.Questions = unpackInt(byteBuffer);
    }
}
