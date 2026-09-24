package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Get inventory segment.
 *
 * <p>Template: {@code FetchInventoryDescendents Low 277 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class FetchInventoryDescendents extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryData InventoryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Single. */
    public static class InventoryData {
        public boolean FetchFolders; // BOOL - false will omit folders in query
        public boolean FetchItems; // BOOL - false will omit items in query
        public UUID FolderID; // LLUUID
        public UUID OwnerID; // LLUUID
        public int SortOrder; // S32 - 0 = name, 1 = time
    }

    public FetchInventoryDescendents() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 74;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleFetchInventoryDescendents(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 277 (FetchInventoryDescendents).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x15);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.InventoryData_Field.FolderID);
        packUUID(byteBuffer, this.InventoryData_Field.OwnerID);
        packInt(byteBuffer, this.InventoryData_Field.SortOrder);
        packBoolean(byteBuffer, this.InventoryData_Field.FetchFolders);
        packBoolean(byteBuffer, this.InventoryData_Field.FetchItems);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.InventoryData_Field.FolderID = unpackUUID(byteBuffer);
        this.InventoryData_Field.OwnerID = unpackUUID(byteBuffer);
        this.InventoryData_Field.SortOrder = unpackInt(byteBuffer);
        this.InventoryData_Field.FetchFolders = unpackBoolean(byteBuffer);
        this.InventoryData_Field.FetchItems = unpackBoolean(byteBuffer);
    }
}
