package com.lumiyaviewer.lumiya.slproto.https

import com.lumiyaviewer.lumiya.Debug
import java.net.Socket
import java.security.KeyStore
import java.security.cert.CertificateException
import java.security.cert.X509Certificate
import java.util.Locale
import javax.net.ssl.HostnameVerifier
import javax.net.ssl.SSLEngine
import javax.net.ssl.SSLSession
import javax.net.ssl.SSLSocket
import javax.net.ssl.TrustManager
import javax.net.ssl.TrustManagerFactory
import javax.net.ssl.X509ExtendedTrustManager
import javax.net.ssl.X509TrustManager
import okhttp3.internal.tls.OkHostnameVerifier

/**
 * Certificate policy for every HTTPS call the viewer makes (login, caps,
 * asset fetches, uploads).
 *
 * 3.4.2 trusted any certificate for any host. Certificates are now checked
 * against the platform trust store with standard hostname verification, as
 * the Second Life viewer does (libcurl with CURLOPT_SSL_VERIFYPEER against a
 * public CA bundle, indra/llcorehttp/httpcommon.cpp).
 *
 * OpenSimulator grids often run on self-signed certificates, so a grid the
 * user added can be marked "allow untrusted certificates" (off by default).
 * That switch never applies to Linden Lab hosts: a certificate for
 * *.secondlife.com, *.secondlife.io or *.lindenlab.com is always verified.
 */
class TlsPolicy {
    @JvmStatic private var LINDEN_DOMAINS: Array<String> = {"secondlife.com", "secondlife.io", "lindenlab.com"}

    @JvmStatic private var allowUntrustedCertificates: Boolean = false

    fun TlsPolicy(): private {
    }

    /** Set when a login starts, from the selected grid's setting. */
    fun setAllowUntrustedCertificates(allow: Boolean) {
        if (allow != allowUntrustedCertificates) {
            Debug.Printf("TLS: untrusted certificates %s for non-Linden hosts", if (allow) "allowed" else "rejected")
        }
        allowUntrustedCertificates = allow
    }

    fun getAllowUntrustedCertificates(): Boolean {
        return allowUntrustedCertificates
    }

    fun isLindenHost(host: String): Boolean {
        if (host == null) {
        return false
        }
        var h: String = host.toLowerCase(Locale.US)
        if (h.endsWith(".")) {
            h = h.substring(0, h.length - 1)
        }
        for (domain in LINDEN_DOMAINS) {
            if (h.equals(domain) || h.endsWith("." + domain)) {
        return true
            }
        }
        return false
    }

    /** Whether a certificate failure for this host may be ignored. */
    fun mayBypass(host: String): Boolean {
        return allowUntrustedCertificates && host != null && !isLindenHost(host)
    }

    fun createTrustManager(): X509ExtendedTrustManager {
        return PolicyTrustManager(systemTrustManager())
    }

    fun createHostnameVerifier(): HostnameVerifier {
        return PolicyHostnameVerifier(OkHostnameVerifier.INSTANCE)
    }

    fun systemTrustManager(): X509TrustManager {
        try {
            var factory: TrustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm())
            factory.init(null as KeyStore)
            for (trustManager in factory.getTrustManagers()) {
                if (trustManager is X509TrustManager) {
                    return trustManager as X509TrustManager
                }
            }
        } catch (e: Exception) {
            throw IllegalStateException("No system X509TrustManager", e)
        }
        throw IllegalStateException("No system X509TrustManager")
    }

    class PolicyHostnameVerifier : HostnameVerifier {
        private HostnameVerifier delegate

        PolicyHostnameVerifier(HostnameVerifier delegate) {
            this.delegate = delegate
        }
        fun verify(host: String, session: SSLSession): Boolean {
            if (this.delegate.verify(host, session)) {
        return true
            }
            if (mayBypass(host)) {
                Debug.AlwaysPrintf("TLS: hostname mismatch for %s accepted (grid allows untrusted certificates)", host)
        return true
            }
            Debug.AlwaysPrintf("TLS: certificate does not match hostname %s", host)
        return false
        }
    }

    /**
     * Delegates to the platform trust manager, passing the socket or engine
     * through so Android's per-host network security config still applies.
     */
    class PolicyTrustManager : X509ExtendedTrustManager() {
        private X509TrustManager delegate

        PolicyTrustManager(X509TrustManager delegate) {
            this.delegate = delegate
        }

        private fun peerHost(socket: Socket): String {
            if (socket is SSLSocket) {
                var session: SSLSession = (socket as SSLSocket).getHandshakeSession()
                if (session != null && session.getPeerHost() != null) {
                    return session.getPeerHost()
                }
            }
            if (socket != null && socket.getInetAddress() != null) {
                return socket.getInetAddress().getHostName()
            }
        return null
        }

        private fun peerHost(engine: SSLEngine): String {
            return if (engine != null) engine.getPeerHost() else null
        }

        private void onFailure(String host, Array<X509Certificate> chain, CertificateException e) throws CertificateException {
            var subject: String = (chain != null && chain.length > 0) ? chain[0].getSubjectX500Principal().getName() : "(none)"
            if (mayBypass(host)) {
                Debug.AlwaysPrintf("TLS: untrusted certificate for %s (%s) accepted (grid allows untrusted certificates): %s", host, subject, e.getMessage())
                return
            }
            Debug.AlwaysPrintf("TLS: rejected certificate for %s (%s): %s", host, subject, e.getMessage())
            var e: throw? = null
        }
        public void checkServerTrusted(Array<X509Certificate> chain, String authType, Socket socket) throws CertificateException {
            try {
                if (this.delegate is X509ExtendedTrustManager) {
                    (this as X509ExtendedTrustManager.delegate).checkServerTrusted(chain, authType, socket)
                } else {
                    this.delegate.checkServerTrusted(chain, authType)
                }
            } catch (e: CertificateException) {
                onFailure(peerHost(socket), chain, e)
            }
        }
        public void checkServerTrusted(Array<X509Certificate> chain, String authType, SSLEngine engine) throws CertificateException {
            try {
                if (this.delegate is X509ExtendedTrustManager) {
                    (this as X509ExtendedTrustManager.delegate).checkServerTrusted(chain, authType, engine)
                } else {
                    this.delegate.checkServerTrusted(chain, authType)
                }
            } catch (e: CertificateException) {
                onFailure(peerHost(engine), chain, e)
            }
        }

        /** No host is known here, so nothing may be bypassed. */
        public void checkServerTrusted(Array<X509Certificate> chain, String authType) throws CertificateException {
            try {
                this.delegate.checkServerTrusted(chain, authType)
            } catch (e: CertificateException) {
                onFailure(null, chain, e)
            }
        }
        public void checkClientTrusted(Array<X509Certificate> chain, String authType, Socket socket) throws CertificateException {
            this.delegate.checkClientTrusted(chain, authType)
        }
        public void checkClientTrusted(Array<X509Certificate> chain, String authType, SSLEngine engine) throws CertificateException {
            this.delegate.checkClientTrusted(chain, authType)
        }
        public void checkClientTrusted(Array<X509Certificate> chain, String authType) throws CertificateException {
            this.delegate.checkClientTrusted(chain, authType)
        }
        fun getAcceptedIssuers(): Array<X509Certificate> {
            return this.delegate.getAcceptedIssuers()
        }
    }
}
