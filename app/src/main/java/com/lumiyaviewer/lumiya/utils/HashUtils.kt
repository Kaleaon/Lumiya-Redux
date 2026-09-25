package com.lumiyaviewer.lumiya.utils

import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

object HashUtils {
    @JvmStatic
    fun MD5_Hash(str: String): String {
        return try {
            val digest = MessageDigest.getInstance("MD5")
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
