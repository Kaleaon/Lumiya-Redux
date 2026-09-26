package com.lumiyaviewer.lumiya.utils

import com.lumiyaviewer.lumiya.Debug
import java.io.File

object FileUtils {
    @JvmStatic
    fun clearFolder(file: File) {
        try {
            if (!file.exists()) return
            val listFiles = file.listFiles() ?: return
            for (child in listFiles) {
                if (child != null && child.name != ".." && child.name != ".") {
                    if (child.isDirectory) {
                        clearFolder(child)
                        Debug.Printf("ClearCache: Deleting directory %s", child.absolutePath)
                        child.delete()
                    } else if (child.isFile) {
                        Debug.Printf("ClearCache: Deleting file %s", child.absolutePath)
                        child.delete()
                    }
                }
            }
        } catch (_: Exception) {
        }
    }
}
