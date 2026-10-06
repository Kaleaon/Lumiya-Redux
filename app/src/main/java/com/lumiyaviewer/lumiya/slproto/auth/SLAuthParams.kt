package com.lumiyaviewer.lumiya.slproto.auth

import android.content.Intent
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class SLAuthParams {
    companion object {
        /** Intent extra: the grid accepts certificates that fail verification (TlsPolicy). */
        @JvmField val EXTRA_ALLOW_UNTRUSTED_CERTIFICATES: String = "allow_untrusted_certificates"
        /** Intent extra: one-time multi-factor code answering an "mfa_challenge" login reply. */
        @JvmField val EXTRA_MFA_TOKEN: String = "mfa_token"
    }

    @JvmField var allowUntrustedCertificates: Boolean = false
    @JvmField var clientID: UUID? = null
    @JvmField var gridName: String = ""
    @JvmField var loginName: String = ""
    @JvmField var loginURL: String = ""
    /** One-time MFA code for this attempt only, or null. Never used for reconnects. */
    @JvmField var mfaToken: String? = null
    @JvmField var passwordHash: String = ""
    @JvmField var startLocation: String = ""

    constructor(intent: Intent) {
        this.loginName = intent.getStringExtra("login") ?: ""
        this.passwordHash = intent.getStringExtra("password") ?: ""
        this.clientID = UUIDPool.getUUID(intent.getStringExtra("client_id"))
        this.startLocation = intent.getStringExtra("start_location") ?: ""
        this.loginURL = intent.getStringExtra("login_url") ?: ""
        this.gridName = intent.getStringExtra("grid_name") ?: ""
        this.allowUntrustedCertificates = intent.getBooleanExtra(EXTRA_ALLOW_UNTRUSTED_CERTIFICATES, false)
        this.mfaToken = intent.getStringExtra(EXTRA_MFA_TOKEN)
    }

    constructor(loginName: String, passwordHash: String, uuid: UUID?, startLocation: String, loginURL: String, gridName: String) :
        this(loginName, passwordHash, uuid, startLocation, loginURL, gridName, false, null)

    constructor(loginName: String, passwordHash: String, uuid: UUID?, startLocation: String, loginURL: String, gridName: String, allowUntrustedCertificates: Boolean, mfaToken: String?) {
        this.loginName = loginName
        this.passwordHash = passwordHash
        this.clientID = uuid
        this.startLocation = startLocation
        this.loginURL = loginURL
        this.gridName = gridName
        this.allowUntrustedCertificates = allowUntrustedCertificates
        this.mfaToken = mfaToken
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || javaClass != other.javaClass) return false
        val authParams = other as SLAuthParams
        if (loginName != authParams.loginName) return false
        if (passwordHash != authParams.passwordHash) return false
        if (if (clientID != null) clientID != authParams.clientID else authParams.clientID != null) return false
        if (startLocation != authParams.startLocation) return false
        if (loginURL != authParams.loginURL) return false
        return gridName == authParams.gridName
    }

    override fun hashCode(): Int {
        var result = loginName.hashCode()
        result = 31 * result + passwordHash.hashCode()
        result = 31 * result + (clientID?.hashCode() ?: 0)
        result = 31 * result + startLocation.hashCode()
        result = 31 * result + loginURL.hashCode()
        result = 31 * result + gridName.hashCode()
        return result
    }

    fun withLocation(str: String): SLAuthParams {
        return SLAuthParams(this.loginName, this.passwordHash, this.clientID, str, this.loginURL, this.gridName, this.allowUntrustedCertificates, this.mfaToken)
    }

    /** The same parameters after the MFA code has been used once. */
    fun withoutMfaToken(): SLAuthParams {
        return SLAuthParams(this.loginName, this.passwordHash, this.clientID, this.startLocation, this.loginURL, this.gridName, this.allowUntrustedCertificates, null)
    }
}
