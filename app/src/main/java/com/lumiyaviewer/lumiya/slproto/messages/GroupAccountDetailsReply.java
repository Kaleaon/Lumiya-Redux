package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Reliable
 *
 * <p>Template: {@code GroupAccountDetailsReply Low 356 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelGroupLandMoney::processGroupAccountDetailsReply()} in indra/newview/llpanelgrouplandmoney.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupAccountDetailsReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<HistoryData> HistoryData_Fields = new ArrayList<>();
    public MoneyData MoneyData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
    }

    /** Block HistoryData, Variable. */
    public static class HistoryData {
        public int Amount; // S32
        public byte[] Description; // Variable 1 - string
    }

    /** Block MoneyData, Single. */
    public static class MoneyData {
        public int CurrentInterval; // S32
        public int IntervalDays; // S32
        public UUID RequestID; // LLUUID
        public byte[] StartDate; // Variable 1 - string
    }

    public GroupAccountDetailsReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.MoneyData_Field = new MoneyData();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.MoneyData_Field.StartDate.length + 25 + 36 + 1;
        Iterator<?> it = this.HistoryData_Fields.iterator();
        while (true) {
            int i = length;
            if (!it.hasNext()) {
                return i;
            }
            length = ((HistoryData) it.next()).Description.length + 1 + 4 + i;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupAccountDetailsReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 356 (GroupAccountDetailsReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x64);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packUUID(byteBuffer, this.MoneyData_Field.RequestID);
        packInt(byteBuffer, this.MoneyData_Field.IntervalDays);
        packInt(byteBuffer, this.MoneyData_Field.CurrentInterval);
        packVariable(byteBuffer, this.MoneyData_Field.StartDate, 1);
        byteBuffer.put((byte) this.HistoryData_Fields.size());
        for (HistoryData historyData : this.HistoryData_Fields) {
            packVariable(byteBuffer, historyData.Description, 1);
            packInt(byteBuffer, historyData.Amount);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.MoneyData_Field.RequestID = unpackUUID(byteBuffer);
        this.MoneyData_Field.IntervalDays = unpackInt(byteBuffer);
        this.MoneyData_Field.CurrentInterval = unpackInt(byteBuffer);
        this.MoneyData_Field.StartDate = unpackVariable(byteBuffer, 1);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            HistoryData historyData = new HistoryData();
            historyData.Description = unpackVariable(byteBuffer, 1);
            historyData.Amount = unpackInt(byteBuffer);
            this.HistoryData_Fields.add(historyData);
        }
    }
}
