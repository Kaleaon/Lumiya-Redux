.class public Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$1;,
        Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$2;,
        Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$CharsetStripInterceptor;,
        Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$DNSforDNS;,
        Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$SLDNS;
    }
.end annotation


# static fields
.field private static final CONNECT_TIMEOUT:J = 0x3cL

.field private static final READ_TIMEOUT:J = 0x3cL

.field private static final okHttpClient:Lokhttp3/OkHttpClient;

.field private static trustAllCerts:[Ljavax/net/ssl/TrustManager;

.field private static final trustEverythingManager:Ljavax/net/ssl/X509TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const-wide/16 v6, 0x3c

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->trustEverythingManager:Ljavax/net/ssl/X509TrustManager;

    const/4 v0, 0x1

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->trustEverythingManager:Ljavax/net/ssl/X509TrustManager;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->trustAllCerts:[Ljavax/net/ssl/TrustManager;

    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    sget-object v1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->proxy(Ljava/net/Proxy;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$SLDNS;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$SLDNS;-><init>()V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->dns(Lokhttp3/Dns;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v1, Lokhttp3/ConnectionPool;

    const-wide/16 v2, 0x5

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const/16 v5, 0x8

    invoke-direct {v1, v5, v2, v3, v4}, Lokhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->connectionPool(Lokhttp3/ConnectionPool;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v6, v7, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v6, v7, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$2;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$2;-><init>()V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$CharsetStripInterceptor;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection$CharsetStripInterceptor;-><init>()V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->trustEverythingManager:Ljavax/net/ssl/X509TrustManager;

    invoke-virtual {v0, v1, v2}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->okHttpClient:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOkHttpClient()Lokhttp3/OkHttpClient;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->okHttpClient:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method private static getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 5

    const/4 v4, 0x0

    :try_start_0
    const-string/jumbo v0, "TLS"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->trustAllCerts:[Ljavax/net/ssl/TrustManager;

    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    return-object v4
.end method
