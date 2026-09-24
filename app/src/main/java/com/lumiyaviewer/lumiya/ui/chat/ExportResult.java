package com.lumiyaviewer.lumiya.ui.chat;

import java.io.File;

class ExportResult {
    final File outputFile;
    final String rawText;
    final String rawTextTitle;

    ExportResult(File file, String rawText, String rawTextTitle) {
        this.outputFile = file;
        this.rawText = rawText;
        this.rawTextTitle = rawTextTitle;
    }
}
