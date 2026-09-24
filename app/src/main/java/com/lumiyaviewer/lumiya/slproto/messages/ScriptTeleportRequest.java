package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;

/**
 * ScriptTeleportRequest
 * Interestingly, this message does not actually "Request a Teleport"
 * on the viewer. Instead it opens the world map and places a beacon
 * at the indicated location.
 * reliable
 *
 * <p>Template: {@code ScriptTeleportRequest Low 195 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_script_teleport_request()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ScriptTeleportRequest extends SLMessage {
    public Data Data_Field;

    /** Block Data, Single. */
    public static class Data {
        public LLVector3 LookAt; // LLVector3
        public byte[] ObjectName; // Variable 1
        public byte[] SimName; // Variable 1
        public LLVector3 SimPosition; // LLVector3
    }

    public ScriptTeleportRequest() {
        this.zeroCoded = false;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.ObjectName.length + 1 + 1 + this.Data_Field.SimName.length + 12 + 12 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleScriptTeleportRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 195 (ScriptTeleportRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xC3);
        packVariable(byteBuffer, this.Data_Field.ObjectName, 1);
        packVariable(byteBuffer, this.Data_Field.SimName, 1);
        packLLVector3(byteBuffer, this.Data_Field.SimPosition);
        packLLVector3(byteBuffer, this.Data_Field.LookAt);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.ObjectName = unpackVariable(byteBuffer, 1);
        this.Data_Field.SimName = unpackVariable(byteBuffer, 1);
        this.Data_Field.SimPosition = unpackLLVector3(byteBuffer);
        this.Data_Field.LookAt = unpackLLVector3(byteBuffer);
    }
}
