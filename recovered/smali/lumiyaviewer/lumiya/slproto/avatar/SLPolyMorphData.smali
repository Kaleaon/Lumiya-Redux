.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;
.super Ljava/lang/Object;


# instance fields
.field private indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field private isMasked:Z

.field private mesh:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

.field private morphID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

.field private numVertices:I

.field private texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field private vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;Ljava/io/DataInputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->morphID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->mesh:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    invoke-virtual {p3}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->isMasked:Z

    invoke-virtual {p3}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->numVertices:I

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->numVertices:I

    mul-int/lit8 v1, v1, 0x18

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->numVertices:I

    mul-int/lit8 v1, v1, 0x8

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->numVertices:I

    mul-int/lit8 v1, v1, 0x4

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->read(Ljava/io/InputStream;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->read(Ljava/io/InputStream;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->read(Ljava/io/InputStream;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SLPolyMorphData: Loaded morph \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', vertices = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->numVertices:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public applyMorphData(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;FLcom/lumiyaviewer/lumiya/render/GLTexture;)V
    .locals 11

    const/4 v10, 0x0

    const/4 v9, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->isMasked:Z

    if-eqz v0, :cond_1

    if-eqz p3, :cond_1

    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_2

    invoke-interface {p3}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getWidth()I

    move-result v7

    invoke-interface {p3}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getHeight()I

    move-result v8

    invoke-interface {p3}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getExtraComponentsBuffer()Ljava/nio/ByteBuffer;

    move-result-object v10

    if-eqz v10, :cond_0

    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->position()I

    move-result v9

    :cond_0
    :goto_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->numVertices:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    move v0, p2

    invoke-static/range {v0 .. v10}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->applyMeshMorph(FLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;)V

    return-void

    :cond_1
    move v0, v9

    goto :goto_0

    :cond_2
    move v8, v9

    move v7, v9

    goto :goto_1
.end method

.method public applyMorphDataSlow(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;FLcom/lumiyaviewer/lumiya/render/GLTexture;)V
    .locals 19

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v12

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v13

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->isMasked:Z

    if-eqz v2, :cond_1

    if-eqz p3, :cond_1

    const/4 v6, 0x1

    :goto_0
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    if-eqz v6, :cond_0

    invoke-interface/range {p3 .. p3}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getWidth()I

    move-result v5

    invoke-interface/range {p3 .. p3}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getHeight()I

    move-result v4

    invoke-interface/range {p3 .. p3}, Lcom/lumiyaviewer/lumiya/render/GLTexture;->getExtraComponentsBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    :cond_0
    :goto_1
    const/4 v7, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMorphData;->numVertices:I

    if-ge v7, v8, :cond_5

    invoke-virtual {v12, v7}, Ljava/nio/IntBuffer;->get(I)I

    move-result v15

    if-eqz v6, :cond_6

    mul-int/lit8 v8, v15, 0x2

    add-int/lit8 v8, v8, 0x0

    invoke-virtual {v14, v8}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v8

    int-to-float v9, v5

    mul-float/2addr v8, v9

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    double-to-int v8, v8

    mul-int/lit8 v9, v15, 0x2

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v14, v9}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v9

    int-to-float v0, v4

    move/from16 v16, v0

    mul-float v9, v9, v16

    float-to-double v0, v9

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->floor(D)D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-int v9, v0

    mul-int/2addr v9, v5

    add-int/2addr v9, v2

    add-int/2addr v8, v9

    invoke-virtual {v3, v8}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v8

    and-int/lit16 v8, v8, 0xff

    int-to-float v8, v8

    const/high16 v9, 0x437f0000    # 255.0f

    div-float/2addr v8, v9

    mul-float v8, v8, p2

    :goto_3
    const/4 v9, 0x0

    :goto_4
    const/16 v16, 0x6

    move/from16 v0, v16

    if-ge v9, v0, :cond_3

    mul-int/lit8 v16, v15, 0x6

    add-int v16, v16, v9

    mul-int/lit8 v17, v15, 0x6

    add-int v17, v17, v9

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v17

    mul-int/lit8 v18, v7, 0x6

    add-int v18, v18, v9

    move/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v18

    mul-float v18, v18, v8

    add-float v17, v17, v18

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v13, v0, v1}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_1
    const/4 v6, 0x0

    goto/16 :goto_0

    :cond_2
    const/4 v6, 0x0

    goto :goto_1

    :cond_3
    const/4 v9, 0x0

    :goto_5
    const/16 v16, 0x2

    move/from16 v0, v16

    if-ge v9, v0, :cond_4

    mul-int/lit8 v16, v15, 0x2

    add-int v16, v16, v9

    mul-int/lit8 v17, v15, 0x2

    add-int v17, v17, v9

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v17

    mul-int/lit8 v18, v7, 0x2

    add-int v18, v18, v9

    move/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v18

    mul-float v18, v18, v8

    add-float v17, v17, v18

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_2

    :cond_5
    return-void

    :cond_6
    move/from16 v8, p2

    goto :goto_3
.end method
