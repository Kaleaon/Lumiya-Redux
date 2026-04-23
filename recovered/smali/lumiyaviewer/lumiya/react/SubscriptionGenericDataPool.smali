.class public abstract Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscribable;
.implements Lcom/lumiyaviewer/lumiya/react/Unsubscribable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/react/Subscribable",
        "<TK;TT;>;",
        "Lcom/lumiyaviewer/lumiya/react/Unsubscribable",
        "<TK;TT;>;"
    }
.end annotation


# instance fields
.field private canContainNulls:Z

.field private final lock:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->lock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->canContainNulls:Z

    return-void
.end method

.method private invokeSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;TT;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    if-eqz p3, :cond_1

    invoke-virtual {p1, p3}, Lcom/lumiyaviewer/lumiya/react/Subscription;->onError(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p2, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->canContainNulls:Z

    if-eqz v0, :cond_0

    :cond_2
    invoke-virtual {p1, p2}, Lcom/lumiyaviewer/lumiya/react/Subscription;->onData(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected abstract getExistingSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<TK;TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method protected abstract getSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionList",
            "<TK;TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public setCanContainNulls(Z)Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool",
            "<TK;TT;>;"
        }
    .end annotation

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->canContainNulls:Z

    return-object p0
.end method

.method public setData(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
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
            "(TK;TT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public setData(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TT;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->getSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    move-result-object v0

    if-eqz p3, :cond_0

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->setError(Ljava/lang/Throwable;)V

    :goto_0
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->getSubscriptions(Z)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-direct {p0, v0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->invokeSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    :try_start_1
    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->setData(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    return-void
.end method

.method public setError(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 1
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

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
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

    invoke-virtual {p0, p1, v0, p2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

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

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

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

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;
    .locals 7
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

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/react/Subscription;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/react/Unsubscribable;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;Ljava/lang/ref/ReferenceQueue;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->getSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->addSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;)V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->getError()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->getData()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    monitor-exit v1

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->invokeSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public unsubscribe(Lcom/lumiyaviewer/lumiya/react/Subscription;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/react/Subscription;->getKey()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionGenericDataPool;->getExistingSubscriptions(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/react/SubscriptionList;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionList;->removeSubscription(Lcom/lumiyaviewer/lumiya/react/Subscription;)V
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
