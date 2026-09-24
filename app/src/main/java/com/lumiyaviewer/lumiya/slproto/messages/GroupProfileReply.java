package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GroupProfileReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupProfileReply Low 352 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupPropertiesReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupProfileReply extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public boolean AllowPublish; // BOOL
        public byte[] Charter; // Variable 2 - string
        public UUID FounderID; // LLUUID
        public UUID GroupID; // LLUUID
        public int GroupMembershipCount; // S32
        public int GroupRolesCount; // S32
        public UUID InsigniaID; // LLUUID
        public boolean MaturePublish; // BOOL
        public byte[] MemberTitle; // Variable 1 - string
        public int MembershipFee; // S32
        public int Money; // S32
        public byte[] Name; // Variable 1 - string
        public boolean OpenEnrollment; // BOOL
        public UUID OwnerRole; // LLUUID
        public long PowersMask; // U64
        public boolean ShowInList; // BOOL
    }

    public GroupProfileReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.GroupData_Field.Name.length + 17 + 2 + this.GroupData_Field.Charter.length + 1 + 1 + this.GroupData_Field.MemberTitle.length + 8 + 16 + 16 + 4 + 1 + 4 + 4 + 4 + 1 + 1 + 16 + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupProfileReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 352 (GroupProfileReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x60);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        packVariable(byteBuffer, this.GroupData_Field.Name, 1);
        packVariable(byteBuffer, this.GroupData_Field.Charter, 2);
        packBoolean(byteBuffer, this.GroupData_Field.ShowInList);
        packVariable(byteBuffer, this.GroupData_Field.MemberTitle, 1);
        packLong(byteBuffer, this.GroupData_Field.PowersMask);
        packUUID(byteBuffer, this.GroupData_Field.InsigniaID);
        packUUID(byteBuffer, this.GroupData_Field.FounderID);
        packInt(byteBuffer, this.GroupData_Field.MembershipFee);
        packBoolean(byteBuffer, this.GroupData_Field.OpenEnrollment);
        packInt(byteBuffer, this.GroupData_Field.Money);
        packInt(byteBuffer, this.GroupData_Field.GroupMembershipCount);
        packInt(byteBuffer, this.GroupData_Field.GroupRolesCount);
        packBoolean(byteBuffer, this.GroupData_Field.AllowPublish);
        packBoolean(byteBuffer, this.GroupData_Field.MaturePublish);
        packUUID(byteBuffer, this.GroupData_Field.OwnerRole);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        this.GroupData_Field.Name = unpackVariable(byteBuffer, 1);
        this.GroupData_Field.Charter = unpackVariable(byteBuffer, 2);
        this.GroupData_Field.ShowInList = unpackBoolean(byteBuffer);
        this.GroupData_Field.MemberTitle = unpackVariable(byteBuffer, 1);
        this.GroupData_Field.PowersMask = unpackLong(byteBuffer);
        this.GroupData_Field.InsigniaID = unpackUUID(byteBuffer);
        this.GroupData_Field.FounderID = unpackUUID(byteBuffer);
        this.GroupData_Field.MembershipFee = unpackInt(byteBuffer);
        this.GroupData_Field.OpenEnrollment = unpackBoolean(byteBuffer);
        this.GroupData_Field.Money = unpackInt(byteBuffer);
        this.GroupData_Field.GroupMembershipCount = unpackInt(byteBuffer);
        this.GroupData_Field.GroupRolesCount = unpackInt(byteBuffer);
        this.GroupData_Field.AllowPublish = unpackBoolean(byteBuffer);
        this.GroupData_Field.MaturePublish = unpackBoolean(byteBuffer);
        this.GroupData_Field.OwnerRole = unpackUUID(byteBuffer);
    }
}
