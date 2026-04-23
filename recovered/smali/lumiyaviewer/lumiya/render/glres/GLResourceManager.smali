.class public Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;,
        Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLResourceReference;
    }
.end annotation


# instance fields
.field private final glCleanableLock:Ljava/lang/Object;

.field private final glCleanables:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;",
            ">;"
        }
    .end annotation
.end field

.field private final refQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;",
            ">;"
        }
    .end annotation
.end field

.field private final refSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)Ljava/lang/ref/ReferenceQueue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refQueue:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)Ljava/util/Set;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refSet:Ljava/util/Set;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refQueue:Ljava/lang/ref/ReferenceQueue;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refSet:Ljava/util/Set;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanableLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanables:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public Cleanup()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanableLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanables:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v1

    if-eqz v1, :cond_1

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;

    if-eqz v0, :cond_0

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;->GLFree()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refSet:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    return-void
.end method

.method public Flush()V
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanableLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanables:Ljava/util/Set;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;->GLCleanup()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanables:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->refSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->releaseAllGLMemory()V

    return-void
.end method

.method public addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanableLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->glCleanables:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
