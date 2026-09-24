package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * dataserver -> simulator -> viewer
 * Reliable
 *
 * <p>Template: {@code GroupAccountSummaryReply Low 354 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelGroupLandMoney::processGroupAccountSummaryReply()} in indra/newview/llpanelgrouplandmoney.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupAccountSummaryReply extends SLMessage {
    public AgentData AgentData_Field;
    public MoneyData MoneyData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
    }

    /** Block MoneyData, Single. */
    public static class MoneyData {
        public int Balance; // S32
        public int CurrentInterval; // S32
        public int GroupTaxCurrent; // S32
        public int GroupTaxEstimate; // S32
        public int IntervalDays; // S32
        public int LandTaxCurrent; // S32
        public int LandTaxEstimate; // S32
        public byte[] LastTaxDate; // Variable 1 - string
        public int LightTaxCurrent; // S32
        public int LightTaxEstimate; // S32
        public int NonExemptMembers; // S32
        public int ObjectTaxCurrent; // S32
        public int ObjectTaxEstimate; // S32
        public int ParcelDirFeeCurrent; // S32
        public int ParcelDirFeeEstimate; // S32
        public UUID RequestID; // LLUUID
        public byte[] StartDate; // Variable 1 - string
        public byte[] TaxDate; // Variable 1 - string
        public int TotalCredits; // S32
        public int TotalDebits; // S32
    }

    public GroupAccountSummaryReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.MoneyData_Field = new MoneyData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MoneyData_Field.StartDate.length + 25 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 1 + this.MoneyData_Field.LastTaxDate.length + 1 + this.MoneyData_Field.TaxDate.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleGroupAccountSummaryReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 354 (GroupAccountSummaryReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x62);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        packUUID(byteBuffer, this.MoneyData_Field.RequestID);
        packInt(byteBuffer, this.MoneyData_Field.IntervalDays);
        packInt(byteBuffer, this.MoneyData_Field.CurrentInterval);
        packVariable(byteBuffer, this.MoneyData_Field.StartDate, 1);
        packInt(byteBuffer, this.MoneyData_Field.Balance);
        packInt(byteBuffer, this.MoneyData_Field.TotalCredits);
        packInt(byteBuffer, this.MoneyData_Field.TotalDebits);
        packInt(byteBuffer, this.MoneyData_Field.ObjectTaxCurrent);
        packInt(byteBuffer, this.MoneyData_Field.LightTaxCurrent);
        packInt(byteBuffer, this.MoneyData_Field.LandTaxCurrent);
        packInt(byteBuffer, this.MoneyData_Field.GroupTaxCurrent);
        packInt(byteBuffer, this.MoneyData_Field.ParcelDirFeeCurrent);
        packInt(byteBuffer, this.MoneyData_Field.ObjectTaxEstimate);
        packInt(byteBuffer, this.MoneyData_Field.LightTaxEstimate);
        packInt(byteBuffer, this.MoneyData_Field.LandTaxEstimate);
        packInt(byteBuffer, this.MoneyData_Field.GroupTaxEstimate);
        packInt(byteBuffer, this.MoneyData_Field.ParcelDirFeeEstimate);
        packInt(byteBuffer, this.MoneyData_Field.NonExemptMembers);
        packVariable(byteBuffer, this.MoneyData_Field.LastTaxDate, 1);
        packVariable(byteBuffer, this.MoneyData_Field.TaxDate, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        this.MoneyData_Field.RequestID = unpackUUID(byteBuffer);
        this.MoneyData_Field.IntervalDays = unpackInt(byteBuffer);
        this.MoneyData_Field.CurrentInterval = unpackInt(byteBuffer);
        this.MoneyData_Field.StartDate = unpackVariable(byteBuffer, 1);
        this.MoneyData_Field.Balance = unpackInt(byteBuffer);
        this.MoneyData_Field.TotalCredits = unpackInt(byteBuffer);
        this.MoneyData_Field.TotalDebits = unpackInt(byteBuffer);
        this.MoneyData_Field.ObjectTaxCurrent = unpackInt(byteBuffer);
        this.MoneyData_Field.LightTaxCurrent = unpackInt(byteBuffer);
        this.MoneyData_Field.LandTaxCurrent = unpackInt(byteBuffer);
        this.MoneyData_Field.GroupTaxCurrent = unpackInt(byteBuffer);
        this.MoneyData_Field.ParcelDirFeeCurrent = unpackInt(byteBuffer);
        this.MoneyData_Field.ObjectTaxEstimate = unpackInt(byteBuffer);
        this.MoneyData_Field.LightTaxEstimate = unpackInt(byteBuffer);
        this.MoneyData_Field.LandTaxEstimate = unpackInt(byteBuffer);
        this.MoneyData_Field.GroupTaxEstimate = unpackInt(byteBuffer);
        this.MoneyData_Field.ParcelDirFeeEstimate = unpackInt(byteBuffer);
        this.MoneyData_Field.NonExemptMembers = unpackInt(byteBuffer);
        this.MoneyData_Field.LastTaxDate = unpackVariable(byteBuffer, 1);
        this.MoneyData_Field.TaxDate = unpackVariable(byteBuffer, 1);
    }
}
