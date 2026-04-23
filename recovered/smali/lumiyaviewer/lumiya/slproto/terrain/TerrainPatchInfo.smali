.class public Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;
.super Ljava/lang/Object;


# instance fields
.field private final hashCode:I

.field private final heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

.field private final layerMask:I

.field private final textureHeightMap:[F

.field private final textures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;FFFF)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getHeightArray()[F

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getMapWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getMapHeight()I

    move-result v3

    move-object v0, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->getTextureHeightMap([FIIFFFF)[F

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textureHeightMap:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textureHeightMap:[F

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->getNeededLayerMask([F)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->layerMask:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getHashCode()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->hashCode:I

    return-void
.end method

.method private getHashCode()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->layerMask:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textureHeightMap:[F

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    if-nez v1, :cond_0

    return v0

    :cond_0
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->layerMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->layerMask:I

    if-ne v1, v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textureHeightMap:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textureHeightMap:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    :cond_1
    return v0
.end method

.method public getHeightMap()Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    return-object v0
.end method

.method public final getLayerMask()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->layerMask:I

    return v0
.end method

.method public getMaxHeight()F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getMaxHeight()F

    move-result v0

    return v0
.end method

.method public getMinHeight()F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->heightMap:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;->getMinHeight()F

    move-result v0

    return v0
.end method

.method public final getTextureHeightMap()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textureHeightMap:[F

    return-object v0
.end method

.method public getTextures()Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->textures:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainTextures;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->hashCode:I

    return v0
.end method
