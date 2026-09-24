package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * New Transfer system
 * Request a new transfer (target->source)
 *
 * <p>Template: {@code TransferRequest Low 153 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferRequest()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TransferRequest extends SLMessage {
    public TransferInfo TransferInfo_Field;

    /** Block TransferInfo, Single. */
    public static class TransferInfo {
        public int ChannelType; // S32
        public byte[] Params; // Variable 2
        public float Priority; // F32
        public int SourceType; // S32
        public UUID TransferID; // LLUUID
    }

    public TransferRequest() {
        this.zeroCoded = true;
        this.TransferInfo_Field = new TransferInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.TransferInfo_Field.Params.length + 30 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTransferRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 153 (TransferRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x99);
        packUUID(byteBuffer, this.TransferInfo_Field.TransferID);
        packInt(byteBuffer, this.TransferInfo_Field.ChannelType);
        packInt(byteBuffer, this.TransferInfo_Field.SourceType);
        packFloat(byteBuffer, this.TransferInfo_Field.Priority);
        packVariable(byteBuffer, this.TransferInfo_Field.Params, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TransferInfo_Field.TransferID = unpackUUID(byteBuffer);
        this.TransferInfo_Field.ChannelType = unpackInt(byteBuffer);
        this.TransferInfo_Field.SourceType = unpackInt(byteBuffer);
        this.TransferInfo_Field.Priority = unpackFloat(byteBuffer);
        this.TransferInfo_Field.Params = unpackVariable(byteBuffer, 2);
    }
}
