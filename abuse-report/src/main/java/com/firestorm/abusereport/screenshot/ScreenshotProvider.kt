package com.firestorm.abusereport.screenshot

import java.io.File

interface ScreenshotProvider {
    /**
     * Captures or returns current screenshot image bytes.
     */
    fun captureScreenshot(): ByteArray?

    /**
     * Checks if a previous screenshot exists.
     */
    fun hasPreviousScreenshot(): Boolean = false

    /**
     * Returns previous screenshot bytes if available.
     */
    fun loadPreviousScreenshot(): ByteArray? = null

    /**
     * Saves image bytes to a temporary screenshot file in local working directory.
     * Keeps track of created temporary files for cleanup.
     */
    fun saveTemporaryScreenshot(bytes: ByteArray, workingDir: File, filename: String = "screen_report_last.png"): File?

    /**
     * Cleans up any temporary screenshot files immediately after upload or cancellation.
     */
    fun cleanupTemporaryFiles()
}

/**
 * Standard implementation supporting memory buffers and disk temporary files.
 */
class DefaultScreenshotProvider(
    private val screenshotSupplier: (() -> ByteArray?)? = null,
    private val previousScreenshotSupplier: (() -> ByteArray?)? = null
) : ScreenshotProvider {

    private val tempFiles = mutableListOf<File>()

    override fun captureScreenshot(): ByteArray? {
        return screenshotSupplier?.invoke()
    }

    override fun hasPreviousScreenshot(): Boolean {
        return previousScreenshotSupplier?.invoke() != null
    }

    override fun loadPreviousScreenshot(): ByteArray? {
        return previousScreenshotSupplier?.invoke()
    }

    override fun saveTemporaryScreenshot(bytes: ByteArray, workingDir: File, filename: String): File? {
        return try {
            if (!workingDir.exists()) {
                workingDir.mkdirs()
            }
            val tempFile = File(workingDir, filename)
            tempFile.writeBytes(bytes)
            synchronized(tempFiles) {
                tempFiles.add(tempFile)
            }
            tempFile
        } catch (e: Exception) {
            null
        }
    }

    override fun cleanupTemporaryFiles() {
        synchronized(tempFiles) {
            val iterator = tempFiles.iterator()
            while (iterator.hasNext()) {
                val file = iterator.next()
                try {
                    if (file.exists()) {
                        file.delete()
                    }
                } catch (_: Exception) {}
                iterator.remove()
            }
        }
    }
}
