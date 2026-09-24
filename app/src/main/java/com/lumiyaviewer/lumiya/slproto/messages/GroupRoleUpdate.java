package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupRoleUpdate
 * viewer -> simulator -> dataserver
 *
 * <p>Template: {@code GroupRoleUpdate Low 378 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupRoleUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<RoleData> RoleData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block RoleData, Variable. */
    public static class RoleData {
        public byte[] Description; // Variable 1
        public byte[] Name; // Variable 1
        public long Powers; // U64
        public UUID RoleID; // LLUUID
        public byte[] Title; // Variable 1
        public int UpdateType; // U8
    }

    public GroupRoleUpdate() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 53;
        Iterator<?> it = this.RoleData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            RoleData roleData = (RoleData) it.next();
            i = roleData.Title.length + roleData.Name.length + 17 + 1 + roleData.Description.length + 1 + 8 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleGroupRoleUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 378 (GroupRoleUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x7A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        byteBuffer.put((byte) this.RoleData_Fields.size());
        for (RoleData roleData : this.RoleData_Fields) {
            packUUID(byteBuffer, roleData.RoleID);
            packVariable(byteBuffer, roleData.Name, 1);
            packVariable(byteBuffer, roleData.Description, 1);
            packVariable(byteBuffer, roleData.Title, 1);
            packLong(byteBuffer, roleData.Powers);
            packByte(byteBuffer, (byte) roleData.UpdateType);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            RoleData roleData = new RoleData();
            roleData.RoleID = unpackUUID(byteBuffer);
            roleData.Name = unpackVariable(byteBuffer, 1);
            roleData.Description = unpackVariable(byteBuffer, 1);
            roleData.Title = unpackVariable(byteBuffer, 1);
            roleData.Powers = unpackLong(byteBuffer);
            roleData.UpdateType = unpackByte(byteBuffer) & 0xFF;
            this.RoleData_Fields.add(roleData);
        }
    }
}
