.class public Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;
.super Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor$InstanceHolder;
    }
.end annotation


# instance fields
.field private isPaused:Z

.field private pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private unpaused:Ljava/util/concurrent/locks/Condition;


# direct methods
.method private constructor <init>()V
    .locals 2

    const-string/jumbo v0, "PrimCompute"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;-><init>(Ljava/lang/String;I)V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->unpaused:Ljava/util/concurrent/locks/Condition;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->isPaused:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :goto_1
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_1

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public pause()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->isPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public resume()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->isPaused:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method
