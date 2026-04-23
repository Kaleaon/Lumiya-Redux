.class public Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;
.super Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;


# instance fields
.field public uAnimationDataBlockIndex:I

.field public uAnimationDataBlockSize:I

.field public uBindShapeMatrix:I

.field public uJointMapArrayStride:I

.field public uJointMapOffset:I

.field public uJointMatricesArrayStride:I

.field public uJointMatricesColumnStride:I

.field public uJointMatricesOffset:I

.field public uRiggingDataBlockIndex:I

.field public uRiggingDataBlockSize:I

.field public vJoint:I

.field public vWeight:I


# direct methods
.method public constructor <init>(Z)V
    .locals 2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RiggedMeshVertexShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    if-eqz p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimOpaqueFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/Shader;Lcom/lumiyaviewer/lumiya/render/shaders/Shader;)V

    return-void

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    goto :goto_0
.end method


# virtual methods
.method protected bindVariables()V
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const v5, 0x8a40

    const/4 v7, 0x1

    const/4 v1, 0x2

    const/4 v3, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->bindVariables()V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const-string/jumbo v2, "vWeight"

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->vWeight:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const-string/jumbo v2, "vJoint"

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->vJoint:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const-string/jumbo v2, "uBindShapeMatrix"

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uBindShapeMatrix:I

    new-array v0, v7, [I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const-string/jumbo v4, "AnimationData"

    invoke-static {v2, v4}, Landroid/opengl/GLES30;->glGetUniformBlockIndex(ILjava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uAnimationDataBlockIndex:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uAnimationDataBlockIndex:I

    invoke-static {v2, v4, v5, v0, v3}, Landroid/opengl/GLES30;->glGetActiveUniformBlockiv(III[II)V

    aget v2, v0, v3

    iput v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uAnimationDataBlockSize:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uAnimationDataBlockIndex:I

    invoke-static {v2, v4, v7}, Landroid/opengl/GLES30;->glUniformBlockBinding(III)V

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const-string/jumbo v4, "RiggingData"

    invoke-static {v2, v4}, Landroid/opengl/GLES30;->glGetUniformBlockIndex(ILjava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uRiggingDataBlockIndex:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uRiggingDataBlockIndex:I

    invoke-static {v2, v4, v5, v0, v3}, Landroid/opengl/GLES30;->glGetActiveUniformBlockiv(III[II)V

    aget v0, v0, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uRiggingDataBlockSize:I

    new-array v2, v1, [I

    new-array v5, v1, [I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    new-array v4, v1, [Ljava/lang/String;

    const-string/jumbo v6, "jointMap"

    aput-object v6, v4, v3

    const-string/jumbo v6, "jointMatrices"

    aput-object v6, v4, v7

    invoke-static {v0, v4, v2, v3}, Landroid/opengl/GLES30;->glGetUniformIndices(I[Ljava/lang/String;[II)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const v4, 0x8a3b

    move v6, v3

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES30;->glGetActiveUniformsiv(II[III[II)V

    aget v0, v5, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMapOffset:I

    aget v0, v5, v7

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMatricesOffset:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const v4, 0x8a3c

    move v6, v3

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES30;->glGetActiveUniformsiv(II[III[II)V

    aget v0, v5, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMapArrayStride:I

    aget v0, v5, v7

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMatricesArrayStride:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    const v4, 0x8a3d

    move v6, v3

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES30;->glGetActiveUniformsiv(II[III[II)V

    aget v0, v5, v7

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMatricesColumnStride:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->handle:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uRiggingDataBlockIndex:I

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES30;->glUniformBlockBinding(III)V

    return-void
.end method
