package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupRoleDataReply
 * All role data for this group
 * dataserver -> simulator -> agent
 *
 * <p>Template: {@code GroupRoleDataReply Low 372 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupRoleDataReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupRoleDataReply extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;
    public ArrayList<RoleData> RoleData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
        public UUID RequestID; // LLUUID
        public int RoleCount; // S32
    }

    /** Block RoleData, Variable. */
    public static class RoleData {
        public byte[] Description; // Variable 1
        public int Members; // U32
        public byte[] Name; // Variable 1
        public long Powers; // U64
        public UUID RoleID; // LLUUID
        public byte[] Title; // Variable 1
    }

    public GroupRoleDataReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 57;
        Iterator<?> it = this.RoleData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            RoleData roleData = (RoleData) it.next();
            i = roleData.Description.length + roleData.Name.length + 17 + 1 + roleData.Title.length + 1 + 8 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupRoleDataReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 372 (GroupRoleDataReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x74);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        packUUID(byteBuffer, this.GroupData_Field.RequestID);
        packInt(byteBuffer, this.GroupData_Field.RoleCount);
        byteBuffer.put((byte) this.RoleData_Fields.size());
        for (RoleData roleData : this.RoleData_Fields) {
            packUUID(byteBuffer, roleData.RoleID);
            packVariable(byteBuffer, roleData.Name, 1);
            packVariable(byteBuffer, roleData.Title, 1);
            packVariable(byteBuffer, roleData.Description, 1);
            packLong(byteBuffer, roleData.Powers);
            packInt(byteBuffer, roleData.Members);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        this.GroupData_Field.RequestID = unpackUUID(byteBuffer);
        this.GroupData_Field.RoleCount = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            RoleData roleData = new RoleData();
            roleData.RoleID = unpackUUID(byteBuffer);
            roleData.Name = unpackVariable(byteBuffer, 1);
            roleData.Title = unpackVariable(byteBuffer, 1);
            roleData.Description = unpackVariable(byteBuffer, 1);
            roleData.Powers = unpackLong(byteBuffer);
            roleData.Members = unpackInt(byteBuffer);
            this.RoleData_Fields.add(roleData);
        }
    }
}
