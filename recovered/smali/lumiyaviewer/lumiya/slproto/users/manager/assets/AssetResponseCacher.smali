.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Refreshable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Refreshable",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
        ">;"
    }
.end annotation


# instance fields
.field private final cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

.field private final pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation
.end field

.field private final requestHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getCachedAssetDao()Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/-$Lambda$9LOU8pkPwNY-FJNwesblYMTVNE0;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/-$Lambda$9LOU8pkPwNY-FJNwesblYMTVNE0;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->setCacheInvalidateHandler(Lcom/lumiyaviewer/lumiya/react/Refreshable;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-direct {v1, p0, v2, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    return-void
.end method


# virtual methods
.method public getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    return-object v0
.end method

.method public getRequestSource()Lcom/lumiyaviewer/lumiya/react/RequestSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RateLimitRequestHandler;

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_assets_AssetResponseCacher_872(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->setMustRevalidate(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->cachedAssetDao:Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;->update(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public requestUpdate(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->pool:Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic requestUpdate(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->requestUpdate(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)V

    return-void
.end method
