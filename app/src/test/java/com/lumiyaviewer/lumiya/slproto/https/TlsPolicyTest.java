package com.lumiyaviewer.lumiya.slproto.https;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Application;
import java.io.IOException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLException;
import javax.net.ssl.X509TrustManager;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.tls.HandshakeCertificates;
import okhttp3.tls.HeldCertificate;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * 3.4.2 accepted any certificate for any host. These tests run real TLS
 * handshakes through the viewer's shared OkHttp client against a local server
 * whose certificate no system CA signed, i.e. what an on-path attacker
 * presents.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class TlsPolicyTest {
    private MockWebServer server;

    @Before
    public void setUp() throws Exception {
        TlsPolicy.setAllowUntrustedCertificates(false);
        HeldCertificate selfSigned = new HeldCertificate.Builder()
                .commonName("localhost")
                .addSubjectAlternativeName("localhost")
                .build();
        HandshakeCertificates serverCerts = new HandshakeCertificates.Builder()
                .heldCertificate(selfSigned)
                .build();
        server = new MockWebServer();
        server.useHttps(serverCerts.sslSocketFactory(), false);
        server.start();
    }

    @After
    public void tearDown() throws Exception {
        TlsPolicy.setAllowUntrustedCertificates(false);
        server.shutdown();
    }

    private Response get() throws IOException {
        OkHttpClient client = SLHTTPSConnection.getOkHttpClient();
        return client.newCall(new Request.Builder().url(server.url("/login")).build()).execute();
    }

    @Test
    public void selfSignedCertificateRejectedByDefault() throws Exception {
        server.enqueue(new MockResponse().setBody("secret"));
        try (Response response = get()) {
            fail("untrusted certificate was accepted: " + response.code());
        } catch (SSLException expected) {
            // SSLHandshakeException or SSLPeerUnverifiedException
        }
        assertEquals("no request may reach an unverified server", 0, server.getRequestCount());
    }

    @Test
    public void selfSignedCertificateAcceptedWhenGridAllowsIt() throws Exception {
        TlsPolicy.setAllowUntrustedCertificates(true);
        server.enqueue(new MockResponse().setBody("ok"));
        try (Response response = get()) {
            assertEquals("ok", response.body().string());
        }
    }

    @Test
    public void lindenHosts() {
        assertTrue(TlsPolicy.isLindenHost("login.agni.lindenlab.com"));
        assertTrue(TlsPolicy.isLindenHost("simhost-0a1b2c.agni.secondlife.io"));
        assertTrue(TlsPolicy.isLindenHost("asset-cdn.glb.agni.lindenlab.com"));
        assertTrue(TlsPolicy.isLindenHost("SECONDLIFE.COM."));
        assertFalse(TlsPolicy.isLindenHost("login.osgrid.org"));
        assertFalse(TlsPolicy.isLindenHost("evilsecondlife.com"));
        assertFalse(TlsPolicy.isLindenHost("secondlife.com.attacker.example"));
        assertFalse(TlsPolicy.isLindenHost(null));
    }

    @Test
    public void lindenHostsNeverBypassed() {
        TlsPolicy.setAllowUntrustedCertificates(true);
        assertFalse(TlsPolicy.mayBypass("login.agni.lindenlab.com"));
        assertFalse(TlsPolicy.mayBypass("simhost-1.agni.secondlife.io"));
        assertFalse(TlsPolicy.mayBypass(null));
        assertTrue(TlsPolicy.mayBypass("login.osgrid.org"));
    }

    @Test
    public void unknownHostNeverBypassed() {
        TlsPolicy.setAllowUntrustedCertificates(true);
        X509TrustManager failing = new X509TrustManager() {
            @Override
            public void checkClientTrusted(X509Certificate[] chain, String authType) {
            }

            @Override
            public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                throw new CertificateException("untrusted");
            }

            @Override
            public X509Certificate[] getAcceptedIssuers() {
                return new X509Certificate[0];
            }
        };
        TlsPolicy.PolicyTrustManager trustManager = new TlsPolicy.PolicyTrustManager(failing);
        try {
            trustManager.checkServerTrusted(new X509Certificate[0], "RSA");
            fail("check without a host must not be bypassed");
        } catch (CertificateException expected) {
        }
    }
}
