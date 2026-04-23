.class Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/utils/HasPriority;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TerrainTextureRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;",
        "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
        ">;",
        "Ljava/lang/Runnable;",
        "Lcom/lumiyaviewer/lumiya/utils/HasPriority;"
    }
.end annotation


# instance fields
.field private volatile bakingFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private layerNeededMask:I

.field private layerReadyMask:I

.field private final rawRequests:[Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;

.field private final rawTextures:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x4

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    new-array v0, v1, [Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawRequests:[Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;

    new-array v0, v1, [Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawTextures:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->bakingFuture:Ljava/util/concurrent/Future;

    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 3

    const/4 v0, 0x0

    monitor-enter p0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawRequests:[Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->bakingFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public execute()V
    .locals 4

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getLayerMask()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerNeededMask:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerReadyMask:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerNeededMask:I

    if-eqz v0, :cond_2

    monitor-enter p0

    :goto_0
    const/4 v0, 0x4

    if-ge v1, v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawRequests:[Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;

    aget-object v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerNeededMask:I

    const/4 v2, 0x1

    shl-int/2addr v2, v1

    and-int/2addr v0, v2

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawRequests:[Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;

    new-instance v3, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getTextures()Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->getTextureUUID(I)Ljava/util/UUID;

    move-result-object v0

    invoke-direct {v3, p0, v0, v1}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;Ljava/util/UUID;I)V

    aput-object v3, v2, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    monitor-exit p0

    :goto_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_2
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getDecompressorExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->bakingFuture:Ljava/util/concurrent/Future;

    goto :goto_1
.end method

.method public getPriority()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected declared-synchronized onLayerReady(ILcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V
    .locals 7

    const/4 v6, 0x4

    const/4 v1, 0x1

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawTextures:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    aput-object p2, v2, p1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerReadyMask:I

    shl-int v3, v1, p1

    or-int/2addr v2, v3

    iput v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerReadyMask:I

    const-string/jumbo v3, "Terrain: onLayerReady (%d), rawTexture %s, layerNeededMask %d, layerReadyMask %d"

    const/4 v2, 0x4

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v4, v5

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    const/4 v5, 0x1

    aput-object v2, v4, v5

    iget v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerNeededMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v4, v5

    iget v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerReadyMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v5, 0x3

    aput-object v2, v4, v5

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerNeededMask:I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerReadyMask:I

    and-int/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerNeededMask:I

    if-ne v2, v3, :cond_0

    move v2, v0

    :goto_1
    if-ge v2, v6, :cond_4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->layerNeededMask:I

    shl-int v4, v1, v2

    and-int/2addr v3, v4

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawTextures:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    aget-object v3, v3, v2

    if-nez v3, :cond_2

    const-string/jumbo v1, "Terrain: texture for layer %d is not ready"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_2
    if-eqz v0, :cond_3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getDecompressorExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->bakingFuture:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_3
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    const-string/jumbo v2, "null"

    goto :goto_0

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_4
    move v0, v1

    goto :goto_2
.end method

.method public run()V
    .locals 6

    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->rawTextures:[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getTextureHeightMap()[F

    move-result-object v3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getHeightMap()Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getMapWidth()I

    move-result v4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getHeightMap()Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getMapHeight()I

    move-result v5

    const/16 v0, 0x100

    const/16 v1, 0x100

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->bakeTerrain(II[Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;[FII)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-result-object v0

    const-string/jumbo v1, "Terrain: Baked texture producer: produced baked texture"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method
