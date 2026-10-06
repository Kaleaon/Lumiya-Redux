package com.lumiyaviewer.lumiya.slproto.auth

import android.content.Context
import android.content.SharedPreferences
import android.security.keystore.KeyGenParameterSpec
import android.security.keystore.KeyProperties
import android.util.Base64
import com.lumiyaviewer.lumiya.Debug
import java.nio.charset.StandardCharsets
import java.security.KeyStore
import java.security.MessageDigest
import java.util.Locale
import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.GCMParameterSpec

/**
 * The "mfa_hash" a Second Life login returns after a multi-factor code was
 * accepted. Sending it on later logins skips the code prompt, like the
 * viewer's protected "mfa_hash" map keyed by grid and user
 * (indra/newview/lllogininstance.cpp, llstartup.cpp).
 *
 * The hash is a credential, so it is stored encrypted with an AES-GCM key held
 * in the Android Keystore. There is no plaintext fallback: if the keystore is
 * unavailable the hash is not kept and the user is asked for a code again.
 */
open class MfaHashStore {
    companion object {
        private const val KEY_ALIAS = "lumiya_mfa_hash"
        private const val PREFS_NAME = "mfa_hashes"
        private const val KEYSTORE = "AndroidKeyStore"
        private const val TRANSFORMATION = "AES/GCM/NoPadding"
        private const val GCM_IV_BYTES = 12
        private const val GCM_TAG_BITS = 128

        @JvmStatic
        fun accountKey(gridName: String?, loginName: String?): String {
            var name = if (loginName == null) "" else loginName.trim().lowercase(Locale.US).replace('.', ' ').replace('_', ' ')
            name = name.replace("\\s+".toRegex(), " ")
            if (!name.contains(" ")) {
                name = "$name resident"
            }
            val grid = gridName ?: ""
            return try {
                val digest = MessageDigest.getInstance("SHA-256").digest("$grid\n$name".toByteArray(StandardCharsets.UTF_8))
                val hex = StringBuilder()
                for (b in digest) {
                    hex.append(String.format(Locale.US, "%02x", b))
                }
                hex.toString()
            } catch (e: Exception) {
                throw IllegalStateException(e)
            }
        }
    }

    private var prefs: SharedPreferences? = null

    constructor(context: Context) : this(context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE))

    constructor(prefs: SharedPreferences?) {
        this.prefs = prefs
    }

    open fun get(gridName: String, loginName: String): String {
        val prefs = this.prefs ?: return ""
        val stored = prefs.getString(accountKey(gridName, loginName), null) ?: return ""
        return try {
            val blob = Base64.decode(stored, Base64.NO_WRAP)
            val cipher = Cipher.getInstance(TRANSFORMATION)
            cipher.init(Cipher.DECRYPT_MODE, getOrCreateKey(), GCMParameterSpec(GCM_TAG_BITS, blob, 0, GCM_IV_BYTES))
            val plain = cipher.doFinal(blob, GCM_IV_BYTES, blob.size - GCM_IV_BYTES)
            String(plain, StandardCharsets.UTF_8)
        } catch (e: Exception) {
            Debug.Printf("MFA: stored hash unreadable, discarding: %s", e.message)
            remove(gridName, loginName)
            ""
        }
    }

    open fun put(gridName: String, loginName: String, mfaHash: String?) {
        if (mfaHash.isNullOrEmpty()) return
        val prefs = this.prefs ?: return
        try {
            val cipher = Cipher.getInstance(TRANSFORMATION)
            cipher.init(Cipher.ENCRYPT_MODE, getOrCreateKey())
            val iv = cipher.iv
            val encrypted = cipher.doFinal(mfaHash.toByteArray(StandardCharsets.UTF_8))
            val blob = ByteArray(iv.size + encrypted.size)
            System.arraycopy(iv, 0, blob, 0, iv.size)
            System.arraycopy(encrypted, 0, blob, iv.size, encrypted.size)
            prefs.edit().putString(accountKey(gridName, loginName), Base64.encodeToString(blob, Base64.NO_WRAP)).apply()
        } catch (e: Exception) {
            Debug.Printf("MFA: cannot store hash (keystore unavailable): %s", e.message)
        }
    }

    open fun remove(gridName: String, loginName: String) {
        prefs?.edit()?.remove(accountKey(gridName, loginName))?.apply()
    }

    private fun getOrCreateKey(): SecretKey {
        val keyStore = KeyStore.getInstance(KEYSTORE)
        keyStore.load(null)
        val entry = keyStore.getEntry(KEY_ALIAS, null)
        if (entry is KeyStore.SecretKeyEntry) {
            return entry.secretKey
        }
        val generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, KEYSTORE)
        generator.init(
            KeyGenParameterSpec.Builder(KEY_ALIAS, KeyProperties.PURPOSE_ENCRYPT or KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build()
        )
        return generator.generateKey()
    }
}
