package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ScriptMailRegistration
 * Simulator -> dataserver
 *
 * <p>Template: {@code ScriptMailRegistration Low 418 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ScriptMailRegistration extends SLMessage {
    public DataBlock DataBlock_Field;

    /** Block DataBlock, Single. */
    public static class DataBlock {
        public int Flags; // U32
        public byte[] TargetIP; // Variable 1 - String IP
        public int TargetPort; // IPPORT
        public UUID TaskID; // LLUUID
    }

    public ScriptMailRegistration() {
        this.zeroCoded = false;
        this.DataBlock_Field = new DataBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataBlock_Field.TargetIP.length + 1 + 2 + 16 + 4 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleScriptMailRegistration(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 418 (ScriptMailRegistration).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA2);
        packVariable(byteBuffer, this.DataBlock_Field.TargetIP, 1);
        packShort(byteBuffer, (short) this.DataBlock_Field.TargetPort);
        packUUID(byteBuffer, this.DataBlock_Field.TaskID);
        packInt(byteBuffer, this.DataBlock_Field.Flags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.DataBlock_Field.TargetIP = unpackVariable(byteBuffer, 1);
        this.DataBlock_Field.TargetPort = unpackShort(byteBuffer) & 65535;
        this.DataBlock_Field.TaskID = unpackUUID(byteBuffer);
        this.DataBlock_Field.Flags = unpackInt(byteBuffer);
    }
}
