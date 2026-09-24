package com.lumiyaviewer.lumiya.slproto.https;

import com.lumiyaviewer.lumiya.Debug;
import java.net.Socket;
import java.security.KeyStore;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Locale;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLEngine;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509ExtendedTrustManager;
import javax.net.ssl.X509TrustManager;
import okhttp3.internal.tls.OkHostnameVerifier;

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
public final class TlsPolicy {
    private static final String[] LINDEN_DOMAINS = {"secondlife.com", "secondlife.io", "lindenlab.com"};

    private static volatile boolean allowUntrustedCertificates = false;

    private TlsPolicy() {
    }

    /** Set when a login starts, from the selected grid's setting. */
    public static void setAllowUntrustedCertificates(boolean allow) {
        if (allow != allowUntrustedCertificates) {
            Debug.Printf("TLS: untrusted certificates %s for non-Linden hosts", allow ? "allowed" : "rejected");
        }
        allowUntrustedCertificates = allow;
    }

    public static boolean getAllowUntrustedCertificates() {
        return allowUntrustedCertificates;
    }

    public static boolean isLindenHost(String host) {
        if (host == null) {
            return false;
        }
        String h = host.toLowerCase(Locale.US);
        if (h.endsWith(".")) {
            h = h.substring(0, h.length() - 1);
        }
        for (String domain : LINDEN_DOMAINS) {
            if (h.equals(domain) || h.endsWith("." + domain)) {
                return true;
            }
        }
        return false;
    }

    /** Whether a certificate failure for this host may be ignored. */
    static boolean mayBypass(String host) {
        return allowUntrustedCertificates && host != null && !isLindenHost(host);
    }

    static X509ExtendedTrustManager createTrustManager() {
        return new PolicyTrustManager(systemTrustManager());
    }

    static HostnameVerifier createHostnameVerifier() {
        return new PolicyHostnameVerifier(OkHostnameVerifier.INSTANCE);
    }

    static X509TrustManager systemTrustManager() {
        try {
            TrustManagerFactory factory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
            factory.init((KeyStore) null);
            for (TrustManager trustManager : factory.getTrustManagers()) {
                if (trustManager instanceof X509TrustManager) {
                    return (X509TrustManager) trustManager;
                }
            }
        } catch (Exception e) {
            throw new IllegalStateException("No system X509TrustManager", e);
        }
        throw new IllegalStateException("No system X509TrustManager");
    }

    static final class PolicyHostnameVerifier implements HostnameVerifier {
        private final HostnameVerifier delegate;

        PolicyHostnameVerifier(HostnameVerifier delegate) {
            this.delegate = delegate;
        }

        @Override
        public boolean verify(String host, SSLSession session) {
            if (this.delegate.verify(host, session)) {
                return true;
            }
            if (mayBypass(host)) {
                Debug.AlwaysPrintf("TLS: hostname mismatch for %s accepted (grid allows untrusted certificates)", host);
                return true;
            }
            Debug.AlwaysPrintf("TLS: certificate does not match hostname %s", host);
            return false;
        }
    }

    /**
     * Delegates to the platform trust manager, passing the socket or engine
     * through so Android's per-host network security config still applies.
     */
    static final class PolicyTrustManager extends X509ExtendedTrustManager {
        private final X509TrustManager delegate;

        PolicyTrustManager(X509TrustManager delegate) {
            this.delegate = delegate;
        }

        private static String peerHost(Socket socket) {
            if (socket instanceof SSLSocket) {
                SSLSession session = ((SSLSocket) socket).getHandshakeSession();
                if (session != null && session.getPeerHost() != null) {
                    return session.getPeerHost();
                }
            }
            if (socket != null && socket.getInetAddress() != null) {
                return socket.getInetAddress().getHostName();
            }
            return null;
        }

        private static String peerHost(SSLEngine engine) {
            return engine != null ? engine.getPeerHost() : null;
        }

        private void onFailure(String host, X509Certificate[] chain, CertificateException e) throws CertificateException {
            String subject = (chain != null && chain.length > 0) ? chain[0].getSubjectX500Principal().getName() : "(none)";
            if (mayBypass(host)) {
                Debug.AlwaysPrintf("TLS: untrusted certificate for %s (%s) accepted (grid allows untrusted certificates): %s", host, subject, e.getMessage());
                return;
            }
            Debug.AlwaysPrintf("TLS: rejected certificate for %s (%s): %s", host, subject, e.getMessage());
            throw e;
        }

        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType, Socket socket) throws CertificateException {
            try {
                if (this.delegate instanceof X509ExtendedTrustManager) {
                    ((X509ExtendedTrustManager) this.delegate).checkServerTrusted(chain, authType, socket);
                } else {
                    this.delegate.checkServerTrusted(chain, authType);
                }
            } catch (CertificateException e) {
                onFailure(peerHost(socket), chain, e);
            }
        }

        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType, SSLEngine engine) throws CertificateException {
            try {
                if (this.delegate instanceof X509ExtendedTrustManager) {
                    ((X509ExtendedTrustManager) this.delegate).checkServerTrusted(chain, authType, engine);
                } else {
                    this.delegate.checkServerTrusted(chain, authType);
                }
            } catch (CertificateException e) {
                onFailure(peerHost(engine), chain, e);
            }
        }

        /** No host is known here, so nothing may be bypassed. */
        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            try {
                this.delegate.checkServerTrusted(chain, authType);
            } catch (CertificateException e) {
                onFailure(null, chain, e);
            }
        }

        @Override
        public void checkClientTrusted(X509Certificate[] chain, String authType, Socket socket) throws CertificateException {
            this.delegate.checkClientTrusted(chain, authType);
        }

        @Override
        public void checkClientTrusted(X509Certificate[] chain, String authType, SSLEngine engine) throws CertificateException {
            this.delegate.checkClientTrusted(chain, authType);
        }

        @Override
        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            this.delegate.checkClientTrusted(chain, authType);
        }

        @Override
        public X509Certificate[] getAcceptedIssuers() {
            return this.delegate.getAcceptedIssuers();
        }
    }
}
