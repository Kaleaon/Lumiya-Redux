.class public Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;
.super Ljava/lang/Object;


# instance fields
.field private final indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field private final numIndices:I

.field private final numVertices:I

.field private final texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field private final vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field private final weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "NoGeometry"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Position"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    const-string/jumbo v0, "TriangleList"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numIndices:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    return-void

    :cond_1
    const-string/jumbo v0, "Position"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBinary()[B

    move-result-object v4

    const-string/jumbo v0, "Normal"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string/jumbo v0, "Normal"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBinary()[B

    move-result-object v0

    :goto_0
    const-string/jumbo v1, "TexCoord0"

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string/jumbo v1, "TexCoord0"

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBinary()[B

    move-result-object v1

    :goto_1
    array-length v2, v4

    div-int/lit8 v2, v2, 0x6

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    new-instance v2, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    mul-int/lit8 v3, v3, 0x6

    mul-int/lit8 v3, v3, 0x4

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v2, -0x41000000    # -0.5f

    const/high16 v3, -0x41000000    # -0.5f

    const/high16 v6, -0x41000000    # -0.5f

    invoke-direct {v5, v2, v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v2, 0x3f000000    # 0.5f

    const/high16 v3, 0x3f000000    # 0.5f

    const/high16 v7, 0x3f000000    # 0.5f

    invoke-direct {v6, v2, v3, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const-string/jumbo v2, "PositionDomain"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "PositionDomain"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-string/jumbo v3, "Min"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v2, "PositionDomain"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-string/jumbo v3, "Min"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v3, v8

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v7, v8

    const/4 v8, 0x2

    invoke-virtual {v2, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v2, v8

    invoke-virtual {v5, v3, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    :cond_2
    const-string/jumbo v2, "PositionDomain"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-string/jumbo v3, "Max"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "PositionDomain"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-string/jumbo v3, "Max"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v3, v8

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v7, v8

    const/4 v8, 0x2

    invoke-virtual {v2, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v2, v8

    invoke-virtual {v6, v3, v7, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    :cond_3
    const/4 v3, 0x0

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    const/4 v2, 0x0

    const/4 v7, 0x0

    invoke-direct {v3, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct {v2, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    const-string/jumbo v7, "TexCoord0Domain"

    invoke-virtual {p1, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    const-string/jumbo v7, "TexCoord0Domain"

    invoke-virtual {p1, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    const-string/jumbo v8, "Min"

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    const-string/jumbo v7, "TexCoord0Domain"

    invoke-virtual {p1, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    const-string/jumbo v8, "Min"

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v8, v8

    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v10

    double-to-float v7, v10

    invoke-virtual {v3, v8, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->set(FF)V

    :cond_4
    const-string/jumbo v7, "TexCoord0Domain"

    invoke-virtual {p1, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    const-string/jumbo v8, "Max"

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    const-string/jumbo v7, "TexCoord0Domain"

    invoke-virtual {p1, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    const-string/jumbo v8, "Max"

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v8, v8

    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v10

    double-to-float v7, v10

    invoke-virtual {v2, v8, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->set(FF)V

    :cond_5
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    sget-object v7, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v7

    if-eqz v0, :cond_8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    move-object v4, v0

    :goto_2
    if-eqz v1, :cond_9

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    :goto_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x0

    :goto_4
    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    if-ge v1, v8, :cond_b

    invoke-virtual {v7}, Ljava/nio/ShortBuffer;->get()S

    move-result v8

    const v9, 0xffff

    and-int/2addr v8, v9

    int-to-float v8, v8

    iget v9, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v10, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v9, v10

    mul-float/2addr v8, v9

    const v9, 0x477fff00    # 65535.0f

    div-float/2addr v8, v9

    iget v9, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v8, v9

    invoke-virtual {v7}, Ljava/nio/ShortBuffer;->get()S

    move-result v9

    const v10, 0xffff

    and-int/2addr v9, v10

    int-to-float v9, v9

    iget v10, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v11, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v10, v11

    mul-float/2addr v9, v10

    const v10, 0x477fff00    # 65535.0f

    div-float/2addr v9, v10

    iget v10, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v9, v10

    invoke-virtual {v7}, Ljava/nio/ShortBuffer;->get()S

    move-result v10

    const v11, 0xffff

    and-int/2addr v10, v11

    int-to-float v10, v10

    iget v11, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v12, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v11, v12

    mul-float/2addr v10, v11

    const v11, 0x477fff00    # 65535.0f

    div-float/2addr v10, v11

    iget v11, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v11, v8}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v8, v9}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v8, v10}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    if-eqz v4, :cond_a

    invoke-virtual {v4}, Ljava/nio/ShortBuffer;->get()S

    move-result v8

    const v9, 0xffff

    and-int/2addr v8, v9

    int-to-float v8, v8

    const/high16 v9, 0x40000000    # 2.0f

    mul-float/2addr v8, v9

    const v9, 0x477fff00    # 65535.0f

    div-float/2addr v8, v9

    const/high16 v9, 0x3f800000    # 1.0f

    sub-float/2addr v8, v9

    invoke-virtual {v4}, Ljava/nio/ShortBuffer;->get()S

    move-result v9

    const v10, 0xffff

    and-int/2addr v9, v10

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    mul-float/2addr v9, v10

    const v10, 0x477fff00    # 65535.0f

    div-float/2addr v9, v10

    const/high16 v10, 0x3f800000    # 1.0f

    sub-float/2addr v9, v10

    invoke-virtual {v4}, Ljava/nio/ShortBuffer;->get()S

    move-result v10

    const v11, 0xffff

    and-int/2addr v10, v11

    int-to-float v10, v10

    const/high16 v11, 0x40000000    # 2.0f

    mul-float/2addr v10, v11

    const v11, 0x477fff00    # 65535.0f

    div-float/2addr v10, v11

    const/high16 v11, 0x3f800000    # 1.0f

    sub-float/2addr v10, v11

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v11, v8}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v8, v9}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v8, v10}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_4

    :cond_6
    const/4 v0, 0x0

    goto/16 :goto_0

    :cond_7
    const/4 v1, 0x0

    goto/16 :goto_1

    :cond_8
    const/4 v0, 0x0

    move-object v4, v0

    goto/16 :goto_2

    :cond_9
    const/4 v0, 0x0

    goto/16 :goto_3

    :cond_a
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    goto :goto_5

    :cond_b
    if-eqz v0, :cond_c

    new-instance v1, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    mul-int/lit8 v4, v4, 0x2

    mul-int/lit8 v4, v4, 0x4

    invoke-direct {v1, v4}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x0

    :goto_6
    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    if-ge v1, v4, :cond_d

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->get()S

    move-result v4

    const v5, 0xffff

    and-int/2addr v4, v5

    int-to-float v4, v4

    iget v5, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v6, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    sub-float/2addr v5, v6

    mul-float/2addr v4, v5

    const v5, 0x477fff00    # 65535.0f

    div-float/2addr v4, v5

    iget v5, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    add-float/2addr v4, v5

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->get()S

    move-result v5

    const v6, 0xffff

    and-int/2addr v5, v6

    int-to-float v5, v5

    iget v6, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v7, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    sub-float/2addr v6, v7

    mul-float/2addr v5, v6

    const v6, 0x477fff00    # 65535.0f

    div-float/2addr v5, v6

    iget v6, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    add-float/2addr v5, v6

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v6, v4}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->putFloat(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    :cond_d
    const-string/jumbo v0, "TriangleList"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBinary()[B

    move-result-object v0

    array-length v1, v0

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numIndices:I

    new-instance v1, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numIndices:I

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numIndices:I

    mul-int/lit8 v2, v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v0, v4, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromByteArray(I[BII)V

    const-string/jumbo v0, "Weights"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string/jumbo v0, "Weights"

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBinary()[B

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    array-length v2, v0

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v0, v4, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromByteArray(I[BII)V

    :goto_7
    return-void

    :cond_e
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    goto :goto_7
.end method


# virtual methods
.method PrepareInfluenceBuffer(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;I)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->jointIndexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3, p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->meshPrepareSeparateInfluenceBuffer(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method PrepareInfluenceBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {v0, v1, v2, p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->meshPrepareInfluenceBuffer(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V

    :cond_0
    return-void
.end method

.method final UpdateRigged(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;I[F[F)V
    .locals 7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->weightBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    move v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-static/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->applyRiggedMeshMorph(Ljava/nio/ByteBuffer;I[F[FLjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)V

    :cond_0
    return-void
.end method

.method public final getIndices()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-object v0
.end method

.method public final getNumIndices()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numIndices:I

    return v0
.end method

.method public final getNumVertices()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->numVertices:I

    return v0
.end method

.method public final getTexCoords()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-object v0
.end method

.method public final getVertices()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-object v0
.end method
