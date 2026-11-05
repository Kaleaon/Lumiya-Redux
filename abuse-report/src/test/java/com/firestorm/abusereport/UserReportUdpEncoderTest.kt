package com.firestorm.abusereport

import com.firestorm.abusereport.models.*
import com.firestorm.abusereport.net.UserReportUdpEncoder
import org.junit.Assert.*
import org.junit.Test
import java.nio.ByteBuffer
import java.nio.ByteOrder

class UserReportUdpEncoderTest {

    @Test
    fun testEncodeUserReportPacketHeaderAndStructure() {
        val request = AbuseReportRequest(
            categoryId = 6, // Harassment
            categoryName = "Harassment",
            summary = "Griefing at sandbox",
            details = "User is spamming objects.",
            location = ReportLocation("Sandbox Alpha", "11111111-1111-1111-1111-111111111111", Triple(128.5f, 64.0f, 21.5f)),
            abuserTarget = AbuserTarget(
                id = "22222222-2222-2222-2222-222222222222",
                name = "BadResident Resident"
            ),
            versionString = "Firestorm 7.1.0 (Linux)",
            reportType = ReportType.COMPLAINT_REPORT,
            screenshotId = "33333333-3333-3333-3333-333333333333"
        )

        val config = AbuseReportEndpointConfig(
            agentId = "44444444-4444-4444-4444-444444444444",
            sessionId = "55555555-5555-5555-5555-555555555555"
        )

        val packetBytes = UserReportUdpEncoder.encode(request, config)

        assertNotNull(packetBytes)
        assertTrue("Packet byte array must be non-empty", packetBytes.isNotEmpty())

        assertEquals(0xFF.toByte(), packetBytes[0])
        assertEquals(0xFF.toByte(), packetBytes[1])
        assertEquals(0x00.toByte(), packetBytes[2])
        assertEquals(0x85.toByte(), packetBytes[3])

        val bb = ByteBuffer.wrap(packetBytes)
        bb.position(4) // Skip 4-byte header

        val agentIdMost = bb.long
        val agentIdLeast = bb.long
        val expectedAgentId = java.util.UUID.fromString("44444444-4444-4444-4444-444444444444")
        assertEquals(expectedAgentId.mostSignificantBits, agentIdMost)
        assertEquals(expectedAgentId.leastSignificantBits, agentIdLeast)

        val sessionIdMost = bb.long
        val sessionIdLeast = bb.long
        val expectedSessionId = java.util.UUID.fromString("55555555-5555-5555-5555-555555555555")
        assertEquals(expectedSessionId.mostSignificantBits, sessionIdMost)
        assertEquals(expectedSessionId.leastSignificantBits, sessionIdLeast)

        val reportType = bb.get().toInt() and 0xFF
        assertEquals(3, reportType)

        val category = bb.get().toInt() and 0xFF
        assertEquals(6, category)

        bb.order(ByteOrder.LITTLE_ENDIAN)
        val posX = bb.float
        val posY = bb.float
        val posZ = bb.float
        assertEquals(128.5f, posX, 0.01f)
        assertEquals(64.0f, posY, 0.01f)
        assertEquals(21.5f, posZ, 0.01f)
    }
}
