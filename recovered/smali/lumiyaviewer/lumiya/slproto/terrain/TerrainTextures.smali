.class public Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;
.super Ljava/lang/Object;


# static fields
.field private static defaultTerrainTextures:[Ljava/util/UUID;


# instance fields
.field private final terrainHeightRange:[F

.field private final terrainStartHeight:[F

.field private final textureIDs:[Ljava/util/UUID;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/util/UUID;

    const-string/jumbo v1, "0bc58228-74a0-7e83-89bc-5c23464bcec5"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string/jumbo v1, "63338ede-0037-c4fd-855b-015d77112fc8"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string/jumbo v1, "303cd381-8560-7579-23f1-f0a880799740"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string/jumbo v1, "53a2f406-4895-1d13-d541-d2e3b86bc19c"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->defaultTerrainTextures:[Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    new-array v0, v2, [Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->textureIDs:[Ljava/util/UUID;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->defaultTerrainTextures:[Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->textureIDs:[Ljava/util/UUID;

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;)V
    .locals 10

    const/4 v9, 0x3

    const/4 v8, 0x4

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v8, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    new-array v0, v8, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    new-array v2, v8, [Ljava/util/UUID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail0:Ljava/util/UUID;

    aput-object v0, v2, v1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail1:Ljava/util/UUID;

    aput-object v0, v2, v6

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail2:Ljava/util/UUID;

    aput-object v0, v2, v7

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainDetail3:Ljava/util/UUID;

    aput-object v0, v2, v9

    move v0, v1

    :goto_0
    if-ge v0, v8, :cond_2

    const-string/jumbo v3, "Terrain: texture[%d] = %s"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    aget-object v5, v2, v0

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    aget-object v3, v2, v0

    if-eqz v3, :cond_0

    aget-object v3, v2, v0

    sget-object v4, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->defaultTerrainTextures:[Ljava/util/UUID;

    aget-object v3, v3, v0

    aput-object v3, v2, v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->textureIDs:[Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight00:F

    aput v2, v0, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight01:F

    aput v2, v0, v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight10:F

    aput v2, v0, v7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainStartHeight11:F

    aput v2, v0, v9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange00:F

    aput v2, v0, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange01:F

    aput v1, v0, v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange10:F

    aput v1, v0, v7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake$RegionInfo;->TerrainHeightRange11:F

    aput v1, v0, v9

    return-void
.end method

.method private static bilinearCorners([FFF)F
    .locals 5

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    aget v0, p0, v0

    mul-float/2addr v0, p1

    const/4 v1, 0x1

    aget v1, p0, v1

    sub-float v2, v4, p1

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    const/4 v1, 0x2

    aget v1, p0, v1

    mul-float/2addr v1, p1

    const/4 v2, 0x3

    aget v2, p0, v2

    sub-float v3, v4, p1

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    mul-float/2addr v0, p2

    sub-float v2, v4, p2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    if-nez v1, :cond_0

    return v0

    :cond_0
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->textureIDs:[Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->textureIDs:[Ljava/util/UUID;

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    :cond_1
    return v0
.end method

.method public getNeededLayerMask([F)I
    .locals 7

    const/4 v6, 0x1

    const/4 v0, 0x0

    array-length v2, p1

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_1

    aget v3, p1, v1

    float-to-double v4, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v4, v4

    shl-int v5, v6, v4

    or-int/2addr v0, v5

    int-to-float v5, v4

    sub-float/2addr v3, v5

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-eqz v3, :cond_0

    add-int/lit8 v3, v4, 0x1

    shl-int v3, v6, v3

    or-int/2addr v0, v3

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    and-int/lit8 v0, v0, 0xf

    return v0
.end method

.method public getTextureHeightMap([FIIFFFF)[F
    .locals 8

    mul-int v0, p2, p3

    new-array v2, v0, [F

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p3, :cond_1

    int-to-float v0, v1

    add-int/lit8 v3, p3, -0x1

    int-to-float v3, v3

    div-float v3, v0, v3

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p2, :cond_0

    int-to-float v4, v0

    add-int/lit8 v5, p2, -0x1

    int-to-float v5, v5

    div-float/2addr v4, v5

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    mul-float v6, v4, p6

    add-float/2addr v6, p4

    mul-float v7, v3, p7

    add-float/2addr v7, p5

    invoke-static {v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->bilinearCorners([FFF)F

    move-result v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    mul-float/2addr v4, p6

    add-float/2addr v4, p4

    mul-float v7, v3, p7

    add-float/2addr v7, p5

    invoke-static {v6, v4, v7}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->bilinearCorners([FFF)F

    move-result v4

    mul-int v6, v1, p2

    add-int/2addr v6, v0

    aget v6, p1, v6

    sub-float v5, v6, v5

    const/high16 v6, 0x40800000    # 4.0f

    mul-float/2addr v5, v6

    div-float v4, v5, v4

    const/4 v5, 0x0

    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    const/high16 v5, 0x40400000    # 3.0f

    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    mul-int v5, v1, p2

    add-int/2addr v5, v0

    aput v4, v2, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    return-object v2
.end method

.method public getTextureUUID(I)Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->textureIDs:[Ljava/util/UUID;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->textureIDs:[Ljava/util/UUID;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainStartHeight:[F

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([F)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->terrainHeightRange:[F

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
