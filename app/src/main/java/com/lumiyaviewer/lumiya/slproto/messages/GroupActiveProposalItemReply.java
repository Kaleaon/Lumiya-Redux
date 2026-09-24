package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupActiveProposalItemReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupActiveProposalItemReply Low 360 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupActiveProposalItemReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ProposalData> ProposalData_Fields = new ArrayList<>();
    public TransactionData TransactionData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
    }

    /** Block ProposalData, Variable. */
    public static class ProposalData {
        public boolean AlreadyVoted; // BOOL
        public byte[] EndDateTime; // Variable 1 - string
        public float Majority; // F32
        public byte[] ProposalText; // Variable 1 - string
        public int Quorum; // S32
        public byte[] StartDateTime; // Variable 1 - string
        public byte[] TerseDateID; // Variable 1 - string
        public byte[] VoteCast; // Variable 1 - string
        public UUID VoteID; // LLUUID
        public UUID VoteInitiator; // LLUUID
    }

    /** Block TransactionData, Single. */
    public static class TransactionData {
        public int TotalNumItems; // U32
        public UUID TransactionID; // LLUUID
    }

    public GroupActiveProposalItemReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.TransactionData_Field = new TransactionData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 57;
        Iterator<?> it = this.ProposalData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            ProposalData proposalData = (ProposalData) it.next();
            i = proposalData.ProposalText.length + proposalData.TerseDateID.length + 33 + 1 + proposalData.StartDateTime.length + 1 + proposalData.EndDateTime.length + 1 + 1 + proposalData.VoteCast.length + 4 + 4 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleGroupActiveProposalItemReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 360 (GroupActiveProposalItemReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x68);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packUUID(byteBuffer, this.TransactionData_Field.TransactionID);
        packInt(byteBuffer, this.TransactionData_Field.TotalNumItems);
        byteBuffer.put((byte) this.ProposalData_Fields.size());
        for (ProposalData proposalData : this.ProposalData_Fields) {
            packUUID(byteBuffer, proposalData.VoteID);
            packUUID(byteBuffer, proposalData.VoteInitiator);
            packVariable(byteBuffer, proposalData.TerseDateID, 1);
            packVariable(byteBuffer, proposalData.StartDateTime, 1);
            packVariable(byteBuffer, proposalData.EndDateTime, 1);
            packBoolean(byteBuffer, proposalData.AlreadyVoted);
            packVariable(byteBuffer, proposalData.VoteCast, 1);
            packFloat(byteBuffer, proposalData.Majority);
            packInt(byteBuffer, proposalData.Quorum);
            packVariable(byteBuffer, proposalData.ProposalText, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TransactionID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TotalNumItems = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ProposalData proposalData = new ProposalData();
            proposalData.VoteID = unpackUUID(byteBuffer);
            proposalData.VoteInitiator = unpackUUID(byteBuffer);
            proposalData.TerseDateID = unpackVariable(byteBuffer, 1);
            proposalData.StartDateTime = unpackVariable(byteBuffer, 1);
            proposalData.EndDateTime = unpackVariable(byteBuffer, 1);
            proposalData.AlreadyVoted = unpackBoolean(byteBuffer);
            proposalData.VoteCast = unpackVariable(byteBuffer, 1);
            proposalData.Majority = unpackFloat(byteBuffer);
            proposalData.Quorum = unpackInt(byteBuffer);
            proposalData.ProposalText = unpackVariable(byteBuffer, 1);
            this.ProposalData_Fields.add(proposalData);
        }
    }
}
