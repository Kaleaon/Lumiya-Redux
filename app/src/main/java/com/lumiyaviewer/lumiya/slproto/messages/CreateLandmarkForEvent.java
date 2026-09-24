package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * give agent a landmark for an event.
 *
 * <p>Template: {@code CreateLandmarkForEvent Low 306 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class CreateLandmarkForEvent extends SLMessage {
    public AgentData AgentData_Field;
    public EventData EventData_Field;
    public InventoryBlock InventoryBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block EventData, Single. */
    public static class EventData {
        public int EventID; // U32
    }

    /** Block InventoryBlock, Single. */
    public static class InventoryBlock {
        public UUID FolderID; // LLUUID
        public byte[] Name; // Variable 1
    }

    public CreateLandmarkForEvent() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.EventData_Field = new EventData();
        this.InventoryBlock_Field = new InventoryBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.InventoryBlock_Field.Name.length + 17 + 40;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCreateLandmarkForEvent(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 306 (CreateLandmarkForEvent).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x32);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.EventData_Field.EventID);
        packUUID(byteBuffer, this.InventoryBlock_Field.FolderID);
        packVariable(byteBuffer, this.InventoryBlock_Field.Name, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.EventData_Field.EventID = unpackInt(byteBuffer);
        this.InventoryBlock_Field.FolderID = unpackUUID(byteBuffer);
        this.InventoryBlock_Field.Name = unpackVariable(byteBuffer, 1);
    }
}
