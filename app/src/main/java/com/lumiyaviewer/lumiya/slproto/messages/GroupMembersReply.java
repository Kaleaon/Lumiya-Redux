package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupMembersReply
 * list of uuids for the group members
 * dataserver -> simulator
 * reliable
 *
 * <p>Template: {@code GroupMembersReply Low 367 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupMembersReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupMembersReply extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;
    public ArrayList<MemberData> MemberData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
        public int MemberCount; // S32
        public UUID RequestID; // LLUUID
    }

    /** Block MemberData, Variable. */
    public static class MemberData {
        public UUID AgentID; // LLUUID
        public long AgentPowers; // U64
        public int Contribution; // S32
        public boolean IsOwner; // BOOL
        public byte[] OnlineStatus; // Variable 1 - string
        public byte[] Title; // Variable 1 - string
    }

    public GroupMembersReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 57;
        Iterator<?> it = this.MemberData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            MemberData memberData = (MemberData) it.next();
            i = memberData.Title.length + memberData.OnlineStatus.length + 21 + 8 + 1 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupMembersReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 367 (GroupMembersReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x6F);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        packUUID(byteBuffer, this.GroupData_Field.RequestID);
        packInt(byteBuffer, this.GroupData_Field.MemberCount);
        byteBuffer.put((byte) this.MemberData_Fields.size());
        for (MemberData memberData : this.MemberData_Fields) {
            packUUID(byteBuffer, memberData.AgentID);
            packInt(byteBuffer, memberData.Contribution);
            packVariable(byteBuffer, memberData.OnlineStatus, 1);
            packLong(byteBuffer, memberData.AgentPowers);
            packVariable(byteBuffer, memberData.Title, 1);
            packBoolean(byteBuffer, memberData.IsOwner);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        this.GroupData_Field.RequestID = unpackUUID(byteBuffer);
        this.GroupData_Field.MemberCount = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            MemberData memberData = new MemberData();
            memberData.AgentID = unpackUUID(byteBuffer);
            memberData.Contribution = unpackInt(byteBuffer);
            memberData.OnlineStatus = unpackVariable(byteBuffer, 1);
            memberData.AgentPowers = unpackLong(byteBuffer);
            memberData.Title = unpackVariable(byteBuffer, 1);
            memberData.IsOwner = unpackBoolean(byteBuffer);
            this.MemberData_Fields.add(memberData);
        }
    }
}
