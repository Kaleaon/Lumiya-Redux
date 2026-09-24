package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * GroupVoteHistoryRequest
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupVoteHistoryRequest Low 361 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupVoteHistoryRequest extends SLMessage {
    public AgentData AgentData_Field;
    public GroupData GroupData_Field;
    public TransactionData TransactionData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block GroupData, Single. */
    public static class GroupData {
        public UUID GroupID; // LLUUID
    }

    /** Block TransactionData, Single. */
    public static class TransactionData {
        public UUID TransactionID; // LLUUID
    }

    public GroupVoteHistoryRequest() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.GroupData_Field = new GroupData();
        this.TransactionData_Field = new TransactionData();
    }

    @Override
    public int CalcPayloadSize() {
        return 68;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupVoteHistoryRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 361 (GroupVoteHistoryRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x69);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.GroupData_Field.GroupID);
        packUUID(byteBuffer, this.TransactionData_Field.TransactionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.GroupData_Field.GroupID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TransactionID = unpackUUID(byteBuffer);
    }
}
