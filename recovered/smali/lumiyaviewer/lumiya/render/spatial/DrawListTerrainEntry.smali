.class Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;
.super Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;


# instance fields
.field private volatile drawablePatch:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;",
            ">;"
        }
    .end annotation
.end field

.field private patchInfo:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final patchX:I

.field private final patchY:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;II)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;-><init>()V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchX:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchY:I

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->updatePatchInfo(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;)V

    return-void
.end method


# virtual methods
.method public addToDrawList(Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;)V
    .locals 6
    .param p1    # Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->drawablePatch:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;

    :cond_0
    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->terrainGeometryCache:Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->glTerrainTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchInfo:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchX:I

    iget v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchY:I

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;-><init>(Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;II)V

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->drawablePatch:Ljava/lang/ref/WeakReference;

    :cond_1
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawList;->terrain:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public updatePatchInfo(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchInfo:Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getMinHeight()F

    move-result v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getMaxHeight()F

    move-result v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->boundingBox:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchX:I

    mul-int/lit8 v3, v3, 0x10

    int-to-float v3, v3

    const/4 v4, 0x0

    aput v3, v2, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->boundingBox:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchY:I

    mul-int/lit8 v3, v3, 0x10

    int-to-float v3, v3

    const/4 v4, 0x1

    aput v3, v2, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->boundingBox:[F

    const/4 v3, 0x2

    aput v0, v2, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->boundingBox:[F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchX:I

    add-int/lit8 v2, v2, 0x1

    mul-int/lit8 v2, v2, 0x10

    int-to-float v2, v2

    const/4 v3, 0x3

    aput v2, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->boundingBox:[F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->patchY:I

    add-int/lit8 v2, v2, 0x1

    mul-int/lit8 v2, v2, 0x10

    int-to-float v2, v2

    const/4 v3, 0x4

    aput v2, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->boundingBox:[F

    const/4 v2, 0x5

    aput v1, v0, v2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListTerrainEntry;->drawablePatch:Ljava/lang/ref/WeakReference;

    return-void
.end method
