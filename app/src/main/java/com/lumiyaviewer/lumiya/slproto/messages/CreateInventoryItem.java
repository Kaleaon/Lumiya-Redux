package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Create inventory
 *
 * <p>Template: {@code CreateInventoryItem Low 305 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class CreateInventoryItem extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryBlock InventoryBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryBlock, Single. */
    public static class InventoryBlock {
        public int CallbackID; // U32 - Async Response
        public byte[] Description; // Variable 1
        public UUID FolderID; // LLUUID
        public int InvType; // S8
        public byte[] Name; // Variable 1
        public int NextOwnerMask; // U32
        public UUID TransactionID; // LLUUID - Going to become TransactionID
        public int Type; // S8
        public int WearableType; // U8
    }

    public CreateInventoryItem() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.InventoryBlock_Field = new InventoryBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.InventoryBlock_Field.Name.length + 44 + 1 + this.InventoryBlock_Field.Description.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCreateInventoryItem(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 305 (CreateInventoryItem).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x31);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.InventoryBlock_Field.CallbackID);
        packUUID(byteBuffer, this.InventoryBlock_Field.FolderID);
        packUUID(byteBuffer, this.InventoryBlock_Field.TransactionID);
        packInt(byteBuffer, this.InventoryBlock_Field.NextOwnerMask);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.Type);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.InvType);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.WearableType);
        packVariable(byteBuffer, this.InventoryBlock_Field.Name, 1);
        packVariable(byteBuffer, this.InventoryBlock_Field.Description, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.CallbackID = unpackInt(byteBuffer);
        this.InventoryBlock_Field.FolderID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.TransactionID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.NextOwnerMask = unpackInt(byteBuffer);
        this.InventoryBlock_Field.Type = unpackByte(byteBuffer);
        this.InventoryBlock_Field.InvType = unpackByte(byteBuffer);
        this.InventoryBlock_Field.WearableType = unpackByte(byteBuffer) & 0xFF;
        this.InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1);
        this.InventoryBlock_Field.Description = unpackVariable(byteBuffer, 1);
    }
}
