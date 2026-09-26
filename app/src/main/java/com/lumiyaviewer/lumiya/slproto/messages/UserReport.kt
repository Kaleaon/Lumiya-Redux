package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * complaint/bug-report
 * reliable
 *
 * <p>Template: {@code UserReport Low 133 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class UserReport : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ReportData_Field: ReportData = ReportData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ReportData, Single. */
    open class ReportData {
        @JvmField var AbuseRegionID: UUID? = null
        @JvmField var AbuseRegionName: ByteArray? = null
        @JvmField var AbuserID: UUID? = null
        @JvmField var Category: Int = 0
        @JvmField var CheckFlags: Int = 0
        @JvmField var Details: ByteArray? = null
        @JvmField var ObjectID: UUID? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var ReportType: Int = 0
        @JvmField var ScreenshotID: UUID? = null
        @JvmField var Summary: ByteArray? = null
        @JvmField var VersionString: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ReportData_Field.AbuseRegionName!!.size + 64 + 16 + 1 + ReportData_Field.Summary!!.size + 2 + ReportData_Field.Details!!.size + 1 + ReportData_Field.VersionString!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUserReport(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 133 (UserReport).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x85).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packByte(byteBuffer, (ReportData_Field.ReportType).toByte())
        packByte(byteBuffer, (ReportData_Field.Category).toByte())
        packLLVector3(byteBuffer, ReportData_Field.Position)
        packByte(byteBuffer, (ReportData_Field.CheckFlags).toByte())
        packUUID(byteBuffer, ReportData_Field.ScreenshotID)
        packUUID(byteBuffer, ReportData_Field.ObjectID)
        packUUID(byteBuffer, ReportData_Field.AbuserID)
        packVariable(byteBuffer, ReportData_Field.AbuseRegionName, 1)
        packUUID(byteBuffer, ReportData_Field.AbuseRegionID)
        packVariable(byteBuffer, ReportData_Field.Summary, 1)
        packVariable(byteBuffer, ReportData_Field.Details, 2)
        packVariable(byteBuffer, ReportData_Field.VersionString, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ReportData_Field.ReportType = unpackByte(byteBuffer).toInt() and 0xFF
        ReportData_Field.Category = unpackByte(byteBuffer).toInt() and 0xFF
        ReportData_Field.Position = unpackLLVector3(byteBuffer)
        ReportData_Field.CheckFlags = unpackByte(byteBuffer).toInt() and 0xFF
        ReportData_Field.ScreenshotID = unpackUUID(byteBuffer)
        ReportData_Field.ObjectID = unpackUUID(byteBuffer)
        ReportData_Field.AbuserID = unpackUUID(byteBuffer)
        ReportData_Field.AbuseRegionName = unpackVariable(byteBuffer, 1)
        ReportData_Field.AbuseRegionID = unpackUUID(byteBuffer)
        ReportData_Field.Summary = unpackVariable(byteBuffer, 1)
        ReportData_Field.Details = unpackVariable(byteBuffer, 2)
        ReportData_Field.VersionString = unpackVariable(byteBuffer, 1)
    }
}
