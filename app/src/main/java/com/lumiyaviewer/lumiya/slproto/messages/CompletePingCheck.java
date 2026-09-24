package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * CompletePingCheck - used to measure circuit ping times
 *
 * <p>Template: {@code CompletePingCheck High 2 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_complete_ping_check()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class CompletePingCheck extends SLMessage {
    public PingID PingID_Field;

    /** Block PingID, Single. */
    public static class PingID {
        public int PingID; // U8
    }

    public CompletePingCheck() {
        this.zeroCoded = false;
        this.PingID_Field = new PingID();
    }

    @Override
    public int CalcPayloadSize() {
        return 2;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCompletePingCheck(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 2 (CompletePingCheck).
        byteBuffer.put((byte) 0x02);
        packByte(byteBuffer, (byte) this.PingID_Field.PingID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.PingID_Field.PingID = unpackByte(byteBuffer) & 0xFF;
    }
}
