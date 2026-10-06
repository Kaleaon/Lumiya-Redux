package com.lumiyaviewer.lumiya.slproto.auth

import android.os.Build
import android.text.TextUtils
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection
import com.lumiyaviewer.lumiya.slproto.https.TlsPolicy
import com.lumiyaviewer.lumiya.utils.HashUtils
import com.lumiyaviewer.lumiya.utils.StringUtils
import java.io.BufferedInputStream
import java.io.IOException
import java.security.cert.CertificateException
import java.util.LinkedList
import javax.net.ssl.SSLPeerUnverifiedException
import okhttp3.MediaType
import okhttp3.Request
import okhttp3.RequestBody
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlPullParserFactory

open class SLAuth {
    private var mfaHashStore: MfaHashStore? = null

    constructor() {
        this.mfaHashStore = if (LumiyaApp.getContext() != null) MfaHashStore(LumiyaApp.getContext()) else null
    }

    constructor(mfaHashStore: MfaHashStore?) {
        this.mfaHashStore = mfaHashStore
    }

    private class LoginRequestField(val name: String, val value: String)

    @Throws(IOException::class)
    private fun SendLoginRequest(authParams: SLAuthParams): SLAuthReply {
        val passwordHash = authParams.passwordHash
        var startLocation = "last"
        if (authParams.startLocation != null) {
            if (authParams.startLocation == "first") {
                startLocation = "home"
            } else if (authParams.startLocation.startsWith("uri:")) {
                startLocation = authParams.startLocation
            }
        }
        val fields = LinkedList<LoginRequestField>()
        val loginName = authParams.loginName.trim()
        var separatorIndex = loginName.length
        val separators = " ._"
        for (i in 0 until separators.length) {
            val index = loginName.indexOf(separators.substring(i, i + 1))
            if (index != -1 && index < separatorIndex) {
                separatorIndex = index
            }
        }
        var firstName = loginName.substring(0, separatorIndex).trim()
        var lastName = ""
        if (separatorIndex < loginName.length) {
            lastName = loginName.substring(separatorIndex + 1).trim()
        }
        if (lastName.equals("", ignoreCase = true)) {
            lastName = "Resident"
        }
        fields.add(LoginRequestField("first", firstName))
        fields.add(LoginRequestField("last", lastName))
        fields.add(LoginRequestField("passwd", passwordHash))
        fields.add(LoginRequestField("start", startLocation))

        val channel = "Lumiya " + (if (Debug.isDebugBuild()) "Test" else "Release")
        var version = LumiyaApp.getAppVersion() ?: "3.4.2"
        while (StringUtils.countOccurrences(version, '.') < 3) {
            version += ".0"
        }
        Debug.Printf("Auth: viewer channel '%s', version '%s'", channel, version)
        fields.add(LoginRequestField("channel", channel))
        fields.add(LoginRequestField("version", version))
        fields.add(LoginRequestField("platform", "Android"))
        fields.add(LoginRequestField("platform_version", Build.VERSION.RELEASE ?: ""))
        fields.add(LoginRequestField("mac", HashUtils.MD5_Hash("android_id")))
        fields.add(LoginRequestField("user-agent", "Lumiya"))
        fields.add(LoginRequestField("id0", authParams.clientID?.toString() ?: ""))
        fields.add(LoginRequestField("agree_to_tos", "true"))
        fields.add(LoginRequestField("viewer_digest", "f50cfcc3-d6ce-4f16-a822-b91271de4c48"))

        val mfaHash = mfaHashStore?.get(authParams.gridName, authParams.loginName) ?: ""
        fields.add(LoginRequestField("token", normalizeMfaToken(authParams.mfaToken)))
        fields.add(LoginRequestField("mfa_hash", mfaHash))

        var loginURL = authParams.loginURL
        var methodName = "login_to_simulator"
        var reply: SLAuthReply? = null

        for (redirect in 0 until 5) {
            val request = StringBuilder()
            request.append("<?xml version=\"1.0\"?>\n")
            request.append("<methodCall>")
            request.append("<methodName>").append(methodName).append("</methodName>")
            request.append("<params>")
            request.append("<param>")
            request.append("<value>")
            request.append("<struct>")
            for (field in fields) {
                request.append("<member>")
                request.append("<name>")
                request.append(field.name)
                request.append("</name>")
                request.append("<value>")
                request.append("<string>")
                request.append(TextUtils.htmlEncode(field.value))
                request.append("</string>")
                request.append("</value>")
                request.append("</member>")
            }
            request.append("<member>")
            request.append("<name>options</name>")
            request.append("<value>")
            request.append("<array><data>")
            request.append("<value><string>buddy-list</string></value>")
            request.append("<value><string>display_names</string></value>")
            request.append("<value><string>inventory-root</string></value>")
            request.append("<value><string>inventory-lib-root</string></value>")
            request.append("<value><string>max-agent-groups</string></value>")
            request.append("</data></array>")
            request.append("</value>")
            request.append("</member>")
            request.append("</struct>")
            request.append("</value>")
            request.append("</param>")
            request.append("</params>")
            request.append("</methodCall>")

            val requestXML = request.toString()
            Debug.Log("Start location: " + startLocation)

            val response = SLHTTPSConnection.getOkHttpClient().newCall(
                Request.Builder()
                    .url(loginURL)
                    .header("Connection", "close")
                    .post(RequestBody.create(MediaType.parse("text/xml"), requestXML))
                    .header("Content-Type", "text/xml")
                    .build()
            ).execute() ?: throw IOException("Null response")

            try {
                if (!response.isSuccessful) {
                    throw IOException("Login error code " + response.code())
                }
                try {
                    val responseBody = response.body() ?: throw IOException("Null response body")
                    val parser = XmlPullParserFactory.newInstance().newPullParser()
                    parser.setInput(BufferedInputStream(responseBody.byteStream(), 65536), null)
                    val currentReply = SLAuthReply(authParams.gridName, authParams.loginURL, parser)
                    reply = currentReply
                    if (!currentReply.isIndeterminate || currentReply.nextMethod.isNullOrEmpty() || currentReply.nextURL.isNullOrEmpty()) {
                        if (currentReply.success && !currentReply.mfaHash.isNullOrEmpty() && this.mfaHashStore != null) {
                            this.mfaHashStore?.put(authParams.gridName, authParams.loginName, currentReply.mfaHash)
                        }
                        return currentReply
                    }
                    methodName = currentReply.nextMethod!!
                    loginURL = currentReply.nextURL!!
                } catch (e: XmlPullParserException) {
                    Debug.Warning(e)
                    throw IOException("Login reply parse error", e)
                }
            } finally {
                response.close()
            }
        }
        return reply ?: throw IOException("Failed to login to simulator")
    }

    fun normalizeMfaToken(token: String?): String {
        return token?.replace("\\s+".toRegex(), "") ?: ""
    }

    @Throws(IOException::class)
    open fun Login(authParams: SLAuthParams): SLAuthReply {
        TlsPolicy.setAllowUntrustedCertificates(authParams.allowUntrustedCertificates)
        try {
            return SendLoginRequest(authParams)
        } catch (e: Exception) {
            e.printStackTrace()
            if (isCertificateFailure(e)) {
                throw CertificateVerificationException(e)
            }
            if (e is IOException) {
                throw e
            }
            throw IOException("Failed to login to simulator", e)
        }
    }

    private fun isCertificateFailure(e: Throwable): Boolean {
        var t: Throwable? = e
        while (t != null) {
            if (t is SSLPeerUnverifiedException || t is CertificateException) {
                return true
            }
            val cause = t.cause
            if (cause === t) break
            t = cause
        }
        return false
    }

    open class CertificateVerificationException(cause: Throwable) : IOException(
        "The login server's security certificate could not be verified. The connection may be intercepted. " +
        "For a grid with a self-signed certificate, allow untrusted certificates in Manage Grids.",
        cause
    ) {
        companion object {
            private const val serialVersionUID = 1L
        }
    }

    companion object {
        @JvmStatic
        fun getPasswordHash(password: String): String {
            var trimmed = password.trim()
            if (trimmed.length > 16) {
                trimmed = trimmed.substring(0, 16)
            }
            return "$1$" + HashUtils.MD5_Hash(trimmed)
        }
    }
}
