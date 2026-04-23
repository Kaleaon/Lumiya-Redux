.class public Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;


# instance fields
.field private final drawableTextureParams:Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

.field private glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

.field private volatile hasAlphaLayer:Z

.field private volatile loadedTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

.field private textureRequested:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->textureRequested:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->loadedTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->hasAlphaLayer:Z

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->drawableTextureParams:Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    return-void
.end method


# virtual methods
.method public GLCleanup()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    :cond_0
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->textureRequested:Z

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->loadedTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->hasAlphaLayer:Z

    return-void
.end method

.method public final GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Z
    .locals 2

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->loadedTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->GLDraw()V

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->textureRequested:Z

    if-nez v0, :cond_1

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->textureRequested:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->glTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->drawableTextureParams:Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 2

    const/4 v1, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->loadedTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->hasAlphaLayer()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->hasAlphaLayer:Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p1, :cond_0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->loadedTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->hasAlphaLayer:Z

    goto :goto_0
.end method

.method hasAlphaLayer()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->hasAlphaLayer:Z

    return v0
.end method
