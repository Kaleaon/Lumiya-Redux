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

        private LoginRequestField(String str, String str2) {
            this.name = str;
            this.value = str2;
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
    private SLAuthReply SendLoginRequest(SLAuthParams sLAuthParams) throws IOException {
        String str = "last";
        LoginRequestField loginRequestField = null;
        String str2 = sLAuthParams.passwordHash;
        if (sLAuthParams.startLocation != null && sLAuthParams.startLocation.equals("first")) {
            str = "home";
        } else if (sLAuthParams.startLocation != null && sLAuthParams.startLocation.startsWith("uri:")) {
            str = sLAuthParams.startLocation;
        }
        LinkedList<LoginRequestField> linkedList = new LinkedList();
        String strTrim = sLAuthParams.loginName.trim();
        int length = strTrim.length();
        for (int i = 0; i < " ._".length(); i++) {
            int iIndexOf = strTrim.indexOf(" ._".substring(i, i + 1));
            if (iIndexOf != -1 && iIndexOf < length) {
                length = iIndexOf;
            }
        }
        String strSubstring = strTrim.substring(0, length);
        String strSubstring2 = length < strTrim.length() ? strTrim.substring(length + 1) : "";
        String strTrim2 = strSubstring.trim();
        String strTrim3 = strSubstring2.trim();
        if (strTrim3.equalsIgnoreCase("")) {
            strTrim3 = "Resident";
        }
        linkedList.add(new LoginRequestField("first", strTrim2, loginRequestField));
        linkedList.add(new LoginRequestField("last", strTrim3, loginRequestField));
        linkedList.add(new LoginRequestField("passwd", str2, loginRequestField));
        linkedList.add(new LoginRequestField("start", str, loginRequestField));
        String str3 = "Lumiya " + (Debug.isDebugBuild() ? "Test" : "Release");
        String appVersion = LumiyaApp.getAppVersion();
        for (int iCountOccurrences = StringUtils.countOccurrences(appVersion, '.'); iCountOccurrences < 3; iCountOccurrences++) {
            appVersion = appVersion + ".0";
        }
        Debug.Printf("Auth: viewer channel '%s', version '%s'", str3, appVersion);
        linkedList.add(new LoginRequestField("channel", str3, loginRequestField));
        linkedList.add(new LoginRequestField("version", appVersion, loginRequestField));
        linkedList.add(new LoginRequestField("platform", "Android", loginRequestField));
        linkedList.add(new LoginRequestField("platform_version", Build.VERSION.RELEASE, loginRequestField));
        linkedList.add(new LoginRequestField("mac", HashUtils.MD5_Hash("android_id"), loginRequestField));
        linkedList.add(new LoginRequestField("user-agent", "Lumiya", loginRequestField));
        linkedList.add(new LoginRequestField("id0", sLAuthParams.clientID.toString(), loginRequestField));
        linkedList.add(new LoginRequestField("agree_to_tos", "true", loginRequestField));
        linkedList.add(new LoginRequestField("viewer_digest", "f50cfcc3-d6ce-4f16-a822-b91271de4c48", loginRequestField));
        String str4 = sLAuthParams.loginURL;
        String str5 = "login_to_simulator";
        SLAuthReply sLAuthReply = null;
        for (int i2 = 0; i2 < 5; i2++) {
            StringBuilder sb = new StringBuilder();
            sb.append("<?xml version=\"1.0\"?>\n");
            sb.append("<methodCall>");
            sb.append("<methodName>").append(str5).append("</methodName>");
            sb.append("<params>");
            sb.append("<param>");
            sb.append("<value>");
            sb.append("<struct>");
            for (LoginRequestField loginRequestField2 : linkedList) {
                sb.append("<member>");
                sb.append("<name>");
                sb.append(loginRequestField2.name);
                sb.append("</name>");
                sb.append("<value>");
                sb.append("<string>");
                sb.append(TextUtils.htmlEncode(loginRequestField2.value));
                sb.append("</string>");
                sb.append("</value>");
                sb.append("</member>");
            }
            sb.append("<member>");
            sb.append("<name>options</name>");
            sb.append("<value>");
            sb.append("<array><data>");
            sb.append("<value><string>buddy-list</string></value>");
            sb.append("<value><string>display_names</string></value>");
            sb.append("<value><string>inventory-root</string></value>");
            sb.append("<value><string>inventory-lib-root</string></value>");
            sb.append("<value><string>max-agent-groups</string></value>");
            sb.append("</data></array>");
            sb.append("</value>");
            sb.append("</member>");
            sb.append("</struct>");
            sb.append("</value>");
            sb.append("</param>");
            sb.append("</params>");
            sb.append("</methodCall>");
            String string = sb.toString();
            Debug.Log("Start location: " + str);
            Response responseExecute = SLHTTPSConnection.getOkHttpClient().newCall(new Request.Builder().url(str4).header(HttpHeaders.CONNECTION, "close").post(RequestBody.create(MediaType.parse("text/xml"), string)).header(HttpHeaders.CONTENT_TYPE, "text/xml").build()).execute();
            try {
                if (!responseExecute.isSuccessful()) {
                    throw new IOException("Login error code " + responseExecute.code());
                }
                try {
                    XmlPullParser xmlPullParserNewPullParser = XmlPullParserFactory.newInstance().newPullParser();
                    if (responseExecute.body() == null) {
                        throw new IOException("Empty login response");
                    }
                    xmlPullParserNewPullParser.setInput(new BufferedInputStream(responseExecute.body().byteStream(), 65536), null);
                    sLAuthReply = new SLAuthReply(sLAuthParams.gridName, sLAuthParams.loginURL, xmlPullParserNewPullParser);
                    if (!sLAuthReply.isIndeterminate || sLAuthReply.nextMethod == null || sLAuthReply.nextURL == null) {
                        return sLAuthReply;
                    }
                    str5 = sLAuthReply.nextMethod;
                    str4 = sLAuthReply.nextURL;
                    responseExecute.close();
                } catch (XmlPullParserException e) {
                    Debug.Warning(e);
                    throw new IOException("Login reply parse error", e);
                }
            } finally {
                responseExecute.close();
            }
        }
        return sLAuthReply;
    }

    public static String getPasswordHash(String str) {
        String trim = str.trim();
        if (trim.length() > 16) {
            trim = trim.substring(0, 16);
        }
        return "$1$" + HashUtils.MD5_Hash(trim);
    }

    public SLAuthReply Login(SLAuthParams sLAuthParams) throws IOException {
        try {
            return SendLoginRequest(sLAuthParams);
        } catch (Exception e) {
            throw new IOException("Failed to login to simulator", e);
        }
    }
}
