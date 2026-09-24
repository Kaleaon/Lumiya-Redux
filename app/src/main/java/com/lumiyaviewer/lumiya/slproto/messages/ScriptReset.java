package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ScriptReset - causes a script to reset
 *
 * <p>Template: {@code ScriptReset Low 246 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ScriptReset extends SLMessage {
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
    }

    public ScriptReset() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Script_Field = new Script();
    }

    @Override
    public int CalcPayloadSize() {
        return 68;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleScriptReset(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 246 (ScriptReset).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF6);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Script_Field.ObjectID);
        packUUID(byteBuffer, this.Script_Field.ItemID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Script_Field.ObjectID = unpackUUID(byteBuffer);
        this.Script_Field.ItemID = unpackUUID(byteBuffer);
    }
}
