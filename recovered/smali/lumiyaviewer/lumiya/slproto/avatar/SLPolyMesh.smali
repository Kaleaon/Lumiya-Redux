.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;
.super Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;


# instance fields
.field protected hasWeights:Z

.field public jointMap:[I

.field private morphIndices:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private morphs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

.field protected weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;


# direct methods
.method public constructor <init>(Ljava/io/DataInputStream;Ljava/io/DataInputStream;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

    invoke-direct {v0, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphIndices:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v0

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v2

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v0

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v2

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v0

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v2

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v3

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v4

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v5, v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->hasWeights:Z

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    mul-int/lit8 v2, v2, 0x18

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    mul-int/lit8 v2, v2, 0x8

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->read(Ljava/io/InputStream;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->read(Ljava/io/InputStream;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->hasWeights:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    mul-int/lit8 v2, v2, 0x4

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->read(Ljava/io/InputStream;)V

    :cond_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numFaces:I

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numFaces:I

    mul-int/lit8 v2, v2, 0x2

    mul-int/lit8 v2, v2, 0x3

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->read(Ljava/io/InputStream;)V

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    new-array v0, v5, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

    move v3, v1

    move v0, v1

    move-object v2, p1

    :goto_1
    if-ge v3, v5, :cond_3

    const/16 v4, 0x32

    if-lt v0, v4, :cond_1

    if-eqz p2, :cond_1

    move v0, v1

    move-object v2, p2

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v6

    aget-object v4, v4, v6

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

    invoke-direct {v6, v4, p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;Ljava/io/DataInputStream;)V

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

    aput-object v6, v7, v3

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphIndices:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v0, 0x1

    add-int/lit8 v0, v3, 0x1

    move v3, v0

    move v0, v4

    goto :goto_1

    :cond_2
    move v0, v1

    goto/16 :goto_0

    :cond_3
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    new-array v3, v0, [I

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    :goto_2
    if-ge v1, v0, :cond_4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    aput v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SLPolyMesh: Loaded, numVerts = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", faces = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numFaces:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", morphs = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public applyMorphData(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;[FLcom/lumiyaviewer/lumiya/render/GLTexture;)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

    aget-object v1, v1, v0

    aget v2, p2, v0

    invoke-virtual {v1, p1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->applyMorphData(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;FLcom/lumiyaviewer/lumiya/render/GLTexture;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public applySkeleton(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;[F)V
    .locals 6

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->hasWeights:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->getAnimatedVertexData()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v2

    if-eqz v2, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->applyMorphingTransform(ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;[I[F)V

    :cond_0
    return-void
.end method

.method public applySkeletonSlow(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;[F)V
    .locals 16

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->hasWeights:Z

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    if-eqz v2, :cond_4

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->getAnimatedVertexData()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v2

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v9

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v12

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v13

    const/16 v2, 0x10

    new-array v2, v2, [F

    const/16 v3, 0x10

    new-array v4, v3, [F

    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    const/4 v3, 0x0

    move v8, v3

    :goto_0
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    if-ge v8, v3, :cond_4

    invoke-virtual {v9, v8}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v10

    float-to-double v14, v10

    cmpl-double v3, v14, v6

    if-eqz v3, :cond_5

    float-to-double v6, v10

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-float v3, v6

    sub-float v6, v10, v3

    float-to-int v3, v3

    add-int/lit8 v3, v3, -0x1

    const/4 v5, 0x0

    if-ltz v3, :cond_0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    array-length v7, v7

    if-ge v3, v7, :cond_0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    aget v5, v5, v3

    :cond_0
    add-int/lit8 v7, v3, 0x1

    if-ltz v7, :cond_2

    add-int/lit8 v7, v3, 0x1

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    array-length v11, v11

    if-ge v7, v11, :cond_2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->jointMap:[I

    add-int/lit8 v3, v3, 0x1

    aget v3, v7, v3

    :goto_1
    float-to-double v10, v10

    mul-int/lit8 v5, v5, 0x10

    mul-int/lit8 v7, v3, 0x10

    if-ne v5, v7, :cond_3

    const/4 v3, 0x0

    const/16 v6, 0x10

    move-object/from16 v0, p2

    invoke-static {v0, v5, v4, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    mul-int/lit8 v3, v8, 0x6

    add-int/lit8 v3, v3, 0x0

    invoke-virtual {v12, v3}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v3

    const/4 v5, 0x0

    aput v3, v2, v5

    mul-int/lit8 v3, v8, 0x6

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v12, v3}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v3

    const/4 v5, 0x1

    aput v3, v2, v5

    mul-int/lit8 v3, v8, 0x6

    add-int/lit8 v3, v3, 0x2

    invoke-virtual {v12, v3}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v3

    const/4 v5, 0x2

    aput v3, v2, v5

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v5, 0x3

    aput v3, v2, v5

    const/4 v3, 0x4

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v6, v2

    invoke-static/range {v2 .. v7}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    mul-int/lit8 v3, v8, 0x6

    add-int/lit8 v3, v3, 0x0

    const/4 v5, 0x4

    aget v5, v2, v5

    invoke-virtual {v13, v3, v5}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    mul-int/lit8 v3, v8, 0x6

    add-int/lit8 v3, v3, 0x1

    const/4 v5, 0x5

    aget v5, v2, v5

    invoke-virtual {v13, v3, v5}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    mul-int/lit8 v3, v8, 0x6

    add-int/lit8 v3, v3, 0x2

    const/4 v5, 0x6

    aget v5, v2, v5

    invoke-virtual {v13, v3, v5}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    add-int/lit8 v3, v8, 0x1

    move v8, v3

    move-wide v6, v10

    goto/16 :goto_0

    :cond_2
    move v3, v5

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    :goto_3
    const/16 v14, 0x10

    if-ge v3, v14, :cond_1

    add-int v14, v5, v3

    aget v14, p2, v14

    const/high16 v15, 0x3f800000    # 1.0f

    sub-float/2addr v15, v6

    mul-float/2addr v14, v15

    add-int v15, v7, v3

    aget v15, p2, v15

    mul-float/2addr v15, v6

    add-float/2addr v14, v15

    aput v14, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_4
    return-void

    :cond_5
    move-wide v10, v6

    goto :goto_2
.end method

.method public getMorphIndex(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;)I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphIndices:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getNumMorphs()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->morphs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;

    array-length v0, v0

    return v0
.end method
