package com.lumiyaviewer.lumiya.slproto.auth;

import android.content.Intent;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.util.UUID;

public class SLAuthParams {
    /** Intent extra: the grid accepts certificates that fail verification (TlsPolicy). */
    public static final String EXTRA_ALLOW_UNTRUSTED_CERTIFICATES = "allow_untrusted_certificates";
    /** Intent extra: one-time multi-factor code answering an "mfa_challenge" login reply. */
    public static final String EXTRA_MFA_TOKEN = "mfa_token";

    public final boolean allowUntrustedCertificates;
    public final UUID clientID;
    public final String gridName;
    public final String loginName;
    public final String loginURL;
    /** One-time MFA code for this attempt only, or null. Never used for reconnects. */
    public final String mfaToken;
    public final String passwordHash;
    public final String startLocation;

    public SLAuthParams(Intent intent) {
        this.loginName = intent.getStringExtra("login");
        this.passwordHash = intent.getStringExtra("password");
        this.clientID = UUIDPool.getUUID(intent.getStringExtra("client_id"));
        this.startLocation = intent.getStringExtra("start_location");
        this.loginURL = intent.getStringExtra("login_url");
        this.gridName = intent.getStringExtra("grid_name");
        this.allowUntrustedCertificates = intent.getBooleanExtra(EXTRA_ALLOW_UNTRUSTED_CERTIFICATES, false);
        this.mfaToken = intent.getStringExtra(EXTRA_MFA_TOKEN);
    }

    public SLAuthParams(String loginName, String passwordHash, UUID uuid, String startLocation, String loginURL, String gridName) {
        this(loginName, passwordHash, uuid, startLocation, loginURL, gridName, false, null);
    }

    public SLAuthParams(String loginName, String passwordHash, UUID uuid, String startLocation, String loginURL, String gridName, boolean allowUntrustedCertificates, String mfaToken) {
        this.loginName = loginName;
        this.passwordHash = passwordHash;
        this.clientID = uuid;
        this.startLocation = startLocation;
        this.loginURL = loginURL;
        this.gridName = gridName;
        this.allowUntrustedCertificates = allowUntrustedCertificates;
        this.mfaToken = mfaToken;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        SLAuthParams authParams = (SLAuthParams) obj;
        if (this.loginName == null ? authParams.loginName != null : (!this.loginName.equals(authParams.loginName))) {
            return false;
        }
        if (this.passwordHash == null ? authParams.passwordHash != null : (!this.passwordHash.equals(authParams.passwordHash))) {
            return false;
        }
        if (this.clientID == null ? authParams.clientID != null : (!this.clientID.equals(authParams.clientID))) {
            return false;
        }
        if (this.startLocation == null ? authParams.startLocation != null : (!this.startLocation.equals(authParams.startLocation))) {
            return false;
        }
        if (this.loginURL == null ? authParams.loginURL != null : (!this.loginURL.equals(authParams.loginURL))) {
            return false;
        }
        return this.gridName != null ? this.gridName.equals(authParams.gridName) : authParams.gridName == null;
    }

    public int hashCode() {
        return (((this.loginURL != null ? this.loginURL.hashCode() : 0) + (((this.startLocation != null ? this.startLocation.hashCode() : 0) + (((this.clientID != null ? this.clientID.hashCode() : 0) + (((this.passwordHash != null ? this.passwordHash.hashCode() : 0) + ((this.loginName != null ? this.loginName.hashCode() : 0) * 31)) * 31)) * 31)) * 31)) * 31) + (this.gridName != null ? this.gridName.hashCode() : 0);
    }

    public SLAuthParams withLocation(String str) {
        return new SLAuthParams(this.loginName, this.passwordHash, this.clientID, str, this.loginURL, this.gridName, this.allowUntrustedCertificates, this.mfaToken);
    }

    /** The same parameters after the MFA code has been used once. */
    public SLAuthParams withoutMfaToken() {
        return new SLAuthParams(this.loginName, this.passwordHash, this.clientID, this.startLocation, this.loginURL, this.gridName, this.allowUntrustedCertificates, null);
    }
}
