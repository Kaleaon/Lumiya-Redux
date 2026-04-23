.class public Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;
.super Ljava/lang/Object;


# static fields
.field private static final riggingDataPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InternPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private glRiggingDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final hasExtendedBones:Z

.field private final hashCode:I

.field private final jointMatrices:[F
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final joints:[I
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private mappedJointMatrices:[F

.field private mappedJointVectors:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->riggingDataPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    return-void
.end method

.method private constructor <init>([I[FZ)V
    .locals 1
    .param p1    # [I
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # [F
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->glRiggingDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->jointMatrices:[F

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->hasExtendedBones:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->calcHashCode()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->hashCode:I

    return-void
.end method

.method private PrepareRiggingUniformBuffer(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .locals 11

    const/4 v10, 0x4

    const/4 v1, 0x0

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    new-instance v4, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v0, v3, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uRiggingDataBlockSize:I

    invoke-direct {v4, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    array-length v2, v2

    if-ge v0, v2, :cond_0

    iget v2, v3, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMapOffset:I

    iget v5, v3, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMapArrayStride:I

    mul-int/2addr v5, v0

    add-int/2addr v2, v5

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    aget v5, v5, v0

    invoke-virtual {v4, v2, v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putRawInt(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    array-length v2, v2

    if-ge v0, v2, :cond_2

    iget v2, v3, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMatricesOffset:I

    iget v5, v3, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMatricesArrayStride:I

    mul-int/2addr v5, v0

    add-int/2addr v2, v5

    div-int/lit8 v5, v2, 0x4

    move v2, v1

    :goto_2
    if-ge v2, v10, :cond_1

    iget v6, v3, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uJointMatricesColumnStride:I

    mul-int/2addr v6, v2

    div-int/lit8 v6, v6, 0x4

    add-int/2addr v6, v5

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->jointMatrices:[F

    mul-int/lit8 v8, v0, 0x10

    mul-int/lit8 v9, v2, 0x4

    add-int/2addr v8, v9

    invoke-virtual {v4, v6, v7, v8, v10}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromFloatArray(I[FII)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-object v4
.end method

.method private calcHashCode()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->jointMatrices:[F

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public static create([I[FZ)Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;
    .locals 2
    .param p0    # [I
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # [F
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->riggingDataPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    invoke-direct {v1, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;-><init>([I[FZ)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    return-object v0
.end method


# virtual methods
.method PrepareInfluenceBuffers(Lcom/lumiyaviewer/lumiya/render/RenderContext;[F)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;->uBindShapeMatrix:I

    const/4 v1, 0x1

    invoke-static {v0, v1, v3, p2, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;->uJointVectors:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    array-length v1, v1

    div-int/lit8 v1, v1, 0x4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glUniform4fv(II[FI)V

    return-void
.end method

.method public SetupBuffers30(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->glRiggingDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->PrepareRiggingUniformBuffer(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->glRiggingDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->glRiggingDataBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindUniform(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V

    return-void
.end method

.method UpdateRigged(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;[FLcom/lumiyaviewer/rawbuffers/DirectByteBuffer;I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    invoke-virtual {p1, p3, p4, p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->UpdateRigged(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;I[F[F)V

    return-void
.end method

.method UpdateRiggedMatrices(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)V
    .locals 8

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    :cond_1
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->jointWorldMatrix:[F

    move v6, v7

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    array-length v0, v0

    if-ge v6, v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    aget v0, v0, v6

    if-ltz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    mul-int/lit8 v1, v6, 0x10

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    aget v3, v3, v6

    mul-int/lit8 v3, v3, 0x10

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->jointMatrices:[F

    mul-int/lit8 v5, v6, 0x10

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    :goto_1
    move v0, v7

    :goto_2
    const/4 v1, 0x3

    if-ge v0, v1, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    mul-int/lit8 v3, v6, 0x3

    mul-int/lit8 v3, v3, 0x4

    mul-int/lit8 v4, v0, 0x4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    mul-int/lit8 v5, v6, 0x10

    add-int/2addr v5, v0

    add-int/lit8 v5, v5, 0x0

    aget v4, v4, v5

    aput v4, v1, v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    mul-int/lit8 v3, v6, 0x3

    mul-int/lit8 v3, v3, 0x4

    mul-int/lit8 v4, v0, 0x4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    mul-int/lit8 v5, v6, 0x10

    add-int/2addr v5, v0

    add-int/lit8 v5, v5, 0x4

    aget v4, v4, v5

    aput v4, v1, v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    mul-int/lit8 v3, v6, 0x3

    mul-int/lit8 v3, v3, 0x4

    mul-int/lit8 v4, v0, 0x4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x2

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    mul-int/lit8 v5, v6, 0x10

    add-int/2addr v5, v0

    add-int/lit8 v5, v5, 0x8

    aget v4, v4, v5

    aput v4, v1, v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointVectors:[F

    mul-int/lit8 v3, v6, 0x3

    mul-int/lit8 v3, v3, 0x4

    mul-int/lit8 v4, v0, 0x4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    mul-int/lit8 v5, v6, 0x10

    add-int/2addr v5, v0

    add-int/lit8 v5, v5, 0xc

    aget v4, v4, v5

    aput v4, v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->mappedJointMatrices:[F

    mul-int/lit8 v1, v6, 0x10

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    goto :goto_1

    :cond_3
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto/16 :goto_0

    :cond_4
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    :cond_1
    return v0

    :cond_2
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->jointMatrices:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->jointMatrices:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    :cond_3
    return v0
.end method

.method final fitsGL20()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->joints:[I

    array-length v0, v0

    const/16 v1, 0x34

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final hasExtendedBones()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->hasExtendedBones:Z

    return v0
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->hashCode:I

    return v0
.end method
