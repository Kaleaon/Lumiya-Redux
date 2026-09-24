package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * RemoveInventoryFolder
 *
 * <p>Template: {@code RemoveInventoryFolder Low 276 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processRemoveInventoryFolder()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RemoveInventoryFolder extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<FolderData> FolderData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block FolderData, Variable. */
    public static class FolderData {
        public UUID FolderID; // LLUUID
    }

    public RemoveInventoryFolder() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.FolderData_Fields.size() * 16) + 37;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRemoveInventoryFolder(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 276 (RemoveInventoryFolder).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x14);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.FolderData_Fields.size());
        Iterator<?> it = this.FolderData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((FolderData) it.next()).FolderID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            FolderData folderData = new FolderData();
            folderData.FolderID = unpackUUID(byteBuffer);
            this.FolderData_Fields.add(folderData);
        }
    }
}
