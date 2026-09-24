package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * RemoveInventoryItem
 *
 * <p>Template: {@code RemoveInventoryItem Low 270 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processRemoveInventoryItem()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RemoveInventoryItem extends SLMessage {
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
    }

    public RemoveInventoryItem() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.InventoryData_Fields.size() * 16) + 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRemoveInventoryItem(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 270 (RemoveInventoryItem).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x0E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.InventoryData_Fields.size());
        Iterator<?> it = this.InventoryData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((InventoryData) it.next()).ItemID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            InventoryData inventoryData = new InventoryData();
            inventoryData.ItemID = unpackUUID(byteBuffer);
            this.InventoryData_Fields.add(inventoryData);
        }
    }
}
