package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AgentDataUpdate
 * Updates a viewer or simulator's impression of agent-specific information.
 * Used, for example, when an agent's group changes.
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AgentDataUpdate Low 387 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAgent::processAgentDataUpdate()} in indra/newview/llagent.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AgentDataUpdate extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID ActiveGroupID; // LLUUID - active group
        public UUID AgentID; // LLUUID
        public byte[] FirstName; // Variable 1 - string
        public byte[] GroupName; // Variable 1 - string
        public long GroupPowers; // U64
        public byte[] GroupTitle; // Variable 1 - string
        public byte[] LastName; // Variable 1 - string
    }

    public AgentDataUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.AgentData_Field.FirstName.length + 17 + 1 + this.AgentData_Field.LastName.length + 1 + this.AgentData_Field.GroupTitle.length + 16 + 8 + 1 + this.AgentData_Field.GroupName.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentDataUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 387 (AgentDataUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x83);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packVariable(byteBuffer, this.AgentData_Field.FirstName, 1);
        packVariable(byteBuffer, this.AgentData_Field.LastName, 1);
        packVariable(byteBuffer, this.AgentData_Field.GroupTitle, 1);
        packUUID(byteBuffer, this.AgentData_Field.ActiveGroupID);
        packLong(byteBuffer, this.AgentData_Field.GroupPowers);
        packVariable(byteBuffer, this.AgentData_Field.GroupName, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.FirstName = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.LastName = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.GroupTitle = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.ActiveGroupID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupPowers = unpackLong(byteBuffer);
        this.AgentData_Field.GroupName = unpackVariable(byteBuffer, 1);
    }
}
