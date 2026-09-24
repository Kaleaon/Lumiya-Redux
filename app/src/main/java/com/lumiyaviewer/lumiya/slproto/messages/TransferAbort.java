package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Abort a transfer in progress (either from target->source or source->target)
 *
 * <p>Template: {@code TransferAbort Low 155 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTransferAbort()} in indra/llmessage/lltransfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TransferAbort extends SLMessage {
    public TransferInfo TransferInfo_Field;

    /** Block TransferInfo, Single. */
    public static class TransferInfo {
        public int ChannelType; // S32
        public UUID TransferID; // LLUUID
    }

    public TransferAbort() {
        this.zeroCoded = true;
        this.TransferInfo_Field = new TransferInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return 24;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTransferAbort(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 155 (TransferAbort).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x9B);
        packUUID(byteBuffer, this.TransferInfo_Field.TransferID);
        packInt(byteBuffer, this.TransferInfo_Field.ChannelType);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TransferInfo_Field.TransferID = unpackUUID(byteBuffer);
        this.TransferInfo_Field.ChannelType = unpackInt(byteBuffer);
    }
}
