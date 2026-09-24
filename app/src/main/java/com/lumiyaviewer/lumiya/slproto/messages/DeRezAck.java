package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * This message is sent when a derez succeeds, but there's no way to
 * know, since no inventory is created on the viewer. For example, when
 * saving into task inventory.
 *
 * <p>Template: {@code DeRezAck Low 292 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_derez_ack()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DeRezAck extends SLMessage {
    public TransactionData TransactionData_Field;

    /** Block TransactionData, Single. */
    public static class TransactionData {
        public boolean Success; // BOOL
        public UUID TransactionID; // LLUUID
    }

    public DeRezAck() {
        this.zeroCoded = false;
        this.TransactionData_Field = new TransactionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 21;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDeRezAck(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 292 (DeRezAck).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x24);
        packUUID(byteBuffer, this.TransactionData_Field.TransactionID);
        packBoolean(byteBuffer, this.TransactionData_Field.Success);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TransactionData_Field.TransactionID = unpackUUID(byteBuffer);
        this.TransactionData_Field.Success = unpackBoolean(byteBuffer);
    }
}
