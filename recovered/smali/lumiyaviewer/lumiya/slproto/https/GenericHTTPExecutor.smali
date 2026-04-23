.class public Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor$InstanceHolder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 9

    const/4 v2, 0x1

    const-wide/16 v4, 0x3c

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor$1;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor$1;-><init>()V

    const/4 v3, 0x3

    move-object v1, p0

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;->allowCoreThreadTimeOut(Z)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;-><init>()V

    return-void
.end method

.method public static getInstance()Ljava/util/concurrent/ExecutorService;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;

    move-result-object v0

    return-object v0
.end method
