package com.firestorm.abusereport.net

import com.firestorm.abusereport.models.ReportCategory
import java.net.HttpURLConnection
import java.net.URL
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class AbuseCategoriesClient {

    /**
     * Default preset categories matching Second Life / OpenSim abuse categories.
     */
    val defaultCategories: List<ReportCategory> = listOf(
        ReportCategory(0, "Select Category"),
        ReportCategory(1, "Age Play / Underage"),
        ReportCategory(2, "Assault"),
        ReportCategory(3, "Broadcasting / Live Stream"),
        ReportCategory(4, "Disclosure of Personal Info"),
        ReportCategory(5, "Disturbing the Peace"),
        ReportCategory(6, "Harassment"),
        ReportCategory(7, "Indecency"),
        ReportCategory(8, "Land Misuse"),
        ReportCategory(37, "Permissions Exploit"),
        ReportCategory(66, "IP / Content Removal")
    )

    /**
     * Fetches category list from AbuseCategories capability endpoint.
     */
    suspend fun fetchCategories(capUrl: String, language: String = "en"): List<ReportCategory> = withContext(Dispatchers.IO) {
        if (capUrl.isBlank()) {
            return@withContext defaultCategories
        }

        val fullUrl = if (language != "default" && language.isNotBlank()) "$capUrl?lc=$language" else capUrl
        try {
            val conn = URL(fullUrl).openConnection() as HttpURLConnection
            conn.requestMethod = "GET"
            conn.connectTimeout = 5_000
            conn.readTimeout = 8_000

            if (conn.responseCode == 200) {
                val body = conn.inputStream.bufferedReader().readText()
                val parsed = parseCategoriesJson(body)
                if (parsed.isNotEmpty()) {
                    return@withContext parsed
                }
            }
        } catch (_: Exception) {
            // Fall through to default categories
        }
        defaultCategories
    }

    internal fun parseCategoriesJson(json: String): List<ReportCategory> {
        val categories = mutableListOf<ReportCategory>()
        try {
            if (!json.contains("categories")) return emptyList()

            val objectRegex = Regex("""\{[^}]*?"category"\s*:\s*(\d+)[^}]*?"name"\s*:\s*"([^"]+)"[^}]*?\}""")
            val matches = objectRegex.findAll(json)
            for (m in matches) {
                val catId = m.groupValues[1].toIntOrNull() ?: continue
                val name = m.groupValues[2]
                categories.add(ReportCategory(catId, name))
            }
        } catch (_: Exception) {}
        return categories
    }
}
