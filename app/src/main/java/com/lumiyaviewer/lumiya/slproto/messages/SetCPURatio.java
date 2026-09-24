package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * SetChildCount - Sent to launcher to adjust nominal child count
 * Simulator sends this increase the sim/cpu ratio on startup
 *
 * <p>Template: {@code SetCPURatio Low 327 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SetCPURatio extends SLMessage {
    public Data Data_Field;

    /** Block Data, Single. */
    public static class Data {
        public int Ratio; // U8
    }

    public SetCPURatio() {
        this.zeroCoded = false;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return 5;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSetCPURatio(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 327 (SetCPURatio).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x47);
        packByte(byteBuffer, (byte) this.Data_Field.Ratio);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.Ratio = unpackByte(byteBuffer) & 0xFF;
    }
}
