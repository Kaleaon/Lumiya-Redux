.class public Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;
    }
.end annotation


# instance fields
.field private final usePriorities:Z


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 11

    const/4 v10, 0x1

    const/4 v9, 0x0

    const-wide/16 v4, 0x3c

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;-><init>()V

    new-instance v8, Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0;

    invoke-direct {v8, p1}, Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0;-><init>(Ljava/lang/Object;)V

    move-object v1, p0

    move v2, p2

    move v3, p2

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-boolean v9, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->usePriorities:Z

    const-string/jumbo v0, "Executor for %s: maxThreads %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v9

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v10

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, v10}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->allowCoreThreadTimeOut(Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/util/concurrent/BlockingQueue;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    const/4 v9, 0x1

    const-wide/16 v4, 0x3c

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0$1;

    invoke-direct {v8, p1}, Lcom/lumiyaviewer/lumiya/res/executors/-$Lambda$paN_qX4OegT79dFg6kmGbliJfA0$1;-><init>(Ljava/lang/Object;)V

    move-object v1, p0

    move v2, p2

    move v3, p2

    move-object v7, p3

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-boolean v9, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->usePriorities:Z

    const-string/jumbo v0, "Executor for %s: maxThreads %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v9

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, v9}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->allowCoreThreadTimeOut(Z)V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_res_executors_WeakExecutor_1106(Ljava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 6

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const-string/jumbo v1, "Creating thread %s got %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    return-object v0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_res_executors_WeakExecutor_531(Ljava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 6

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const-string/jumbo v1, "Creating thread %s got %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    return-object v0
.end method


# virtual methods
.method protected newTaskFor(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/RunnableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "TT;)",
            "Ljava/util/concurrent/RunnableFuture",
            "<TT;>;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->usePriorities:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;

    invoke-direct {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    return-object v0

    :cond_0
    invoke-super {p0, p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->newTaskFor(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/RunnableFuture;

    move-result-object v0

    return-object v0
.end method

.method protected newTaskFor(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/RunnableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)",
            "Ljava/util/concurrent/RunnableFuture",
            "<TT;>;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;->usePriorities:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor$ComparableFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    return-object v0

    :cond_0
    invoke-super {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->newTaskFor(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/RunnableFuture;

    move-result-object v0

    return-object v0
.end method
