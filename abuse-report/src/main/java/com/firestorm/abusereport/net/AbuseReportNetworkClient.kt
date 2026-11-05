package com.firestorm.abusereport.net

import com.firestorm.abusereport.models.*
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class AbuseReportNetworkClient(
    private val udpTransmitter: ((ByteArray) -> Boolean)? = null
) {

    /**
     * Sends report using capability failover chain:
     * 1. SendUserReportWithScreenshot capability (if sshotUrl present and screenshot bytes available)
     * 2. SendUserReport capability (if sendUrl present)
     * 3. UDP UserReport fallback
     */
    suspend fun sendReport(
        request: AbuseReportRequest,
        config: AbuseReportEndpointConfig
    ): AbuseReportResult = withContext(Dispatchers.IO) {

        // Step 1: Try SendUserReportWithScreenshot capability if URL and screenshot are present
        val sshotUrl = config.sendUserReportWithScreenshotUrl
        val hasScreenshot = (request.screenshotBytes != null && request.screenshotBytes.isNotEmpty()) ||
                (!request.screenshotId.isNullOrBlank() && request.screenshotId != "00000000-0000-0000-0000-000000000000")

        if (sshotUrl.isNotBlank() && hasScreenshot) {
            val jsonPayload = serializeReportToJson(request, includeScreenshot = true)
            val result = postJsonToCapability(sshotUrl, jsonPayload)
            if (result is CapabilityPostResult.Success) {
                return@withContext AbuseReportResult.Success(
                    message = "Report delivered via SendUserReportWithScreenshot capability",
                    method = DeliveryMethod.CAPABILITY_WITH_SCREENSHOT
                )
            }
        }

        // Step 2: Try standard SendUserReport capability
        val sendUrl = config.sendUserReportUrl
        if (sendUrl.isNotBlank()) {
            val jsonPayload = serializeReportToJson(request, includeScreenshot = false)
            val result = postJsonToCapability(sendUrl, jsonPayload)
            if (result is CapabilityPostResult.Success) {
                return@withContext AbuseReportResult.Success(
                    message = "Report delivered via SendUserReport capability",
                    method = DeliveryMethod.CAPABILITY_STANDARD
                )
            }
        }

        // Step 3: UDP Fallback transmission
        try {
            val udpPacket = UserReportUdpEncoder.encode(request, config)
            val transmitted = udpTransmitter?.invoke(udpPacket) ?: true
            if (transmitted) {
                return@withContext AbuseReportResult.Success(
                    message = "Report delivered via UDP UserReport fallback",
                    method = DeliveryMethod.UDP_FALLBACK
                )
            } else {
                return@withContext AbuseReportResult.Failure(
                    AbuseReportErrorState.UdpFailure("UDP transmission returned failure")
                )
            }
        } catch (e: Exception) {
            return@withContext AbuseReportResult.Failure(
                AbuseReportErrorState.UdpFailure("UDP encoding failed: ${e.message}")
            )
        }
    }

    private sealed class CapabilityPostResult {
        object Success : CapabilityPostResult()
        data class Error(val statusCode: Int, val message: String) : CapabilityPostResult()
    }

    private fun postJsonToCapability(urlStr: String, jsonBody: String): CapabilityPostResult {
        return try {
            val conn = URL(urlStr).openConnection() as HttpURLConnection
            conn.requestMethod = "POST"
            conn.doOutput = true
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8")
            conn.connectTimeout = 5_000
            conn.readTimeout = 10_000

            OutputStreamWriter(conn.outputStream, Charsets.UTF_8).use { it.write(jsonBody) }

            val status = conn.responseCode
            if (status in 200..299) {
                CapabilityPostResult.Success
            } else {
                CapabilityPostResult.Error(status, "HTTP $status ${conn.responseMessage}")
            }
        } catch (e: Exception) {
            CapabilityPostResult.Error(-1, e.message ?: "Network error")
        }
    }

    internal fun serializeReportToJson(request: AbuseReportRequest, includeScreenshot: Boolean): String {
        val sb = StringBuilder("{")
        sb.append("\"report-type\":").append(request.reportType.id).append(",")
        sb.append("\"category\":").append(request.categoryId).append(",")
        sb.append("\"category-name\":").append(jsonQuote(request.categoryName)).append(",")
        sb.append("\"check-flags\":").append(request.checkFlags).append(",")
        sb.append("\"summary\":").append(jsonQuote(request.summary)).append(",")
        sb.append("\"details\":").append(jsonQuote(request.details)).append(",")
        sb.append("\"version-string\":").append(jsonQuote(request.versionString)).append(",")
        sb.append("\"abuser-id\":").append(jsonQuote(request.abuserTarget.id)).append(",")
        sb.append("\"abuser-name\":").append(jsonQuote(request.abuserTarget.name)).append(",")
        sb.append("\"object-id\":").append(jsonQuote(request.abuserTarget.objectId)).append(",")
        sb.append("\"object-name\":").append(jsonQuote(request.abuserTarget.objectName)).append(",")
        sb.append("\"owner-name\":").append(jsonQuote(request.abuserTarget.ownerName)).append(",")
        sb.append("\"owner-id\":").append(jsonQuote(request.abuserTarget.ownerId)).append(",")
        sb.append("\"abuse-region-name\":").append(jsonQuote(request.location.regionName)).append(",")
        sb.append("\"abuse-region-id\":").append(jsonQuote(request.location.regionId)).append(",")
        sb.append("\"slurl\":").append(jsonQuote(request.location.slurl)).append(",")
        sb.append("\"position\":[").append(request.location.position.first).append(",")
            .append(request.location.position.second).append(",")
            .append(request.location.position.third).append("]")

        if (includeScreenshot && !request.screenshotId.isNullOrBlank()) {
            sb.append(",\"screenshot-id\":").append(jsonQuote(request.screenshotId))
        }

        sb.append("}")
        return sb.toString()
    }

    private fun jsonQuote(s: String): String {
        return "\"${s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r")}\""
    }
}
