.class public Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
        "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
        "Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;)V

    return-void
.end method


# virtual methods
.method protected CancelRawResource(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method protected GetResourceSize(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)I
    .locals 1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getLoadedSize()I

    move-result v0

    return v0
.end method

.method protected bridge synthetic GetResourceSize(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;->GetResourceSize(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)I

    move-result v0

    return v0
.end method

.method protected bridge synthetic LoadResource(Ljava/lang/Object;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    check-cast p2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;->LoadResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    move-result-object v0

    return-object v0
.end method

.method protected LoadResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    invoke-direct {v0, p3, p2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V

    return-object v0
.end method

.method protected RequestRawResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method protected bridge synthetic RequestRawResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;->RequestRawResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method
