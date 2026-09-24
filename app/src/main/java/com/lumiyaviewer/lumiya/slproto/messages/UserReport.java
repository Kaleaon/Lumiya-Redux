package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * complaint/bug-report
 * reliable
 *
 * <p>Template: {@code UserReport Low 133 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class UserReport extends SLMessage {
    public AgentData AgentData_Field;
    public ReportData ReportData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ReportData, Single. */
    public static class ReportData {
        public UUID AbuseRegionID; // LLUUID
        public byte[] AbuseRegionName; // Variable 1
        public UUID AbuserID; // LLUUID
        public int Category; // U8 - see sequence.user_report_category
        public int CheckFlags; // U8 - checkboxflags
        public byte[] Details; // Variable 2
        public UUID ObjectID; // LLUUID
        public LLVector3 Position; // LLVector3 - screenshot position, region-local
        public int ReportType; // U8 - BUG=1, COMPLAINT=2
        public UUID ScreenshotID; // LLUUID
        public byte[] Summary; // Variable 1
        public byte[] VersionString; // Variable 1
    }

    public UserReport() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ReportData_Field = new ReportData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ReportData_Field.AbuseRegionName.length + 64 + 16 + 1 + this.ReportData_Field.Summary.length + 2 + this.ReportData_Field.Details.length + 1 + this.ReportData_Field.VersionString.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleUserReport(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 133 (UserReport).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x85);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packByte(byteBuffer, (byte) this.ReportData_Field.ReportType);
        packByte(byteBuffer, (byte) this.ReportData_Field.Category);
        packLLVector3(byteBuffer, this.ReportData_Field.Position);
        packByte(byteBuffer, (byte) this.ReportData_Field.CheckFlags);
        packUUID(byteBuffer, this.ReportData_Field.ScreenshotID);
        packUUID(byteBuffer, this.ReportData_Field.ObjectID);
        packUUID(byteBuffer, this.ReportData_Field.AbuserID);
        packVariable(byteBuffer, this.ReportData_Field.AbuseRegionName, 1);
        packUUID(byteBuffer, this.ReportData_Field.AbuseRegionID);
        packVariable(byteBuffer, this.ReportData_Field.Summary, 1);
        packVariable(byteBuffer, this.ReportData_Field.Details, 2);
        packVariable(byteBuffer, this.ReportData_Field.VersionString, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ReportData_Field.ReportType = unpackByte(byteBuffer) & 0xFF;
        this.ReportData_Field.Category = unpackByte(byteBuffer) & 0xFF;
        this.ReportData_Field.Position = unpackLLVector3(byteBuffer);
        this.ReportData_Field.CheckFlags = unpackByte(byteBuffer) & 0xFF;
        this.ReportData_Field.ScreenshotID = unpackUUID(byteBuffer);
        this.ReportData_Field.ObjectID = unpackUUID(byteBuffer);
        this.ReportData_Field.AbuserID = unpackUUID(byteBuffer);
        this.ReportData_Field.AbuseRegionName = unpackVariable(byteBuffer, 1);
        this.ReportData_Field.AbuseRegionID = unpackUUID(byteBuffer);
        this.ReportData_Field.Summary = unpackVariable(byteBuffer, 1);
        this.ReportData_Field.Details = unpackVariable(byteBuffer, 2);
        this.ReportData_Field.VersionString = unpackVariable(byteBuffer, 1);
    }
}
