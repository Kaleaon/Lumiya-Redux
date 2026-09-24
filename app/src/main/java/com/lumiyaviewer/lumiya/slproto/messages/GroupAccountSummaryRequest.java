package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * CurrentInterval = 0  =>  this period (week, day, etc.)
 * CurrentInterval = 1  =>  last period
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupAccountSummaryRequest Low 353 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class GroupAccountSummaryRequest extends SLMessage {
    public AgentData AgentData_Field;
    public MoneyData MoneyData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block MoneyData, Single. */
    public static class MoneyData {
        public int CurrentInterval; // S32
        public int IntervalDays; // S32
        public UUID RequestID; // LLUUID
    }

    public GroupAccountSummaryRequest() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.MoneyData_Field = new MoneyData();
    }

    @Override
    public int CalcPayloadSize() {
        return 76;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupAccountSummaryRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 353 (GroupAccountSummaryRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x61);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packUUID(byteBuffer, this.MoneyData_Field.RequestID);
        packInt(byteBuffer, this.MoneyData_Field.IntervalDays);
        packInt(byteBuffer, this.MoneyData_Field.CurrentInterval);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.MoneyData_Field.RequestID = unpackUUID(byteBuffer);
        this.MoneyData_Field.IntervalDays = unpackInt(byteBuffer);
        this.MoneyData_Field.CurrentInterval = unpackInt(byteBuffer);
    }
}
