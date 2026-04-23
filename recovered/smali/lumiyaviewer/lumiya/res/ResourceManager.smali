.class public abstract Lcom/lumiyaviewer/lumiya/res/ResourceManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;,
        Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;,
        Lcom/lumiyaviewer/lumiya/res/ResourceManager$3;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ResourceParams:",
        "Ljava/lang/Object;",
        "ResourceType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final cancelledRequests:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;>;"
        }
    .end annotation
.end field

.field private final cleanup:Ljava/lang/Runnable;

.field private volatile cleanupFuture:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private final consumerMap:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;>;"
        }
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;

.field private final removalListener:Lcom/google/common/cache/RemovalListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/RemovalListener",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;>;"
        }
    .end annotation
.end field

.field private final requestMap:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Ljava/util/Queue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cancelledRequests:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/google/common/cache/LoadingCache;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->requestMap:Lcom/google/common/cache/LoadingCache;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->lock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanupFuture:Ljava/util/concurrent/ScheduledFuture;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cancelledRequests:Ljava/util/Queue;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager$1;-><init>(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->removalListener:Lcom/google/common/cache/RemovalListener;

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakKeys()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->removalListener:Lcom/google/common/cache/RemovalListener;

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->removalListener(Lcom/google/common/cache/RemovalListener;)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->build()Lcom/google/common/cache/Cache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->consumerMap:Lcom/google/common/cache/Cache;

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakValues()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;-><init>(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->requestMap:Lcom/google/common/cache/LoadingCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager$3;-><init>(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanup:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->consumerMap:Lcom/google/common/cache/Cache;

    invoke-interface {v0, p1}, Lcom/google/common/cache/Cache;->invalidate(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->collectReferences()V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public CompleteRequest(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;TResourceType;",
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ">;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->requestMap:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v0, p1}, Lcom/google/common/cache/LoadingCache;->invalidate(Ljava/lang/Object;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p3}, Ljava/util/Set;->size()I

    move-result v0

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;

    if-eqz v0, :cond_0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->consumerMap:Lcom/google/common/cache/Cache;

    invoke-interface {v4, v0}, Lcom/google/common/cache/Cache;->invalidate(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    monitor-exit v1

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;

    const/4 v3, 0x0

    invoke-interface {v0, p2, v3}, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;->OnResourceReady(Ljava/lang/Object;Z)V

    goto :goto_1

    :cond_2
    invoke-interface {v2}, Ljava/util/List;->clear()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->collectReferences()V

    return-void
.end method

.method protected abstract CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation
.end method

.method public IntermediateResult(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;TResourceType;",
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ">;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p3}, Ljava/util/Set;->size()I

    move-result v0

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;

    if-eqz v0, :cond_0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    monitor-exit v1

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;

    const/4 v3, 0x1

    invoke-interface {v0, p2, v3}, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;->OnResourceReady(Ljava/lang/Object;Z)V

    goto :goto_1

    :cond_2
    invoke-interface {v2}, Ljava/util/List;->clear()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->collectReferences()V

    return-void
.end method

.method public RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ")V"
        }
    .end annotation

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->lock:Ljava/lang/Object;

    monitor-enter v10

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->requestMap:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v2, p1}, Lcom/google/common/cache/LoadingCache;->getUnchecked(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-object v9, v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->consumerMap:Lcom/google/common/cache/Cache;

    invoke-interface {v2, p2, v9}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v9, p2}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->addConsumer(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->willStart()Z

    move-result v11

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanupFuture:Ljava/util/concurrent/ScheduledFuture;

    if-nez v2, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanup:Ljava/lang/Runnable;

    const-wide/16 v4, 0x1

    const-wide/16 v6, 0x1

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v2 .. v8}, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v2

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanupFuture:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v10

    if-eqz v11, :cond_1

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->execute()V

    :cond_1
    return-void

    :catchall_0
    move-exception v2

    monitor-exit v10

    throw v2
.end method

.method protected collectReferences()V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->lock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->requestMap:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v0}, Lcom/google/common/cache/LoadingCache;->cleanUp()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->consumerMap:Lcom/google/common/cache/Cache;

    invoke-interface {v0}, Lcom/google/common/cache/Cache;->cleanUp()V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cancelledRequests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->requestMap:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v0}, Lcom/google/common/cache/LoadingCache;->size()J

    move-result-wide v4

    cmp-long v0, v4, v6

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->consumerMap:Lcom/google/common/cache/Cache;

    invoke-interface {v0}, Lcom/google/common/cache/Cache;->size()J

    move-result-wide v4

    cmp-long v0, v4, v6

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cancelledRequests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanupFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanupFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->cleanupFuture:Ljava/util/concurrent/ScheduledFuture;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    monitor-exit v2

    if-eqz v1, :cond_5

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    goto :goto_1

    :cond_4
    invoke-interface {v1}, Ljava/util/List;->clear()V

    :cond_5
    return-void
.end method
