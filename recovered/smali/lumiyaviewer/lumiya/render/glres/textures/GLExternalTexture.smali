.class public Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;
.super Ljava/lang/Object;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xf
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture$1;
    }
.end annotation


# instance fields
.field private final handle:I

.field private final height:I

.field private final onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

.field private final surface:Landroid/view/Surface;

.field private final surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private final width:I


# direct methods
.method public constructor <init>(II)V
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    const/16 v9, 0x2601

    const/16 v2, 0x1908

    const/4 v4, 0x1

    const v0, 0x8d65

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture$1;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->width:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->height:I

    new-array v3, v4, [I

    invoke-static {v4, v3, v1}, Landroid/opengl/GLES11;->glGenTextures(I[II)V

    aget v3, v3, v1

    iput v3, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->handle:I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->bind()V

    const/16 v7, 0x1401

    const/4 v8, 0x0

    move v3, p1

    move v4, p2

    move v5, v1

    move v6, v2

    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES11;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const/16 v1, 0x2801

    invoke-static {v0, v1, v9}, Landroid/opengl/GLES11;->glTexParameteri(III)V

    const/16 v1, 0x2800

    invoke-static {v0, v1, v9}, Landroid/opengl/GLES11;->glTexParameteri(III)V

    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->handle:I

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->onFrameAvailableListener:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surface:Landroid/view/Surface;

    return-void
.end method


# virtual methods
.method public bind()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->handle:I

    const v1, 0x8d65

    invoke-static {v1, v0}, Landroid/opengl/GLES11;->glBindTexture(II)V

    return-void
.end method

.method public getCanvas()Landroid/graphics/Canvas;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surface:Landroid/view/Surface;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Surface;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->width:I

    return v0
.end method

.method public postCanvas(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surface:Landroid/view/Surface;

    invoke-virtual {v0, p1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public release()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surface:Landroid/view/Surface;

    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->release()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->handle:I

    aput v1, v0, v2

    invoke-static {v3, v0, v2}, Landroid/opengl/GLES11;->glDeleteTextures(I[II)V

    return-void
.end method

.method public update([F)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLExternalTexture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    return-void
.end method
