.class public Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
        "<TK;>;"
    }
.end annotation


# instance fields
.field private final activeRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/concurrent/Future",
            "<*>;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final baseHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final executor:Ljava/util/concurrent/ExecutorService;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V
    .locals 1
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ExecutorService;",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->activeRequests:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->lock:Ljava/lang/Object;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->executor:Ljava/util/concurrent/ExecutorService;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->baseHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_react_AsyncCancellableRequestHandler_993(Ljava/lang/Object;)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->baseHandler:Lcom/lumiyaviewer/lumiya/react/RequestHandler;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestHandler;->onRequest(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->activeRequests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :catchall_1
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->activeRequests:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    monitor-exit v1

    throw v0

    :catchall_2
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onRequest(Ljava/lang/Object;)V
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/lumiyaviewer/lumiya/react/-$Lambda$W2IjgG3sQFB-K_ukBg8_XysJz_I;

    invoke-direct {v2, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$W2IjgG3sQFB-K_ukBg8_XysJz_I;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->activeRequests:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onRequestCancelled(Ljava/lang/Object;)V
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/AsyncCancellableRequestHandler;->activeRequests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z
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
