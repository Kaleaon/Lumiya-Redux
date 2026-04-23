.class public Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;


# instance fields
.field private final backgroundColor:I

.field private final hoverText:Ljava/lang/String;

.field private volatile hoverTextTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

.field private final textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

.field private textureRequested:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textureRequested:Z

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->hoverText:Ljava/lang/String;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->backgroundColor:I

    return-void
.end method


# virtual methods
.method public final DrawAtWorld(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFFLcom/lumiyaviewer/lumiya/render/MatrixStack;ZI)V
    .locals 8

    const/16 v0, 0x8

    new-array v0, v0, [F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    invoke-virtual {p6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v6

    invoke-virtual {p6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v7

    const/4 v1, 0x0

    aput p2, v0, v1

    const/4 v1, 0x1

    aput p3, v0, v1

    const/4 v1, 0x2

    aput p4, v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v4, 0x3

    aput v1, v0, v4

    const/4 v1, 0x4

    const/4 v5, 0x0

    move-object v4, v0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    const/4 v1, 0x5

    aget v2, v0, v1

    add-float/2addr v2, p5

    aput v2, v0, v1

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-static {v0, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_0
    const/4 v1, 0x3

    aget v1, v0, v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x3

    aget v2, v0, v2

    div-float v2, v1, v2

    const/4 v1, 0x1

    aget v1, v0, v1

    const/4 v3, 0x3

    aget v3, v0, v3

    div-float v3, v1, v3

    const/4 v1, 0x3

    aget v1, v0, v1

    const/4 v4, 0x0

    cmpl-float v1, v1, v4

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    aget v1, v0, v1

    const/4 v4, 0x3

    aget v0, v0, v4

    div-float v4, v1, v0

    move-object v0, p0

    move-object v1, p1

    move v5, p7

    move/from16 v6, p8

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFZI)V

    :cond_0
    return-void

    :cond_1
    const/4 v1, 0x0

    const/4 v5, 0x4

    move-object v2, v6

    move v3, v7

    move-object v4, v0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    goto :goto_0
.end method

.method public GLCleanup()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textureRequested:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->hoverTextTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    return-void
.end method

.method public final GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;FFFZI)V
    .locals 9

    const/4 v8, 0x1

    const/high16 v4, 0x40000000    # 2.0f

    const/4 v7, 0x0

    const/high16 v6, 0x437f0000    # 255.0f

    const/high16 v5, 0x3f800000    # 1.0f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textureRequested:Z

    if-nez v0, :cond_0

    iput-boolean v8, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textureRequested:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->textTextureCache:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->hoverText:Ljava/lang/String;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->backgroundColor:I

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->create(Ljava/lang/String;I)Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextTextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->hoverTextTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v4

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v3, 0x2

    aget v2, v2, v3

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v4

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/4 v4, 0x3

    aget v3, v3, v4

    int-to-float v3, v3

    div-float/2addr v2, v3

    iget-boolean v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v3, :cond_3

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->uPreTranslate:I

    invoke-static {v3, p2, p3, p4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->uScale:I

    invoke-static {v3, v1, v2, v5}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->uPostTranslate:I

    iget v2, v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;->baselineOffset:F

    invoke-static {v1, v7, v2, v7}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;->GLDraw()V

    if-eqz p5, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->uColor:I

    shr-int/lit8 v1, p6, 0x0

    and-int/lit16 v1, v1, 0xff

    int-to-float v1, v1

    div-float/2addr v1, v6

    shr-int/lit8 v2, p6, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, v6

    shr-int/lit8 v3, p6, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-float v3, v3

    div-float/2addr v3, v6

    shr-int/lit8 v4, p6, 0x18

    and-int/lit16 v4, v4, 0xff

    rsub-int v4, v4, 0xff

    int-to-float v4, v4

    div-float/2addr v4, v6

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->uColorize:I

    invoke-static {v0, v8}, Landroid/opengl/GLES20;->glUniform1i(II)V

    :goto_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/Quad;->DrawQuad(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->uColor:I

    invoke-static {v0, v5, v5, v5, v5}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->uColorize:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    goto :goto_0

    :cond_3
    invoke-static {}, Landroid/opengl/GLES10;->glLoadIdentity()V

    invoke-static {p2, p3, p4}, Landroid/opengl/GLES10;->glTranslatef(FFF)V

    invoke-static {v1, v2, v5}, Landroid/opengl/GLES10;->glScalef(FFF)V

    iget v1, v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;->baselineOffset:F

    invoke-static {v7, v1, v7}, Landroid/opengl/GLES10;->glTranslatef(FFF)V

    if-eqz p5, :cond_4

    shr-int/lit8 v1, p6, 0x0

    and-int/lit16 v1, v1, 0xff

    int-to-float v1, v1

    div-float/2addr v1, v6

    shr-int/lit8 v2, p6, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, v6

    shr-int/lit8 v3, p6, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-float v3, v3

    div-float/2addr v3, v6

    shr-int/lit8 v4, p6, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-float v4, v4

    div-float/2addr v4, v6

    sub-float v4, v5, v4

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    :goto_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;->GLDraw()V

    goto :goto_0

    :cond_4
    invoke-static {v5, v5, v5, v5}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    goto :goto_1
.end method

.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 2

    const/4 v1, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->hoverTextTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p1, :cond_0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableHoverText;->hoverTextTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTextTexture;

    goto :goto_0
.end method
