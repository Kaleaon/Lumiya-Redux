package com.lumiyaviewer.lumiya.slproto.https

import com.google.common.net.HttpHeaders
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import com.google.gson.JsonParser
import com.lumiyaviewer.lumiya.Debug
import java.io.IOException
import java.net.InetAddress
import java.net.Proxy
import java.net.UnknownHostException
import java.util.ArrayList
import java.util.List
import java.util.concurrent.TimeUnit
import javax.net.ssl.SSLContext
import javax.net.ssl.SSLSocketFactory
import javax.net.ssl.TrustManager
import javax.net.ssl.X509ExtendedTrustManager
import okhttp3.ConnectionPool
import okhttp3.Dns
import okhttp3.HttpUrl
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response

open class SLHTTPSConnection {
    @JvmStatic private var CONNECT_TIMEOUT: Long = 60
    @JvmStatic private var READ_TIMEOUT: Long = 60
    // 3.4.2 installed a trust-everything X509TrustManager and a hostname
    // verifier that returned true, so any on-path attacker could read the
    // login password hash and session. Certificates are verified now; see
    // TlsPolicy for the per-grid exception for self-signed OpenSim grids.
    @JvmStatic private var trustManager: X509ExtendedTrustManager = TlsPolicy.createTrustManager()
    @JvmStatic private var okHttpClient: OkHttpClient = OkHttpClient.Builder().proxy(Proxy.NO_PROXY).dns(SLDNS()).connectionPool(ConnectionPool(8, 5, TimeUnit.MINUTES)).connectTimeout(60, TimeUnit.SECONDS).readTimeout(60, TimeUnit.SECONDS).hostnameVerifier(TlsPolicy.createHostnameVerifier()).addNetworkInterceptor(CharsetStripInterceptor()).sslSocketFactory(getSocketFactory(), trustManager).build()

    open class CharsetStripInterceptor : Interceptor {
        CharsetStripInterceptor() {
        }
        public Response intercept(Interceptor.Chain chain) throws IOException {
            var request: Request = chain.request()
            var header: String = request.header(HttpHeaders.CONTENT_TYPE)
            if (header == null || (!header.contains(";"))) {
                return chain.proceed(request)
            }
            var indexOf: Int = header.indexOf(";")
            if (indexOf != -1) {
                header = header.substring(0, indexOf)
            }
            return chain.proceed(request.newBuilder().header(HttpHeaders.CONTENT_TYPE, header).build())
        }
    }

    open class DNSforDNS : Dns {
        private Dns systemDns = Dns.SYSTEM

        DNSforDNS() {
        }
        public List<InetAddress> lookup(String str) throws UnknownHostException {
            try {
                var lookup: MutableList<InetAddress> = this.systemDns.lookup(str)
                if (lookup == null) {
                    throw UnknownHostException(str)
                }
                if (lookup.isEmpty()) {
                    throw UnknownHostException(str)
                }
        return lookup
            } catch (e: UnknownHostException) {
                if (!str.equalsIgnoreCase("dns.google.com")) {
                    var e: throw? = null
                }
                Debug.Printf("DNS: Falling back to static IP addresses for %s", str)
                var arrayList: ArrayList = ArrayList()
                arrayList.add(InetAddress.getByName("64.233.164.101"))
                arrayList.add(InetAddress.getByName("64.233.164.113"))
                arrayList.add(InetAddress.getByName("64.233.164.139"))
                arrayList.add(InetAddress.getByName("64.233.164.138"))
                arrayList.add(InetAddress.getByName("64.233.164.100"))
                arrayList.add(InetAddress.getByName("64.233.164.102"))
        return arrayList
            }
        }
    }

    open class SLDNS : Dns {
        private Dns systemDns = Dns.SYSTEM
        private OkHttpClient httpResolverClient = OkHttpClient.Builder().dns(DNSforDNS()).connectTimeout(60, TimeUnit.SECONDS).readTimeout(60, TimeUnit.SECONDS).build()

        SLDNS() {
        }

        private List<InetAddress> tryResolveOverHTTP(String str) throws UnknownHostException {
            Debug.Printf("DNS: Trying to resolve over HTTPS: hostname = %s", str)
            try {
                var execute: Response = this.httpResolverClient.newCall(Request.Builder().url(HttpUrl.Builder().scheme("https").host("dns.google.com").addPathSegment("resolve").addQueryParameter("name", str).addQueryParameter("type", "A").build()).get().build()).execute()
                if (execute == null) {
                    throw UnknownHostException(str)
                }
                if (!execute.isSuccessful()) {
                    Debug.Printf("DNS: Failed to resolve over HTTPS: error code %d, error message %s", execute.code(), execute.message())
                    throw UnknownHostException(str)
                }
                var asJsonObject: JsonObject = JsonParser().parse(execute.body().string()).getAsJsonObject()
                var arrayList: ArrayList = ArrayList()
                for (jsonElement in asJsonObject.getAsJsonArray("Answer")) {
                    if (jsonElement.isJsonObject()) {
                        var asJsonObject2: JsonObject = jsonElement.getAsJsonObject()
                        if (asJsonObject2.has("name") && asJsonObject2.has("type") && asJsonObject2.has("data")) {
                            var asString: String = asJsonObject2.get("name").getAsString()
                            var asInt: Int = asJsonObject2.get("type").getAsInt()
                            var asString2: String = asJsonObject2.get("data").getAsString()
                            if (asString.equalsIgnoreCase(str + ".") && asInt == 1 && asString2 != null && (!asString2.isEmpty())) {
                                Debug.Printf("DNS: Resolving '%s': found good result '%s'", str, asString2)
                                var byName: InetAddress = InetAddress.getByName(asString2)
                                if (byName != null) {
                                    arrayList.add(byName)
                                }
                            }
                        }
                    }
                }
                if (!arrayList.isEmpty()) {
        return arrayList
                }
                Debug.Printf("DNS: Failed to resolve over HTTPS: hostname = %s, no valid answers", str)
                throw UnknownHostException(str)
            } catch (e: Exception) {
                Debug.Printf("DNS: Failed to resolve over HTTPS: hostname = %s, error = %s", str, e.getMessage())
                throw UnknownHostException(str)
            }
        }
        public List<InetAddress> lookup(String str) throws UnknownHostException {
            try {
                var lookup: MutableList<InetAddress> = this.systemDns.lookup(str)
                if (lookup == null) {
                    throw UnknownHostException(str)
                }
                if (lookup.isEmpty()) {
                    throw UnknownHostException(str)
                }
        return lookup
            } catch (e: UnknownHostException) {
                try {
                    var tryResolveOverHTTP: MutableList<InetAddress> = tryResolveOverHTTP(str)
                    if (tryResolveOverHTTP == null) {
                        throw UnknownHostException(str)
                    }
                    if (tryResolveOverHTTP.isEmpty()) {
                        throw UnknownHostException(str)
                    }
        return tryResolveOverHTTP
                } catch (e2: UnknownHostException) {
                    if (!str.equalsIgnoreCase("login.agni.lindenlab.com")) {
                        var e2: throw? = null
                    }
                    Debug.Printf("DNS: Falling back to static address for %s", str)
                    var arrayList: ArrayList = ArrayList()
                    arrayList.add(InetAddress.getByName("216.82.57.58"))
        return arrayList
                }
            }
        }
    }

    fun getOkHttpClient(): OkHttpClient {
        return okHttpClient
    }

    private fun getSocketFactory(): SSLSocketFactory {
        try {
            var sslContext: SSLContext = SSLContext.getInstance("TLS")
            sslContext.init(null, arrayOf(trustManager), null)
            return sslContext.getSocketFactory()
        } catch (e: Exception) {
            // No fallback to an unverified factory: fail loudly instead.
            throw IllegalStateException("Cannot initialise TLS", e)
        }
    }
}
