package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * InviteGroupRequest
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code InviteGroupRequest Low 349 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class InviteGroupRequest extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;
    public ArrayList<InviteData> InviteData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID - UUID of inviting agent
        public UUID SessionID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
    }

    /** Block InviteData, Variable. */
    public static class InviteData {
        public UUID InviteeID; // LLUUID
        public UUID RoleID; // LLUUID
    }

    public InviteGroupRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.InviteData_Fields.size() * 32) + 53;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleInviteGroupRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 349 (InviteGroupRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x5D);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        byteBuffer.put((byte) this.InviteData_Fields.size());
        for (InviteData inviteData : this.InviteData_Fields) {
            packUUID(byteBuffer, inviteData.InviteeID);
            packUUID(byteBuffer, inviteData.RoleID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            InviteData inviteData = new InviteData();
            inviteData.InviteeID = unpackUUID(byteBuffer);
            inviteData.RoleID = unpackUUID(byteBuffer);
            this.InviteData_Fields.add(inviteData);
        }
    }
}
