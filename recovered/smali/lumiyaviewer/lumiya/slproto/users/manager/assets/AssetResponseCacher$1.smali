.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;
.super Lcom/lumiyaviewer/lumiya/react/RequestProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;-><init>(Lcom/lumiyaviewer/lumiya/dao/DaoSession;Ljava/util/concurrent/Executor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/RequestProcessor",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/RequestProcessor;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method protected isRequestComplete(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)Z
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->getMustRevalidate()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic isRequestComplete(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    check-cast p2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;->isRequestComplete(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)Z

    move-result v0

    return v0
.end method

.method protected processRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->getStatus()I

    move-result v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->getData()[B

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;-><init>(I[B)V

    const-string/jumbo v0, "AssetCache: returning cached response for key %s"

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_0
    const-string/jumbo v0, "AssetCache: no cached data for key %s"

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p1, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2
.end method

.method protected bridge synthetic processRequest(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;->processRequest(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    move-result-object v0

    return-object v0
.end method

.method protected processResult(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v5, 0x0

    const-string/jumbo v0, "AssetCache: saving cached data for key %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;)Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getStatus()I

    move-result v3

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getData()[B

    move-result-object v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;-><init>(Ljava/lang/String;I[BZ)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/dao/CachedAssetDao;->insertOrReplace(Ljava/lang/Object;)J

    :cond_0
    return-object p2
.end method

.method protected bridge synthetic processResult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    check-cast p2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher$1;->processResult(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    move-result-object v0

    return-object v0
.end method
