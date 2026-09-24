package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ScriptDialogReply
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ScriptDialogReply Low 191 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ScriptDialogReply extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int ButtonIndex; // S32
        public byte[] ButtonLabel; // Variable 1
        public int ChatChannel; // S32
        public UUID ObjectID; // LLUUID
    }

    public ScriptDialogReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.ButtonLabel.length + 25 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleScriptDialogReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 191 (ScriptDialogReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xBF);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.ObjectID);
        packInt(byteBuffer, this.Data_Field.ChatChannel);
        packInt(byteBuffer, this.Data_Field.ButtonIndex);
        packVariable(byteBuffer, this.Data_Field.ButtonLabel, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.ObjectID = unpackUUID(byteBuffer);
        this.Data_Field.ChatChannel = unpackInt(byteBuffer);
        this.Data_Field.ButtonIndex = unpackInt(byteBuffer);
        this.Data_Field.ButtonLabel = unpackVariable(byteBuffer, 1);
    }
}
