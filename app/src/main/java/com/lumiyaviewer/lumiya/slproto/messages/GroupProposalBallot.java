package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GroupProposalBallot
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupProposalBallot Low 364 NotTrusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class GroupProposalBallot extends SLMessage {
    public AgentData AgentData_Field;
    public ProposalData ProposalData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ProposalData, Single. */
    public static class ProposalData {
        public UUID GroupID; // LLUUID
        public UUID ProposalID; // LLUUID
        public byte[] VoteCast; // Variable 1 - string
    }

    public GroupProposalBallot() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.ProposalData_Field = new ProposalData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ProposalData_Field.VoteCast.length + 33 + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupProposalBallot(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 364 (GroupProposalBallot).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x6C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.ProposalData_Field.ProposalID);
        packUUID(byteBuffer, this.ProposalData_Field.GroupID);
        packVariable(byteBuffer, this.ProposalData_Field.VoteCast, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ProposalData_Field.ProposalID = unpackUUID(byteBuffer);
        this.ProposalData_Field.GroupID = unpackUUID(byteBuffer);
        this.ProposalData_Field.VoteCast = unpackVariable(byteBuffer, 1);
    }
}
