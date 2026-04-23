.class public Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;,
        Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;
    }
.end annotation


# instance fields
.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final notEmpty:Ljava/util/concurrent/locks/Condition;

.field private final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final runOnceRunnables:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final thread:Ljava/lang/Thread;

.field private final worker:Ljava/lang/Runnable;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Lock;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/concurrent/locks/Condition;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->notEmpty:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/Queue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->queue:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)Ljava/util/Set;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->runOnceRunnables:Ljava/util/Set;

    return-object v0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->queue:Ljava/util/Queue;

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->notEmpty:Ljava/util/concurrent/locks/Condition;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->runOnceRunnables:Ljava/util/Set;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$1;-><init>(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->worker:Ljava/lang/Runnable;

    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->worker:Ljava/lang/Runnable;

    invoke-direct {v0, v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->thread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 4
    .param p1    # Ljava/lang/Runnable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->thread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catch_0
    move-exception v0

    :try_start_3
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :cond_0
    :try_start_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;->notEmpty:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public getRunOnceExecutor()Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;-><init>(Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor;Lcom/lumiyaviewer/lumiya/react/OpportunisticExecutor$RunOnceExecutor;)V

    return-object v0
.end method
