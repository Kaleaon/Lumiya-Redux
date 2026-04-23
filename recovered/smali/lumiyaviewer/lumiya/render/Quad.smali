.class public Lcom/lumiyaviewer/lumiya/render/Quad;
.super Ljava/lang/Object;


# static fields
.field private static drawOrder:[S

.field private static squareCoords:[F


# instance fields
.field private final indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x14

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/Quad;->squareCoords:[F

    const/4 v0, 0x6

    new-array v0, v0, [S

    fill-array-data v0, :array_1

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/Quad;->drawOrder:[S

    return-void

    :array_0
    .array-data 4
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x0
        0x0
        0x0
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 5

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/Quad;->squareCoords:[F

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x4

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/Quad;->squareCoords:[F

    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    invoke-virtual {v1, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    new-instance v1, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/Quad;->drawOrder:[S

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/render/Quad;->drawOrder:[S

    invoke-virtual {v2, v3}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    invoke-virtual {v2, v4}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    return-void
.end method


# virtual methods
.method public final DrawQuad(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 6

    const/16 v4, 0x1403

    const/4 v2, 0x4

    const/4 v5, 0x0

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/Quad;->drawOrder:[S

    array-length v1, v1

    invoke-virtual {v0, v2, v1, v4, v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/Quad;->drawOrder:[S

    array-length v3, v1

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIII)V

    goto :goto_0
.end method

.method public final DrawSingleQuadShader(Lcom/lumiyaviewer/lumiya/render/RenderContext;II)V
    .locals 7

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x14

    const/4 v6, 0x0

    move-object v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x14

    const/16 v6, 0xc

    move-object v1, p1

    move v2, p3

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/Quad;->drawOrder:[S

    array-length v1, v1

    const/4 v2, 0x4

    const/16 v3, 0x1403

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    :cond_0
    return-void
.end method

.method public EndDrawQuads(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 0

    return-void
.end method

.method public PrepareDrawQuads(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 14

    const/4 v6, 0x0

    const/16 v4, 0x1406

    const/16 v5, 0x14

    const/high16 v1, 0x3f800000    # 1.0f

    const/16 v7, 0xde1

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->vPosition:I

    const/4 v3, 0x3

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v9, v0, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->vTexCoord:I

    const/4 v10, 0x2

    const/16 v13, 0xc

    move-object v8, p1

    move v11, v4

    move v12, v5

    invoke-virtual/range {v7 .. v13}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->sTexture:I

    invoke-static {v0, v6}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {v7}, Landroid/opengl/GLES10;->glEnable(I)V

    invoke-static {v1, v1, v1, v1}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const v2, 0x8074

    const/4 v3, 0x3

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const v2, 0x8078

    const/4 v3, 0x2

    const/16 v6, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    const v0, 0x8078

    invoke-static {v0}, Landroid/opengl/GLES10;->glEnableClientState(I)V

    const/high16 v0, 0x46180000    # 9728.0f

    const/16 v1, 0x2800

    invoke-static {v7, v1, v0}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const/high16 v0, 0x46180000    # 9728.0f

    const/16 v1, 0x2801

    invoke-static {v7, v1, v0}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const v0, 0x46240400    # 10497.0f

    const/16 v1, 0x2802

    invoke-static {v7, v1, v0}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const v0, 0x46240400    # 10497.0f

    const/16 v1, 0x2803

    invoke-static {v7, v1, v0}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/Quad;->indexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto :goto_0
.end method
