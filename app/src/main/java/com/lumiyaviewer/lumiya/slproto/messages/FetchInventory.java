package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * Get inventory item(s) - response comes through FetchInventoryReply
 *
 * <p>Template: {@code FetchInventory Low 279 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class FetchInventory extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<InventoryData> InventoryData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Variable. */
    public static class InventoryData {
        public UUID ItemID; // LLUUID
        public UUID OwnerID; // LLUUID
    }

    public FetchInventory() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.InventoryData_Fields.size() * 32) + 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleFetchInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 279 (FetchInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x17);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.InventoryData_Fields.size());
        for (InventoryData inventoryData : this.InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.OwnerID);
            packUUID(byteBuffer, inventoryData.ItemID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            InventoryData inventoryData = new InventoryData();
            inventoryData.OwnerID = unpackUUID(byteBuffer);
            inventoryData.ItemID = unpackUUID(byteBuffer);
            this.InventoryData_Fields.add(inventoryData);
        }
    }
}
