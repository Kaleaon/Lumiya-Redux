package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * complaint/bug-report - sim -> dataserver. see UserReport for details.
 * reliable
 *
 * <p>Template: {@code UserReportInternal Low 21 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class UserReportInternal extends SLMessage {
    public ReportData ReportData_Field;

    /** Block ReportData, Single. */
    public static class ReportData {
        public UUID AbuseRegionID; // LLUUID
        public byte[] AbuseRegionName; // Variable 1
        public UUID AbuserID; // LLUUID
        public LLVector3 AgentPosition; // LLVector3
        public int Category; // U8
        public UUID CreatorID; // LLUUID
        public byte[] Details; // Variable 2
        public UUID LastOwnerID; // LLUUID
        public UUID ObjectID; // LLUUID
        public UUID OwnerID; // LLUUID
        public UUID RegionID; // LLUUID
        public int ReportType; // U8
        public UUID ReporterID; // LLUUID
        public UUID ScreenshotID; // LLUUID
        public byte[] Summary; // Variable 1
        public byte[] VersionString; // Variable 1
        public LLVector3 ViewerPosition; // LLVector3
    }

    public UserReportInternal() {
        this.zeroCoded = true;
        this.ReportData_Field = new ReportData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ReportData_Field.AbuseRegionName.length + 155 + 16 + 1 + this.ReportData_Field.Summary.length + 2 + this.ReportData_Field.Details.length + 1 + this.ReportData_Field.VersionString.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleUserReportInternal(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 21 (UserReportInternal).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x15);
        packByte(byteBuffer, (byte) this.ReportData_Field.ReportType);
        packByte(byteBuffer, (byte) this.ReportData_Field.Category);
        packUUID(byteBuffer, this.ReportData_Field.ReporterID);
        packLLVector3(byteBuffer, this.ReportData_Field.ViewerPosition);
        packLLVector3(byteBuffer, this.ReportData_Field.AgentPosition);
        packUUID(byteBuffer, this.ReportData_Field.ScreenshotID);
        packUUID(byteBuffer, this.ReportData_Field.ObjectID);
        packUUID(byteBuffer, this.ReportData_Field.OwnerID);
        packUUID(byteBuffer, this.ReportData_Field.LastOwnerID);
        packUUID(byteBuffer, this.ReportData_Field.CreatorID);
        packUUID(byteBuffer, this.ReportData_Field.RegionID);
        packUUID(byteBuffer, this.ReportData_Field.AbuserID);
        packVariable(byteBuffer, this.ReportData_Field.AbuseRegionName, 1);
        packUUID(byteBuffer, this.ReportData_Field.AbuseRegionID);
        packVariable(byteBuffer, this.ReportData_Field.Summary, 1);
        packVariable(byteBuffer, this.ReportData_Field.Details, 2);
        packVariable(byteBuffer, this.ReportData_Field.VersionString, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ReportData_Field.ReportType = unpackByte(byteBuffer) & 0xFF;
        this.ReportData_Field.Category = unpackByte(byteBuffer) & 0xFF;
        this.ReportData_Field.ReporterID = unpackUUID(byteBuffer);
        this.ReportData_Field.ViewerPosition = unpackLLVector3(byteBuffer);
        this.ReportData_Field.AgentPosition = unpackLLVector3(byteBuffer);
        this.ReportData_Field.ScreenshotID = unpackUUID(byteBuffer);
        this.ReportData_Field.ObjectID = unpackUUID(byteBuffer);
        this.ReportData_Field.OwnerID = unpackUUID(byteBuffer);
        this.ReportData_Field.LastOwnerID = unpackUUID(byteBuffer);
        this.ReportData_Field.CreatorID = unpackUUID(byteBuffer);
        this.ReportData_Field.RegionID = unpackUUID(byteBuffer);
        this.ReportData_Field.AbuserID = unpackUUID(byteBuffer);
        this.ReportData_Field.AbuseRegionName = unpackVariable(byteBuffer, 1);
        this.ReportData_Field.AbuseRegionID = unpackUUID(byteBuffer);
        this.ReportData_Field.Summary = unpackVariable(byteBuffer, 1);
        this.ReportData_Field.Details = unpackVariable(byteBuffer, 2);
        this.ReportData_Field.VersionString = unpackVariable(byteBuffer, 1);
    }
}
