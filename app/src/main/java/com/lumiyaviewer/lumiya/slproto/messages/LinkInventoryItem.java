package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Link inventory
 *
 * <p>Template: {@code LinkInventoryItem Low 426 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class LinkInventoryItem extends SLMessage {
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
        public UUID OldItemID; // LLUUID
        public UUID TransactionID; // LLUUID - Going to become TransactionID
        public int Type; // S8
    }

    public LinkInventoryItem() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.InventoryBlock_Field = new InventoryBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.InventoryBlock_Field.Name.length + 55 + 1 + this.InventoryBlock_Field.Description.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleLinkInventoryItem(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 426 (LinkInventoryItem).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xAA);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.InventoryBlock_Field.CallbackID);
        packUUID(byteBuffer, this.InventoryBlock_Field.FolderID);
        packUUID(byteBuffer, this.InventoryBlock_Field.TransactionID);
        packUUID(byteBuffer, this.InventoryBlock_Field.OldItemID);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.Type);
        packByte(byteBuffer, (byte) this.InventoryBlock_Field.InvType);
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
        this.InventoryBlock_Field.OldItemID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.Type = unpackByte(byteBuffer);
        this.InventoryBlock_Field.InvType = unpackByte(byteBuffer);
        this.InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1);
        this.InventoryBlock_Field.Description = unpackVariable(byteBuffer, 1);
    }
}
