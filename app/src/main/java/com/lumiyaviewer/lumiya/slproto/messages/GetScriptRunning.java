package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GetScriptRunning - asks if a script is running or not. the simulator
 * responds with ScriptRunningReply
 *
 * <p>Template: {@code GetScriptRunning Low 243 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GetScriptRunning extends SLMessage {
    public Script Script_Field;

    /** Block Script, Single. */
    public static class Script {
        public UUID ItemID; // LLUUID
        public UUID ObjectID; // LLUUID
    }

    public GetScriptRunning() {
        this.zeroCoded = false;
        this.Script_Field = new Script();
    }

    @Override
    public int CalcPayloadSize() {
        return 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGetScriptRunning(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 243 (GetScriptRunning).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF3);
        packUUID(byteBuffer, this.Script_Field.ObjectID);
        packUUID(byteBuffer, this.Script_Field.ItemID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Script_Field.ObjectID = unpackUUID(byteBuffer);
        this.Script_Field.ItemID = unpackUUID(byteBuffer);
    }
}
