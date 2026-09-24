package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * Viewer -> Sim
 * Used in "Make New Outfit"
 *
 * <p>Template: {@code CreateNewOutfitAttachments Low 398 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class CreateNewOutfitAttachments extends SLMessage {
    public AgentData AgentData_Field;
    public HeaderData HeaderData_Field;
    public ArrayList<ObjectData> ObjectData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block HeaderData, Single. */
    public static class HeaderData {
        public UUID NewFolderID; // LLUUID
    }

    /** Block ObjectData, Variable. */
    public static class ObjectData {
        public UUID OldFolderID; // LLUUID
        public UUID OldItemID; // LLUUID
    }

    public CreateNewOutfitAttachments() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.HeaderData_Field = new HeaderData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ObjectData_Fields.size() * 32) + 53;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCreateNewOutfitAttachments(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 398 (CreateNewOutfitAttachments).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x8E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.HeaderData_Field.NewFolderID);
        byteBuffer.put((byte) this.ObjectData_Fields.size());
        for (ObjectData objectData : this.ObjectData_Fields) {
            packUUID(byteBuffer, objectData.OldItemID);
            packUUID(byteBuffer, objectData.OldFolderID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.HeaderData_Field.NewFolderID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ObjectData objectData = new ObjectData();
            objectData.OldItemID = unpackUUID(byteBuffer);
            objectData.OldFolderID = unpackUUID(byteBuffer);
            this.ObjectData_Fields.add(objectData);
        }
    }
}
