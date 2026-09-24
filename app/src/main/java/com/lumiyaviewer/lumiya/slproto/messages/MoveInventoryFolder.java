package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * MoveInventoryFolder
 *
 * <p>Template: {@code MoveInventoryFolder Low 275 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class MoveInventoryFolder extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<InventoryData> InventoryData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
        public boolean Stamp; // BOOL - should the server re-timestamp children
    }

    /** Block InventoryData, Variable. */
    public static class InventoryData {
        public UUID FolderID; // LLUUID
        public UUID ParentID; // LLUUID
    }

    public MoveInventoryFolder() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.InventoryData_Fields.size() * 32) + 38;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMoveInventoryFolder(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 275 (MoveInventoryFolder).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x13);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packBoolean(byteBuffer, this.AgentData_Field.Stamp);
        byteBuffer.put((byte) this.InventoryData_Fields.size());
        for (InventoryData inventoryData : this.InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.FolderID);
            packUUID(byteBuffer, inventoryData.ParentID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.Stamp = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            InventoryData inventoryData = new InventoryData();
            inventoryData.FolderID = unpackUUID(byteBuffer);
            inventoryData.ParentID = unpackUUID(byteBuffer);
            this.InventoryData_Fields.add(inventoryData);
        }
    }
}
