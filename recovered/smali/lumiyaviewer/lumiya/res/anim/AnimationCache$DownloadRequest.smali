.class Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Ljava/util/UUID;",
        "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;"
    }
.end annotation


# instance fields
.field private assetSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->assetSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public completeRequest(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->assetSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->completeRequest(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic completeRequest(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->completeRequest(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V

    return-void
.end method

.method public execute()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;->-get0(Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    const/16 v2, 0x14

    invoke-static {v3, v3, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;->createAssetKey(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;I)Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetKey;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v2

    invoke-interface {v1, v0, v2, p0, p0}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->assetSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->completeRequest(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V

    goto :goto_0
.end method

.method public onData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)V
    .locals 4

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getData()[B

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getStatus()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->getData()[B

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    :try_start_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-direct {v1, v0, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;-><init>(Ljava/util/UUID;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->completeRequest(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V

    :goto_1
    return-void

    :catch_0
    move-exception v0

    move-object v1, v2

    :goto_2
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->completeRequest(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_2
.end method

.method public bridge synthetic onData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->onData(Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;)V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/anim/AnimationCache$DownloadRequest;->completeRequest(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;)V

    return-void
.end method
