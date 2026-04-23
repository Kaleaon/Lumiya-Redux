.class public Lcom/lumiyaviewer/lumiya/slproto/users/LLSDResponseCacher;
.super Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Key:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher",
        "<TKey;",
        "Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;

    move-result-object v0

    return-object v0
.end method

.method protected loadCached([B)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 2

    :try_start_0
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic loadCached([B)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/LLSDResponseCacher;->loadCached([B)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic requestUpdate(Ljava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method protected storeCached(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)[B
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    :try_start_0
    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->toBinary(Ljava/io/DataOutputStream;)V

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic storeCached(Ljava/lang/Object;)[B
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/LLSDResponseCacher;->storeCached(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)[B

    move-result-object v0

    return-object v0
.end method
