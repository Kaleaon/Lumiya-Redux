.class public Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;


# static fields
.field private static final MAX_LOADS_PER_FRAME:I = 0x10

.field private static final MAX_SIZE_PER_FRAME:I = 0x400000

.field private static final WAIT_FRAMES_AFTER_LOAD:I = 0x3


# instance fields
.field private framesWait:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;->framesWait:I

    return-void
.end method


# virtual methods
.method public GLResourceLoaded(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;)V
    .locals 0

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;->GLCompleteLoad()V

    return-void
.end method

.method public RunLoadQueue(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/render/RenderContext;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;->framesWait:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;->framesWait:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;->framesWait:I

    return-void

    :cond_0
    move v1, v2

    move v3, v2

    :goto_0
    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->canAllocateMemory(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;->GLGetLoadSize()I

    move-result v4

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->canAllocateMemory(I)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->stall()V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;->loadQueue:Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;

    invoke-virtual {v4, v0}, Lcom/lumiyaviewer/lumiya/res/collections/WeakQueue;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_1
    if-eqz v3, :cond_2

    const-string/jumbo v0, "waitForMemory: loadedCount %d, size %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v4, v2

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_2
    return-void

    :cond_3
    invoke-interface {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;->GLLoad(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;)I

    move-result v0

    add-int/2addr v0, v1

    const/4 v1, 0x3

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;->framesWait:I

    add-int/lit8 v1, v3, 0x1

    const/16 v3, 0x10

    if-ge v1, v3, :cond_4

    const/high16 v3, 0x400000

    if-lt v0, v3, :cond_5

    :cond_4
    move v3, v1

    move v1, v0

    goto :goto_1

    :cond_5
    move v3, v1

    move v1, v0

    goto :goto_0
.end method
