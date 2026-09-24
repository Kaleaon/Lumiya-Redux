package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * copy inventory item by item id to specified destination folder,
 * send out bulk inventory update when done.
 * Inventory items are only unique for {agent, inv_id} pairs;
 * the OldItemID needs to be paired with the OldAgentID to
 * produce a unique inventory item.
 *
 * <p>Template: {@code CopyInventoryItem Low 269 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class CopyInventoryItem extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<InventoryData> InventoryData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Variable. */
    public static class InventoryData {
        public int CallbackID; // U32 - Async response
        public UUID NewFolderID; // LLUUID
        public byte[] NewName; // Variable 1
        public UUID OldAgentID; // LLUUID
        public UUID OldItemID; // LLUUID
    }

    public CopyInventoryItem() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.InventoryData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((InventoryData) it.next()).NewName.length + 53 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleCopyInventoryItem(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 269 (CopyInventoryItem).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x0D);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.InventoryData_Fields.size());
        for (InventoryData inventoryData : this.InventoryData_Fields) {
            packInt(byteBuffer, inventoryData.CallbackID);
            packUUID(byteBuffer, inventoryData.OldAgentID);
            packUUID(byteBuffer, inventoryData.OldItemID);
            packUUID(byteBuffer, inventoryData.NewFolderID);
            packVariable(byteBuffer, inventoryData.NewName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            InventoryData inventoryData = new InventoryData();
            inventoryData.CallbackID = unpackInt(byteBuffer);
            inventoryData.OldAgentID = unpackUUID(byteBuffer);
            inventoryData.OldItemID = unpackUUID(byteBuffer);
            inventoryData.NewFolderID = unpackUUID(byteBuffer);
            inventoryData.NewName = unpackVariable(byteBuffer, 1);
            this.InventoryData_Fields.add(inventoryData);
        }
    }
}
