package com.lumiyaviewer.lumiya.utils

import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

object HashUtils {
    @Volatile
    private var md5Instance: MessageDigest? = null

    @JvmStatic
    fun MD5_Hash(str: String): String {
        return try {
            var digest = md5Instance
            if (digest == null) {
                digest = MessageDigest.getInstance("MD5")
                md5Instance = digest
            }
            digest.update(str.toByteArray())
            val bytes = digest.digest()
            val sb = StringBuilder()
            for (b in bytes) {
                sb.append(String.format("%02x", b))
            }
            sb.toString()
        } catch (e: NoSuchAlgorithmException) {
            throw IllegalStateException(e)
        }
    }
}
