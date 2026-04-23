.class abstract Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Refreshable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<KeyType:",
        "Ljava/lang/Object;",
        "MessageType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Refreshable",
        "<TKeyType;>;"
    }
.end annotation


# instance fields
.field private final cacheExecutor:Ljava/util/concurrent/Executor;

.field private final cachedresponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

.field private final keyPrefix:Ljava/lang/String;

.field private final pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<TKeyType;TMessageType;>;"
        }
    .end annotation
.end field

.field private final requestHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler",
            "<TKeyType;TMessageType;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->cachedresponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->getKeyString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->cacheExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getCachedResponseDao()Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->cachedresponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->keyPrefix:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tb8OaRVtYXRJ6N6ca7skHX1PNws;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/-$Lambda$Tb8OaRVtYXRJ6N6ca7skHX1PNws;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setCacheInvalidateHandler(Lcom/lumiyaviewer/lumiya/react/Refreshable;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v1, p0, v2, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    return-void
.end method

.method private getKeyString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKeyType;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->keyPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<TKeyType;TMessageType;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<TKeyType;TMessageType;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_ResponseCacher_1058(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->cachedresponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->getKeyString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedResponse;->setMustRevalidate(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->cachedresponseDao:Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/CachedResponseDao;->update(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method protected abstract loadCached([B)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TMessageType;"
        }
    .end annotation
.end method

.method public requestUpdate(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKeyType;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method protected abstract storeCached(Ljava/lang/Object;)[B
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)[B"
        }
    .end annotation
.end method
