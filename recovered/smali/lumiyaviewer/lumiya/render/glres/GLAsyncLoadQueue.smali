.class public Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;
    }
.end annotation


# instance fields
.field private volatile contextFailed:Z

.field private volatile contextReady:Z

.field private final contextReadyLock:Ljava/lang/Object;

.field private final egl10:Ljavax/microedition/khronos/egl/EGL10;

.field private final eglBaseContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private final eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field private final eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private final loadedQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;",
            ">;"
        }
    .end annotation
.end field

.field private final mustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final requestGL30:Z

.field private final thread:Ljava/lang/Thread;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextReadyLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->egl10:Ljavax/microedition/khronos/egl/EGL10;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglBaseContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->loadedQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    return-object v0
.end method

.method static synthetic -get6(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->mustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get7(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->requestGL30:Z

    return v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextFailed:Z

    return p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextReady:Z

    return p1
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->mustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextReadyLock:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextReady:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextFailed:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->loadedQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->egl10:Ljavax/microedition/khronos/egl/EGL10;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->requestGL30:Z

    invoke-interface {p2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglBaseContext:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglBaseContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->eglBaseContext:Ljavax/microedition/khronos/egl/EGLContext;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq v0, v1, :cond_1

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;

    invoke-direct {v1, p0, p1, v3}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;)V

    const-string/jumbo v2, "EGLLoader"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->thread:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->thread:Ljava/lang/Thread;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :try_start_0
    const-string/jumbo v0, "TexLoad: Waiting for thread to create context"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextReadyLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    :try_start_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextReady:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextReadyLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1

    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/InstantiationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Interrupted: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v1

    const-string/jumbo v0, "TexLoad: Context created, failed = %b"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextFailed:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->contextFailed:Z

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/InstantiationException;

    const-string/jumbo v1, "TexLoad: failed to create context"

    invoke-direct {v0, v1}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/InstantiationException;

    const-string/jumbo v1, "TexLoad: current context was null"

    invoke-direct {v0, v1}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    return-void
.end method


# virtual methods
.method public GLResourceLoaded(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->loadedQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->offer(Ljava/lang/Object;)Z

    return-void
.end method

.method public RunLoadQueue(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/RenderContext;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->loadedQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;->GLCompleteLoad()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public StopLoadQueue()V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "TexLoad: StopLoadQueue called."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->mustExit:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->StopLoadQueue()V

    const-string/jumbo v0, "TexLoad: StopLoadQueue exiting."

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public remove(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->loadedQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->remove(Ljava/lang/Object;)Z

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->remove(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V

    return-void
.end method
