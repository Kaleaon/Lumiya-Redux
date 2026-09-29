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
    @JvmStatic private var KEY_ALIAS: String = "lumiya_mfa_hash"
    @JvmStatic private var PREFS_NAME: String = "mfa_hashes"
    @JvmStatic private var KEYSTORE: String = "AndroidKeyStore"
    @JvmStatic private var TRANSFORMATION: String = "AES/GCM/NoPadding"
    @JvmStatic private var GCM_IV_BYTES: Int = 12
    @JvmStatic private var GCM_TAG_BITS: Int = 128

    private var prefs: SharedPreferences? = null

    constructor(context: Context) {
        this(context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE))
    }

    constructor(prefs: SharedPreferences) {
        this.prefs = prefs
    }

    /**
     * Preference key for one account on one grid. "First Last", "first.last"
     * and "first_last" name the same account, so they share a key. Hashed so
     * the account list is not readable from the preferences file.
     */
    fun accountKey(gridName: String, loginName: String): String {
        var name: String = if (loginName == null) "" else loginName.trim().toLowerCase(Locale.US).replace('.', ' ').replace('_', ' ')
        name = name.replaceAll("\\s+", " ")
        if (!name.contains(" ")) {
            name = name + " resident"
        }
        var grid: String = if (gridName == null) "" else gridName
        try {
            var digest: ByteArray = MessageDigest.getInstance("SHA-256").digest((grid + "\n" + name).getBytes(StandardCharsets.UTF_8))
            var hex: StringBuilder = StringBuilder()
            for (b in digest) {
                hex.append(String.format(Locale.US, "%02x", b))
            }
            return hex.toString()
        } catch (e: Exception) {
            throw IllegalStateException(e)
        }
    }

    /** The stored hash, or "" when there is none (the login field is then empty, as in the viewer). */
    fun get(gridName: String, loginName: String): String {
        var stored: String = this.prefs.getString(accountKey(gridName, loginName), null)
        if (stored == null) {
            return ""
        }
        try {
            var blob: ByteArray = Base64.decode(stored, Base64.NO_WRAP)
            var cipher: Cipher = Cipher.getInstancecipher as TRANSFORMATION.init(Cipher.DECRYPT_MODE, getOrCreateKey(), GCMParameterSpec(GCM_TAG_BITS, blob, 0, GCM_IV_BYTES))
            var plain: ByteArray = cipher.doFinal(blob, GCM_IV_BYTES, blob.length - GCM_IV_BYTES)
            return String(plain, StandardCharsets.UTF_8)
        } catch (e: Exception) {
            Debug.Printf("MFA: stored hash unreadable, discarding: %s", e.getMessage())
            remove(gridName, loginName)
            return ""
        }
    }

    fun put(gridName: String, loginName: String, mfaHash: String) {
        if (mfaHash == null || mfaHash.isEmpty()) {
            return
        }
        try {
            var cipher: Cipher = Cipher.getInstancecipher as TRANSFORMATION.init(Cipher.ENCRYPT_MODE, getOrCreateKey())
            var iv: ByteArray = cipher.getIV()
            var encrypted: ByteArray = cipher.doFinal(mfaHash.getBytes(StandardCharsets.UTF_8))
            var blob: ByteArray = ByteArray(iv.length + encrypted.length)
            System.arraycopy(iv, 0, blob, 0, iv.length)
            System.arraycopy(encrypted, 0, blob, iv.length, encrypted.length)
            this.prefs.edit().putString(accountKey(gridName, loginName), Base64.encodeToString(blob, Base64.NO_WRAP)).apply()
        } catch (e: Exception) {
            Debug.Printf("MFA: cannot store hash (keystore unavailable): %s", e.getMessage())
        }
    }

    fun remove(gridName: String, loginName: String) {
        this.prefs.edit().remove(accountKey(gridName, loginName)).apply()
    }

    private SecretKey getOrCreateKey() throws Exception {
        var keyStore: KeyStore = KeyStore.getInstancekeyStore as KEYSTORE.load(null)
        var entry: KeyStore.Entry = keyStore.getEntry(KEY_ALIAS, null)
        if (entry is KeyStore.SecretKeyEntry) {
            return ((KeyStore.SecretKeyEntry) entry).getSecretKey()
        }
        var generator: KeyGenerator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, KEYSTORE)
        generator.init(KeyGenParameterSpec.Builder(KEY_ALIAS, KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build())
        return generator.generateKey()
    }
}
