package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Return info about a transfer/initiate transfer (source->target)
 * Possibly should have a Params field like above
 *
 * <p>Template: {@code TransferInfo Low 154 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferInfo()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TransferInfo extends SLMessage {
    public TransferInfoData TransferInfoData_Field;

    public static class TransferInfoData {
        public int ChannelType; // S32
        public byte[] Params; // Variable 2
        public int Size; // S32
        public int Status; // S32
        public int TargetType; // S32
        public UUID TransferID; // LLUUID
    }

    public TransferInfo() {
        this.zeroCoded = true;
        this.TransferInfoData_Field = new TransferInfoData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.TransferInfoData_Field.Params.length + 34 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTransferInfo(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 154 (TransferInfo).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x9A);
        packUUID(byteBuffer, this.TransferInfoData_Field.TransferID);
        packInt(byteBuffer, this.TransferInfoData_Field.ChannelType);
        packInt(byteBuffer, this.TransferInfoData_Field.TargetType);
        packInt(byteBuffer, this.TransferInfoData_Field.Status);
        packInt(byteBuffer, this.TransferInfoData_Field.Size);
        packVariable(byteBuffer, this.TransferInfoData_Field.Params, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TransferInfoData_Field.TransferID = unpackUUID(byteBuffer);
        this.TransferInfoData_Field.ChannelType = unpackInt(byteBuffer);
        this.TransferInfoData_Field.TargetType = unpackInt(byteBuffer);
        this.TransferInfoData_Field.Status = unpackInt(byteBuffer);
        this.TransferInfoData_Field.Size = unpackInt(byteBuffer);
        this.TransferInfoData_Field.Params = unpackVariable(byteBuffer, 2);
    }
}
