package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * MoveTaskInventory
 *
 * <p>Template: {@code MoveTaskInventory Low 288 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MoveTaskInventory extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryData InventoryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID FolderID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Single. */
    public static class InventoryData {
        public UUID ItemID; // LLUUID
        public int LocalID; // U32
    }

    public MoveTaskInventory() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 72;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMoveTaskInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 288 (MoveTaskInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x20);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.FolderID);
        packInt(byteBuffer, this.InventoryData_Field.LocalID);
        packUUID(byteBuffer, this.InventoryData_Field.ItemID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.FolderID = unpackUUID(byteBuffer);
        this.InventoryData_Field.LocalID = unpackInt(byteBuffer);
        this.InventoryData_Field.ItemID = unpackUUID(byteBuffer);
    }
}
