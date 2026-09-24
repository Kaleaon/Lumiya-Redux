package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AvatarGroupsReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AvatarGroupsReply Low 173 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarGroupsReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarGroupsReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<GroupData> GroupData_Fields = new ArrayList<>();
    public NewGroupData NewGroupData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID - your id
        public UUID AvatarID; // LLUUID - avatar you're asking about
    }

    /** Block GroupData, Variable. */
    public static class GroupData {
        public boolean AcceptNotices; // BOOL
        public UUID GroupID; // LLUUID
        public UUID GroupInsigniaID; // LLUUID
        public byte[] GroupName; // Variable 1
        public long GroupPowers; // U64
        public byte[] GroupTitle; // Variable 1
    }

    /** Block NewGroupData, Single. */
    public static class NewGroupData {
        public boolean ListInProfile; // BOOL - whether group displays in profile
    }

    public AvatarGroupsReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.NewGroupData_Field = new NewGroupData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.GroupData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2 + 1;
            }
            GroupData groupData = (GroupData) it.next();
            i = groupData.GroupName.length + groupData.GroupTitle.length + 10 + 16 + 1 + 16 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAvatarGroupsReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 173 (AvatarGroupsReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xAD);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.AvatarID);
        byteBuffer.put((byte) this.GroupData_Fields.size());
        for (GroupData groupData : this.GroupData_Fields) {
            packLong(byteBuffer, groupData.GroupPowers);
            packBoolean(byteBuffer, groupData.AcceptNotices);
            packVariable(byteBuffer, groupData.GroupTitle, 1);
            packUUID(byteBuffer, groupData.GroupID);
            packVariable(byteBuffer, groupData.GroupName, 1);
            packUUID(byteBuffer, groupData.GroupInsigniaID);
        }
        packBoolean(byteBuffer, this.NewGroupData_Field.ListInProfile);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.AvatarID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            GroupData groupData = new GroupData();
            groupData.GroupPowers = unpackLong(byteBuffer);
            groupData.AcceptNotices = unpackBoolean(byteBuffer);
            groupData.GroupTitle = unpackVariable(byteBuffer, 1);
            groupData.GroupID = unpackUUID(byteBuffer);
            groupData.GroupName = unpackVariable(byteBuffer, 1);
            groupData.GroupInsigniaID = unpackUUID(byteBuffer);
            this.GroupData_Fields.add(groupData);
        }
        this.NewGroupData_Field.ListInProfile = unpackBoolean(byteBuffer);
    }
}
