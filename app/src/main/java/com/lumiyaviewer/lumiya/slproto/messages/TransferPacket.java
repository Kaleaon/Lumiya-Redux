package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * TransferPacket
 *
 * <p>Template: {@code TransferPacket High 17 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferPacket()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TransferPacket extends SLMessage {
    public TransferData TransferData_Field;

    /** Block TransferData, Single. */
    public static class TransferData {
        public int ChannelType; // S32
        public byte[] Data; // Variable 2
        public int Packet; // S32
        public int Status; // S32
        public UUID TransferID; // LLUUID
    }

    public TransferPacket() {
        this.zeroCoded = false;
        this.TransferData_Field = new TransferData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.TransferData_Field.Data.length + 30 + 1;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTransferPacket(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 17 (TransferPacket).
        byteBuffer.put((byte) 0x11);
        packUUID(byteBuffer, this.TransferData_Field.TransferID);
        packInt(byteBuffer, this.TransferData_Field.ChannelType);
        packInt(byteBuffer, this.TransferData_Field.Packet);
        packInt(byteBuffer, this.TransferData_Field.Status);
        packVariable(byteBuffer, this.TransferData_Field.Data, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TransferData_Field.TransferID = unpackUUID(byteBuffer);
        this.TransferData_Field.ChannelType = unpackInt(byteBuffer);
        this.TransferData_Field.Packet = unpackInt(byteBuffer);
        this.TransferData_Field.Status = unpackInt(byteBuffer);
        this.TransferData_Field.Data = unpackVariable(byteBuffer, 2);
    }
}
