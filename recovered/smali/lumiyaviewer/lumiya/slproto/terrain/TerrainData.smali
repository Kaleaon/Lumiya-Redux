.class public Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;
.super Ljava/lang/Object;


# static fields
.field public static final PatchesPerEdge:I = 0x10

.field public static final PatchesSize:I = 0x10

.field public static final TerrainPerEdge:I = 0x100


# instance fields
.field private final heightMap:[F

.field private final patchDirtyMap:[Z

.field private volatile terrainTextures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

.field private validCount:I

.field private final validMap:[Z

.field private final vertexHeights:[F

.field private final vertexLock:Ljava/lang/Object;

.field private final vertexNormals:[F

.field private final vertexValids:[Z

.field private waterHeight:F

.field private waterHeightValid:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    const v3, 0x10201

    const/high16 v2, 0x10000

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexLock:Ljava/lang/Object;

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    new-array v0, v2, [Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexHeights:[F

    const v0, 0x20402

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexNormals:[F

    new-array v0, v3, [Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexValids:[Z

    const/16 v0, 0x100

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->patchDirtyMap:[Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeight:F

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeightValid:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validCount:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->terrainTextures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    return-void
.end method

.method private declared-synchronized SetWaterHeight(F)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeight:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeightValid:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :cond_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeight:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeightValid:Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->updateEntireTerrain()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private markVerticesDirty(IIII)V
    .locals 11

    const/16 v10, 0x10

    div-int/lit8 v1, p1, 0x10

    div-int/lit8 v0, p2, 0x10

    div-int/lit8 v4, p3, 0x10

    div-int/lit8 v5, p4, 0x10

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexLock:Ljava/lang/Object;

    monitor-enter v6

    move v3, v0

    :goto_0
    if-gt v3, v5, :cond_2

    move v2, v1

    :goto_1
    if-gt v2, v4, :cond_1

    if-ltz v2, :cond_0

    if-ge v2, v10, :cond_0

    if-ltz v3, :cond_0

    if-ge v3, v10, :cond_0

    :try_start_0
    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->patchDirtyMap:[Z

    mul-int/lit8 v8, v3, 0x10

    add-int/2addr v8, v2

    const/4 v9, 0x1

    aput-boolean v9, v7, v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_0

    :cond_2
    monitor-exit v6

    move v2, v0

    :goto_2
    if-gt v2, v5, :cond_5

    move v0, v1

    :goto_3
    if-gt v0, v4, :cond_4

    if-ltz v0, :cond_3

    if-ge v0, v10, :cond_3

    if-ltz v2, :cond_3

    if-ge v2, v10, :cond_3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v3

    invoke-virtual {v3, v0, v2, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->updateTerrainPatch(IILcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;)V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :catchall_0
    move-exception v0

    monitor-exit v6

    throw v0

    :cond_4
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_2

    :cond_5
    return-void
.end method

.method private updateVerticesInRegion(IIII)V
    .locals 9

    :goto_0
    if-gt p2, p4, :cond_6

    move v2, p1

    :goto_1
    if-gt v2, p3, :cond_5

    add-int/lit8 v0, v2, -0x1

    add-int/lit8 v1, p2, -0x1

    const/4 v3, 0x0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v3, 0xff

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v0, 0x0

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/4 v0, 0x0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    const/4 v1, 0x0

    const/4 v0, 0x0

    if-ltz v3, :cond_0

    const/16 v7, 0x100

    if-ge v3, v7, :cond_0

    if-ltz v4, :cond_0

    const/16 v7, 0x100

    if-ge v4, v7, :cond_0

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    mul-int/lit16 v8, v4, 0x100

    add-int/2addr v8, v3

    aget-boolean v7, v7, v8

    if-eqz v7, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v1, v4, 0x100

    add-int/2addr v1, v3

    aget v0, v0, v1

    const/4 v1, 0x0

    add-float/2addr v1, v0

    const/4 v0, 0x1

    :cond_0
    if-ltz v5, :cond_1

    const/16 v7, 0x100

    if-ge v5, v7, :cond_1

    if-ltz v4, :cond_1

    const/16 v7, 0x100

    if-ge v4, v7, :cond_1

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    mul-int/lit16 v8, v4, 0x100

    add-int/2addr v8, v5

    aget-boolean v7, v7, v8

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v8, v4, 0x100

    add-int/2addr v8, v5

    aget v7, v7, v8

    add-float/2addr v1, v7

    add-int/lit8 v0, v0, 0x1

    :cond_1
    if-ltz v3, :cond_2

    const/16 v7, 0x100

    if-ge v3, v7, :cond_2

    if-ltz v6, :cond_2

    const/16 v7, 0x100

    if-ge v6, v7, :cond_2

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    mul-int/lit16 v8, v6, 0x100

    add-int/2addr v8, v3

    aget-boolean v7, v7, v8

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v8, v6, 0x100

    add-int/2addr v8, v3

    aget v7, v7, v8

    add-float/2addr v1, v7

    add-int/lit8 v0, v0, 0x1

    :cond_2
    if-ltz v5, :cond_3

    const/16 v7, 0x100

    if-ge v5, v7, :cond_3

    if-ltz v6, :cond_3

    const/16 v7, 0x100

    if-ge v6, v7, :cond_3

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    mul-int/lit16 v8, v6, 0x100

    add-int/2addr v8, v5

    aget-boolean v7, v7, v8

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v8, v6, 0x100

    add-int/2addr v8, v5

    aget v7, v7, v8

    add-float/2addr v1, v7

    add-int/lit8 v0, v0, 0x1

    :cond_3
    const/4 v7, 0x4

    if-ne v0, v7, :cond_4

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexHeights:[F

    mul-int/lit16 v8, p2, 0x101

    add-int/2addr v8, v2

    int-to-float v0, v0

    div-float v0, v1, v0

    aput v0, v7, v8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v1, v6, 0x100

    add-int/2addr v1, v5

    aget v0, v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v7, v6, 0x100

    add-int/2addr v3, v7

    aget v1, v1, v3

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v3, v6, 0x100

    add-int/2addr v3, v5

    aget v1, v1, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v4, v4, 0x100

    add-int/2addr v4, v5

    aget v3, v3, v4

    sub-float/2addr v1, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexNormals:[F

    mul-int/lit16 v4, p2, 0x101

    add-int/2addr v4, v2

    mul-int/lit8 v4, v4, 0x2

    aput v0, v3, v4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexNormals:[F

    mul-int/lit16 v3, p2, 0x101

    add-int/2addr v3, v2

    mul-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x1

    aput v1, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexValids:[Z

    mul-int/lit16 v1, p2, 0x101

    add-int/2addr v1, v2

    const/4 v3, 0x1

    aput-boolean v3, v0, v1

    :goto_2
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexValids:[Z

    mul-int/lit16 v1, p2, 0x101

    add-int/2addr v1, v2

    const/4 v3, 0x0

    aput-boolean v3, v0, v1

    goto :goto_2

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto/16 :goto_0

    :cond_6
    return-void
.end method


# virtual methods
.method public declared-synchronized ApplyRegionInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->WaterHeight:F

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->SetWaterHeight(F)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->terrainTextures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->terrainTextures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->updateEntireTerrain()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public ProcessLayerData([B)V
    .locals 14

    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;

    invoke-direct {v2, p1}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;-><init>([B)V

    const/16 v0, 0x10

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v0

    const/16 v1, 0x8

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    const/16 v1, 0x8

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v1

    const-string/jumbo v4, "Terrain: ProcessLayerData: stride 0x%x patchSize 0x%x type 0x%x"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x1

    aput-object v0, v5, v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexLock:Ljava/lang/Object;

    monitor-enter v4

    :cond_0
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->isEOF()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DecompressPatch(Lcom/lumiyaviewer/lumiya/utils/BitBuffer;I)Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    if-nez v5, :cond_2

    :cond_1
    monitor-exit v4

    const-string/jumbo v0, "Terrain: LayerData received, valid count is now %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_2
    :try_start_1
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->getX()I

    move-result v6

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->getY()I

    move-result v7

    const/16 v0, 0x10

    if-ge v6, v0, :cond_0

    const/16 v0, 0x10

    if-ge v7, v0, :cond_0

    const/4 v0, 0x0

    move v1, v0

    :goto_1
    if-ge v1, v3, :cond_5

    mul-int/lit8 v0, v7, 0x10

    add-int v8, v0, v1

    if-ltz v8, :cond_4

    const/16 v0, 0x100

    if-ge v8, v0, :cond_4

    const/4 v0, 0x0

    :goto_2
    if-ge v0, v3, :cond_4

    mul-int/lit8 v9, v6, 0x10

    add-int/2addr v9, v0

    if-ltz v9, :cond_3

    const/16 v10, 0x100

    if-ge v9, v10, :cond_3

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->heightMap:[F

    mul-int/lit16 v11, v8, 0x100

    add-int/2addr v11, v9

    iget-object v12, v5, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->heightMap:[F

    mul-int v13, v1, v3

    add-int/2addr v13, v0

    aget v12, v12, v13

    aput v12, v10, v11

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    mul-int/lit16 v11, v8, 0x100

    add-int/2addr v11, v9

    aget-boolean v10, v10, v11

    if-nez v10, :cond_3

    iget v10, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validCount:I

    iget-object v10, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    mul-int/lit16 v11, v8, 0x100

    add-int/2addr v9, v11

    const/4 v11, 0x1

    aput-boolean v11, v10, v9

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_5
    mul-int/lit8 v0, v6, 0x10

    mul-int/lit8 v1, v7, 0x10

    add-int/lit8 v5, v6, 0x1

    mul-int/lit8 v5, v5, 0x10

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v6, v7, 0x1

    mul-int/lit8 v6, v6, 0x10

    add-int/lit8 v6, v6, 0x1

    invoke-direct {p0, v0, v1, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->markVerticesDirty(IIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v4

    throw v0
.end method

.method public getPatchInfo(II)Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;
    .locals 11

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->patchDirtyMap:[Z

    mul-int/lit8 v2, p2, 0x10

    add-int/2addr v2, p1

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->patchDirtyMap:[Z

    mul-int/lit8 v2, p2, 0x10

    add-int/2addr v2, p1

    const/4 v3, 0x0

    aput-boolean v3, v0, v2

    mul-int/lit8 v0, p1, 0x10

    mul-int/lit8 v2, p2, 0x10

    add-int/lit8 v3, p1, 0x1

    mul-int/lit8 v3, v3, 0x10

    add-int/lit8 v4, p2, 0x1

    mul-int/lit8 v4, v4, 0x10

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->updateVerticesInRegion(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    const/4 v1, 0x1

    const/4 v0, 0x0

    move v2, v0

    move v0, v1

    :goto_0
    const/16 v1, 0x11

    if-ge v2, v1, :cond_3

    mul-int/lit8 v1, p2, 0x10

    add-int/2addr v1, v2

    mul-int/lit16 v3, v1, 0x101

    const/4 v1, 0x0

    :goto_1
    const/16 v4, 0x11

    if-ge v1, v4, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexValids:[Z

    add-int v5, v3, v1

    mul-int/lit8 v6, p1, 0x10

    add-int/2addr v5, v6

    aget-boolean v4, v4, v5

    if-nez v4, :cond_2

    const/4 v0, 0x0

    :cond_1
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_6

    const/16 v0, 0x121

    new-array v2, v0, [F

    const/16 v0, 0x242

    new-array v3, v0, [F

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    const/16 v0, 0x11

    if-ge v1, v0, :cond_5

    mul-int/lit8 v0, p2, 0x10

    add-int/2addr v0, v1

    mul-int/lit16 v4, v0, 0x101

    const/4 v0, 0x0

    :goto_3
    const/16 v5, 0x11

    if-ge v0, v5, :cond_4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexHeights:[F

    add-int v6, v4, v0

    mul-int/lit8 v7, p1, 0x10

    add-int/2addr v6, v7

    aget v5, v5, v6

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexNormals:[F

    add-int v7, v4, v0

    mul-int/lit8 v8, p1, 0x10

    add-int/2addr v7, v8

    mul-int/lit8 v7, v7, 0x2

    aget v6, v6, v7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexNormals:[F

    add-int v8, v4, v0

    mul-int/lit8 v9, p1, 0x10

    add-int/2addr v8, v9

    mul-int/lit8 v8, v8, 0x2

    add-int/lit8 v8, v8, 0x1

    aget v7, v7, v8

    mul-int/lit8 v8, v1, 0x11

    add-int/2addr v8, v0

    aput v5, v2, v8

    mul-int/lit8 v5, v1, 0x11

    add-int/2addr v5, v0

    mul-int/lit8 v5, v5, 0x2

    aput v6, v3, v5

    mul-int/lit8 v5, v1, 0x11

    add-int/2addr v5, v0

    mul-int/lit8 v5, v5, 0x2

    add-int/lit8 v5, v5, 0x1

    aput v7, v3, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_4
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_5
    int-to-float v0, p1

    const/high16 v1, 0x41800000    # 16.0f

    div-float v8, v0, v1

    int-to-float v0, p1

    const/high16 v1, 0x41800000    # 16.0f

    div-float v9, v0, v1

    const/high16 v6, 0x3d800000    # 0.0625f

    const/high16 v7, 0x3d800000    # 0.0625f

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeight:F

    const/16 v4, 0x11

    const/16 v5, 0x11

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;-><init>(F[F[FII)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->terrainTextures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    move-object v1, v10

    move-object v2, v0

    move v4, v8

    move v5, v9

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;FFFF)V

    return-object v10

    :cond_6
    const/4 v0, 0x0

    return-object v0
.end method

.method public final isUnderWater(F)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeightValid:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeight:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public reset()V
    .locals 5

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexLock:Ljava/lang/Object;

    monitor-enter v2

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->waterHeightValid:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validCount:I

    move v1, v0

    :goto_0
    const/high16 v3, 0x10000

    if-ge v1, v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->validMap:[Z

    const/4 v4, 0x0

    aput-boolean v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_1
    const v3, 0x10201

    if-ge v1, v3, :cond_1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->vertexValids:[Z

    const/4 v4, 0x0

    aput-boolean v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    const/16 v1, 0x100

    if-ge v0, v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->patchDirtyMap:[Z

    const/4 v3, 0x0

    aput-boolean v3, v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method public updateEntireTerrain()V
    .locals 2

    const/16 v1, 0x100

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainData;->markVerticesDirty(IIII)V

    return-void
.end method
