package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AgentGroupDataUpdate
 * Updates a viewer or simulator's impression of the groups an agent is in.
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AgentGroupDataUpdate Low 389 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAgent::processAgentGroupDataUpdate()} in indra/newview/llagent.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AgentGroupDataUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<GroupData> GroupData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block GroupData, Variable. */
    public static class GroupData {
        public boolean AcceptNotices; // BOOL
        public int Contribution; // S32
        public UUID GroupID; // LLUUID
        public UUID GroupInsigniaID; // LLUUID
        public byte[] GroupName; // Variable 1 - string
        public long GroupPowers; // U64
    }

    public AgentGroupDataUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 21;
        Iterator<?> it = this.GroupData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((GroupData) it.next()).GroupName.length + 46 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentGroupDataUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 389 (AgentGroupDataUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x85);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        byteBuffer.put((byte) this.GroupData_Fields.size());
        for (GroupData groupData : this.GroupData_Fields) {
            packUUID(byteBuffer, groupData.GroupID);
            packLong(byteBuffer, groupData.GroupPowers);
            packBoolean(byteBuffer, groupData.AcceptNotices);
            packUUID(byteBuffer, groupData.GroupInsigniaID);
            packInt(byteBuffer, groupData.Contribution);
            packVariable(byteBuffer, groupData.GroupName, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            GroupData groupData = new GroupData();
            groupData.GroupID = unpackUUID(byteBuffer);
            groupData.GroupPowers = unpackLong(byteBuffer);
            groupData.AcceptNotices = unpackBoolean(byteBuffer);
            groupData.GroupInsigniaID = unpackUUID(byteBuffer);
            groupData.Contribution = unpackInt(byteBuffer);
            groupData.GroupName = unpackVariable(byteBuffer, 1);
            this.GroupData_Fields.add(groupData);
        }
    }
}
