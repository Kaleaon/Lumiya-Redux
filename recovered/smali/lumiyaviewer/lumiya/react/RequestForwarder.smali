.class public abstract Lcom/lumiyaviewer/lumiya/react/RequestForwarder;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Kup:",
        "Ljava/lang/Object;",
        "Tup:",
        "Ljava/lang/Object;",
        "Kdown:",
        "Ljava/lang/Object;",
        "Tdown:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
        "<TKup;>;"
    }
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;

.field private final resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TKup;TTup;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final subscribable:Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<TKdown;TTdown;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final subscriptions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TKup;",
            "Lcom/lumiyaviewer/lumiya/react/RequestForwarder",
            "<TKup;TTup;TKdown;TTdown;>.DownstreamSubscription;>;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Ljava/util/concurrent/Executor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;)Lcom/lumiyaviewer/lumiya/react/Subscribable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->subscribable:Lcom/lumiyaviewer/lumiya/react/Subscribable;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->processResultInternal(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/react/RequestSource;Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Subscribable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestSource",
            "<TKup;TTup;>;",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<TKdown;TTdown;>;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->subscriptions:Ljava/util/Map;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->executor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->subscribable:Lcom/lumiyaviewer/lumiya/react/Subscribable;

    invoke-interface {p1, p0}, Lcom/lumiyaviewer/lumiya/react/RequestSource;->attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    return-void
.end method

.method private processRequestInternal(Ljava/lang/Object;)V
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKup;)V"
        }
    .end annotation

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->getDownstreamKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;-><init>(Lcom/lumiyaviewer/lumiya/react/RequestForwarder;Ljava/lang/Object;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->subscriptions:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->unsubscribe()V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private processResultInternal(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKup;TTdown;)V"
        }
    .end annotation

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->processResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->resultHandler:Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    invoke-interface {v1, p1, v0}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected abstract getDownstreamKey(Ljava/lang/Object;)Ljava/lang/Object;
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKup;)TKdown;"
        }
    .end annotation
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_RequestForwarder_2672(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->processRequestInternal(Ljava/lang/Object;)V

    return-void
.end method

.method public onRequest(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKup;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->executor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/lumiyaviewer/lumiya/react/-$Lambda$swF2K5wPKI2_xA-bWP-XwHVnywU$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$swF2K5wPKI2_xA-bWP-XwHVnywU$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->processRequestInternal(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onRequestCancelled(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TKup;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder;->subscriptions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/RequestForwarder$DownstreamSubscription;->unsubscribe()V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected abstract processResult(Ljava/lang/Object;)Ljava/lang/Object;
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTdown;)TTup;"
        }
    .end annotation
.end method
