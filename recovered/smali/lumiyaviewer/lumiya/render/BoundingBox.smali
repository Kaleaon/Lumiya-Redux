.class public Lcom/lumiyaviewer/lumiya/render/BoundingBox;
.super Ljava/lang/Object;


# static fields
.field private static final cubeSize:F = 0.5f

.field private static cubeVertices:[F


# instance fields
.field private final vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

.field private final vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x6c

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->cubeVertices:[F

    return-void

    :array_0
    .array-data 4
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
    .end array-data
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 7

    const/4 v6, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->cubeVertices:[F

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x4

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->cubeVertices:[F

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->cubeVertices:[F

    array-length v2, v2

    invoke-virtual {v0, v6, v1, v6, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromFloatArray(I[FII)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0, v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;->vPosition:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    const v0, 0x8893

    invoke-static {v0, v6}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Unbind()V

    invoke-static {v6}, Landroid/opengl/GLES20;->glUseProgram(I)V

    return-void
.end method

.method public static EndOcclusionQueries(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-static {v1, v1, v1, v1}, Landroid/opengl/GLES30;->glColorMask(ZZZZ)V

    invoke-static {v1}, Landroid/opengl/GLES30;->glDepthMask(Z)V

    const/16 v0, 0x201

    invoke-static {v0}, Landroid/opengl/GLES30;->glDepthFunc(I)V

    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES30;->glEnable(I)V

    return-void
.end method

.method public static PrepareOcclusionQueries(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0, v0, v0, v0}, Landroid/opengl/GLES30;->glColorMask(ZZZZ)V

    invoke-static {v0}, Landroid/opengl/GLES30;->glDepthMask(Z)V

    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES30;->glDisable(I)V

    const/16 v0, 0x203

    invoke-static {v0}, Landroid/opengl/GLES30;->glDepthFunc(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;->uMVPMatrix:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelApplyMatrix(I)V

    return-void
.end method


# virtual methods
.method public OcclusionQuery(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;->uObjWorldMatrix:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldApplyMatrix(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;->uObjCoordScale:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjScaleApplyVector(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->BeginOcclusionQuery(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->cubeVertices:[F

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    const/4 v1, 0x4

    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->EndOcclusionQuery()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Unbind()V

    return-void
.end method
