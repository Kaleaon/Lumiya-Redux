.class public Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;,
        Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;,
        Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SimpleGeometryRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
        "Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;",
        ">;"
    }
.end annotation


# instance fields
.field private final meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;->meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    return-void
.end method


# virtual methods
.method protected CreateNewRequest(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            "Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            "Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->isMesh()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;->meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-direct {v0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->isSculpt()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;

    invoke-direct {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SimpleGeometryRequest;

    invoke-direct {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SimpleGeometryRequest;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method

.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;->CreateNewRequest(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method
