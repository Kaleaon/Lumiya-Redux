package com.firestorm.abusereport

import com.firestorm.abusereport.models.*
import com.firestorm.abusereport.net.AbuseCategoriesClient
import com.firestorm.abusereport.net.AbuseReportNetworkClient
import com.firestorm.abusereport.screenshot.DefaultScreenshotProvider
import com.firestorm.abusereport.screenshot.ScreenshotProvider
import com.firestorm.abusereport.service.AbuseReportService
import kotlinx.coroutines.runBlocking
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import java.io.File

class AbuseReportServiceTest {

    private lateinit var endpointConfig: AbuseReportEndpointConfig
    private lateinit var service: AbuseReportService

    @Before
    fun setUp() {
        endpointConfig = AbuseReportEndpointConfig(
            abuseCategoriesUrl = "",
            sendUserReportWithScreenshotUrl = "",
            sendUserReportUrl = "",
            legacyReportUrl = "",
            agentId = "11111111-1111-1111-1111-111111111111",
            sessionId = "22222222-2222-2222-2222-222222222222",
            userDataDir = System.getProperty("java.io.tmpdir") ?: "."
        )
        service = AbuseReportService(endpointConfig)
    }

    @Test
    fun testValidationFailsOnMissingCategory() {
        val req = AbuseReportRequest(
            categoryId = 0,
            summary = "Griefing",
            details = "Detailed report"
        )
        val err = service.validateRequest(req)
        assertTrue(err is AbuseReportErrorState.ValidationError)
        assertEquals("categoryId", (err as AbuseReportErrorState.ValidationError).field)
    }

    @Test
    fun testValidationFailsOnBlankSummary() {
        val req = AbuseReportRequest(
            categoryId = 2,
            summary = "   ",
            details = "Detailed report"
        )
        val err = service.validateRequest(req)
        assertTrue(err is AbuseReportErrorState.ValidationError)
        assertEquals("summary", (err as AbuseReportErrorState.ValidationError).field)
    }

    @Test
    fun testValidationFailsOnDefaultDetails() {
        val req = AbuseReportRequest(
            categoryId = 2,
            summary = "Harassment incident",
            details = "Please describe the issue in detail."
        )
        val err = service.validateRequest(req)
        assertTrue(err is AbuseReportErrorState.ValidationError)
        assertEquals("details", (err as AbuseReportErrorState.ValidationError).field)
    }

    @Test
    fun testValidationCopyrightWarning() {
        val req = AbuseReportRequest(
            categoryId = 66, // IP_CONTENT_REMOVAL
            summary = "DMCA infringement",
            details = "Stolen mesh asset",
            copyrightAcknowledged = false
        )
        val err = service.validateRequest(req)
        assertTrue(err is AbuseReportErrorState.CopyrightWarning)
        assertEquals(66, (err as AbuseReportErrorState.CopyrightWarning).categoryId)

        val ackReq = req.copy(copyrightAcknowledged = true)
        val noErr = service.validateRequest(ackReq)
        assertNull(noErr)
    }

    @Test
    fun testCategoryCaching() = runBlocking {
        val categories = service.loadCategories()
        assertNotNull(categories)
        assertTrue("Categories list should not be empty", categories.isNotEmpty())
        assertEquals(categories, service.getCategories())
    }

    @Test
    fun testScreenshotProviderAndCleanup() = runBlocking {
        var cleanupCalled = false
        val mockBytes = byteArrayOf(0x89.toByte(), 0x50.toByte(), 0x4E.toByte(), 0x47.toByte())

        val provider = object : ScreenshotProvider {
            override fun captureScreenshot(): ByteArray? = mockBytes
            override fun saveTemporaryScreenshot(bytes: ByteArray, workingDir: File, filename: String): File? {
                val f = File(workingDir, "test_sshot.png")
                f.writeBytes(bytes)
                return f
            }
            override fun cleanupTemporaryFiles() {
                cleanupCalled = true
            }
        }

        val testService = AbuseReportService(
            endpointConfig = endpointConfig,
            screenshotProvider = provider
        )

        val request = AbuseReportRequest(
            categoryId = 2,
            summary = "Assault report",
            details = "Avatar attacked me at the sandbox."
        )

        val result = testService.submitReport(request)
        assertTrue(result is AbuseReportResult.Success)
        assertEquals(DeliveryMethod.UDP_FALLBACK, (result as AbuseReportResult.Success).method)
        assertTrue("Temporary files cleanup must be invoked after submitReport", cleanupCalled)
    }

    @Test
    fun testJsonSerializationFormat() {
        val netClient = AbuseReportNetworkClient()
        val req = AbuseReportRequest(
            categoryId = 5,
            categoryName = "Disturbing the Peace",
            summary = "Spamming sounds",
            details = "Playing loud audio clips",
            versionString = "Firestorm 7.1.0",
            location = ReportLocation("Astra", "11111111-1111-1111-1111-111111111111", Triple(10.0f, 20.0f, 30.0f))
        )

        val json = netClient.serializeReportToJson(req, includeScreenshot = false)
        assertTrue(json.contains("\"category\":5"))
        assertTrue(json.contains("\"summary\":\"Spamming sounds\""))
        assertTrue(json.contains("\"position\":[10.0,20.0,30.0]"))
    }
}
