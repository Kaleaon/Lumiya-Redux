package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * LogoutReply
 * it's ok for the viewer to quit.
 * sim -> viewer
 * reliable
 * Includes inventory items to update with new asset ids
 *
 * <p>Template: {@code LogoutReply Low 253 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_logout_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class LogoutReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<InventoryData> InventoryData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block InventoryData, Variable. */
    public static class InventoryData {
        public UUID ItemID; // LLUUID - null if list is actually empty (but has one entry 'cause it can't have none)
    }

    public LogoutReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.InventoryData_Fields.size() * 16) + 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleLogoutReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 253 (LogoutReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xFD);
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
