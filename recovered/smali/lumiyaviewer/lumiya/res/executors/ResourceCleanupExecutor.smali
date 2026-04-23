.class public Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;
.super Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor$InstanceHolder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor$1;-><init>()V

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;

    move-result-object v0

    return-object v0
.end method
