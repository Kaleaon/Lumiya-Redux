.class public Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;
.super Ljava/lang/Object;


# instance fields
.field private final hashCode:I

.field private final heightMap:[F

.field private final mapHeight:I

.field private final mapWidth:I

.field private final normalMap:[F

.field private final waterHeight:F


# direct methods
.method public constructor <init>(F[F[FII)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->waterHeight:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapWidth:I

    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapHeight:I

    array-length v0, p2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    array-length v1, p2

    invoke-static {p2, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, p3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->normalMap:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->normalMap:[F

    array-length v1, p3

    invoke-static {p3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getHashCode()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->hashCode:I

    return-void
.end method

.method private getHashCode()I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->waterHeight:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([F)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->normalMap:[F

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapWidth:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapHeight:I

    add-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    if-nez v1, :cond_0

    return v0

    :cond_0
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->waterHeight:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->waterHeight:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapWidth:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapWidth:I

    if-ne v1, v2, :cond_1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapHeight:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapHeight:I

    if-ne v1, v2, :cond_1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->normalMap:[F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->normalMap:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    :cond_1
    return v0
.end method

.method public final getHeightArray()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    return-object v0
.end method

.method public final getMapHeight()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapHeight:I

    return v0
.end method

.method public final getMapWidth()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->mapWidth:I

    return v0
.end method

.method public getMaxHeight()F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    invoke-static {v0}, Lcom/google/common/primitives/Floats;->max([F)F

    move-result v0

    return v0
.end method

.method public getMinHeight()F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->heightMap:[F

    invoke-static {v0}, Lcom/google/common/primitives/Floats;->min([F)F

    move-result v0

    return v0
.end method

.method public final getNormalArray()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->normalMap:[F

    return-object v0
.end method

.method public final getWaterHeight()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->waterHeight:F

    return v0
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->hashCode:I

    return v0
.end method
