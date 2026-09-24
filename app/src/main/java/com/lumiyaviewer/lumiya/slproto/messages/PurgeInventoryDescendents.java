package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * This is how you remove inventory when you're not even sure what it
 * is - only it's parenting.
 *
 * <p>Template: {@code PurgeInventoryDescendents Low 285 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class PurgeInventoryDescendents extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryData InventoryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Single. */
    public static class InventoryData {
        public UUID FolderID; // LLUUID
    }

    public PurgeInventoryDescendents() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandlePurgeInventoryDescendents(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 285 (PurgeInventoryDescendents).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x1D);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.InventoryData_Field.FolderID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.InventoryData_Field.FolderID = unpackUUID(byteBuffer);
    }
}
