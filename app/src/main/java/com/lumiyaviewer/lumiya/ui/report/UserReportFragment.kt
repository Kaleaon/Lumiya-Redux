package com.lumiyaviewer.lumiya.ui.report

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.firestorm.abusereport.models.*
import com.firestorm.abusereport.screenshot.DefaultScreenshotProvider
import com.firestorm.abusereport.service.AbuseReportService
import com.lumiyaviewer.lumiya.R
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/**
 * Android UI fragment for abuse/user reporting in Lumiya-Redux,
 * delegating all categories, validation, and network/UDP operations to AbuseReportService.
 */
open class UserReportFragment : Fragment() {

    private lateinit var categorySpinner: Spinner
    private lateinit var summaryEdit: EditText
    private lateinit var detailsEdit: EditText
    private lateinit var abuserNameEdit: EditText
    private lateinit var sendButton: Button
    private lateinit var cancelButton: Button

    private var copyrightWarningSeen: Boolean = false
    private var abuserId: String = ""
    private var objectId: String = ""
    private var regionName: String = ""
    private var position: Triple<Float, Float, Float> = Triple(0f, 0f, 0f)

    private val screenshotProvider = DefaultScreenshotProvider()

    private val abuseReportService: AbuseReportService by lazy {
        val endpointConfig = AbuseReportEndpointConfig(
            abuseCategoriesUrl = System.getProperty("lumiya.cap.AbuseCategories", ""),
            sendUserReportWithScreenshotUrl = System.getProperty("lumiya.cap.SendUserReportWithScreenshot", ""),
            sendUserReportUrl = System.getProperty("lumiya.cap.SendUserReport", ""),
            legacyReportUrl = System.getProperty("lumiya.legacy.reportEndpoint", ""),
            agentId = System.getProperty("lumiya.agent.id", "00000000-0000-0000-0000-000000000000"),
            userDataDir = requireContext().cacheDir.absolutePath
        )
        AbuseReportService(
            endpointConfig = endpointConfig,
            screenshotProvider = screenshotProvider
        )
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.voice_status, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        loadCategories()
    }

    private fun loadCategories() {
        CoroutineScope(Dispatchers.IO).launch {
            val categories = abuseReportService.loadCategories()
            withContext(Dispatchers.Main) {
                if (isAdded && ::categorySpinner.isInitialized) {
                    val categoryNames = categories.map { it.name }
                    val adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_item, categoryNames)
                    adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
                    categorySpinner.adapter = adapter
                }
            }
        }
    }

    fun onSubmitReport() {
        val selectedCategoryPosition = if (::categorySpinner.isInitialized) categorySpinner.selectedItemPosition else 1
        val categories = abuseReportService.getCategories()
        val category = if (selectedCategoryPosition in categories.indices) categories[selectedCategoryPosition] else categories.first()

        val summaryText = if (::summaryEdit.isInitialized) summaryEdit.text.toString() else "Report"
        val detailsText = if (::detailsEdit.isInitialized) detailsEdit.text.toString() else "Details"
        val abuserNameText = if (::abuserNameEdit.isInitialized) abuserNameEdit.text.toString() else ""

        val request = AbuseReportRequest(
            categoryId = category.id,
            categoryName = category.name,
            abuserTarget = AbuserTarget(
                id = abuserId,
                name = abuserNameText,
                objectId = objectId
            ),
            location = ReportLocation(
                regionName = regionName,
                position = position
            ),
            summary = summaryText,
            details = detailsText,
            copyrightAcknowledged = copyrightWarningSeen
        )

        val validationError = abuseReportService.validateRequest(request)
        if (validationError != null) {
            when (validationError) {
                is AbuseReportErrorState.CopyrightWarning -> {
                    copyrightWarningSeen = true
                    Toast.makeText(context, validationError.message, Toast.LENGTH_LONG).show()
                }
                is AbuseReportErrorState.ValidationError -> {
                    Toast.makeText(context, validationError.message, Toast.LENGTH_SHORT).show()
                }
                else -> {
                    Toast.makeText(context, "Validation failed", Toast.LENGTH_SHORT).show()
                }
            }
            return
        }

        CoroutineScope(Dispatchers.IO).launch {
            val result = abuseReportService.submitReport(request)
            withContext(Dispatchers.Main) {
                if (isAdded) {
                    when (result) {
                        is AbuseReportResult.Success -> {
                            Toast.makeText(context, result.message, Toast.LENGTH_SHORT).show()
                        }
                        is AbuseReportResult.Failure -> {
                            Toast.makeText(context, "Report failed: ${result.errorState}", Toast.LENGTH_LONG).show()
                        }
                    }
                }
            }
        }
    }

    fun onCancelReport() {
        copyrightWarningSeen = false
        screenshotProvider.cleanupTemporaryFiles()
    }
}
