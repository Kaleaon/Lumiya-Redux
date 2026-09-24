package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * viewer -> userserver -> dataserver
 * Reliable
 *
 * <p>Template: {@code MoneyBalanceRequest Low 313 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class MoneyBalanceRequest extends SLMessage {
    public AgentData AgentData_Field;
    public MoneyData MoneyData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block MoneyData, Single. */
    public static class MoneyData {
        public UUID TransactionID; // LLUUID
    }

    public MoneyBalanceRequest() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.MoneyData_Field = new MoneyData();
    }

    @Override
    public int CalcPayloadSize() {
        return 52;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleMoneyBalanceRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 313 (MoneyBalanceRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x39);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.MoneyData_Field.TransactionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.MoneyData_Field.TransactionID = unpackUUID(byteBuffer);
    }
}
