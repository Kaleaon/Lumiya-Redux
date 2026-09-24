package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * ConfirmXferPacket
 *
 * <p>Template: {@code ConfirmXferPacket High 19 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_confirm_packet()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ConfirmXferPacket extends SLMessage {
    public XferID XferID_Field;

    /** Block XferID, Single. */
    public static class XferID {
        public long ID; // U64
        public int Packet; // U32
    }

    public ConfirmXferPacket() {
        this.zeroCoded = false;
        this.XferID_Field = new XferID();
    }

    @Override
    public int CalcPayloadSize() {
        return 13;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleConfirmXferPacket(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 19 (ConfirmXferPacket).
        byteBuffer.put((byte) 0x13);
        packLong(byteBuffer, this.XferID_Field.ID);
        packInt(byteBuffer, this.XferID_Field.Packet);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.XferID_Field.ID = unpackLong(byteBuffer);
        this.XferID_Field.Packet = unpackInt(byteBuffer);
    }
}
