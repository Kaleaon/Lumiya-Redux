.class Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PrimRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
        "Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;",
        ">;",
        "Ljava/lang/Runnable;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;"
    }
.end annotation


# instance fields
.field private volatile geometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

.field private final geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

.field private final glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;",
            "Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
            "Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p3, p4}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->geometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public cancelRequest()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->remove(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getVolumeParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v0

    invoke-virtual {v1, v0, p0}, Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method public run()V
    .locals 3

    :try_start_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->geometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-direct {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method
