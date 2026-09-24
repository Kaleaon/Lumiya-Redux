package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * End fixed messages
 * StartPingCheck - used to measure circuit ping times
 * PingID is used to determine how backlogged the ping was that was
 * returned (or how hosed the other side is)
 *
 * <p>Template: {@code StartPingCheck High 1 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_start_ping_check()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class StartPingCheck extends SLMessage {
    public PingID PingID_Field;

    /** Block PingID, Single. */
    public static class PingID {
        public int OldestUnacked; // U32 - Current oldest "unacked" packet on the sender side
        public int PingID; // U8
    }

    public StartPingCheck() {
        this.zeroCoded = false;
        this.PingID_Field = new PingID();
    }

    @Override
    public int CalcPayloadSize() {
        return 6;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleStartPingCheck(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 1 (StartPingCheck).
        byteBuffer.put((byte) 0x01);
        packByte(byteBuffer, (byte) this.PingID_Field.PingID);
        packInt(byteBuffer, this.PingID_Field.OldestUnacked);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.PingID_Field.PingID = unpackByte(byteBuffer) & 0xFF;
        this.PingID_Field.OldestUnacked = unpackInt(byteBuffer);
    }
}
