package com.lumiyaviewer.lumiya.slproto.auth;

import android.os.Build;
import android.text.TextUtils;
import com.google.common.net.HttpHeaders;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection;
import com.lumiyaviewer.lumiya.utils.StringUtils;
import java.io.BufferedInputStream;
import java.util.LinkedList;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.lumiyaviewer.lumiya.utils.HashUtils;
import java.io.IOException;

public class SLAuth {

    private static class LoginRequestField {
        public final String name;
        public final String value;

        private LoginRequestField(String name, String value) {
            this.name = name;
            this.value = value;
        }

        /* synthetic */ LoginRequestField(String str, String str2, LoginRequestField loginRequestField) {
            this(str, str2);
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
        String passwordHash = authParams.passwordHash;
        // 3.4.2 logged the password hash and the whole request here through
        // Debug.Log (a no-op in release builds). Left out: credentials must not
        // reach logs if debug logging is ever enabled (TPV policy).
        String startLocation = "last";
        if (authParams.startLocation != null) {
            if (authParams.startLocation.equals("first")) {
                startLocation = "home";
            } else if (authParams.startLocation.startsWith("uri:")) {
                startLocation = authParams.startLocation;
            }
        }
        LinkedList<LoginRequestField> fields = new LinkedList<>();
        // "First Last", "first.last" or "first_last"; a bare name is a
        // "Resident" account (the viewer's LLGridManager legacy name handling).
        String loginName = authParams.loginName.trim();
        int separatorIndex = loginName.length();
        String separators = " ._";
        for (int i = 0; i < separators.length(); i++) {
            int index = loginName.indexOf(separators.substring(i, i + 1));
            if (index != -1 && index < separatorIndex) {
                separatorIndex = index;
            }
        }
        String firstName = loginName.substring(0, separatorIndex);
        String lastName = "";
        if (separatorIndex < loginName.length()) {
            lastName = loginName.substring(separatorIndex + 1);
        }
        firstName = firstName.trim();
        lastName = lastName.trim();
        if (lastName.equalsIgnoreCase("")) {
            lastName = "Resident";
        }
        fields.add(new LoginRequestField("first", firstName, null));
        fields.add(new LoginRequestField("last", lastName, null));
        fields.add(new LoginRequestField("passwd", passwordHash, null));
        fields.add(new LoginRequestField("start", startLocation, null));
        String channel = "Lumiya " + (Debug.isDebugBuild() ? "Test" : "Release");
        // Login expects a four-part version: pad "3.4.2" to "3.4.2.0".
        String version = LumiyaApp.getAppVersion();
        for (int dots = StringUtils.countOccurrences(version, '.'); dots < 3; dots++) {
            version = version + ".0";
        }
        Debug.Printf("Auth: viewer channel '%s', version '%s'", channel, version);
        fields.add(new LoginRequestField("channel", channel, null));
        fields.add(new LoginRequestField("version", version, null));
        fields.add(new LoginRequestField("platform", "Android", null));
        fields.add(new LoginRequestField("platform_version", Build.VERSION.RELEASE, null));
        fields.add(new LoginRequestField("mac", HashUtils.MD5_Hash("android_id"), null));
        fields.add(new LoginRequestField("user-agent", "Lumiya", null));
        fields.add(new LoginRequestField("id0", authParams.clientID.toString(), null));
        fields.add(new LoginRequestField("agree_to_tos", "true", null));
        fields.add(new LoginRequestField("viewer_digest", "f50cfcc3-d6ce-4f16-a822-b91271de4c48", null));
        String loginURL = authParams.loginURL;
        String methodName = "login_to_simulator";
        SLAuthReply reply = null;
        for (int redirect = 0; redirect < 5; redirect++) {
            StringBuilder request = new StringBuilder();
            request.append("<?xml version=\"1.0\"?>\n");
            request.append("<methodCall>");
            request.append("<methodName>").append(methodName).append("</methodName>");
            request.append("<params>");
            request.append("<param>");
            request.append("<value>");
            request.append("<struct>");
            for (LoginRequestField field : fields) {
                request.append("<member>");
                request.append("<name>");
                request.append(field.name);
                request.append("</name>");
                request.append("<value>");
                request.append("<string>");
                // Escaped (3.4.2 was not): a "uri:Region&x&y&z" start location
                // otherwise makes the XML-RPC request malformed.
                request.append(TextUtils.htmlEncode(field.value));
                request.append("</string>");
                request.append("</value>");
                request.append("</member>");
            }
            // Optional login response sections the viewer wants back.
            request.append("<member>");
            request.append("<name>options</name>");
            request.append("<value>");
            request.append("<array><data>");
            request.append("<value><string>buddy-list</string></value>");
            request.append("<value><string>display_names</string></value>");
            request.append("<value><string>inventory-root</string></value>");
            request.append("<value><string>inventory-lib-root</string></value>");
            request.append("<value><string>max-agent-groups</string></value>");
            request.append("</data></array>");
            request.append("</value>");
            request.append("</member>");
            request.append("</struct>");
            request.append("</value>");
            request.append("</param>");
            request.append("</params>");
            request.append("</methodCall>");
            String requestXML = request.toString();
            Debug.Log("Start location: " + startLocation);
            Response response = SLHTTPSConnection.getOkHttpClient().newCall(new Request.Builder()
                    .url(loginURL)
                    .header("Connection", "close")
                    .post(RequestBody.create(MediaType.parse("text/xml"), requestXML))
                    .header("Content-Type", "text/xml")
                    .build()).execute();
            if (response == null) {
                throw new IOException("Null response");
            }
            try {
                if (!response.isSuccessful()) {
                    throw new IOException("Login error code " + response.code());
                }
                try {
                    XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();
                    parser.setInput(new BufferedInputStream(response.body().byteStream(), 65536), null);
                    reply = new SLAuthReply(authParams.gridName, authParams.loginURL, parser);
                    if (!reply.isIndeterminate || reply.nextMethod == null || reply.nextURL == null) {
                        return reply;
                    }
                    methodName = reply.nextMethod;
                    loginURL = reply.nextURL;
                } catch (XmlPullParserException e) {
                    Debug.Warning(e);
                    throw new IOException("Login reply parse error", e);
                }
            } finally {
                response.close();
            }
        }
        return reply;
    }

    /**
     * Second Life login password: "$1$" + MD5 hex digest, as the viewer sends
     * it (llpanellogin.cpp LLMD5, llsecapi.cpp "$1$" prefix). 3.4.2 first cuts
     * the password to 16 characters, Second Life's historical maximum.
     */
    public static String getPasswordHash(String password) {
        String trimmed = password.trim();
        if (trimmed.length() > 16) {
            trimmed = trimmed.substring(0, 16);
        }
        return "$1$" + HashUtils.MD5_Hash(trimmed);
    }

    public SLAuthReply Login(SLAuthParams authParams) throws IOException {
        try {
            return SendLoginRequest(authParams);
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException("Failed to login to simulator");
        }
    }
}
