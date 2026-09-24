package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * RequestTaskInventory
 *
 * <p>Template: {@code RequestTaskInventory Low 289 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class RequestTaskInventory extends SLMessage {
    public AgentData AgentData_Field;
    public InventoryData InventoryData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Single. */
    public static class InventoryData {
        public int LocalID; // U32
    }

    public RequestTaskInventory() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.InventoryData_Field = new InventoryData();
    }

    @Override
    public int CalcPayloadSize() {
        return 40;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestTaskInventory(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 289 (RequestTaskInventory).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x21);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.InventoryData_Field.LocalID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.InventoryData_Field.LocalID = unpackInt(byteBuffer);
    }
}
