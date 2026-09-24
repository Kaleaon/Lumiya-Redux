package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * CreateInventoryFolder
 *
 * <p>Template: {@code CreateInventoryFolder Low 273 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class CreateInventoryFolder extends SLMessage {
    public AgentData AgentData_Field;
    public FolderData FolderData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block FolderData, Single. */
    public static class FolderData {
        public UUID FolderID; // LLUUID
        public byte[] Name; // Variable 1
        public UUID ParentID; // LLUUID
        public int Type; // S8
    }

    public CreateInventoryFolder() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.FolderData_Field = new FolderData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.FolderData_Field.Name.length + 34 + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCreateInventoryFolder(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 273 (CreateInventoryFolder).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x11);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.FolderData_Field.FolderID);
        packUUID(byteBuffer, this.FolderData_Field.ParentID);
        packByte(byteBuffer, (byte) this.FolderData_Field.Type);
        packVariable(byteBuffer, this.FolderData_Field.Name, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.FolderData_Field.FolderID = unpackUUID(byteBuffer);
        this.FolderData_Field.ParentID = unpackUUID(byteBuffer);
        this.FolderData_Field.Type = unpackByte(byteBuffer);
        this.FolderData_Field.Name = unpackVariable(byteBuffer, 1);
    }
}
