.class Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;
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
    name = "SculptGeometryRequest"
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
.field private volatile sculptData:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

.field private final sculptTextureParams:Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            "Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->sculptTextureParams:Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->sculptData:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public cancelRequest()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->remove(Ljava/lang/Runnable;)Z

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->sculptTextureParams:Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method public run()V
    .locals 3

    :try_start_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->sculptData:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-direct {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache$SculptGeometryRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method
