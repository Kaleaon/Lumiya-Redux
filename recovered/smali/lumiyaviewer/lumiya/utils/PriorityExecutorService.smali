.class public Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ComparePriority;,
        Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;,
        Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;
    }
.end annotation


# instance fields
.field private exe:Ljava/util/concurrent/ThreadPoolExecutor;

.field private queue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;IILcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;)V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-direct {v0, p3}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->queue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;

    const-wide/16 v4, 0xa

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->queue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    move-object v1, p1

    move v2, p2

    move v3, p2

    move-object v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ExecutorWithListener;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$OnExecutionCompleteListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method


# virtual methods
.method public cancel(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->queue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getNumThreads()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getCorePoolSize()I

    move-result v0

    return v0
.end method

.method public getNumWaitingTasks()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isShutdown()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    move-result v0

    return v0
.end method

.method public setNumThreads(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getCorePoolSize()I

    move-result v0

    if-eq p1, v0, :cond_0

    if-lez p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->setCorePoolSize(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->setMaximumPoolSize(I)V

    :cond_0
    return-void
.end method

.method public shutdownNow()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->exe:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    return-void
.end method

.method public updatePriority(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;->queue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;->updatePriority(Ljava/lang/Object;)V

    return-void
.end method
