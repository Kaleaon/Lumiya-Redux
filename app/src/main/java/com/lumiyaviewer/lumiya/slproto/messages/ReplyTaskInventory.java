package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ReplyTaskInventory
 *
 * <p>Template: {@code ReplyTaskInventory Low 290 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerObject::processTaskInv()} in indra/newview/llviewerobject.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ReplyTaskInventory extends SLMessage {
    public InventoryData InventoryData_Field;

    /** Block InventoryData, Single. */
    public static class InventoryData {
        public byte[] Filename; // Variable 1
        public int Serial; // S16
        public UUID TaskID; // LLUUID
    }

    public ReplyTaskInventory() {
        this.zeroCoded = true;
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.InventoryData_Field.Filename.length + 19 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleReplyTaskInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 290 (ReplyTaskInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x22);
        packUUID(byteBuffer, this.InventoryData_Field.TaskID);
        packShort(byteBuffer, (short) this.InventoryData_Field.Serial);
        packVariable(byteBuffer, this.InventoryData_Field.Filename, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.InventoryData_Field.TaskID = unpackUUID(byteBuffer);
        this.InventoryData_Field.Serial = unpackShort(byteBuffer);
        this.InventoryData_Field.Filename = unpackVariable(byteBuffer, 1);
    }
}
