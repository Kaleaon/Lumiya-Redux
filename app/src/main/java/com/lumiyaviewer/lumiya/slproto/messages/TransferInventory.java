package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * sim -> dataserver
 * sent during agent to agent inventory transfers
 *
 * <p>Template: {@code TransferInventory Low 295 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class TransferInventory extends SLMessage {
    public InfoBlock InfoBlock_Field;
    public ArrayList<InventoryBlock> InventoryBlock_Fields = new ArrayList<>();

    /** Block InfoBlock, Single. */
    public static class InfoBlock {
        public UUID DestID; // LLUUID
        public UUID SourceID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    /** Block InventoryBlock, Variable. */
    public static class InventoryBlock {
        public UUID InventoryID; // LLUUID
        public int Type; // S8
    }

    public TransferInventory() {
        this.zeroCoded = true;
        this.InfoBlock_Field = new InfoBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.InventoryBlock_Fields.size() * 17) + 53;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTransferInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 295 (TransferInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x27);
        packUUID(byteBuffer, this.InfoBlock_Field.SourceID);
        packUUID(byteBuffer, this.InfoBlock_Field.DestID);
        packUUID(byteBuffer, this.InfoBlock_Field.TransactionID);
        byteBuffer.put((byte) this.InventoryBlock_Fields.size());
        for (InventoryBlock inventoryBlock : this.InventoryBlock_Fields) {
            packUUID(byteBuffer, inventoryBlock.InventoryID);
            packByte(byteBuffer, (byte) inventoryBlock.Type);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.InfoBlock_Field.SourceID = unpackUUID(byteBuffer);
        this.InfoBlock_Field.DestID = unpackUUID(byteBuffer);
        this.InfoBlock_Field.TransactionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            InventoryBlock inventoryBlock = new InventoryBlock();
            inventoryBlock.InventoryID = unpackUUID(byteBuffer);
            inventoryBlock.Type = unpackByte(byteBuffer);
            this.InventoryBlock_Fields.add(inventoryBlock);
        }
    }
}
