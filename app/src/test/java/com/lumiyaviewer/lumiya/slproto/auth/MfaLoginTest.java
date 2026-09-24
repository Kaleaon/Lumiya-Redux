package com.lumiyaviewer.lumiya.slproto.auth;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import androidx.test.core.app.ApplicationProvider;
import com.lumiyaviewer.lumiya.LumiyaApp;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Multi-factor login against a local XML-RPC login server that behaves like
 * login.agni.lindenlab.com with MFA turned on: the first attempt gets
 * reason "mfa_challenge", the retry with "token" succeeds and returns an
 * "mfa_hash", which later logins send instead of a code.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class MfaLoginTest {
    private static final String GRID = "Second Life";
    private static final String USER = "Test Resident";

    private MockWebServer server;
    private MemoryStore store;

    /** In-memory stand-in: Robolectric has no AndroidKeyStore provider. */
    static class MemoryStore extends MfaHashStore {
        final Map<String, String> hashes = new HashMap<>();

        MemoryStore() {
            super((android.content.SharedPreferences) null);
        }

        @Override
        public String get(String gridName, String loginName) {
            String hash = hashes.get(accountKey(gridName, loginName));
            return hash == null ? "" : hash;
        }

        @Override
        public void put(String gridName, String loginName, String mfaHash) {
            hashes.put(accountKey(gridName, loginName), mfaHash);
        }
    }

    private static String reply(String... members) {
        StringBuilder xml = new StringBuilder("<?xml version=\"1.0\"?><methodResponse><params><param><value><struct>");
        for (int i = 0; i < members.length; i += 2) {
            xml.append("<member><name>").append(members[i]).append("</name><value><string>")
                    .append(members[i + 1]).append("</string></value></member>");
        }
        return xml.append("</struct></value></param></params></methodResponse>").toString();
    }

    private static final String CHALLENGE = reply(
            "login", "false",
            "reason", "mfa_challenge",
            "message", "Enter the code from your authenticator app",
            "message_id", "mfa_challenge");

    private static final String SUCCESS = reply(
            "login", "true",
            "agent_id", "11111111-2222-3333-4444-555555555555",
            "session_id", "66666666-7777-8888-9999-000000000000",
            "secure_session_id", "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
            "circuit_code", "12345",
            "sim_ip", "127.0.0.1",
            "sim_port", "13000",
            "seed_capability", "https://sim.example/cap/seed",
            "mfa_hash", "HASH-FROM-GRID");

    /** The string value of one field in a recorded XML-RPC login request, or null. */
    private static String field(String body, String name) {
        Matcher m = Pattern.compile("<member><name>" + Pattern.quote(name) + "</name><value><string>(.*?)</string>").matcher(body);
        return m.find() ? m.group(1) : null;
    }

    private SLAuthParams params(String token) {
        return new SLAuthParams(USER, "$1$0123456789abcdef0123456789abcdef", UUID.randomUUID(), "last",
                server.url("/cgi-bin/login.cgi").toString(), GRID, false, token);
    }

    @Before
    public void setUp() throws Exception {
        Field context = LumiyaApp.class.getDeclaredField("mContext");
        context.setAccessible(true);
        context.set(null, ApplicationProvider.getApplicationContext());
        server = new MockWebServer();
        server.start();
        store = new MemoryStore();
    }

    @After
    public void tearDown() throws Exception {
        server.shutdown();
    }

    @Test
    public void challengeThenTokenThenSavedHash() throws Exception {
        SLAuth auth = new SLAuth(store);

        server.enqueue(new MockResponse().setBody(CHALLENGE));
        SLAuthReply challenge = auth.Login(params(null));
        assertFalse(challenge.success);
        assertTrue(challenge.isMfaChallenge());
        assertEquals("Enter the code from your authenticator app", challenge.message);
        String first = server.takeRequest().getBody().readUtf8();
        assertEquals("", field(first, "token"));

        server.enqueue(new MockResponse().setBody(SUCCESS));
        SLAuthReply ok = auth.Login(params(" 123 456 "));
        assertTrue(ok.success);
        assertFalse(ok.isMfaChallenge());
        assertEquals("HASH-FROM-GRID", ok.mfaHash);
        String second = server.takeRequest().getBody().readUtf8();
        assertEquals("whitespace is stripped from the code", "123456", field(second, "token"));
        assertEquals("", field(second, "mfa_hash"));

        // Later logins, including automatic reconnects, send the hash and no code.
        server.enqueue(new MockResponse().setBody(SUCCESS));
        auth.Login(params(null));
        String third = server.takeRequest().getBody().readUtf8();
        assertEquals("", field(third, "token"));
        assertEquals("HASH-FROM-GRID", field(third, "mfa_hash"));
    }

    @Test
    public void ordinaryFailureIsNotAChallenge() throws Exception {
        server.enqueue(new MockResponse().setBody(reply("login", "false", "reason", "key", "message", "Wrong password")));
        SLAuthReply reply = new SLAuth(store).Login(params(null));
        assertFalse(reply.success);
        assertFalse(reply.isMfaChallenge());
        assertEquals("key", reply.reason);
        assertNull(reply.mfaHash);
    }

    @Test
    public void accountKeyMatchesNameSpellings() {
        String key = MfaHashStore.accountKey(GRID, "Test Resident");
        assertEquals(key, MfaHashStore.accountKey(GRID, "test.resident"));
        assertEquals(key, MfaHashStore.accountKey(GRID, "test_resident"));
        assertEquals(key, MfaHashStore.accountKey(GRID, "  test  "));
        assertNotEquals(key, MfaHashStore.accountKey("OSGrid", "Test Resident"));
        assertNotEquals(key, MfaHashStore.accountKey(GRID, "Other Resident"));
    }

    @Test
    public void withoutMfaTokenKeepsEverythingElse() {
        SLAuthParams withToken = new SLAuthParams(USER, "hash", UUID.randomUUID(), "home", "https://login.example/", GRID, true, "123456");
        SLAuthParams stripped = withToken.withoutMfaToken();
        assertNull(stripped.mfaToken);
        assertTrue(stripped.allowUntrustedCertificates);
        assertEquals(withToken, stripped);
        assertEquals("123456", withToken.withLocation("last").mfaToken);
    }
}
