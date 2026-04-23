.class public Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;
.super Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Key:",
        "Ljava/lang/Object;",
        "MessageType::",
        "Ljava/io/Serializable;",
        ">",
        "Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher",
        "<TKey;TMessageType;>;"
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

.method protected loadCached([B)Ljava/io/Serializable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TMessageType;"
        }
    .end annotation

    const/4 v2, 0x0

    :try_start_0
    new-instance v0, Ljava/io/ObjectInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    return-object v2

    :catch_1
    move-exception v0

    return-object v2

    :catch_2
    move-exception v0

    return-object v2
.end method

.method protected bridge synthetic loadCached([B)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;->loadCached([B)Ljava/io/Serializable;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic requestUpdate(Ljava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method protected storeCached(Ljava/io/Serializable;)[B
    .locals 2
    .param p1    # Ljava/io/Serializable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)[B"
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->flush()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic storeCached(Ljava/lang/Object;)[B
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/io/Serializable;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;->storeCached(Ljava/io/Serializable;)[B

    move-result-object v0

    return-object v0
.end method
