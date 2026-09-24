package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * SetScriptRunning - makes a script active or inactive (Enable may be
 * true or false)
 *
 * <p>Template: {@code SetScriptRunning Low 245 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SetScriptRunning extends SLMessage {
    public AgentData AgentData_Field;
    public Script Script_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Script, Single. */
    public static class Script {
        public UUID ItemID; // LLUUID
        public UUID ObjectID; // LLUUID
        public boolean Running; // BOOL
    }

    public SetScriptRunning() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Script_Field = new Script();
    }

    @Override
    public int CalcPayloadSize() {
        return 69;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSetScriptRunning(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 245 (SetScriptRunning).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF5);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Script_Field.ObjectID);
        packUUID(byteBuffer, this.Script_Field.ItemID);
        packBoolean(byteBuffer, this.Script_Field.Running);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Script_Field.ObjectID = unpackUUID(byteBuffer);
        this.Script_Field.ItemID = unpackUUID(byteBuffer);
        this.Script_Field.Running = unpackBoolean(byteBuffer);
    }
}
