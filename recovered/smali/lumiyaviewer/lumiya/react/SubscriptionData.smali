.class public Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
.implements Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;
.implements Lcom/lumiyaviewer/lumiya/react/RefreshableOne;
.implements Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException;
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
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
        "<TT;>;",
        "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
        "Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;",
        "Lcom/lumiyaviewer/lumiya/react/RefreshableOne;",
        "Lcom/lumiyaviewer/lumiya/react/UnsubscribableOne;"
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field private data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private error:Ljava/lang/Throwable;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final executor:Ljava/util/concurrent/Executor;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final inLoadableListeners:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final listenersInvokeAgain:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final loadableStatusListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;",
            ">;"
        }
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;

.field private final onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final subscription:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<TK;TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 3
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->loadableStatusListeners:Ljava/util/List;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->inLoadableListeners:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->listenersInvokeAgain:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->executor:Ljava/util/concurrent/Executor;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V
    .locals 3
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;)V"
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->loadableStatusListeners:Ljava/util/List;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->inLoadableListeners:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->listenersInvokeAgain:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->executor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)V
    .locals 3
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<TT;>;",
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;",
            ")V"
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->loadableStatusListeners:Ljava/util/List;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->inLoadableListeners:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->listenersInvokeAgain:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->executor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    return-void
.end method

.method private invokeLoadableListeners()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->inLoadableListeners:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->loadableStatusListeners:Ljava/util/List;

    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getLoadableStatus()Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    move-result-object v2

    invoke-interface {v0, p0, v2}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;->onLoadableStatusChange(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->listenersInvokeAgain:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->inLoadableListeners:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :goto_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->listenersInvokeAgain:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    goto :goto_1
.end method


# virtual methods
.method public addLoadableStatusListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->loadableStatusListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public assertHasData()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    invoke-direct {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    :try_start_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException;

    const-string/jumbo v2, "Data not ready"

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getData()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getLoadableStatus()Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Idle:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Error:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loaded:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    return-object v0

    :cond_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;->Loading:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;

    return-object v0
.end method

.method public hasData()Z
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public isSubscribed()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onData(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;->onData(Ljava/lang/Object;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->invokeLoadableListeners()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->onError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;->onError(Ljava/lang/Throwable;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->invokeLoadableListeners()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public requestRefresh()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->requestRefresh()V

    :cond_0
    return-void
.end method

.method public subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/react/Subscribable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/Subscribable",
            "<TK;TT;>;TK;)V"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {p1, p2, v1, p0, p0}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->invokeLoadableListeners()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public unsubscribe()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->lock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->data:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->error:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->invokeLoadableListeners()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
