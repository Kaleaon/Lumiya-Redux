package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ScriptRunningReply - response from simulator to message above
 *
 * <p>Template: {@code ScriptRunningReply Low 244 NotTrusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLLiveLSLEditor::processScriptRunningReply()} in indra/newview/llpreviewscript.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ScriptRunningReply extends SLMessage {
    public Script Script_Field;

    /** Block Script, Single. */
    public static class Script {
        public UUID ItemID; // LLUUID
        public UUID ObjectID; // LLUUID
        public boolean Running; // BOOL
    }

    public ScriptRunningReply() {
        this.zeroCoded = false;
        this.Script_Field = new Script();
    }

    @Override
    public int CalcPayloadSize() {
        return 37;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleScriptRunningReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 244 (ScriptRunningReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF4);
        packUUID(byteBuffer, this.Script_Field.ObjectID);
        packUUID(byteBuffer, this.Script_Field.ItemID);
        packBoolean(byteBuffer, this.Script_Field.Running);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Script_Field.ObjectID = unpackUUID(byteBuffer);
        this.Script_Field.ItemID = unpackUUID(byteBuffer);
        this.Script_Field.Running = unpackBoolean(byteBuffer);
    }
}
