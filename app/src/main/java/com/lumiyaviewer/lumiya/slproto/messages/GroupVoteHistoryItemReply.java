package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupVoteHistoryItemReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupVoteHistoryItemReply Low 362 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupVoteHistoryItemReply extends SLMessage {
    public AgentData AgentData_Field;
    public HistoryItemData HistoryItemData_Field;
    public TransactionData TransactionData_Field;
    public ArrayList<VoteItem> VoteItem_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
    }

    /** Block HistoryItemData, Single. */
    public static class HistoryItemData {
        public byte[] EndDateTime; // Variable 1 - string
        public float Majority; // F32
        public byte[] ProposalText; // Variable 2 - string
        public int Quorum; // S32
        public byte[] StartDateTime; // Variable 1 - string
        public byte[] TerseDateID; // Variable 1 - string
        public UUID VoteID; // LLUUID
        public UUID VoteInitiator; // LLUUID
        public byte[] VoteResult; // Variable 1 - string
        public byte[] VoteType; // Variable 1 - string
    }

    /** Block TransactionData, Single. */
    public static class TransactionData {
        public int TotalNumItems; // U32
        public UUID TransactionID; // LLUUID
    }

    /** Block VoteItem, Variable. */
    public static class VoteItem {
        public UUID CandidateID; // LLUUID
        public int NumVotes; // S32
        public byte[] VoteCast; // Variable 1 - string
    }

    public GroupVoteHistoryItemReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.TransactionData_Field = new TransactionData();
        this.HistoryItemData_Field = new HistoryItemData();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.HistoryItemData_Field.TerseDateID.length + 17 + 1 + this.HistoryItemData_Field.StartDateTime.length + 1 + this.HistoryItemData_Field.EndDateTime.length + 16 + 1 + this.HistoryItemData_Field.VoteType.length + 1 + this.HistoryItemData_Field.VoteResult.length + 4 + 4 + 2 + this.HistoryItemData_Field.ProposalText.length + 56 + 1;
        Iterator<?> it = this.VoteItem_Fields.iterator();
        while (true) {
            int length2 = length;
            if (!it.hasNext()) {
                return length2;
            }
            length = ((VoteItem) it.next()).VoteCast.length + 17 + 4 + length2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleGroupVoteHistoryItemReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 362 (GroupVoteHistoryItemReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x6A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packUUID(byteBuffer, this.TransactionData_Field.TransactionID);
        packInt(byteBuffer, this.TransactionData_Field.TotalNumItems);
        packUUID(byteBuffer, this.HistoryItemData_Field.VoteID);
        packVariable(byteBuffer, this.HistoryItemData_Field.TerseDateID, 1);
        packVariable(byteBuffer, this.HistoryItemData_Field.StartDateTime, 1);
        packVariable(byteBuffer, this.HistoryItemData_Field.EndDateTime, 1);
        packUUID(byteBuffer, this.HistoryItemData_Field.VoteInitiator);
        packVariable(byteBuffer, this.HistoryItemData_Field.VoteType, 1);
        packVariable(byteBuffer, this.HistoryItemData_Field.VoteResult, 1);
        packFloat(byteBuffer, this.HistoryItemData_Field.Majority);
        packInt(byteBuffer, this.HistoryItemData_Field.Quorum);
        packVariable(byteBuffer, this.HistoryItemData_Field.ProposalText, 2);
        byteBuffer.put((byte) this.VoteItem_Fields.size());
        for (VoteItem voteItem : this.VoteItem_Fields) {
            packUUID(byteBuffer, voteItem.CandidateID);
            packVariable(byteBuffer, voteItem.VoteCast, 1);
            packInt(byteBuffer, voteItem.NumVotes);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TransactionID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TotalNumItems = unpackInt(byteBuffer);
        this.HistoryItemData_Field.VoteID = unpackUUID(byteBuffer);
        this.HistoryItemData_Field.TerseDateID = unpackVariable(byteBuffer, 1);
        this.HistoryItemData_Field.StartDateTime = unpackVariable(byteBuffer, 1);
        this.HistoryItemData_Field.EndDateTime = unpackVariable(byteBuffer, 1);
        this.HistoryItemData_Field.VoteInitiator = unpackUUID(byteBuffer);
        this.HistoryItemData_Field.VoteType = unpackVariable(byteBuffer, 1);
        this.HistoryItemData_Field.VoteResult = unpackVariable(byteBuffer, 1);
        this.HistoryItemData_Field.Majority = unpackFloat(byteBuffer);
        this.HistoryItemData_Field.Quorum = unpackInt(byteBuffer);
        this.HistoryItemData_Field.ProposalText = unpackVariable(byteBuffer, 2);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            VoteItem voteItem = new VoteItem();
            voteItem.CandidateID = unpackUUID(byteBuffer);
            voteItem.VoteCast = unpackVariable(byteBuffer, 1);
            voteItem.NumVotes = unpackInt(byteBuffer);
            this.VoteItem_Fields.add(voteItem);
        }
    }
}
