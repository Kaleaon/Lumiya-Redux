.class Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EGLLoadThread"
.end annotation


# instance fields
.field private eglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private final renderContext:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/RenderContext;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    return-void
.end method

.method private createContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 11
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/16 v10, 0x80

    const/4 v0, 0x3

    const/4 v1, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const-string/jumbo v2, "TexLoad: create[1]: eglGetError = %d"

    new-array v3, v9, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    invoke-interface {v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get3(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get2(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v5

    new-array v6, v0, [I

    const/16 v7, 0x3098

    aput v7, v6, v8

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get7(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Z

    move-result v7

    if-eqz v7, :cond_0

    :goto_0
    aput v0, v6, v9

    const/16 v0, 0x3038

    aput v0, v6, v1

    invoke-interface {v2, v3, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    const-string/jumbo v1, "TexLoad: create[2]: eglGetError = %d"

    new-array v2, v9, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v3

    invoke-interface {v3}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get3(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v3

    const/16 v4, 0x3056

    const/16 v5, 0x3057

    const/16 v6, 0x3038

    filled-new-array {v4, v10, v5, v10, v6}, [I

    move-result-object v4

    invoke-interface {v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v1

    const-string/jumbo v2, "TexLoad: create[3]: eglGetError = %d"

    new-array v3, v9, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    invoke-interface {v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v0, :cond_1

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq v0, v2, :cond_1

    const-string/jumbo v2, "TexLoad: texture loader context created (%s)"

    new-array v3, v9, [Ljava/lang/Object;

    aput-object v0, v3, v8

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->eglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "TexLoad: Failed to create loader context"

    new-array v2, v8, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 12

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->renderContext:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->createContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v6

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const-string/jumbo v4, "TexLoad: Signaling context readiness."

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get0(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    :try_start_0
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    if-nez v6, :cond_1

    const/4 v4, 0x1

    :goto_0
    invoke-static {v7, v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-set0(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Z)Z

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    const/4 v7, 0x1

    invoke-static {v4, v7}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-set1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;Z)Z

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get0(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v5

    if-eqz v6, :cond_4

    const-string/jumbo v4, "TexLoad: thread init: eglGetError = %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v7

    invoke-interface {v7}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v5, v8

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v5

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->eglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->eglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v4, v5, v7, v8, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v4

    const-string/jumbo v5, "TexLoad: thread init: rc = %b, eglGetError = %d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v8, 0x0

    aput-object v4, v7, v8

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    invoke-interface {v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v8, 0x1

    aput-object v4, v7, v8

    invoke-static {v5, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v4, v1

    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get6(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_3

    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;->GLGetLoadSize()I

    move-result v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->canAllocateMemory(I)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v5, v1}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->offer(Ljava/lang/Object;)Z

    const-wide/16 v8, 0x3e8

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    add-int/lit8 v1, v4, 0x1

    const/16 v4, 0xa

    if-lt v1, v4, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sub-long v8, v4, v2

    const-wide/32 v10, 0xea60

    cmp-long v7, v8, v10

    if-ltz v7, :cond_0

    const-string/jumbo v1, "TexLoad: invoking GC."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v1, 0x0

    move-wide v2, v4

    :cond_0
    :goto_2
    move v4, v1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v5

    throw v0

    :cond_2
    const/4 v4, 0x0

    :try_start_2
    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-interface {v1, v0, v5}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;->GLLoad(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;)I

    invoke-static {}, Landroid/opengl/GLES10;->glFinish()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    move v1, v4

    goto :goto_2

    :catch_0
    move-exception v0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get5(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->clear()V

    const-string/jumbo v0, "TexLoad: Working thread exiting."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    invoke-interface {v0, v1, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->this$0:Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;->-get4(Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->eglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue$EGLLoadThread;->eglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    :cond_4
    return-void
.end method
