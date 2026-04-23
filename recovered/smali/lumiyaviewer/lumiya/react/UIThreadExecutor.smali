.class public Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;,
        Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$InstanceHolder;
    }
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final mainLooper:Landroid/os/Looper;

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

.field private final queueRunnable:Ljava/lang/Runnable;

.field private final runnablePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final serialExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/concurrent/locks/Lock;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/Queue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queue:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queueRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->runnablePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->runnablePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->mainLooper:Landroid/os/Looper;

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->mainLooper:Landroid/os/Looper;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->handler:Landroid/os/Handler;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queue:Ljava/util/Queue;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$1;-><init>(Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->serialExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/-$Lambda$D7hbGKuty0crHscG-TIL-CtFXqo;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/react/-$Lambda$D7hbGKuty0crHscG-TIL-CtFXqo;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queueRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method public static getInstance()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    move-result-object v0

    return-object v0
.end method

.method public static getSerialInstance()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->serialExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1    # Ljava/lang/Runnable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->mainLooper:Landroid/os/Looper;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v0

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catch_0
    move-exception v0

    :try_start_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_5
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :cond_1
    :try_start_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->runnablePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queueRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_1
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_react_UIThreadExecutor_2348()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->runnablePosted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_1
    :try_start_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :catch_0
    move-exception v0

    :try_start_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_5
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void
.end method
