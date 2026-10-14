package com.firestorm.abusereport.service

import com.firestorm.abusereport.models.*
import com.firestorm.abusereport.net.AbuseCategoriesClient
import com.firestorm.abusereport.net.AbuseReportNetworkClient
import com.firestorm.abusereport.screenshot.ScreenshotProvider
import java.io.File
import java.util.UUID
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class AbuseReportService(
    private val endpointConfig: AbuseReportEndpointConfig,
    private val screenshotProvider: ScreenshotProvider? = null,
    private val categoriesClient: AbuseCategoriesClient = AbuseCategoriesClient(),
    private val networkClient: AbuseReportNetworkClient = AbuseReportNetworkClient()
) {

    private var cachedCategories: List<ReportCategory> = emptyList()

    /**
     * Loads and caches abuse categories from network endpoint or defaults.
     */
    suspend fun loadCategories(language: String = "en"): List<ReportCategory> = withContext(Dispatchers.IO) {
        if (cachedCategories.isNotEmpty()) {
            return@withContext cachedCategories
        }
        val cats = categoriesClient.fetchCategories(endpointConfig.abuseCategoriesUrl, language)
        cachedCategories = cats
        cats
    }

    /**
     * Returns cached categories or default preset list if not loaded yet.
     */
    fun getCategories(): List<ReportCategory> {
        return if (cachedCategories.isNotEmpty()) cachedCategories else categoriesClient.defaultCategories
    }

    /**
     * Validates a report request without submitting.
     * Returns null if valid, or AbuseReportErrorState if invalid.
     */
    fun validateRequest(request: AbuseReportRequest): AbuseReportErrorState? {
        if (request.categoryId == 0) {
            return AbuseReportErrorState.ValidationError("categoryId", "Please select an abuse category")
        }
        if (request.summary.isBlank()) {
            return AbuseReportErrorState.ValidationError("summary", "Summary field cannot be blank")
        }
        if (request.details.isBlank() || request.details.trim() == request.defaultDetailsText.trim()) {
            return AbuseReportErrorState.ValidationError("details", "Please provide details describing the issue")
        }

        val detailsLc = request.details.lowercase()
        val summaryLc = request.summary.lowercase()
        val isCopyrightCategory = request.categoryId == 66 || request.categoryId == 37
        val mentionsCopyright = detailsLc.contains("copyright") || summaryLc.contains("copyright")

        if ((isCopyrightCategory || mentionsCopyright) && !request.copyrightAcknowledged) {
            return AbuseReportErrorState.CopyrightWarning(
                message = "Copyright / Intellectual Property reports require official filing instructions.",
                categoryId = request.categoryId
            )
        }

        return null
    }

    /**
     * Submits an abuse report. Handles validation, screenshot processing, temp file cleanup, and transport dispatch.
     */
    suspend fun submitReport(request: AbuseReportRequest): AbuseReportResult = withContext(Dispatchers.IO) {
        val validationError = validateRequest(request)
        if (validationError != null) {
            return@withContext AbuseReportResult.Failure(validationError)
        }

        var tempFile: File? = null
        var processedRequest = request

        try {
            if (screenshotProvider != null && (request.screenshotBytes == null || request.screenshotBytes.isEmpty())) {
                val capturedBytes = screenshotProvider.captureScreenshot()
                if (capturedBytes != null && capturedBytes.isNotEmpty()) {
                    val workingDir = File(endpointConfig.userDataDir)
                    tempFile = screenshotProvider.saveTemporaryScreenshot(capturedBytes, workingDir)
                    val generatedSshotId = request.screenshotId ?: UUID.randomUUID().toString()
                    processedRequest = request.copy(
                        screenshotBytes = capturedBytes,
                        screenshotId = generatedSshotId
                    )
                }
            }

            return@withContext networkClient.sendReport(processedRequest, endpointConfig)

        } finally {
            screenshotProvider?.cleanupTemporaryFiles()
            if (tempFile != null && tempFile.exists()) {
                try { tempFile.delete() } catch (_: Exception) {}
            }
        }
    }
}
