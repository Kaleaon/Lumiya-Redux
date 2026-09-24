package com.lumiyaviewer.lumiya.slproto.auth;

import android.content.Context;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;
import com.lumiyaviewer.lumiya.Debug;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.util.Locale;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

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
public class MfaHashStore {
    private static final String KEY_ALIAS = "lumiya_mfa_hash";
    private static final String PREFS_NAME = "mfa_hashes";
    private static final String KEYSTORE = "AndroidKeyStore";
    private static final String TRANSFORMATION = "AES/GCM/NoPadding";
    private static final int GCM_IV_BYTES = 12;
    private static final int GCM_TAG_BITS = 128;

    private final SharedPreferences prefs;

    public MfaHashStore(Context context) {
        this(context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE));
    }

    MfaHashStore(SharedPreferences prefs) {
        this.prefs = prefs;
    }

    /**
     * Preference key for one account on one grid. "First Last", "first.last"
     * and "first_last" name the same account, so they share a key. Hashed so
     * the account list is not readable from the preferences file.
     */
    static String accountKey(String gridName, String loginName) {
        String name = loginName == null ? "" : loginName.trim().toLowerCase(Locale.US).replace('.', ' ').replace('_', ' ');
        name = name.replaceAll("\\s+", " ");
        if (!name.contains(" ")) {
            name = name + " resident";
        }
        String grid = gridName == null ? "" : gridName;
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest((grid + "\n" + name).getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (byte b : digest) {
                hex.append(String.format(Locale.US, "%02x", b));
            }
            return hex.toString();
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    /** The stored hash, or "" when there is none (the login field is then empty, as in the viewer). */
    public String get(String gridName, String loginName) {
        String stored = this.prefs.getString(accountKey(gridName, loginName), null);
        if (stored == null) {
            return "";
        }
        try {
            byte[] blob = Base64.decode(stored, Base64.NO_WRAP);
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(Cipher.DECRYPT_MODE, getOrCreateKey(), new GCMParameterSpec(GCM_TAG_BITS, blob, 0, GCM_IV_BYTES));
            byte[] plain = cipher.doFinal(blob, GCM_IV_BYTES, blob.length - GCM_IV_BYTES);
            return new String(plain, StandardCharsets.UTF_8);
        } catch (Exception e) {
            Debug.Printf("MFA: stored hash unreadable, discarding: %s", e.getMessage());
            remove(gridName, loginName);
            return "";
        }
    }

    public void put(String gridName, String loginName, String mfaHash) {
        if (mfaHash == null || mfaHash.isEmpty()) {
            return;
        }
        try {
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(Cipher.ENCRYPT_MODE, getOrCreateKey());
            byte[] iv = cipher.getIV();
            byte[] encrypted = cipher.doFinal(mfaHash.getBytes(StandardCharsets.UTF_8));
            byte[] blob = new byte[iv.length + encrypted.length];
            System.arraycopy(iv, 0, blob, 0, iv.length);
            System.arraycopy(encrypted, 0, blob, iv.length, encrypted.length);
            this.prefs.edit().putString(accountKey(gridName, loginName), Base64.encodeToString(blob, Base64.NO_WRAP)).apply();
        } catch (Exception e) {
            Debug.Printf("MFA: cannot store hash (keystore unavailable): %s", e.getMessage());
        }
    }

    public void remove(String gridName, String loginName) {
        this.prefs.edit().remove(accountKey(gridName, loginName)).apply();
    }

    private static SecretKey getOrCreateKey() throws Exception {
        KeyStore keyStore = KeyStore.getInstance(KEYSTORE);
        keyStore.load(null);
        KeyStore.Entry entry = keyStore.getEntry(KEY_ALIAS, null);
        if (entry instanceof KeyStore.SecretKeyEntry) {
            return ((KeyStore.SecretKeyEntry) entry).getSecretKey();
        }
        KeyGenerator generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, KEYSTORE);
        generator.init(new KeyGenParameterSpec.Builder(KEY_ALIAS, KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build());
        return generator.generateKey();
    }
}
