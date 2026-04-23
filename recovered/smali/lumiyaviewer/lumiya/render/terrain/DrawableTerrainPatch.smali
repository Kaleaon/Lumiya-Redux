.class public Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# instance fields
.field private volatile geometry:Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;

.field private final objWorldMatrix:[F

.field private volatile texture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;II)V
    .locals 5

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->objWorldMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->objWorldMatrix:[F

    invoke-static {v0, v4}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->objWorldMatrix:[F

    mul-int/lit8 v1, p4, 0x10

    int-to-float v1, v1

    mul-int/lit8 v2, p5, 0x10

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-static {v0, v4, v1, v2, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;->getHeightMap()Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    move-result-object v0

    invoke-virtual {p1, v0, p0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    if-eqz p2, :cond_0

    invoke-virtual {p2, p3, p0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    :cond_0
    return-void
.end method

.method public static GLPrepare(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 0

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->GLPrepare(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    return-void
.end method


# virtual methods
.method public GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->geometry:Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->texture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->objWorldMatrix:[F

    invoke-virtual {v0, p1, v2, v1}, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;[FLcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;)V

    :cond_0
    return-void
.end method

.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 4

    const-string/jumbo v1, "DrawableTerrainPatch: got resource = %s"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->geometry:Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;

    :cond_0
    :goto_1
    return-void

    :cond_1
    const-string/jumbo v0, "null"

    goto :goto_0

    :cond_2
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/terrain/DrawableTerrainPatch;->texture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    goto :goto_1
.end method
