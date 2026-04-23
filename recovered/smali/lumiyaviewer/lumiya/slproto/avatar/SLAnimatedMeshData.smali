.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;
.super Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;


# static fields
.field private static final BUF_INDEX:I = 0x1

.field private static final BUF_TEXCOORD:I = 0x2

.field private static final BUF_VERTEX:I = 0x0

.field private static final BUF_WEIGHTS:I = 0x3


# instance fields
.field private VBOLoaded:Z

.field private final animated:Z

.field private final animatedVertexData:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field private glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private texCoordsDirty:Z

.field private verticesDirty:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;Z)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->VBOLoaded:Z

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->texCoordsDirty:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->verticesDirty:Z

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->hasWeights:Z

    if-eqz v1, :cond_0

    xor-int/lit8 v0, p2, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animated:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animated:Z

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animatedVertexData:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->verticesDirty:Z

    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animatedVertexData:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    goto :goto_0
.end method

.method private setupVBOs(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x2

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->VBOLoaded:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->texCoordsDirty:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->verticesDirty:Z

    if-eqz v0, :cond_7

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->VBOLoaded:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->verticesDirty:Z

    if-eqz v0, :cond_2

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animated:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animatedVertexData:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    aget-object v1, v1, v3

    if-nez v1, :cond_9

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    aput-object v2, v1, v3

    :cond_2
    :goto_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->VBOLoaded:Z

    if-nez v0, :cond_4

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->hasWeights:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    aput-object v1, v0, v5

    :cond_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->VBOLoaded:Z

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->texCoordsDirty:Z

    if-eqz v0, :cond_6

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    aget-object v0, v0, v4

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    aput-object v1, v0, v4

    :cond_6
    :goto_2
    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->VBOLoaded:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->verticesDirty:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->texCoordsDirty:Z

    :cond_7
    return-void

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    goto :goto_0

    :cond_9
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animated:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    aget-object v0, v0, v3

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Reload(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto :goto_1

    :cond_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    aget-object v0, v0, v4

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Reload(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    goto :goto_2
.end method


# virtual methods
.method public final GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)V
    .locals 8

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->setupVBOs(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    if-eqz p2, :cond_b

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    const/16 v0, 0xde1

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p2, p1}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Z

    move-result v1

    if-nez v1, :cond_b

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_1

    const/16 v0, 0xde1

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    :cond_1
    const/4 v0, 0x0

    move v7, v0

    :goto_0
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->VBOLoaded:Z

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->setTextureEnabled(Z)V

    if-nez v7, :cond_2

    const/16 v0, 0xde1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :cond_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uObjWorldMatrix:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldApplyMatrix(I)V

    if-eqz v7, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vColor:I

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vPosition:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vNormal:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/16 v6, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    if-eqz v7, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vTexCoord:I

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x8

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vWeight:I

    const/4 v3, 0x1

    const/16 v4, 0x1406

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uJointMap:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    array-length v1, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glUniform1iv(II[II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uJointMapLength:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    array-length v1, v1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uUseWeight:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->numFaces:I

    mul-int/lit8 v1, v1, 0x3

    const/4 v2, 0x4

    const/16 v3, 0x1403

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    :cond_3
    :goto_4
    if-eqz v7, :cond_4

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_a

    const/16 v0, 0xde1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :cond_4
    :goto_5
    return-void

    :cond_5
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vColor:I

    const/high16 v1, 0x3f000000    # 0.5f

    const/high16 v2, 0x3f000000    # 0.5f

    const/high16 v3, 0x3f000000    # 0.5f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    goto/16 :goto_1

    :cond_6
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vTexCoord:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    goto :goto_2

    :cond_7
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->vWeight:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->uUseWeight:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    goto :goto_3

    :cond_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->hasWeights:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animatedVertexData:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    :goto_6
    if-eqz v0, :cond_3

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES10;->glColor4f(FFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const v2, 0x8074

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const v2, 0x8075

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/16 v6, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    const v2, 0x8078

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x8

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->glBuffers:[Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->numFaces:I

    mul-int/lit8 v3, v1, 0x3

    const/4 v2, 0x4

    const/16 v4, 0x1403

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIII)V

    const v0, 0x8075

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    const v0, 0x8078

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    goto/16 :goto_4

    :cond_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    goto :goto_6

    :cond_a
    const/16 v0, 0xde1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES10;->glBindTexture(II)V

    const/16 v0, 0xde1

    invoke-static {v0}, Landroid/opengl/GLES10;->glDisable(I)V

    goto/16 :goto_5

    :cond_b
    move v7, v0

    goto/16 :goto_0
.end method

.method public getAnimatedVertexData()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->animatedVertexData:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-object v0
.end method

.method public setVerticesDirty()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->verticesDirty:Z

    return-void
.end method
