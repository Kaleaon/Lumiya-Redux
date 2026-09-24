package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * This is the new improved way to remove inventory items.  It is
 * currently only supported in viewer->userserver->dataserver
 * messages typically initiated by an empty trash method.
 *
 * <p>Template: {@code RemoveInventoryObjects Low 284 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processRemoveInventoryObjects()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RemoveInventoryObjects extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<FolderData> FolderData_Fields = new ArrayList<>();
    public ArrayList<ItemData> ItemData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block FolderData, Variable. */
    public static class FolderData {
        public UUID FolderID; // LLUUID
    }

    /** Block ItemData, Variable. */
    public static class ItemData {
        public UUID ItemID; // LLUUID
    }

    public RemoveInventoryObjects() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.FolderData_Fields.size() * 16) + 37 + 1 + (this.ItemData_Fields.size() * 16);
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleRemoveInventoryObjects(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 284 (RemoveInventoryObjects).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x1C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.FolderData_Fields.size());
        Iterator<?> it = this.FolderData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((FolderData) it.next()).FolderID);
        }
        byteBuffer.put((byte) this.ItemData_Fields.size());
        Iterator<?> iterator = this.ItemData_Fields.iterator();
        while (iterator.hasNext()) {
            packUUID(byteBuffer, ((ItemData) iterator.next()).ItemID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            FolderData folderData = new FolderData();
            folderData.FolderID = unpackUUID(byteBuffer);
            this.FolderData_Fields.add(folderData);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            ItemData itemData = new ItemData();
            itemData.ItemID = unpackUUID(byteBuffer);
            this.ItemData_Fields.add(itemData);
        }
    }
}
