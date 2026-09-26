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
        @JvmField var AbuseRegionID: UUID? = null
        @JvmField var AbuseRegionName: ByteArray? = null
        @JvmField var AbuserID: UUID? = null
        @JvmField var AgentPosition: LLVector3? = null
        @JvmField var Category: Int = 0
        @JvmField var CreatorID: UUID? = null
        @JvmField var Details: ByteArray? = null
        @JvmField var LastOwnerID: UUID? = null
        @JvmField var ObjectID: UUID? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var RegionID: UUID? = null
        @JvmField var ReportType: Int = 0
        @JvmField var ReporterID: UUID? = null
        @JvmField var ScreenshotID: UUID? = null
        @JvmField var Summary: ByteArray? = null
        @JvmField var VersionString: ByteArray? = null
        @JvmField var ViewerPosition: LLVector3? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
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
        ReportData_Field.ReporterID = unpackUUID(byteBuffer)
        ReportData_Field.ViewerPosition = unpackLLVector3(byteBuffer)
        ReportData_Field.AgentPosition = unpackLLVector3(byteBuffer)
        ReportData_Field.ScreenshotID = unpackUUID(byteBuffer)
        ReportData_Field.ObjectID = unpackUUID(byteBuffer)
        ReportData_Field.OwnerID = unpackUUID(byteBuffer)
        ReportData_Field.LastOwnerID = unpackUUID(byteBuffer)
        ReportData_Field.CreatorID = unpackUUID(byteBuffer)
        ReportData_Field.RegionID = unpackUUID(byteBuffer)
        ReportData_Field.AbuserID = unpackUUID(byteBuffer)
        ReportData_Field.AbuseRegionName = unpackVariable(byteBuffer, 1)
        ReportData_Field.AbuseRegionID = unpackUUID(byteBuffer)
        ReportData_Field.Summary = unpackVariable(byteBuffer, 1)
        ReportData_Field.Details = unpackVariable(byteBuffer, 2)
        ReportData_Field.VersionString = unpackVariable(byteBuffer, 1)
    }
}
