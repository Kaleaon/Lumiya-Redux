package com.firestorm.abusereport.net

import com.firestorm.abusereport.models.AbuseReportEndpointConfig
import com.firestorm.abusereport.models.AbuseReportRequest
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.UUID

object UserReportUdpEncoder {

    /**
     * Encodes a UserReport (Low 133) UDP protocol message into a raw byte array.
     */
    fun encode(request: AbuseReportRequest, config: AbuseReportEndpointConfig): ByteArray {
        val agentIdBytes = uuidToBytes(config.agentId)
        val sessionIdBytes = uuidToBytes(config.sessionId)
        val screenshotIdBytes = uuidToBytes(request.screenshotId ?: "00000000-0000-0000-0000-000000000000")
        val objectIdBytes = uuidToBytes(request.abuserTarget.objectId.ifEmpty { "00000000-0000-0000-0000-000000000000" })
        val abuserIdBytes = uuidToBytes(request.abuserTarget.id.ifEmpty { "00000000-0000-0000-0000-000000000000" })
        val abuseRegionIdBytes = uuidToBytes(request.location.regionId.ifEmpty { "00000000-0000-0000-0000-000000000000" })

        val regionNameBytes = request.location.regionName.toByteArray(Charsets.UTF_8)
        val summaryBytes = request.summary.toByteArray(Charsets.UTF_8)
        val detailsBytes = request.details.toByteArray(Charsets.UTF_8)
        val versionBytes = request.versionString.toByteArray(Charsets.UTF_8)

        // Calculate total payload size:
        // Header: 4 bytes (0xFF, 0xFF, 0x00, 0x85)
        // AgentData: 16 (AgentID) + 16 (SessionID) = 32
        // ReportData: 1 (ReportType) + 1 (Category) + 12 (Pos) + 1 (CheckFlags)
        // + 16 (ScreenshotID) + 16 (ObjectID) + 16 (AbuserID)
        // + (1 + regionNameBytes.size) + 16 (AbuseRegionID)
        // + (1 + summaryBytes.size) + (2 + detailsBytes.size) + (1 + versionBytes.size)
        val totalSize = 4 + 32 + 1 + 1 + 12 + 1 + 16 + 16 + 16 +
                (1 + minOf(regionNameBytes.size, 255)) + 16 +
                (1 + minOf(summaryBytes.size, 255)) +
                (2 + minOf(detailsBytes.size, 65535)) +
                (1 + minOf(versionBytes.size, 255))

        val buffer = ByteBuffer.allocate(totalSize)

        // Header: Low 133
        buffer.put(0xFF.toByte())
        buffer.put(0xFF.toByte())
        buffer.put(0x00.toByte())
        buffer.put(0x85.toByte())

        // AgentData
        buffer.put(agentIdBytes)
        buffer.put(sessionIdBytes)

        // ReportData
        buffer.put(request.reportType.id.toByte())
        buffer.put(request.categoryId.toByte())

        // Position (Little Endian)
        val oldOrder = buffer.order()
        buffer.order(ByteOrder.LITTLE_ENDIAN)
        buffer.putFloat(request.location.position.first)
        buffer.putFloat(request.location.position.second)
        buffer.putFloat(request.location.position.third)
        buffer.order(oldOrder)

        buffer.put(request.checkFlags.toByte())
        buffer.put(screenshotIdBytes)
        buffer.put(objectIdBytes)
        buffer.put(abuserIdBytes)

        // AbuseRegionName (Var 1)
        putVar1(buffer, regionNameBytes)
        buffer.put(abuseRegionIdBytes)

        // Summary (Var 1)
        putVar1(buffer, summaryBytes)

        // Details (Var 2, LE length)
        buffer.order(ByteOrder.LITTLE_ENDIAN)
        val detailsLen = minOf(detailsBytes.size, 65535)
        buffer.putShort(detailsLen.toShort())
        buffer.order(oldOrder)
        buffer.put(detailsBytes, 0, detailsLen)

        // VersionString (Var 1)
        putVar1(buffer, versionBytes)

        return buffer.array()
    }

    private fun putVar1(buffer: ByteBuffer, bytes: ByteArray) {
        val len = minOf(bytes.size, 255)
        buffer.put(len.toByte())
        buffer.put(bytes, 0, len)
    }

    private fun uuidToBytes(uuidStr: String): ByteArray {
        val bytes = ByteArray(16)
        if (uuidStr.isBlank()) return bytes
        return try {
            val uuid = UUID.fromString(uuidStr)
            val bb = ByteBuffer.allocate(16).order(ByteOrder.BIG_ENDIAN)
            bb.putLong(uuid.mostSignificantBits)
            bb.putLong(uuid.leastSignificantBits)
            bb.array()
        } catch (_: Exception) {
            bytes
        }
    }
}
