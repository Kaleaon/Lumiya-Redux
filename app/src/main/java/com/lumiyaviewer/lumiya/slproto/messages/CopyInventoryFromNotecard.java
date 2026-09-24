package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * Inventory update messages
 * UDP DEPRECATED - Now a viewer capability.
 *
 * <p>Template: {@code CopyInventoryFromNotecard Low 265 NotTrusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class CopyInventoryFromNotecard extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<InventoryData> InventoryData_Fields = new ArrayList<>();
    public NotecardData NotecardData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Variable. */
    public static class InventoryData {
        public UUID FolderID; // LLUUID
        public UUID ItemID; // LLUUID
    }

    /** Block NotecardData, Single. */
    public static class NotecardData {
        public UUID NotecardItemID; // LLUUID
        public UUID ObjectID; // LLUUID
    }

    public CopyInventoryFromNotecard() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.NotecardData_Field = new NotecardData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.InventoryData_Fields.size() * 32) + 69;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleCopyInventoryFromNotecard(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 265 (CopyInventoryFromNotecard).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x09);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.NotecardData_Field.NotecardItemID);
        packUUID(byteBuffer, this.NotecardData_Field.ObjectID);
        byteBuffer.put((byte) this.InventoryData_Fields.size());
        for (InventoryData inventoryData : this.InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.ItemID);
            packUUID(byteBuffer, inventoryData.FolderID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.NotecardData_Field.NotecardItemID = unpackUUID(byteBuffer);
        this.NotecardData_Field.ObjectID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            InventoryData inventoryData = new InventoryData();
            inventoryData.ItemID = unpackUUID(byteBuffer);
            inventoryData.FolderID = unpackUUID(byteBuffer);
            this.InventoryData_Fields.add(inventoryData);
        }
    }
}
