.class public Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
        "Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;",
        ">;"
    }
.end annotation


# instance fields
.field private final geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

.field private final textureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;->textureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;->geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    return-void
.end method


# virtual methods
.method protected CreateNewRequest(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
            "Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
            "Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;->textureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;->geometryCache:Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache$PrimRequest;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;Lcom/lumiyaviewer/lumiya/res/geometry/GeometryCache;Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method

.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/geometry/PrimCache;->CreateNewRequest(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method
