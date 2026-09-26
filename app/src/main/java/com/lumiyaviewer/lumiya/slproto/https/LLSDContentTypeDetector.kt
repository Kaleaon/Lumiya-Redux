package com.lumiyaviewer.lumiya.slproto.https

import com.lumiyaviewer.lumiya.Debug
import java.io.BufferedInputStream
import java.io.IOException

open class LLSDContentTypeDetector {

    private static byte[] UTF8_BOM = { 0xEF as byte, 0xBB as byte, (byte) 0xBF }

    enum class LLSDContentType {
        llsdXML,
        llsdBinary

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static LLSDContentType[] valuesCustom() {
            return values()
        }
    }

    public static LLSDContentType DetectContentType(BufferedInputStream stream, String contentType) throws IOException {
        stream.mark(64)
        byte[] buf = ByteArray(32)
        int bytesRead = stream.read(buf, 0, buf.length)
        if (bytesRead < 0) {
            bytesRead = 0
        }
        int skipBytes = 0
        if (bytesRead >= UTF8_BOM.length) {
            boolean hasBom = true
            for (int i = 0; i < UTF8_BOM.length; i++) {
                if (buf[i] != UTF8_BOM[i]) {
                    hasBom = false

                }
            }
            if (hasBom) {
                skipBytes = UTF8_BOM.length
            }
        }
        String firstString = String(buf, skipBytes, bytesRead - skipBytes, "UTF-8")
        stream.reset()
        stream.skip(skipBytes)

        boolean isXml = false
        boolean isBinary = false
        if (firstString.startsWith("<llsd>") || firstString.startsWith("<?xml")) {
            isXml = true
        } else if (firstString.startsWith("<? LLSD/Binary ?>")
                || firstString.startsWith("{")
                || firstString.startsWith("<?llsd/binary")) {
            isBinary = true
        }
        Debug.Printf("LLSD: contentType '%s', detected binary %s, xml %s, skipBytes %d, firstString '%s'",
                contentType,
                if (isBinary) "true" else "false",
                if (isXml) "true" else "false",
                skipBytes,
                firstString)
        if (!isBinary && !isXml && contentType != null
                && contentType.equalsIgnoreCase("application/llsd+binary")) {
            isBinary = true
        }
        if (isBinary) {
            Debug.Printf("LLSD: using binary parser")
            return LLSDContentType.llsdBinary
        }
        Debug.Printf("LLSD: using XML parser")
        return LLSDContentType.llsdXML
    }
}
