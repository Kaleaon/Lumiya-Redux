package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupDataUpdate
 * This is a bunch of group data that needs to be appropriatly routed based on presence info.
 * dataserver -> simulator
 *
 * <p>Template: {@code GroupDataUpdate Low 388 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupDataUpdate extends SLMessage {
    public ArrayList<AgentGroupData> AgentGroupData_Fields = new ArrayList<>();

    /** Block AgentGroupData, Variable. */
    public static class AgentGroupData {
        public UUID AgentID; // LLUUID
        public long AgentPowers; // U64
        public UUID GroupID; // LLUUID
        public byte[] GroupTitle; // Variable 1
    }

    public GroupDataUpdate() {
        this.zeroCoded = true;
    }

    @Override
    public int CalcPayloadSize() {
        int i = 5;
        Iterator<?> it = this.AgentGroupData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((AgentGroupData) it.next()).GroupTitle.length + 41 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupDataUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 388 (GroupDataUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x84);
        byteBuffer.put((byte) this.AgentGroupData_Fields.size());
        for (AgentGroupData agentGroupData : this.AgentGroupData_Fields) {
            packUUID(byteBuffer, agentGroupData.AgentID);
            packUUID(byteBuffer, agentGroupData.GroupID);
            packLong(byteBuffer, agentGroupData.AgentPowers);
            packVariable(byteBuffer, agentGroupData.GroupTitle, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            AgentGroupData agentGroupData = new AgentGroupData();
            agentGroupData.AgentID = unpackUUID(byteBuffer);
            agentGroupData.GroupID = unpackUUID(byteBuffer);
            agentGroupData.AgentPowers = unpackLong(byteBuffer);
            agentGroupData.GroupTitle = unpackVariable(byteBuffer, 1);
            this.AgentGroupData_Fields.add(agentGroupData);
        }
    }
}
