package com.lumiyaviewer.lumiya.slproto.auth;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import androidx.test.core.app.ApplicationProvider;
import com.lumiyaviewer.lumiya.LumiyaApp;
import java.lang.reflect.Field;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.mockwebserver.RecordedRequest;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class SLAuthTest {
    private MockWebServer server;

    private static String reply(String... members) {
        StringBuilder xml = new StringBuilder("<?xml version=\"1.0\"?><methodResponse><params><param><value><struct>");
        for (int i = 0; i < members.length; i += 2) {
            xml.append("<member><name>").append(members[i]).append("</name><value><string>")
                    .append(members[i + 1]).append("</string></value></member>");
        }
        return xml.append("</struct></value></param></params></methodResponse>").toString();
    }

    private static final String SUCCESS_REPLY = reply(
            "login", "true",
            "agent_id", "11111111-2222-3333-4444-555555555555",
            "session_id", "66666666-7777-8888-9999-000000000000",
            "secure_session_id", "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
            "circuit_code", "12345",
            "sim_ip", "127.0.0.1",
            "sim_port", "13000",
            "seed_capability", "https://sim.example/cap/seed");

    private static String field(String body, String name) {
        Matcher m = Pattern.compile("<member><name>" + Pattern.quote(name) + "</name><value><string>(.*?)</string>").matcher(body);
        return m.find() ? m.group(1) : null;
    }

    @Before
    public void setUp() throws Exception {
        Field context = LumiyaApp.class.getDeclaredField("mContext");
        context.setAccessible(true);
        context.set(null, ApplicationProvider.getApplicationContext());
        server = new MockWebServer();
        server.start();
    }

    @After
    public void tearDown() throws Exception {
        server.shutdown();
    }

    @Test
    public void testPasswordHash() {
        String pass = "secretPassword123";
        String hash = SLAuth.getPasswordHash(pass);
        assertTrue(hash.startsWith("$1$"));
        assertEquals(35, hash.length()); // "$1$" + 32-char hex
    }

    @Test
    public void testUsernameParsingSingleWordDefaultResident() throws Exception {
        SLAuth auth = new SLAuth(null);
        server.enqueue(new MockResponse().setBody(SUCCESS_REPLY));

        SLAuthParams params = new SLAuthParams(
                "SingleName",
                "$1$hash",
                UUID.randomUUID(),
                "last",
                server.url("/login").toString(),
                "TestGrid"
        );

        SLAuthReply reply = auth.Login(params);
        assertNotNull(reply);
        assertTrue(reply.success);

        RecordedRequest req = server.takeRequest();
        String body = req.getBody().readUtf8();

        assertEquals("SingleName", field(body, "first"));
        assertEquals("Resident", field(body, "last"));
    }

    @Test
    public void testUsernameParsingSeparators() throws Exception {
        SLAuth auth = new SLAuth(null);

        // Test dotted username
        server.enqueue(new MockResponse().setBody(SUCCESS_REPLY));
        SLAuthParams dottedParams = new SLAuthParams("John.Doe", "$1$hash", UUID.randomUUID(), "last", server.url("/login").toString(), "Grid");
        auth.Login(dottedParams);
        String dottedBody = server.takeRequest().getBody().readUtf8();
        assertEquals("John", field(dottedBody, "first"));
        assertEquals("Doe", field(dottedBody, "last"));

        // Test space username
        server.enqueue(new MockResponse().setBody(SUCCESS_REPLY));
        SLAuthParams spaceParams = new SLAuthParams("Jane Smith", "$1$hash", UUID.randomUUID(), "last", server.url("/login").toString(), "Grid");
        auth.Login(spaceParams);
        String spaceBody = server.takeRequest().getBody().readUtf8();
        assertEquals("Jane", field(spaceBody, "first"));
        assertEquals("Smith", field(spaceBody, "last"));

        // Test underscore username
        server.enqueue(new MockResponse().setBody(SUCCESS_REPLY));
        SLAuthParams underscoreParams = new SLAuthParams("Alice_Bob", "$1$hash", UUID.randomUUID(), "last", server.url("/login").toString(), "Grid");
        auth.Login(underscoreParams);
        String underscoreBody = server.takeRequest().getBody().readUtf8();
        assertEquals("Alice", field(underscoreBody, "first"));
        assertEquals("Bob", field(underscoreBody, "last"));
    }

    @Test
    public void testXmlRpcStructureAndOptionsArray() throws Exception {
        SLAuth auth = new SLAuth(null);
        server.enqueue(new MockResponse().setBody(SUCCESS_REPLY));

        SLAuthParams params = new SLAuthParams("Test User", "$1$hash", UUID.randomUUID(), "first", server.url("/login").toString(), "Grid");
        auth.Login(params);

        RecordedRequest req = server.takeRequest();
        String body = req.getBody().readUtf8();

        assertTrue(body.contains("<methodName>login_to_simulator</methodName>"));
        assertEquals("home", field(body, "start")); // "first" maps to "home"
        assertEquals("true", field(body, "agree_to_tos"));
        assertEquals("f50cfcc3-d6ce-4f16-a822-b91271de4c48", field(body, "viewer_digest"));

        // Verify options array inclusion
        assertTrue(body.contains("<name>options</name>"));
        assertTrue(body.contains("<value><string>buddy-list</string></value>"));
        assertTrue(body.contains("<value><string>display_names</string></value>"));
        assertTrue(body.contains("<value><string>inventory-root</string></value>"));
        assertTrue(body.contains("<value><string>inventory-lib-root</string></value>"));
        assertTrue(body.contains("<value><string>max-agent-groups</string></value>"));
    }

    @Test
    public void testIndeterminateRedirectionLoop() throws Exception {
        SLAuth auth = new SLAuth(null);

        String redirectUrl = server.url("/login_redirect").toString();
        String indeterminateReply = reply(
                "login", "indeterminate",
                "next_url", redirectUrl,
                "next_method", "login_to_simulator");

        server.enqueue(new MockResponse().setBody(indeterminateReply));
        server.enqueue(new MockResponse().setBody(SUCCESS_REPLY));

        SLAuthParams params = new SLAuthParams("User Resident", "$1$hash", UUID.randomUUID(), "last", server.url("/login").toString(), "Grid");
        SLAuthReply reply = auth.Login(params);

        assertNotNull(reply);
        assertTrue(reply.success);
        assertEquals(2, server.getRequestCount());
    }
}
