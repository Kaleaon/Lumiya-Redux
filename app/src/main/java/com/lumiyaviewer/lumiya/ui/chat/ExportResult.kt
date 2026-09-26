package com.lumiyaviewer.lumiya.ui.chat

import java.io.File

internal class ExportResult(
    @JvmField val outputFile: File,
    @JvmField val rawText: String,
    @JvmField val rawTextTitle: String,
)
