.class Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache$TerrainGeometryRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TerrainGeometryRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;",
        "Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;",
        ">;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;",
            "Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->remove(Ljava/lang/Runnable;)Z

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public run()V
    .locals 2

    :try_start_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache$TerrainGeometryRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/render/terrain/TerrainPatchGeometry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchHeightMap;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache$TerrainGeometryRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainGeometryCache$TerrainGeometryRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method
