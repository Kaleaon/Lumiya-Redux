package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * SendXferPacket - send an additional packet of an arbitrary xfer from sim -> viewer
 *
 * <p>Template: {@code SendXferPacket High 18 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code continue_file_receive()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class SendXferPacket extends SLMessage {
    public DataPacket DataPacket_Field;
    public XferID XferID_Field;

    /** Block DataPacket, Single. */
    public static class DataPacket {
        public byte[] Data; // Variable 2
    }

    /** Block XferID, Single. */
    public static class XferID {
        public long ID; // U64
        public int Packet; // U32
    }

    public SendXferPacket() {
        this.zeroCoded = false;
        this.XferID_Field = new XferID();
        this.DataPacket_Field = new DataPacket();
    }

    @Override
    public int CalcPayloadSize() {
        return this.DataPacket_Field.Data.length + 2 + 13;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSendXferPacket(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 18 (SendXferPacket).
        byteBuffer.put((byte) 0x12);
        packLong(byteBuffer, this.XferID_Field.ID);
        packInt(byteBuffer, this.XferID_Field.Packet);
        packVariable(byteBuffer, this.DataPacket_Field.Data, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.XferID_Field.ID = unpackLong(byteBuffer);
        this.XferID_Field.Packet = unpackInt(byteBuffer);
        this.DataPacket_Field.Data = unpackVariable(byteBuffer, 2);
    }
}
