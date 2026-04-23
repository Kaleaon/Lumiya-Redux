.class public Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache",
        "<",
        "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
        "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;",
        "Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;",
        ">;"
    }
.end annotation


# instance fields
.field private final drawableTextCache:Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;)V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->drawableTextCache:Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;

    return-void
.end method


# virtual methods
.method protected CancelRawResource(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->drawableTextCache:Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method protected GetResourceSize(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;)I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected bridge synthetic GetResourceSize(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->GetResourceSize(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;)I

    move-result v0

    return v0
.end method

.method protected bridge synthetic LoadResource(Ljava/lang/Object;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;

    check-cast p2, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;

    invoke-virtual {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->LoadResource(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    move-result-object v0

    return-object v0
.end method

.method protected LoadResource(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;
    .locals 3

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;->getBaselineOffset()F

    move-result v2

    invoke-direct {v0, p3, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;Landroid/graphics/Bitmap;F)V

    return-object v0
.end method

.method protected RequestRawResource(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->drawableTextCache:Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method protected bridge synthetic RequestRawResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->RequestRawResource(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method
