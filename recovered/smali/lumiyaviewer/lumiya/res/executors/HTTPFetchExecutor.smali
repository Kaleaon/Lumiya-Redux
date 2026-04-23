.class public Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;
.super Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor$InstanceHolder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 3

    const-string/jumbo v0, "ResourceHTTPFetch"

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getMaxTextureDownloads()I

    move-result v1

    new-instance v2, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;-><init>(Ljava/lang/String;ILjava/util/concurrent/BlockingQueue;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;

    move-result-object v0

    return-object v0
.end method
