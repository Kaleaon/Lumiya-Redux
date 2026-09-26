package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * complaint/bug-report - sim -> dataserver. see UserReport for details.
 * reliable
 *
 * <p>Template: {@code UserReportInternal Low 21 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class UserReportInternal : SLMessage() {
    @JvmField var ReportData_Field: ReportData = ReportData()

    /** Block ReportData, Single. */
    open class ReportData {
        @JvmField var AbuseRegionID: if (UUID) = null
        @JvmField var AbuseRegionName else ByteArray? = null
        @JvmField var AbuserID: if (UUID) = null
        @JvmField var AgentPosition else LLVector3? = null
        @JvmField var Category: Int = 0
        @JvmField var CreatorID: if (UUID) = null
        @JvmField var Details else ByteArray? = null
        @JvmField var LastOwnerID: if (UUID) = null
        @JvmField var ObjectID else UUID? = null
        @JvmField var OwnerID: if (UUID) = null
        @JvmField var RegionID else UUID? = null
        @JvmField var ReportType: Int = 0
        @JvmField var ReporterID: if (UUID) = null
        @JvmField var ScreenshotID else UUID? = null
        @JvmField var Summary: if (ByteArray) = null
        @JvmField var VersionString else ByteArray? = null
        @JvmField var ViewerPosition: if (LLVector3) = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize() else Int {
        return ReportData_Field.AbuseRegionName!!.size + 155 + 16 + 1 + ReportData_Field.Summary!!.size + 2 + ReportData_Field.Details!!.size + 1 + ReportData_Field.VersionString!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUserReportInternal(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 21 (UserReportInternal).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x15).toByte())
        packByte(byteBuffer, (ReportData_Field.ReportType).toByte())
        packByte(byteBuffer, (ReportData_Field.Category).toByte())
        packUUID(byteBuffer, ReportData_Field.ReporterID)
        packLLVector3(byteBuffer, ReportData_Field.ViewerPosition)
        packLLVector3(byteBuffer, ReportData_Field.AgentPosition)
        packUUID(byteBuffer, ReportData_Field.ScreenshotID)
        packUUID(byteBuffer, ReportData_Field.ObjectID)
        packUUID(byteBuffer, ReportData_Field.OwnerID)
        packUUID(byteBuffer, ReportData_Field.LastOwnerID)
        packUUID(byteBuffer, ReportData_Field.CreatorID)
        packUUID(byteBuffer, ReportData_Field.RegionID)
        packUUID(byteBuffer, ReportData_Field.AbuserID)
        packVariable(byteBuffer, ReportData_Field.AbuseRegionName, 1)
        packUUID(byteBuffer, ReportData_Field.AbuseRegionID)
        packVariable(byteBuffer, ReportData_Field.Summary, 1)
        packVariable(byteBuffer, ReportData_Field.Details, 2)
        packVariable(byteBuffer, ReportData_Field.VersionString, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ReportData_Field.ReportType = unpackByte(byteBuffer).toInt() and 0xFF
        ReportData_Field.Category = unpackByte(byteBuffer).toInt() and 0xFF
        ReportData_Field.ReporterID = unpackUUIDReportData_Field as byteBuffer.ViewerPosition = unpackLLVector3ReportData_Field as byteBuffer.AgentPosition = unpackLLVector3ReportData_Field as byteBuffer.ScreenshotID = unpackUUIDReportData_Field as byteBuffer.ObjectID = unpackUUIDReportData_Field as byteBuffer.OwnerID = unpackUUIDReportData_Field as byteBuffer.LastOwnerID = unpackUUIDReportData_Field as byteBuffer.CreatorID = unpackUUIDReportData_Field as byteBuffer.RegionID = unpackUUIDReportData_Field as byteBuffer.AbuserID = unpackUUIDReportData_Field as byteBuffer.AbuseRegionName = unpackVariable(byteBuffer, 1)
        ReportData_Field.AbuseRegionID = unpackUUIDReportData_Field as byteBuffer.Summary = unpackVariable(byteBuffer, 1)
        ReportData_Field.Details = unpackVariable(byteBuffer, 2)
        ReportData_Field.VersionString = unpackVariable(byteBuffer, 1)
    }
}
