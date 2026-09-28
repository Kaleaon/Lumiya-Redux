package com.lumiyaviewer.lumiya.slproto.auth

import android.content.Intent
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class SLAuthParams {
    /** Intent extra: the grid accepts certificates that fail verification (TlsPolicy). */
    @JvmStatic var EXTRA_ALLOW_UNTRUSTED_CERTIFICATES: String = "allow_untrusted_certificates"
    /** Intent extra: one-time multi-factor code answering an "mfa_challenge" login reply. */
    @JvmStatic var EXTRA_MFA_TOKEN: String = "mfa_token"

    var allowUntrustedCertificates: Boolean = false
    var clientID: UUID? = null
    var gridName: String = ""
    var loginName: String = ""
    var loginURL: String = ""
    /** One-time MFA code for this attempt only, or null. Never used for reconnects. */
    var mfaToken: String = ""
    var passwordHash: String = ""
    var startLocation: String = ""

    constructor(intent: Intent) {
        this.loginName = intent.getStringExtra("login")
        this.passwordHash = intent.getStringExtra("password")
        this.clientID = UUIDPool.getUUID(intent.getStringExtra("client_id"))
        this.startLocation = intent.getStringExtra("start_location")
        this.loginURL = intent.getStringExtra("login_url")
        this.gridName = intent.getStringExtra("grid_name")
        this.allowUntrustedCertificates = intent.getBooleanExtra(EXTRA_ALLOW_UNTRUSTED_CERTIFICATES, false)
        this.mfaToken = intent.getStringExtra(EXTRA_MFA_TOKEN)
    }

    constructor(loginName: String, passwordHash: String, uuid: UUID, startLocation: String, loginURL: String, gridName: String) {
        this(loginName, passwordHash, uuid, startLocation, loginURL, gridName, false, null)
    }

    constructor(loginName: String, passwordHash: String, uuid: UUID, startLocation: String, loginURL: String, gridName: String, allowUntrustedCertificates: Boolean, mfaToken: String) {
        this.loginName = loginName
        this.passwordHash = passwordHash
        this.clientID = uuid
        this.startLocation = startLocation
        this.loginURL = loginURL
        this.gridName = gridName
        this.allowUntrustedCertificates = allowUntrustedCertificates
        this.mfaToken = mfaToken
    }

    fun equals(obj: Any): Boolean {
        if (this == obj) {
        return true
        }
        if (obj == null || getClass() != obj.javaClass) {
        return false
        }
        var authParams: SLAuthParams = obj as SLAuthParams
        if (if (this.loginName == null) authParams.loginName != null else (!this.loginName.equals(authParams.loginName))) {
        return false
        }
        if (if (this.passwordHash == null) authParams.passwordHash != null else (!this.passwordHash.equals(authParams.passwordHash))) {
        return false
        }
        if (if (this.clientID == null) authParams.clientID != null else (!this.clientID.equals(authParams.clientID))) {
        return false
        }
        if (if (this.startLocation == null) authParams.startLocation != null else (!this.startLocation.equals(authParams.startLocation))) {
        return false
        }
        if (if (this.loginURL == null) authParams.loginURL != null else (!this.loginURL.equals(authParams.loginURL))) {
        return false
        }
        return if (this.gridName != null) this.gridName.equals(authParams.gridName) else authParams.gridName == null
    }

    fun hashCode(): Int {
        return (((if (this.loginURL != null) this.loginURL.hashCode() else 0) + (((if (this.startLocation != null) this.startLocation.hashCode() else 0) + (((if (this.clientID != null) this.clientID.hashCode() else 0) + (((if (this.passwordHash != null) this.passwordHash.hashCode() else 0) + ((if (this.loginName != null) this.loginName.hashCode() else 0) * 31)) * 31)) * 31)) * 31)) * 31) + (if (this.gridName != null) this.gridName.hashCode() else 0)
    }

    fun withLocation(str: String): SLAuthParams {
        return SLAuthParams(this.loginName, this.passwordHash, this.clientID, str, this.loginURL, this.gridName, this.allowUntrustedCertificates, this.mfaToken)
    }

    /** The same parameters after the MFA code has been used once. */
    fun withoutMfaToken(): SLAuthParams {
        return SLAuthParams(this.loginName, this.passwordHash, this.clientID, this.startLocation, this.loginURL, this.gridName, this.allowUntrustedCertificates, null)
    }
}
