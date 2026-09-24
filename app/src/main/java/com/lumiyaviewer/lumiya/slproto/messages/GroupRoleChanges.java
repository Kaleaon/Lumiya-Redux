package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * GroupRoleChanges
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupRoleChanges Low 342 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupRoleChanges extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<RoleChange> RoleChange_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RoleChange, Variable. */
    public static class RoleChange {
        public int Change; // U32
        public UUID MemberID; // LLUUID
        public UUID RoleID; // LLUUID
    }

    public GroupRoleChanges() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.RoleChange_Fields.size() * 36) + 53;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleGroupRoleChanges(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 342 (GroupRoleChanges).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x56);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        byteBuffer.put((byte) this.RoleChange_Fields.size());
        for (RoleChange roleChange : this.RoleChange_Fields) {
            packUUID(byteBuffer, roleChange.RoleID);
            packUUID(byteBuffer, roleChange.MemberID);
            packInt(byteBuffer, roleChange.Change);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            RoleChange roleChange = new RoleChange();
            roleChange.RoleID = unpackUUID(byteBuffer);
            roleChange.MemberID = unpackUUID(byteBuffer);
            roleChange.Change = unpackInt(byteBuffer);
            this.RoleChange_Fields.add(roleChange);
        }
    }
}
