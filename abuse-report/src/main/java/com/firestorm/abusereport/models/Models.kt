package com.firestorm.abusereport.models

import java.util.UUID

/**
 * Report category description.
 */
data class ReportCategory(
    val id: Int,
    val name: String,
    val description: String? = null
)

/**
 * Target abuser details (avatar or object).
 */
data class AbuserTarget(
    val id: String = "",
    val name: String = "",
    val objectId: String = "",
    val objectName: String = "",
    val ownerName: String = "",
    val ownerId: String = ""
)

/**
 * Location SLURL and region coordinates.
 */
data class ReportLocation(
    val regionName: String = "Unknown",
    val regionId: String = "",
    val position: Triple<Float, Float, Float> = Triple(0f, 0f, 0f),
    val slurl: String = ""
)

/**
 * Report type constants matching Second Life protocol conventions.
 */
enum class ReportType(val id: Int) {
    NULL_REPORT(0),
    UNKNOWN_REPORT(1),
    COMPLAINT_REPORT(3),
    CS_REQUEST_REPORT(4)
}

/**
 * Delivery method used for successful report submission.
 */
enum class DeliveryMethod {
    CAPABILITY_WITH_SCREENSHOT,
    CAPABILITY_STANDARD,
    UDP_FALLBACK
}

/**
 * Domain error states for UI reporting and display.
 */
sealed class AbuseReportErrorState {
    data class ValidationError(val field: String, val message: String) : AbuseReportErrorState()
    data class CopyrightWarning(val message: String, val categoryId: Int) : AbuseReportErrorState()
    data class CapabilityError(val statusCode: Int, val message: String) : AbuseReportErrorState()
    data class ScreenshotError(val message: String) : AbuseReportErrorState()
    data class UdpFailure(val message: String) : AbuseReportErrorState()
    data class NetworkError(val message: String, val cause: Throwable? = null) : AbuseReportErrorState()
}

/**
 * Result of an abuse report submission attempt.
 */
sealed class AbuseReportResult {
    data class Success(
        val message: String = "Abuse report submitted successfully",
        val method: DeliveryMethod,
        val reportId: String = UUID.randomUUID().toString()
    ) : AbuseReportResult()

    data class Failure(val errorState: AbuseReportErrorState) : AbuseReportResult()
}

/**
 * Report submission request bundle.
 */
data class AbuseReportRequest(
    val categoryId: Int,
    val categoryName: String = "",
    val abuserTarget: AbuserTarget = AbuserTarget(),
    val location: ReportLocation = ReportLocation(),
    val summary: String,
    val details: String,
    val versionString: String = "",
    val reportType: ReportType = ReportType.COMPLAINT_REPORT,
    val checkFlags: Int = 0,
    val screenshotId: String? = null,
    val screenshotBytes: ByteArray? = null,
    val copyrightAcknowledged: Boolean = false,
    val defaultDetailsText: String = "Please describe the issue in detail."
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as AbuseReportRequest
        return categoryId == other.categoryId &&
                categoryName == other.categoryName &&
                abuserTarget == other.abuserTarget &&
                location == other.location &&
                summary == other.summary &&
                details == other.details &&
                versionString == other.versionString &&
                reportType == other.reportType &&
                checkFlags == other.checkFlags &&
                screenshotId == other.screenshotId &&
                (screenshotBytes?.contentEquals(other.screenshotBytes ?: byteArrayOf()) ?: (other.screenshotBytes == null)) &&
                copyrightAcknowledged == other.copyrightAcknowledged &&
                defaultDetailsText == other.defaultDetailsText
    }

    override fun hashCode(): Int {
        var result = categoryId
        result = 31 * result + categoryName.hashCode()
        result = 31 * result + abuserTarget.hashCode()
        result = 31 * result + location.hashCode()
        result = 31 * result + summary.hashCode()
        result = 31 * result + details.hashCode()
        result = 31 * result + versionString.hashCode()
        result = 31 * result + reportType.hashCode()
        result = 31 * result + checkFlags
        result = 31 * result + (screenshotId?.hashCode() ?: 0)
        result = 31 * result + (screenshotBytes?.contentHashCode() ?: 0)
        result = 31 * result + copyrightAcknowledged.hashCode()
        result = 31 * result + defaultDetailsText.hashCode()
        return result
    }
}

/**
 * Configuration of capability URLs and UDP endpoints for the network client.
 */
data class AbuseReportEndpointConfig(
    val abuseCategoriesUrl: String = "",
    val sendUserReportWithScreenshotUrl: String = "",
    val sendUserReportUrl: String = "",
    val legacyReportUrl: String = "",
    val agentId: String = "00000000-0000-0000-0000-000000000000",
    val sessionId: String = "00000000-0000-0000-0000-000000000000",
    val userDataDir: String = System.getProperty("user.home") ?: "."
)
