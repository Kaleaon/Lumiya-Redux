package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * StartGroupProposal
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code StartGroupProposal Low 363 NotTrusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
public class StartGroupProposal extends SLMessage {
    public AgentData AgentData_Field;
    public ProposalData ProposalData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ProposalData, Single. */
    public static class ProposalData {
        public int Duration; // S32 - seconds
        public UUID GroupID; // LLUUID
        public float Majority; // F32
        public byte[] ProposalText; // Variable 1 - string
        public int Quorum; // S32
    }

    public StartGroupProposal() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ProposalData_Field = new ProposalData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ProposalData_Field.ProposalText.length + 29 + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleStartGroupProposal(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 363 (StartGroupProposal).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x6B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.ProposalData_Field.GroupID);
        packInt(byteBuffer, this.ProposalData_Field.Quorum);
        packFloat(byteBuffer, this.ProposalData_Field.Majority);
        packInt(byteBuffer, this.ProposalData_Field.Duration);
        packVariable(byteBuffer, this.ProposalData_Field.ProposalText, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ProposalData_Field.GroupID = unpackUUID(byteBuffer);
        this.ProposalData_Field.Quorum = unpackInt(byteBuffer);
        this.ProposalData_Field.Majority = unpackFloat(byteBuffer);
        this.ProposalData_Field.Duration = unpackInt(byteBuffer);
        this.ProposalData_Field.ProposalText = unpackVariable(byteBuffer, 1);
    }
}
