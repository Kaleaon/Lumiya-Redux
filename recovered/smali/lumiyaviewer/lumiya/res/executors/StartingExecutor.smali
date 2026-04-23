.class public Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;
.super Ljava/lang/Object;


# instance fields
.field private final activeRequests:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/executors/Startable;",
            ">;"
        }
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;

.field private maxConcurrentRequests:I

.field private volatile paused:Z

.field private final waitingRequests:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/executors/Startable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->waitingRequests:Ljava/util/Queue;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->activeRequests:Ljava/util/Set;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->lock:Ljava/lang/Object;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->maxConcurrentRequests:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->paused:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->maxConcurrentRequests:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->waitingRequests:Ljava/util/Queue;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->activeRequests:Ljava/util/Set;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->lock:Ljava/lang/Object;

    const/4 v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->maxConcurrentRequests:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->paused:Z

    iput p1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->maxConcurrentRequests:I

    return-void
.end method

.method private runQueue()V
    .locals 3

    :goto_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->paused:Z

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->activeRequests:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->maxConcurrentRequests:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v0, v2, :cond_2

    :cond_0
    monitor-exit v1

    :cond_1
    return-void

    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->waitingRequests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/executors/Startable;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->activeRequests:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/res/executors/Startable;->start()V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public cancelRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->waitingRequests:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->activeRequests:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->runQueue()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public completeRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->activeRequests:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->runQueue()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public pause()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->paused:Z

    return-void
.end method

.method public queueRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->waitingRequests:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->runQueue()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setMaxConcurrentTasks(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->maxConcurrentRequests:I

    return-void
.end method

.method public unpause()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->paused:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->runQueue()V

    return-void
.end method
