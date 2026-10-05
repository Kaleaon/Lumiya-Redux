package com.lumiyaviewer.lumiya.slproto.https

import com.lumiyaviewer.lumiya.Debug
import java.io.BufferedInputStream

object LLSDContentTypeDetector {

    private val UTF8_BOM = byteArrayOf(0xEF.toByte(), 0xBB.toByte(), 0xBF.toByte())

    enum class LLSDContentType {
        llsdXML,
        llsdBinary,
        llsdNotation;

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<LLSDContentType> {
            return values()
        }
    }

    @JvmStatic
    fun DetectContentType(stream: BufferedInputStream, contentType: String?): LLSDContentType {
        stream.mark(64)
        val buf = ByteArray(32)
        var bytesRead = stream.read(buf, 0, buf.size)
        if (bytesRead < 0) {
            bytesRead = 0
        }
        var skipBytes = 0
        if (bytesRead >= UTF8_BOM.size) {
            var hasBom = true
            for (i in UTF8_BOM.indices) {
                if (buf[i] != UTF8_BOM[i]) {
                    hasBom = false
                    break
                }
            }
            if (hasBom) {
                skipBytes = UTF8_BOM.size
            }
        }
        val firstString = String(buf, skipBytes, bytesRead - skipBytes, Charsets.UTF_8)
        stream.reset()
        stream.skip(skipBytes.toLong())

        var isXml = false
        var isBinary = false
        var isNotation = false
        if (firstString.startsWith("<llsd>") || firstString.startsWith("<?xml")) {
            isXml = true
        } else if (firstString.startsWith("<?llsd/notation") || firstString.startsWith("<? llsd/notation")
                || firstString.startsWith("!") || firstString.startsWith("[") || firstString.startsWith("{")) {
            isNotation = true
        } else if (firstString.startsWith("<? LLSD/Binary ?>")
                || firstString.startsWith("<?llsd/binary")) {
            isBinary = true
        }
        Debug.Printf(
            "LLSD: contentType '%s', detected binary %s, xml %s, notation %s, skipBytes %d, firstString '%s'",
            contentType,
            if (isBinary) "true" else "false",
            if (isXml) "true" else "false",
            if (isNotation) "true" else "false",
            skipBytes,
            firstString
        )
        if (!isBinary && !isXml && !isNotation && contentType != null) {
            if (contentType.equals("application/llsd+binary", ignoreCase = true)) {
                isBinary = true
            } else if (contentType.equals("application/llsd+notation", ignoreCase = true)) {
                isNotation = true
            }
        }
        if (isNotation) {
            Debug.Printf("LLSD: using notation parser")
            return LLSDContentType.llsdNotation
        }
        if (isBinary) {
            Debug.Printf("LLSD: using binary parser")
            return LLSDContentType.llsdBinary
        }
        Debug.Printf("LLSD: using XML parser")
        return LLSDContentType.llsdXML
    }
}
