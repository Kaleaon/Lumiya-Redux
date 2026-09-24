package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * dataserver -> sim
 * InventoryID is the id of the inventory object that the end user
 * should discard if they deny the transfer.
 *
 * <p>Template: {@code TransferInventoryAck Low 296 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class TransferInventoryAck extends SLMessage {
    public InfoBlock InfoBlock_Field;

    /** Block InfoBlock, Single. */
    public static class InfoBlock {
        public UUID InventoryID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    public TransferInventoryAck() {
        this.zeroCoded = true;
        this.InfoBlock_Field = new InfoBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTransferInventoryAck(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 296 (TransferInventoryAck).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x28);
        packUUID(byteBuffer, this.InfoBlock_Field.TransactionID);
        packUUID(byteBuffer, this.InfoBlock_Field.InventoryID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.InfoBlock_Field.TransactionID = unpackUUID(byteBuffer);
        this.InfoBlock_Field.InventoryID = unpackUUID(byteBuffer);
    }
}
