package com.lumiyaviewer.lumiya.slproto.auth

import android.os.Build
import android.text.TextUtils
import com.google.common.net.HttpHeaders
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
import okhttp3.Response
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException
import org.xmlpull.v1.XmlPullParserFactory

open class SLAuth {
    private var mfaHashStore: MfaHashStore? = null

    constructor() {
        if (this(LumiyaApp.getContext() != null) MfaHashStore(LumiyaApp.getContext()) else null)
    }

    constructor(mfaHashStore: MfaHashStore) {
        this.mfaHashStore = mfaHashStore
    }

    private open class LoginRequestField {
        public var name: String
        public var value: String

        fun LoginRequestField(name: String, value: String): private {
            this.name = name
            this.value = value
        }

        /* synthetic */ LoginRequestField(String str, String str2, LoginRequestField loginRequestField) {
            this(str, str2)
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00ea A[LOOP:1: B:28:0x00e7->B:30:0x00ea, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x019c  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x004b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    /**
     * XML-RPC login_to_simulator request (the viewer's LLLoginInstance /
     * lllogin XML-RPC path). Builds the login struct, posts it to the grid's
     * login URI and follows up to five "indeterminate" redirects
     * (next_method / next_url, e.g. for MFA or TOS pages).
     */
    private SLAuthReply SendLoginRequest(SLAuthParams authParams) throws IOException {
        var passwordHash: String = authParams.passwordHash
        // 3.4.2 logged the password hash and the whole request here through
        // Debug.Log (a no-op in release builds). Left out: credentials must not
        // reach logs if debug logging is ever enabled (TPV policy).
        var startLocation: String = "last"
        if (authParams.startLocation != null) {
            if (authParams.startLocation.equals("first")) {
                startLocation = "home"
            } else if (authParams.startLocation.startsWith("uri:")) {
                startLocation = authParams.startLocation
            }
        }
        var fields: LinkedList<LoginRequestField> = LinkedList<>()
        // "First Last", "first.last" or "first_last"; a bare name is a
        // "Resident" account (the viewer's LLGridManager legacy name handling).
        var loginName: String = authParams.loginName.trim()
        var separatorIndex: Int = loginName.length
        var separators: String = " ._"
        for (int i = 0; i < separators.length; i++) {
            var index: Int = loginName.indexOf(separators.substring(i, i + 1))
            if (index != -1 && index < separatorIndex) {
                separatorIndex = index
            }
        }
        var firstName: String = loginName.substring(0, separatorIndex)
        var lastName: String = ""
        if (separatorIndex < loginName.length) {
            lastName = loginName.substring(separatorIndex + 1)
        }
        firstName = firstName.trim()
        lastName = lastName.trim()
        if (lastName.equalsIgnoreCase("")) {
            lastName = "Resident"
        }
        fields.add(LoginRequestField("first", firstName, null))
        fields.add(LoginRequestField("last", lastName, null))
        fields.add(LoginRequestField("passwd", passwordHash, null))
        fields.add(LoginRequestField("start", startLocation, null))
        var channel: String = "Lumiya " + (if (Debug.isDebugBuild()) "Test" else "Release")
        // Login expects a four-part version: pad "3.4.2" to "3.4.2.0".
        var version: String = LumiyaApp.getAppVersion()
        for (int dots = StringUtils.countOccurrences(version, '.'); dots < 3; dots++) {
            version = version + ".0"
        }
        Debug.Printf("Auth: viewer channel '%s', version '%s'", channel, version)
        fields.add(LoginRequestField("channel", channel, null))
        fields.add(LoginRequestField("version", version, null))
        fields.add(LoginRequestField("platform", "Android", null))
        fields.add(LoginRequestField("platform_version", Build.VERSION.RELEASE, null))
        fields.add(LoginRequestField("mac", HashUtils.MD5_Hash("android_id"), null))
        fields.add(LoginRequestField("user-agent", "Lumiya", null))
        fields.add(LoginRequestField("id0", authParams.clientID.toString(), null))
        fields.add(LoginRequestField("agree_to_tos", "true", null))
        fields.add(LoginRequestField("viewer_digest", "f50cfcc3-d6ce-4f16-a822-b91271de4c48", null))
        // Multi-factor authentication (lllogininstance.cpp constructAuthParams):
        // "token" carries the code the user typed after an mfa_challenge
        // reply, "mfa_hash" the hash a previous MFA login returned. Both are
        // sent, empty when unknown.
        var mfaHash: String = if (this.mfaHashStore != null) this.mfaHashStore.get(authParams.gridName, authParams.loginName) else ""
        fields.add(LoginRequestField("token", normalizeMfaToken(authParams.mfaToken), null))
        fields.add(LoginRequestField("mfa_hash", mfaHash, null))
        var loginURL: String = authParams.loginURL
        var methodName: String = "login_to_simulator"
        var reply: SLAuthReply? = null
        for (int redirect = 0; redirect < 5; redirect++) {
            var request: StringBuilder = StringBuilder()
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
                // Escaped (3.4.2 was not): a "uri:Region&x&y&z" start location
                // otherwise makes the XML-RPC request malformed.
                request.append(TextUtils.htmlEncode(field.value))
                request.append("</string>")
                request.append("</value>")
                request.append("</member>")
            }
            // Optional login response sections the viewer wants back.
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
            var requestXML: String = request.toString()
            Debug.Log("Start location: " + startLocation)
            var response: Response = SLHTTPSConnection.getOkHttpClient().newCall(Request.Builder()
                    .url(loginURL)
                    .header("Connection", "close")
                    .post(RequestBody.create(MediaType.parse("text/xml"), requestXML))
                    .header("Content-Type", "text/xml")
                    .build()).execute()
            if (response == null) {
                throw IOException("Null response")
            }
            try {
                if (!response.isSuccessful()) {
                    throw IOException("Login error code " + response.code())
                }
                try {
                    var parser: XmlPullParser = XmlPullParserFactory.newInstance().newPullParser()
                    parser.setInput(BufferedInputStream(response.body().byteStream(), 65536), null)
                    reply = SLAuthReply(authParams.gridName, authParams.loginURL, parser)
                    if (!reply.isIndeterminate || reply.nextMethod == null || reply.nextURL == null) {
                        if (reply.success && reply.mfaHash != null && this.mfaHashStore != null) {
                            this.mfaHashStore.put(authParams.gridName, authParams.loginName, reply.mfaHash)
                        }
        return reply
                    }
                    methodName = reply.nextMethod
                    loginURL = reply.nextURL
                } catch (e: XmlPullParserException) {
                    Debug.Warning(e)
                    throw IOException("Login reply parse error", e)
                }
            } finally {
                response.close()
            }
        }
        return reply
    }

    /**
     * Second Life login password: "$1$" + MD5 hex digest, as the viewer sends
     * it (llpanellogin.cpp LLMD5, llsecapi.cpp "$1$" prefix). 3.4.2 first cuts
     * the password to 16 characters, Second Life's historical maximum.
     */
    fun getPasswordHash(password: String): String {
        var trimmed: String = password.trim()
        if (trimmed.length > 16) {
            trimmed = trimmed.substring(0, 16)
        }
        return "$1$" + HashUtils.MD5_Hash(trimmed)
    }

    /**
     * The viewer strips all whitespace from the code before sending it
     * (SL-17034): codes are often pasted as "123 456".
     */
    fun normalizeMfaToken(token: String): String {
        return token ?: "".replaceAll("\\s", "")
    }

    public SLAuthReply Login(SLAuthParams authParams) throws IOException {
        // The selected grid decides whether certificates that fail
        // verification are accepted for the whole session (never for
        // Linden Lab hosts).
        TlsPolicy.setAllowUntrustedCertificates(authParams.allowUntrustedCertificates)
        try {
            return SendLoginRequest(authParams)
        } catch (e: Exception) {
            e.printStackTrace()
            if (isCertificateFailure(e)) {
                throw CertificateVerificationException(e)
            }
            throw IOException("Failed to login to simulator")
        }
    }

    private fun isCertificateFailure(e: Throwable): Boolean {
        for (Throwable t = e; t != null; t = t.getCause()) {
            if (t is SSLPeerUnverifiedException || t is CertificateException) {
        return true
            }
            if (t.getCause() == t) {

            }
        }
        return false
    }

    /** The login server's certificate did not verify (TlsPolicy). */
    open class CertificateVerificationException : IOException() {
        private long serialVersionUID = 1L

        CertificateVerificationException(Throwable cause) {
            super("The login server's security certificate could not be verified. The connection may be intercepted. "
                    + "For a grid with a self-signed certificate, allow untrusted certificates in Manage Grids.", cause)
        }
    }
}
