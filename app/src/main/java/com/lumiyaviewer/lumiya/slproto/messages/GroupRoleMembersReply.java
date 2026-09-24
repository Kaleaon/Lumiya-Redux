package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * GroupRoleMembersReply
 * All role::member pairs for this group.
 * dataserver -> simulator -> agent
 *
 * <p>Template: {@code GroupRoleMembersReply Low 374 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupRoleMembersReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupRoleMembersReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<MemberData> MemberData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID RequestID; // LLUUID
        public int TotalPairs; // U32
    }

    /** Block MemberData, Variable. */
    public static class MemberData {
        public UUID MemberID; // LLUUID
        public UUID RoleID; // LLUUID
    }

    public GroupRoleMembersReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.MemberData_Fields.size() * 32) + 57;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupRoleMembersReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 374 (GroupRoleMembersReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x76);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packUUID(byteBuffer, this.AgentData_Field.RequestID);
        packInt(byteBuffer, this.AgentData_Field.TotalPairs);
        byteBuffer.put((byte) this.MemberData_Fields.size());
        for (MemberData memberData : this.MemberData_Fields) {
            packUUID(byteBuffer, memberData.RoleID);
            packUUID(byteBuffer, memberData.MemberID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.AgentData_Field.RequestID = unpackUUID(byteBuffer);
        this.AgentData_Field.TotalPairs = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            MemberData memberData = new MemberData();
            memberData.RoleID = unpackUUID(byteBuffer);
            memberData.MemberID = unpackUUID(byteBuffer);
            this.MemberData_Fields.add(memberData);
        }
    }
}
