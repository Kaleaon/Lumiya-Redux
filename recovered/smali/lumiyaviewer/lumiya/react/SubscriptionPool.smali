.class public Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Unsubscribable;
.implements Lcom/lumiyaviewer/lumiya/react/Refreshable;
.implements Lcom/lumiyaviewer/lumiya/react/ResultHandler;
.implements Lcom/lumiyaviewer/lumiya/react/Subscribable;
.implements Lcom/lumiyaviewer/lumiya/react/RequestSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Unsubscribable",
        "<TK;TT;>;",
        "Lcom/lumiyaviewer/lumiya/react/Refreshable",
        "<TK;>;",
        "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
        "<TK;TT;>;",
        "Lcom/lumiyaviewer/lumiya/react/Subscribable",
        "<TK;TT;>;",
        "Lcom/lumiyaviewer/lumiya/react/RequestSource",
        "<TK;TT;>;"
    }
.end annotation


# instance fields
.field private cacheInvalidateExecutor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private cacheInvalidateHandler:Lcom/lumiyaviewer/lumiya/react/Refreshable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Refreshable",
            "<TK;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private disposeExecutor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private disposeHandler:Lcom/lumiyaviewer/lumiya/react/DisposeHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/DisposeHandler",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final entries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList",
            "<TK;TT;>;>;"
        }
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;

.field private final refQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;>;"
        }
    .end annotation
.end field

.field private requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private requestOnce:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->refQueue:Ljava/lang/ref/ReferenceQueue;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeHandler:Lcom/lumiyaviewer/lumiya/react/DisposeHandler;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeExecutor:Ljava/util/concurrent/Executor;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateExecutor:Ljava/util/concurrent/Executor;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateHandler:Lcom/lumiyaviewer/lumiya/react/Refreshable;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestOnce:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)V"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->refQueue:Ljava/lang/ref/ReferenceQueue;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeHandler:Lcom/lumiyaviewer/lumiya/react/DisposeHandler;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeExecutor:Ljava/util/concurrent/Executor;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateExecutor:Ljava/util/concurrent/Executor;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateHandler:Lcom/lumiyaviewer/lumiya/react/Refreshable;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestOnce:Z

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    return-void
.end method

.method private collectReferences()V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-eqz v0, :cond_3

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string/jumbo v1, "UserPic: collecting reference for %s"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    if-eqz v1, :cond_2

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->removeByReference(Lcom/lumiyaviewer/lumiya/react/Subscription$SubscriptionReference;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v2}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequestCancelled(Ljava/lang/Object;)V

    :cond_1
    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeOldData(Lcom/lumiyaviewer/lumiya/react/SubscriptionList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    const-string/jumbo v0, "UserPic: subscriptions = %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v1

    return-void

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private disposeOldData(Lcom/lumiyaviewer/lumiya/react/SubscriptionList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<TK;TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeHandler:Lcom/lumiyaviewer/lumiya/react/DisposeHandler;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->getData()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeExecutor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/lumiyaviewer/lumiya/react/-$Lambda$FQ4ueWG6sVQMwgP3YGPP2nbRyFo;

    invoke-direct {v2, p0, v0}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$FQ4ueWG6sVQMwgP3YGPP2nbRyFo;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeHandler:Lcom/lumiyaviewer/lumiya/react/DisposeHandler;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/react/DisposeHandler;->onDispose(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)",
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_SubscriptionPool_8106(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeHandler:Lcom/lumiyaviewer/lumiya/react/DisposeHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/DisposeHandler;->onDispose(Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_SubscriptionPool_8749(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateHandler:Lcom/lumiyaviewer/lumiya/react/Refreshable;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Refreshable;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method

.method public onResultData(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TT;)V"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->collectReferences()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->setData(Ljava/lang/Object;)V

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->getSubscriptions(Z)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :goto_0
    monitor-exit v2

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/react/Subscription;->onData(Ljava/lang/Object;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_0
    return-void

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public onResultError(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->collectReferences()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->setError(Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->getSubscriptions(Z)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :goto_0
    monitor-exit v2

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/react/Subscription;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_0
    return-void

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public requestUpdate(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateHandler:Lcom/lumiyaviewer/lumiya/react/Refreshable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/lumiyaviewer/lumiya/react/-$Lambda$FQ4ueWG6sVQMwgP3YGPP2nbRyFo$1;

    invoke-direct {v2, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$FQ4ueWG6sVQMwgP3YGPP2nbRyFo$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    instance-of v2, v2, Lcom/lumiyaviewer/lumiya/react/Refreshable;

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Refreshable;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Refreshable;->requestUpdate(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_1
    monitor-exit v1

    return-void

    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateHandler:Lcom/lumiyaviewer/lumiya/react/Refreshable;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Refreshable;->requestUpdate(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_3
    :try_start_2
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestOnce:Z

    if-eqz v2, :cond_4

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    :cond_4
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public requestUpdateAll()V
    .locals 5

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;

    if-eqz v0, :cond_0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestOnce:Z

    if-eqz v4, :cond_1

    iget-boolean v4, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    xor-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_0

    :cond_1
    const/4 v4, 0x1

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, v3}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2
    monitor-exit v1

    return-void
.end method

.method public requestUpdateSome(Lcom/google/common/base/Predicate;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Predicate",
            "<TK;>;)V"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v2, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;

    if-eqz v0, :cond_4

    invoke-interface {p1, v5}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    iget-boolean v6, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestOnce:Z

    if-eqz v6, :cond_0

    iget-boolean v6, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    xor-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_4

    :cond_0
    const/4 v6, 0x1

    iput-boolean v6, v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    if-nez v1, :cond_3

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    :goto_1
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_2
    move-object v1, v0

    goto :goto_0

    :cond_1
    monitor-exit v3

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V

    goto :goto_3

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_2
    return-void

    :cond_3
    move-object v0, v1

    goto :goto_1

    :cond_4
    move-object v0, v1

    goto :goto_2
.end method

.method public setCacheInvalidateHandler(Lcom/lumiyaviewer/lumiya/react/Refreshable;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 0
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Refreshable",
            "<TK;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<TK;TT;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateHandler:Lcom/lumiyaviewer/lumiya/react/Refreshable;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->cacheInvalidateExecutor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method public setDisposeHandler(Lcom/lumiyaviewer/lumiya/react/DisposeHandler;Ljava/util/concurrent/Executor;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 0
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/DisposeHandler",
            "<TT;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<TK;TT;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeHandler:Lcom/lumiyaviewer/lumiya/react/DisposeHandler;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeExecutor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method public setRequestOnce(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<TK;TT;>;"
        }
    .end annotation

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestOnce:Z

    return-object p0
.end method

.method public subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;)",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribe(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;)",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 8
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
            ")",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;"
        }
    .end annotation

    const/4 v7, 0x1

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->refQueue:Ljava/lang/ref/ReferenceQueue;

    move-object v1, p1

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/react/Subscription;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Unsubscribable;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;Ljava/lang/ref/ReferenceQueue;)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v3

    const/4 v2, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;

    if-nez v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;-><init>(Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v2, v7

    :cond_0
    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->addSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->getError()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/react/Subscription;->onError(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->requested:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v1, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    monitor-exit v3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->collectReferences()V

    return-object v0

    :cond_3
    :try_start_1
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool$SubscriptionRequestedList;->getData()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/react/Subscription;->onData(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0
.end method

.method public unsubscribe(Lcom/lumiyaviewer/lumiya/react/Subscription;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/react/Subscription;->getKey()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->removeSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->entries:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v3, v1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequestCancelled(Ljava/lang/Object;)V

    :cond_0
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->disposeOldData(Lcom/lumiyaviewer/lumiya/react/SubscriptionList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->collectReferences()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public withRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionPool",
            "<TK;TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionPool;->requestHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
