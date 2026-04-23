.class public Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;
.super Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Key:",
        "Ljava/lang/Object;",
        "MessageType:",
        "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;",
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

.method protected loadCached([B)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TMessageType;"
        }
    .end annotation

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->DecodeMessageIDGeneric(Ljava/nio/ByteBuffer;)I

    move-result v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageFactory;->CreateByID(I)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->UnpackPayload(Ljava/nio/ByteBuffer;)V

    return-object v2

    :cond_0
    const-string/jumbo v0, "Failed to create message for id 0x%x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v3, 0x0

    aput-object v1, v2, v3

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v4
.end method

.method protected bridge synthetic loadCached([B)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->loadCached([B)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic requestUpdate(Ljava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method protected storeCached(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)[B
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)[B"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->CalcPayloadSize()I

    move-result v0

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->PackPayload(Ljava/nio/ByteBuffer;)V

    return-object v0
.end method

.method protected bridge synthetic storeCached(Ljava/lang/Object;)[B
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->storeCached(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)[B

    move-result-object v0

    return-object v0
.end method
