.class public Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;
.super Ljava/lang/Object;


# static fields
.field public static final RENDER_PASS_ALL:I = 0x3

.field public static final RENDER_PASS_OPAQUE:I = 0x1

.field public static final RENDER_PASS_TRANSPARENT:I = 0x2


# instance fields
.field private final FaceColorsIDs:[I

.field private final FaceCount:I

.field private final FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

.field private final FaceUVMatrices:[F

.field private drawingTextureEnabled:Z

.field private firstFace:Z

.field private final isRiggedMesh:Z

.field private final isSingleFace:Z

.field private final riggingFitsGL20:Z

.field private final singleFaceColor:I

.field private final singleFaceMatrix:[F

.field private final singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

.field private final volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;)V
    .locals 9

    const/4 v1, 0x0

    const/4 v5, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isFacesCombined()Z

    move-result v2

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh:Z

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->riggingFitsGL20()Z

    move-result v0

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->riggingFitsGL20:Z

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->getFaceCount()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getTextures()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->GetDefaultTexture()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v4

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->isSingleFace()Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz v2, :cond_4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isSingleFace:Z

    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    invoke-virtual {v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->GetFace(I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRGBA(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)I

    move-result v2

    iput v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceColor:I

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getTextureID(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Ljava/util/UUID;

    move-result-object v2

    if-eqz v2, :cond_2

    sget-object v3, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    invoke-direct {v3, v2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    :goto_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    invoke-direct {p0, v4, v0, v2, v1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->initFaceUVMatrix(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;[FI)V

    :goto_2
    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    :cond_0
    :goto_3
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    goto :goto_1

    :cond_3
    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceColor:I

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    goto :goto_2

    :cond_4
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isSingleFace:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceColor:I

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    mul-int/lit8 v0, v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    move v0, v1

    move v2, v1

    :goto_4
    iget v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    if-ge v0, v5, :cond_0

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->getFaceID(I)I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->GetFace(I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v5

    if-eqz v5, :cond_6

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    invoke-virtual {v5, v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRGBA(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)I

    move-result v7

    aput v7, v6, v2

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    add-int/lit8 v7, v2, 0x1

    aput v1, v6, v7

    invoke-virtual {v5, v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getTextureID(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Ljava/util/UUID;

    move-result-object v6

    if-eqz v6, :cond_5

    sget-object v7, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {v6, v7}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v6

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    new-instance v8, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    invoke-direct {v8, v6}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)V

    aput-object v8, v7, v0

    :cond_5
    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    mul-int/lit8 v7, v0, 0x10

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->initFaceUVMatrix(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;[FI)V

    :cond_6
    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_7
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isSingleFace:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceColor:I

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    mul-int/lit8 v0, v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    goto/16 :goto_3
.end method

.method private DrawFace(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;ZIILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;[FII)I
    .locals 10

    move/from16 v0, p6

    move-object/from16 v1, p7

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->getFaceRenderMask(ILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)I

    move-result v3

    and-int v2, v3, p10

    if-nez v2, :cond_0

    return v3

    :cond_0
    const/4 v2, 0x0

    if-nez p4, :cond_5

    iget-boolean v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v4, :cond_4

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vColor:I

    shr-int/lit8 v5, p6, 0x0

    and-int/lit16 v5, v5, 0xff

    rsub-int v5, v5, 0xff

    int-to-float v5, v5

    const/high16 v6, 0x437f0000    # 255.0f

    div-float/2addr v5, v6

    shr-int/lit8 v6, p6, 0x8

    and-int/lit16 v6, v6, 0xff

    rsub-int v6, v6, 0xff

    int-to-float v6, v6

    const/high16 v7, 0x437f0000    # 255.0f

    div-float/2addr v6, v7

    shr-int/lit8 v7, p6, 0x10

    and-int/lit16 v7, v7, 0xff

    rsub-int v7, v7, 0xff

    int-to-float v7, v7

    const/high16 v8, 0x437f0000    # 255.0f

    div-float/2addr v7, v8

    shr-int/lit8 v8, p6, 0x18

    and-int/lit16 v8, v8, 0xff

    rsub-int v8, v8, 0xff

    int-to-float v8, v8

    const/high16 v9, 0x437f0000    # 255.0f

    div-float/2addr v8, v9

    invoke-static {v4, v5, v6, v7, v8}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    :goto_0
    if-eqz p7, :cond_1

    move-object/from16 v0, p7

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v2, 0x1

    :cond_1
    :goto_1
    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->drawingTextureEnabled:Z

    if-ne v2, v4, :cond_2

    iget-boolean v4, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->firstFace:Z

    if-eqz v4, :cond_3

    :cond_2
    iget-boolean v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v4, :cond_8

    if-nez v2, :cond_7

    const/16 v4, 0xde1

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->setTextureEnabled(Z)V

    :goto_2
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->drawingTextureEnabled:Z

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->firstFace:Z

    :cond_3
    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v2, :cond_b

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uTexMatrix:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object/from16 v0, p8

    move/from16 v1, p9

    invoke-static {v2, v4, v5, v0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    const/4 v2, -0x1

    if-ne p5, v2, :cond_a

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLDrawAll20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :goto_3
    return v3

    :cond_4
    shr-int/lit8 v4, p6, 0x0

    and-int/lit16 v4, v4, 0xff

    rsub-int v4, v4, 0xff

    int-to-float v4, v4

    const/high16 v5, 0x437f0000    # 255.0f

    div-float/2addr v4, v5

    shr-int/lit8 v5, p6, 0x8

    and-int/lit16 v5, v5, 0xff

    rsub-int v5, v5, 0xff

    int-to-float v5, v5

    const/high16 v6, 0x437f0000    # 255.0f

    div-float/2addr v5, v6

    shr-int/lit8 v6, p6, 0x10

    and-int/lit16 v6, v6, 0xff

    rsub-int v6, v6, 0xff

    int-to-float v6, v6

    const/high16 v7, 0x437f0000    # 255.0f

    div-float/2addr v6, v7

    shr-int/lit8 v7, p6, 0x18

    and-int/lit16 v7, v7, 0xff

    rsub-int v7, v7, 0xff

    int-to-float v7, v7

    const/high16 v8, 0x437f0000    # 255.0f

    div-float/2addr v7, v8

    invoke-static {v4, v5, v6, v7}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    goto :goto_0

    :cond_5
    iget-boolean v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v4, :cond_6

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vColor:I

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    const v8, 0x3f19999a    # 0.6f

    invoke-static {v4, v5, v6, v7, v8}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    goto :goto_1

    :cond_6
    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    const v7, 0x3f19999a    # 0.6f

    invoke-static {v4, v5, v6, v7}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    goto :goto_1

    :cond_7
    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->setTextureEnabled(Z)V

    goto :goto_2

    :cond_8
    if-eqz v2, :cond_9

    const/16 v4, 0xde1

    invoke-static {v4}, Landroid/opengl/GLES10;->glEnable(I)V

    const v4, 0x8078

    invoke-static {v4}, Landroid/opengl/GLES10;->glEnableClientState(I)V

    goto :goto_2

    :cond_9
    const/16 v4, 0xde1

    invoke-static {v4}, Landroid/opengl/GLES10;->glDisable(I)V

    const v4, 0x8078

    invoke-static {v4}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    goto/16 :goto_2

    :cond_a
    invoke-virtual {p2, p1, p5}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLDrawFace20(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V

    goto :goto_3

    :cond_b
    const/16 v2, 0x1702

    invoke-static {v2}, Landroid/opengl/GLES11;->glMatrixMode(I)V

    invoke-static {}, Landroid/opengl/GLES11;->glPushMatrix()V

    invoke-static/range {p8 .. p9}, Landroid/opengl/GLES11;->glLoadMatrixf([FI)V

    const/4 v2, -0x1

    if-ne p5, v2, :cond_c

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLDrawAll10(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :goto_4
    invoke-static {}, Landroid/opengl/GLES11;->glPopMatrix()V

    const/16 v2, 0x1700

    invoke-static {v2}, Landroid/opengl/GLES11;->glMatrixMode(I)V

    goto/16 :goto_3

    :cond_c
    invoke-virtual {p2, p1, p5, p3}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLDrawFace10(Lcom/lumiyaviewer/lumiya/render/RenderContext;ILcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;)V

    goto :goto_4
.end method

.method private DrawFaceFast20(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;IILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;[FII)I
    .locals 7

    invoke-direct {p0, p4, p5}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->getFaceRenderMask(ILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)I

    move-result v0

    and-int v1, v0, p8

    if-nez v1, :cond_0

    return v0

    :cond_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vColor:I

    shr-int/lit8 v2, p4, 0x0

    and-int/lit16 v2, v2, 0xff

    rsub-int v2, v2, 0xff

    int-to-float v2, v2

    const/high16 v3, 0x437f0000    # 255.0f

    div-float/2addr v2, v3

    shr-int/lit8 v3, p4, 0x8

    and-int/lit16 v3, v3, 0xff

    rsub-int v3, v3, 0xff

    int-to-float v3, v3

    const/high16 v4, 0x437f0000    # 255.0f

    div-float/2addr v3, v4

    shr-int/lit8 v4, p4, 0x10

    and-int/lit16 v4, v4, 0xff

    rsub-int v4, v4, 0xff

    int-to-float v4, v4

    const/high16 v5, 0x437f0000    # 255.0f

    div-float/2addr v4, v5

    shr-int/lit8 v5, p4, 0x18

    and-int/lit16 v5, v5, 0xff

    rsub-int v5, v5, 0xff

    int-to-float v5, v5

    const/high16 v6, 0x437f0000    # 255.0f

    div-float/2addr v5, v6

    invoke-static {v1, v2, v3, v4, v5}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    invoke-virtual {p1, p5}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->bindFaceTexture(Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)V

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uTexMatrix:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, p6, p7}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    const/4 v1, -0x1

    if-ne p3, v1, :cond_1

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLDrawAll20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :goto_0
    return v0

    :cond_1
    invoke-virtual {p2, p1, p3}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLDrawFace20(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V

    goto :goto_0
.end method

.method private getFaceRenderMask(ILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)I
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/high16 v3, -0x1000000

    and-int v2, p1, v3

    if-ne v2, v3, :cond_0

    return v1

    :cond_0
    and-int v2, p1, v3

    if-eqz v2, :cond_1

    move v1, v0

    :cond_1
    if-nez v1, :cond_2

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->hasAlphaLayer()Z

    move-result v1

    :cond_2
    if-eqz v1, :cond_3

    const/4 v0, 0x2

    :cond_3
    return v0
.end method

.method private initFaceUVMatrix(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;[FI)V
    .locals 9

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v8, -0x41000000    # -0.5f

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/16 v0, 0x10

    new-array v2, v0, [F

    invoke-static {v2, v3}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getOffsetU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v0

    add-float/2addr v0, v4

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getOffsetV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v1

    add-float/2addr v1, v4

    invoke-static {v2, v3, v0, v1, v5}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRepeatU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v0

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRepeatV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v1

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v2, v3, v0, v1, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRotation(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v0

    const v1, 0x3c8efa35

    div-float v4, v0, v1

    const/high16 v7, -0x40800000    # -1.0f

    move-object v0, p3

    move v1, p4

    move v6, v5

    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->rotateM([FI[FIFFFF)V

    invoke-static {p3, p4, v8, v8, v5}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    return-void
.end method


# virtual methods
.method public final ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V

    :cond_0
    return-void
.end method

.method public final Draw(Lcom/lumiyaviewer/lumiya/render/RenderContext;ZLcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;I)I
    .locals 12

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->firstFace:Z

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_4

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->getMatrices()[F

    move-result-object v0

    move-object v1, v0

    :goto_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->riggingFitsGL20:Z

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    :goto_1
    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uMVPMatrix:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelApplyMatrix(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uObjWorldMatrix:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldApplyMatrix(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uObjCoordScale:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjScaleApplyVector(I)V

    if-eqz v1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    iget v3, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->uNumSectionMatrices:I

    array-length v4, v1

    div-int/lit8 v4, v4, 0x10

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->uSectionMatrices:I

    array-length v3, v1

    div-int/lit8 v3, v3, 0x10

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v0, v3, v4, v1, v5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    :cond_0
    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLBindBuffers20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    move-result-object v3

    :goto_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->drawingTextureEnabled:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isSingleFace:Z

    if-eqz v0, :cond_5

    iget v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceColor:I

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    const/4 v5, -0x1

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move/from16 v10, p4

    invoke-direct/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->DrawFace(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;ZIILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;[FII)I

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    move-object v1, v0

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    goto :goto_1

    :cond_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    goto :goto_1

    :cond_4
    invoke-virtual {v2, p1, p3}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLBindBuffers10(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;)Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    move-result-object v3

    goto :goto_2

    :cond_5
    const/4 v0, 0x0

    const/4 v5, 0x0

    move v11, v0

    :goto_3
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    if-ge v5, v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    mul-int/lit8 v1, v5, 0x2

    aget v6, v0, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    aget-object v7, v0, v5

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    mul-int/lit8 v9, v5, 0x10

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move/from16 v10, p4

    invoke-direct/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->DrawFace(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;ZIILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;[FII)I

    move-result v0

    or-int/2addr v0, v11

    add-int/lit8 v5, v5, 0x1

    move v11, v0

    goto :goto_3

    :cond_6
    return v11
.end method

.method public final DrawFast20(Lcom/lumiyaviewer/lumiya/render/RenderContext;ZLcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;I)I
    .locals 10

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v7, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->getMatrices()[F

    move-result-object v1

    :cond_0
    if-ne p4, v0, :cond_4

    :goto_0
    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh:Z

    if-eqz v3, :cond_5

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->riggingFitsGL20:Z

    if-eqz v3, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    :goto_1
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    if-eq v3, v0, :cond_1

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uMVPMatrix:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelApplyMatrix(I)V

    :cond_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uObjWorldMatrix:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldApplyMatrix(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uObjCoordScale:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjScaleApplyVector(I)V

    if-eqz v1, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->uNumSectionMatrices:I

    array-length v3, v1

    div-int/lit8 v3, v3, 0x10

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->uSectionMatrices:I

    array-length v3, v1

    div-int/lit8 v3, v3, 0x10

    invoke-static {v0, v3, v7, v1, v7}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    :cond_2
    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLBindBuffers20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isSingleFace:Z

    if-eqz v0, :cond_9

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceColor:I

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    const/4 v3, -0x1

    move-object v0, p0

    move-object v1, p1

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->DrawFaceFast20(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;IILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;[FII)I

    move-result v9

    :cond_3
    return v9

    :cond_4
    move v0, v7

    goto :goto_0

    :cond_5
    if-eqz v1, :cond_7

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    goto :goto_1

    :cond_6
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    goto :goto_1

    :cond_7
    if-eqz v0, :cond_8

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    goto :goto_1

    :cond_8
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    goto :goto_1

    :cond_9
    move v3, v7

    move v9, v7

    :goto_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    if-ge v3, v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    mul-int/lit8 v1, v3, 0x2

    aget v4, v0, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    aget-object v5, v0, v3

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    mul-int/lit8 v7, v3, 0x10

    move-object v0, p0

    move-object v1, p1

    move v8, p4

    invoke-direct/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->DrawFaceFast20(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;IILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;[FII)I

    move-result v0

    or-int v7, v9, v0

    add-int/lit8 v3, v3, 0x1

    move v9, v7

    goto :goto_2
.end method

.method public final DrawRigged30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)I
    .locals 13
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const/4 v4, 0x1

    const/high16 v12, 0x437f0000    # 255.0f

    const/4 v1, 0x0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    move v0, v1

    move v2, v1

    move v3, v1

    :goto_0
    iget v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceCount:I

    if-ge v0, v6, :cond_2

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceColorsIDs:[I

    mul-int/lit8 v7, v0, 0x2

    aget v6, v6, v7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceTextures:[Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    aget-object v7, v7, v0

    invoke-direct {p0, v6, v7}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->getFaceRenderMask(ILcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)I

    move-result v8

    or-int/2addr v3, v8

    and-int/2addr v8, p2

    if-eqz v8, :cond_1

    if-nez v2, :cond_0

    invoke-virtual {v5, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLBindBuffersRigged30(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    move v2, v4

    :cond_0
    iget-object v8, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vColor:I

    shr-int/lit8 v9, v6, 0x0

    and-int/lit16 v9, v9, 0xff

    rsub-int v9, v9, 0xff

    int-to-float v9, v9

    div-float/2addr v9, v12

    shr-int/lit8 v10, v6, 0x8

    and-int/lit16 v10, v10, 0xff

    rsub-int v10, v10, 0xff

    int-to-float v10, v10

    div-float/2addr v10, v12

    shr-int/lit8 v11, v6, 0x10

    and-int/lit16 v11, v11, 0xff

    rsub-int v11, v11, 0xff

    int-to-float v11, v11

    div-float/2addr v11, v12

    shr-int/lit8 v6, v6, 0x18

    and-int/lit16 v6, v6, 0xff

    rsub-int v6, v6, 0xff

    int-to-float v6, v6

    div-float/2addr v6, v12

    invoke-static {v8, v9, v10, v11, v6}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    invoke-virtual {p1, v7}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->bindFaceTexture(Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)V

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->uTexMatrix:I

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    mul-int/lit8 v8, v0, 0x10

    invoke-static {v6, v4, v1, v7, v8}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    invoke-virtual {v5, p1, v0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->GLDrawRiggedFace30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v3
.end method

.method public IntersectRay(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IntersectRay(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-boolean v1, v0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceKnown:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isSingleFace:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->singleFaceMatrix:[F

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;-><init>(Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;[FI)V

    return-object v1

    :cond_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isSingleFace:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    if-eqz v1, :cond_1

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->FaceUVMatrices:[F

    iget v3, v0, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;->faceID:I

    mul-int/lit8 v3, v3, 0x10

    invoke-direct {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;-><init>(Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;[FI)V

    return-object v1

    :cond_1
    return-object v0

    :cond_2
    return-object v0
.end method

.method public final UpdateRigged(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->UpdateRigged(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasExtendedBones()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->volumeGeometry:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->hasExtendedBones()Z

    move-result v0

    return v0
.end method

.method public final isRiggedMesh()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawablePrim;->isRiggedMesh:Z

    return v0
.end method
