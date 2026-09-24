package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupTitlesReply
 * dataserver -> simulator -> viewer
 *
 * <p>Template: {@code GroupTitlesReply Low 376 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupTitlesReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupTitlesReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<GroupData> GroupData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID RequestID; // LLUUID
    }

    /** Block GroupData, Variable. */
    public static class GroupData {
        public UUID RoleID; // LLUUID
        public boolean Selected; // BOOL
        public byte[] Title; // Variable 1 - string
    }

    public GroupTitlesReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 53;
        Iterator<?> it = this.GroupData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((GroupData) it.next()).Title.length + 1 + 16 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleGroupTitlesReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 376 (GroupTitlesReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x78);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packUUID(byteBuffer, this.AgentData_Field.RequestID);
        byteBuffer.put((byte) this.GroupData_Fields.size());
        for (GroupData groupData : this.GroupData_Fields) {
            packVariable(byteBuffer, groupData.Title, 1);
            packUUID(byteBuffer, groupData.RoleID);
            packBoolean(byteBuffer, groupData.Selected);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.AgentData_Field.RequestID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            GroupData groupData = new GroupData();
            groupData.Title = unpackVariable(byteBuffer, 1);
            groupData.RoleID = unpackUUID(byteBuffer);
            groupData.Selected = unpackBoolean(byteBuffer);
            this.GroupData_Fields.add(groupData);
        }
    }
}
