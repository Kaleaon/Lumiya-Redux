.class public Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;
.super Ljava/lang/Object;


# static fields
.field private static final PAGE_SIZE:I = 0x1000

.field private static final RELEASE_DELAY_FRAMES:I = 0x4

.field private static final TEXTURE_MAX_RESERVED_MEMORY:I = 0x2000000

.field private static activeRendererRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private static bufMemory:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final delayedRelease:[Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final delayedReleaseBuf:[Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final delayedReleaseIndex:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static inflightLowMemory:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static openJpegMemoryMmapped:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static openJpegMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final rendererLock:Ljava/lang/Object;

.field private static stalled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static textureMemoryLimit:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static volatile textureMemoryReserved:I

.field private static textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x4

    const/4 v1, 0x0

    const/high16 v0, 0x2000000

    sput v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryReserved:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryMmapped:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/high16 v2, 0x4000000

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryLimit:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->inflightLowMemory:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->bufMemory:Ljava/util/concurrent/atomic/AtomicInteger;

    new-array v0, v4, [Ljava/util/concurrent/atomic/AtomicInteger;

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedRelease:[Ljava/util/concurrent/atomic/AtomicInteger;

    new-array v0, v4, [Ljava/util/concurrent/atomic/AtomicInteger;

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseBuf:[Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->stalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->rendererLock:Ljava/lang/Object;

    const/4 v0, 0x0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->activeRendererRef:Ljava/lang/ref/WeakReference;

    move v0, v1

    :goto_0
    if-ge v0, v4, :cond_0

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedRelease:[Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v3, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v3, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    aput-object v3, v2, v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseBuf:[Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v3, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v3, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static actualSize(I)I
    .locals 1

    add-int/lit16 v0, p0, 0x1000

    add-int/lit8 v0, v0, -0x1

    div-int/lit16 v0, v0, 0x1000

    mul-int/lit16 v0, v0, 0x1000

    return v0
.end method

.method public static allocBufferMemory(I)V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->bufMemory:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->actualSize(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->printStats()V

    return-void
.end method

.method public static allocOpenJpegMemory(IZ)V
    .locals 2

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->actualSize(I)I

    move-result v0

    if-eqz p1, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryMmapped:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    :cond_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->updateInflightMemoryLow()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->printStats()V

    return-void
.end method

.method public static allocTextureMemory(I)V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->actualSize(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->updateInflightMemoryLow()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->printStats()V

    return-void
.end method

.method public static canAllocateMemory(I)Z
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->stalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->bufMemory:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->actualSize(I)I

    move-result v2

    add-int/2addr v1, v2

    sget v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryReserved:I

    add-int/2addr v1, v2

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryLimit:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-ge v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    return v0
.end method

.method public static clearActiveRenderer(Ljava/lang/Object;)V
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->rendererLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->activeRendererRef:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->activeRendererRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    :cond_0
    if-eq v0, p0, :cond_1

    if-nez v0, :cond_2

    :cond_1
    const/4 v0, 0x0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->activeRendererRef:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static hasActiveRenderer()Z
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->rendererLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->activeRendererRef:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->activeRendererRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static printStats()V
    .locals 6

    const/high16 v5, 0x100000

    invoke-static {}, Lcom/lumiyaviewer/lumiya/Debug;->isDebugBuild()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    add-int/2addr v0, v1

    const-string/jumbo v1, "Texture mem used: %d Mb oj %d mmap %d tot %d limit %d Mb buf %dk"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    sget-object v3, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    div-int/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    div-int/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    sget-object v3, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryMmapped:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    div-int/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    div-int/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x3

    aput-object v0, v2, v3

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryLimit:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    div-int/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x4

    aput-object v0, v2, v3

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->bufMemory:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    div-int/lit16 v0, v0, 0x400

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x5

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static releaseAllFrameMemory()V
    .locals 3

    const/4 v1, 0x0

    move v0, v1

    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedRelease:[Ljava/util/concurrent/atomic/AtomicInteger;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseBuf:[Ljava/util/concurrent/atomic/AtomicInteger;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method public static releaseAllGLMemory()V
    .locals 2

    const/4 v1, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->bufMemory:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->stalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->printStats()V

    return-void
.end method

.method public static releaseBufferMemory(I)V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseBuf:[Ljava/util/concurrent/atomic/AtomicInteger;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    aget-object v0, v0, v1

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->actualSize(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    return-void
.end method

.method public static releaseFrameMemory()V
    .locals 5

    const/4 v2, 0x1

    const/4 v1, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    const/4 v3, 0x4

    if-lt v0, v3, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    move v0, v1

    :cond_0
    sget-object v3, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedRelease:[Ljava/util/concurrent/atomic/AtomicInteger;

    aget-object v3, v3, v0

    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseBuf:[Ljava/util/concurrent/atomic/AtomicInteger;

    aget-object v0, v4, v0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v4

    if-eqz v3, :cond_3

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v3, v3

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move v0, v2

    :goto_0
    if-eqz v4, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->bufMemory:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v3, v4

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move v0, v2

    :cond_1
    if-eqz v0, :cond_2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->updateInflightMemoryLow()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->printStats()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->stalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_2
    return-void

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public static releaseOpenJpegMemory(IZ)V
    .locals 3

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->actualSize(I)I

    move-result v0

    if-eqz p1, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryMmapped:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v2, v0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    :cond_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v0, v0

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->updateInflightMemoryLow()V

    return-void
.end method

.method public static releaseTextureMemory(I)V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedRelease:[Ljava/util/concurrent/atomic/AtomicInteger;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->delayedReleaseIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    aget-object v0, v0, v1

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->actualSize(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    return-void
.end method

.method public static setActiveRenderer(Ljava/lang/Object;)V
    .locals 2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->rendererLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->activeRendererRef:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static setInflightMemoryLow(Z)V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->inflightLowMemory:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eq v0, p0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->setTextureMemoryState(Z)V

    :cond_0
    return-void
.end method

.method public static setMemoryLimit(I)V
    .locals 2

    const/high16 v0, 0x2000000

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryLimit:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    div-int/lit8 v1, p0, 0x4

    if-le v1, v0, :cond_0

    :goto_0
    sput v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryReserved:I

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public static stall()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->stalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method private static updateInflightMemoryLow()V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->openJpegMemoryUsed:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    add-int/2addr v0, v1

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->textureMemoryLimit:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->setInflightMemoryLow(Z)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
