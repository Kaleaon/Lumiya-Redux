.class public Lcom/lumiyaviewer/lumiya/render/DrawableStore;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/DrawableStore$1;,
        Lcom/lumiyaviewer/lumiya/render/DrawableStore$2;
    }
.end annotation


# instance fields
.field public final drawableAvatarCache:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;",
            ">;"
        }
    .end annotation
.end field

.field public final drawableAvatarStubCache:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;",
            "Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarStub;",
            ">;"
        }
    .end annotation
.end field

.field public final geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

.field public final glTerrainTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;

.field public final glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

.field public final hasGL20:Z

.field public final meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

.field public final primCache:Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;

.field public final spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

.field public final terrainGeometryCache:Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;

.field public final textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;ZIZILjava/lang/Object;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->terrainGeometryCache:Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakKeys()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakValues()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/DrawableStore$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/render/DrawableStore$1;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;)V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->drawableAvatarCache:Lcom/google/common/cache/LoadingCache;

    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakKeys()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakValues()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/DrawableStore$2;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/render/DrawableStore$2;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;)V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->drawableAvatarStubCache:Lcom/google/common/cache/LoadingCache;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->hasGL20:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;

    invoke-direct {v1, p5}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;-><init>(I)V

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;-><init>(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->primCache:Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-direct {v0, p0, p3}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;-><init>(Lcom/lumiyaviewer/lumiya/render/DrawableStore;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    if-eqz p4, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache;)V

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->glTerrainTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTerrainTextureCache;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->spatialObjectIndex:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    invoke-virtual {v0, v1, p6}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->EnableObjectIndex(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public setMeshCapURL(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->setCapURL(Ljava/lang/String;)V

    return-void
.end method
