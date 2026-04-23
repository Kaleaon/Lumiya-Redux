.class Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MeshGeometryRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
        "Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;",
        ">;",
        "Ljava/lang/Runnable;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;"
    }
.end annotation


# instance fields
.field private final meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

.field private volatile meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            "Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public cancelRequest()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->remove(Ljava/lang/Runnable;)Z

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->meshCache:Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    invoke-virtual {v1, v0, p0}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method public run()V
    .locals 2

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$MeshGeometryRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method
