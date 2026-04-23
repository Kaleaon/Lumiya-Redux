.class public final Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;


# instance fields
.field private final FaceCount:I

.field private final FaceIndexStartsCounts:[I

.field private final FaceVertexStartsCounts:[I

.field private final IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final IndexCount:I

.field private final IndexSizeBytes:I

.field private final TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final VertexCount:I

.field private final VertexSizeBytes:I

.field private final facesCombined:Z

.field private final isRiggedMesh:Z

.field private final meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

.field private vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;
        }
    .end annotation

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->isRiggedMesh()Z

    move-result v2

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->getFaceCount()I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    :goto_0
    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    if-ge v2, v5, :cond_1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->getFace(I)Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getVertices()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumVertices()I

    move-result v6

    add-int/2addr v4, v6

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumIndices()I

    move-result v5

    add-int/2addr v3, v5

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    move-object/from16 v0, p0

    iput v3, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexCount:I

    move-object/from16 v0, p0

    iput v4, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexCount:I

    if-eqz v3, :cond_2

    if-nez v4, :cond_3

    :cond_2
    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;

    const-string/jumbo v3, "Mesh data has zero indices or vertices"

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_3
    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    mul-int/lit8 v2, v2, 0x3

    new-array v2, v2, [I

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [I

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v2, v4, 0x4

    mul-int/lit8 v2, v2, 0x6

    move-object/from16 v0, p0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexSizeBytes:I

    mul-int/lit8 v2, v3, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexSizeBytes:I

    mul-int/lit8 v2, v4, 0x4

    mul-int/lit8 v2, v2, 0x2

    new-instance v8, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexSizeBytes:I

    invoke-direct {v8, v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    new-instance v9, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexSizeBytes:I

    invoke-direct {v9, v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    new-instance v10, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v10, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    const/4 v2, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    if-ge v2, v7, :cond_a

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->getFace(I)Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    move-result-object v11

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getVertices()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v7

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getTexCoords()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v12

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumVertices()I

    move-result v13

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumVertices()I

    move-result v14

    if-eqz v14, :cond_4

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumIndices()I

    move-result v14

    if-nez v14, :cond_5

    :cond_4
    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;

    const-string/jumbo v3, "Empty mesh"

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_5
    if-eqz v7, :cond_9

    mul-int/lit8 v14, v5, 0x6

    mul-int/lit8 v15, v13, 0x6

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v8, v14, v7, v0, v15}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFromFloat(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V

    if-eqz v12, :cond_6

    mul-int/lit8 v7, v5, 0x2

    mul-int/lit8 v14, v13, 0x2

    const/4 v15, 0x0

    invoke-virtual {v10, v7, v12, v15, v14}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFromFloat(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V

    :cond_6
    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getIndices()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v12

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumIndices()I

    move-result v14

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v14, :cond_8

    invoke-virtual {v12, v7}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getShort(I)S

    move-result v15

    const v16, 0xffff

    and-int v15, v15, v16

    if-lt v15, v13, :cond_7

    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;

    const-string/jumbo v3, "Too many vertices"

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_8
    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getIndices()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v7

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumIndices()I

    move-result v12

    const/4 v14, 0x0

    invoke-virtual {v9, v6, v7, v14, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFromShort(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V

    :cond_9
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v12, v4, 0x1

    aput v2, v7, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v7, v12, 0x1

    aput v6, v4, v12

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v4, v7, 0x1

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumIndices()I

    move-result v14

    aput v14, v12, v7

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    add-int/lit8 v12, v3, 0x1

    aput v5, v7, v3

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    add-int/lit8 v3, v12, 0x1

    aput v13, v7, v12

    add-int/2addr v5, v13

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumIndices()I

    move-result v7

    add-int/2addr v6, v7

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_a
    const/4 v2, 0x0

    invoke-virtual {v8, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v2, 0x0

    invoke-virtual {v9, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v2, 0x0

    invoke-virtual {v10, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v2, v8}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v2, v9}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v2, v10}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const-string/jumbo v2, "Mesh drawable created,  index count %d, vertex count %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    if-eqz v2, :cond_b

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    :goto_3
    return-void

    :cond_b
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    goto :goto_3
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;
        }
    .end annotation

    const/16 v7, 0x7fff

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {p1, v0, v3, v3, p2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->create(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;FZZLcom/lumiyaviewer/lumiya/render/GLTexture;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;

    move-result-object v4

    if-nez v4, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;

    const-string/jumbo v1, "Failed to create volume"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v3

    move v2, v3

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    add-int/2addr v2, v6

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_1
    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexCount:I

    iput v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexCount:I

    if-eqz v1, :cond_2

    if-nez v2, :cond_3

    :cond_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;

    const-string/jumbo v1, "Prim data has zero indices or vertices"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/CreateFailureException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    iget-object v0, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    mul-int/lit8 v0, v0, 0x3

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v0, v2, 0x4

    mul-int/lit8 v0, v0, 0x6

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexSizeBytes:I

    mul-int/lit8 v0, v1, 0x2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexSizeBytes:I

    mul-int/lit8 v0, v2, 0x4

    mul-int/lit8 v5, v0, 0x2

    new-instance v9, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexSizeBytes:I

    invoke-direct {v9, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexSizeBytes:I

    invoke-direct {v0, v6}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    new-instance v10, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v10, v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    if-ge v2, v7, :cond_4

    if-ge v1, v7, :cond_4

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-eqz v1, :cond_5

    iget-object v1, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    move v5, v3

    move v7, v3

    move v8, v3

    move v1, v3

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;

    mul-int/lit8 v2, v5, 0x6

    iget-object v4, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getData()[F

    move-result-object v4

    iget v12, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    mul-int/lit8 v12, v12, 0x6

    invoke-virtual {v9, v2, v4, v3, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromFloatArray(I[FII)V

    mul-int/lit8 v2, v5, 0x2

    iget-object v4, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getTexCoordsData()[F

    move-result-object v4

    iget v12, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    mul-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v2, v4, v3, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromFloatArray(I[FII)V

    iget-object v2, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    iget v4, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromShortArrayOffset(I[SIIS)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v4, v8, 0x1

    iget v12, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->ID:I

    aput v12, v2, v8

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v8, v4, 0x1

    aput v1, v2, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v4, v8, 0x1

    iget v12, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    aput v12, v2, v8

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    add-int/lit8 v8, v7, 0x1

    aput v5, v2, v7

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    add-int/lit8 v2, v8, 0x1

    iget v12, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    aput v12, v7, v8

    iget v7, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    add-int/2addr v5, v7

    int-to-short v5, v5

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    add-int/2addr v1, v6

    move v7, v2

    move v8, v4

    goto :goto_2

    :cond_4
    move v1, v3

    goto :goto_1

    :cond_5
    iget-object v1, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->VolumeFaces:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v2, v3

    move v4, v3

    move v5, v3

    move v6, v3

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;

    mul-int/lit8 v8, v2, 0x6

    iget-object v11, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getData()[F

    move-result-object v11

    iget v12, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    mul-int/lit8 v12, v12, 0x6

    invoke-virtual {v9, v8, v11, v3, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromFloatArray(I[FII)V

    mul-int/lit8 v8, v2, 0x2

    iget-object v11, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v11}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getTexCoordsData()[F

    move-result-object v11

    iget v12, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    mul-int/lit8 v12, v12, 0x2

    invoke-virtual {v10, v8, v11, v3, v12}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromFloatArray(I[FII)V

    iget-object v8, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    iget v11, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    invoke-virtual {v0, v6, v8, v3, v11}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->loadFromShortArray(I[SII)V

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v11, v5, 0x1

    iget v12, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->ID:I

    aput v12, v8, v5

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v8, v11, 0x1

    aput v6, v5, v11

    iget-object v11, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v5, v8, 0x1

    iget v12, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    aput v12, v11, v8

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    add-int/lit8 v11, v4, 0x1

    aput v2, v8, v4

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    add-int/lit8 v4, v11, 0x1

    iget v12, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    aput v12, v8, v11

    iget v8, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    add-int/2addr v2, v8

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    add-int/2addr v1, v6

    move v6, v1

    goto :goto_3

    :cond_6
    invoke-virtual {v9, v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v10, v3}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v1, v9}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v0, v10}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    return-void
.end method


# virtual methods
.method final ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->isRiggedMesh()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V

    :cond_0
    return-void
.end method

.method final GLBindBuffers10(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;)Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;
    .locals 8

    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexCount:I

    invoke-virtual {p2, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->getFlexedVertexBuffer(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;I)Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    move-result-object v0

    :goto_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-eqz v1, :cond_0

    const v2, 0x8074

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    const v2, 0x8075

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/16 v6, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    const v3, 0x8078

    const/4 v4, 0x2

    const/16 v5, 0x1406

    const/16 v6, 0x8

    const/4 v7, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    goto :goto_0
.end method

.method final GLBindBuffers20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;
    .locals 8

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vPosition:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vNormal:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/16 v6, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vTexCoord:I

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x8

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Unbind()V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    return-object v0

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    const/4 v0, 0x0

    move v7, v0

    :goto_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    if-ge v7, v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vPosition:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v3, v7, 0x2

    aget v1, v1, v3

    mul-int/lit8 v6, v1, 0x18

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vNormal:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v3, v7, 0x2

    aget v1, v1, v3

    mul-int/lit8 v1, v1, 0x18

    add-int/lit8 v6, v1, 0xc

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vTexCoord:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v3, v7, 0x2

    aget v1, v1, v3

    mul-int/lit8 v1, v1, 0x4

    mul-int/lit8 v6, v1, 0x2

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x8

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v2, v7, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->PrepareInfluencesForFace(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Unbind()V

    goto/16 :goto_0

    :cond_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vPosition:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vNormal:I

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    const/16 v6, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vTexCoord:I

    const/4 v3, 0x2

    const/16 v4, 0x1406

    const/16 v5, 0x8

    const/4 v6, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    return-object v0
.end method

.method final GLBindBuffersRigged30(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 14

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->SetupBuffers30(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    const/4 v0, 0x0

    move v13, v0

    :goto_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    if-ge v13, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0, v13}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vPosition:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v6, v13, 0x2

    aget v1, v1, v6

    mul-int/lit8 v6, v1, 0x18

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vNormal:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v6, v13, 0x2

    aget v1, v1, v6

    mul-int/lit8 v1, v1, 0x18

    add-int/lit8 v6, v1, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v8, v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vTexCoord:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v1, v13, 0x2

    aget v0, v0, v1

    mul-int/lit8 v0, v0, 0x4

    mul-int/lit8 v12, v0, 0x2

    const/4 v9, 0x2

    const/16 v11, 0x8

    move-object v7, p1

    move v10, v4

    invoke-virtual/range {v6 .. v12}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v2, v13, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->SetupFace30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Unbind()V

    add-int/lit8 v0, v13, 0x1

    move v13, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public GLCleanup()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    return-void
.end method

.method final GLDrawAll10(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexCount:I

    const/4 v2, 0x4

    const/16 v4, 0x1403

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIII)V

    return-void
.end method

.method final GLDrawAll20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 5

    const/16 v4, 0x1403

    const/4 v3, 0x4

    const/4 v2, 0x0

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexCount:I

    invoke-virtual {v0, v3, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Unbind()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexCount:I

    invoke-virtual {v0, v3, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    goto :goto_0
.end method

.method final GLDrawFace10(Lcom/lumiyaviewer/lumiya/render/RenderContext;ILcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;)V
    .locals 8

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    mul-int/lit8 v7, p2, 0x3

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v1, p2, 0x2

    aget v0, v0, v1

    mul-int/lit8 v6, v0, 0x18

    const v2, 0x8074

    move-object v0, p3

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v1, p2, 0x2

    aget v0, v0, v1

    mul-int/lit8 v0, v0, 0x18

    add-int/lit8 v6, v0, 0xc

    const v2, 0x8075

    move-object v0, p3

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v2, p2, 0x2

    aget v1, v1, v2

    mul-int/lit8 v1, v1, 0x4

    mul-int/lit8 v6, v1, 0x2

    const v2, 0x8078

    const/4 v3, 0x2

    const/16 v5, 0x8

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v2, v7, 0x2

    aget v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v2, v7, 0x1

    aget v1, v1, v2

    mul-int/lit8 v5, v1, 0x2

    const/4 v2, 0x4

    const/16 v4, 0x1403

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIII)V

    return-void
.end method

.method final GLDrawFace20(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V
    .locals 10

    const/16 v9, 0x1403

    const/4 v8, 0x4

    const/4 v3, 0x3

    const/16 v4, 0x1406

    const/16 v5, 0x18

    mul-int/lit8 v7, p2, 0x3

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-eqz v1, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v2, v7, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v3, v7, 0x1

    aget v2, v2, v3

    mul-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v8, v1, v9, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Unbind()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vPosition:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v6, p2, 0x2

    aget v1, v1, v6

    mul-int/lit8 v6, v1, 0x18

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vNormal:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v6, p2, 0x2

    aget v1, v1, v6

    mul-int/lit8 v1, v1, 0x18

    add-int/lit8 v6, v1, 0xc

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->vTexCoord:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v3, p2, 0x2

    aget v1, v1, v3

    mul-int/lit8 v1, v1, 0x4

    mul-int/lit8 v6, v1, 0x2

    const/4 v3, 0x2

    const/16 v5, 0x8

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v2, p2, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->PrepareInfluencesForFace(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v2, v7, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v3, v7, 0x1

    aget v2, v2, v3

    mul-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v8, v1, v9, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    goto :goto_0
.end method

.method final GLDrawRiggedFace30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    if-eqz v0, :cond_0

    mul-int/lit8 v0, p2, 0x3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->vertexArrayObject:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;

    invoke-virtual {v1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLVertexArrayObject;->Bind(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v3, v0, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v0, v0, 0x1

    aget v0, v3, v0

    mul-int/lit8 v0, v0, 0x2

    const/4 v3, 0x4

    const/16 v4, 0x1403

    invoke-virtual {v1, v3, v2, v4, v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->DrawElements20(IIII)V

    :cond_0
    return-void
.end method

.method IntersectRay(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;
    .locals 17

    const/4 v6, 0x0

    const/4 v5, -0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x3

    new-array v10, v2, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v2, 0x0

    :goto_0
    const/4 v7, 0x3

    if-ge v2, v7, :cond_0

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    aput-object v7, v10, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    if-ge v2, v7, :cond_6

    mul-int/lit8 v7, v2, 0x3

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v9, v7, 0x1

    aget v11, v8, v9

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v7, v7, 0x2

    aget v12, v8, v7

    const/4 v8, 0x0

    :goto_2
    if-ge v8, v12, :cond_5

    const/4 v7, 0x0

    move v9, v7

    :goto_3
    const/4 v7, 0x3

    if-ge v9, v7, :cond_2

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-eqz v7, :cond_1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    add-int v13, v11, v8

    add-int/2addr v13, v9

    invoke-virtual {v7, v13}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getShort(I)I

    move-result v7

    mul-int/lit8 v7, v7, 0x6

    :goto_4
    aget-object v13, v10, v9

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    add-int/lit8 v15, v7, 0x0

    invoke-virtual {v14, v15}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getFloat(I)F

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    add-int/lit8 v16, v7, 0x1

    invoke-virtual/range {v15 .. v16}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getFloat(I)F

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    move-object/from16 v16, v0

    add-int/lit8 v7, v7, 0x2

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getFloat(I)F

    move-result v7

    invoke-virtual {v13, v14, v15, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    add-int/lit8 v7, v9, 0x1

    move v9, v7

    goto :goto_3

    :cond_1
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    add-int v13, v11, v8

    add-int/2addr v13, v9

    invoke-virtual {v7, v13}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getShort(I)I

    move-result v7

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v14, v2, 0x2

    aget v13, v13, v14

    add-int/2addr v7, v13

    mul-int/lit8 v7, v7, 0x6

    goto :goto_4

    :cond_2
    const/4 v7, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v1, v10, v7}, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace;->intersect_RayTriangle(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;I)Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;

    move-result-object v9

    if-eqz v9, :cond_4

    iget-object v7, v9, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget v7, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    if-eqz v6, :cond_3

    cmpg-float v13, v7, v3

    if-gez v13, :cond_4

    :cond_3
    move v3, v7

    move v4, v2

    move v5, v8

    move-object v6, v9

    :cond_4
    add-int/lit8 v8, v8, 0x3

    goto :goto_2

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_6
    if-eqz v6, :cond_9

    mul-int/lit8 v2, v4, 0x3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    add-int/lit8 v2, v2, 0x1

    aget v7, v3, v2

    const/4 v2, 0x3

    new-array v8, v2, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    const/4 v2, 0x0

    move v3, v2

    :goto_5
    const/4 v2, 0x3

    if-ge v3, v2, :cond_8

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    if-eqz v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    add-int v9, v7, v5

    add-int/2addr v9, v3

    invoke-virtual {v2, v9}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getShort(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    :goto_6
    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v10, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getFloat(I)F

    move-result v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->TexCoordsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v11, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getFloat(I)F

    move-result v2

    invoke-direct {v9, v10, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    aput-object v9, v8, v3

    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_5

    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->IndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    add-int v9, v7, v5

    add-int/2addr v9, v3

    invoke-virtual {v2, v9}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getShort(I)I

    move-result v2

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v10, v4, 0x2

    aget v9, v9, v10

    add-int/2addr v2, v9

    mul-int/lit8 v2, v2, 0x2

    goto :goto_6

    :cond_8
    const/4 v2, 0x1

    aget-object v2, v8, v2

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    const/4 v3, 0x0

    aget-object v3, v8, v3

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    sub-float/2addr v2, v3

    iget v3, v6, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->s:F

    mul-float/2addr v2, v3

    const/4 v3, 0x2

    aget-object v3, v8, v3

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    const/4 v5, 0x0

    aget-object v5, v8, v5

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    sub-float/2addr v3, v5

    iget v5, v6, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->t:F

    mul-float/2addr v3, v5

    add-float/2addr v2, v3

    const/4 v3, 0x0

    aget-object v3, v8, v3

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    add-float/2addr v2, v3

    const/4 v3, 0x1

    aget-object v3, v8, v3

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    const/4 v5, 0x0

    aget-object v5, v8, v5

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    sub-float/2addr v3, v5

    iget v5, v6, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->s:F

    mul-float/2addr v3, v5

    const/4 v5, 0x2

    aget-object v5, v8, v5

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    const/4 v7, 0x0

    aget-object v7, v8, v7

    iget v7, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    sub-float/2addr v5, v7

    iget v7, v6, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->t:F

    mul-float/2addr v5, v7

    add-float/2addr v3, v5

    const/4 v5, 0x0

    aget-object v5, v8, v5

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    add-float/2addr v3, v5

    new-instance v5, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;->intersectPoint:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-direct {v5, v6, v4, v2, v3}, Lcom/lumiyaviewer/lumiya/render/picking/IntersectInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;IFF)V

    return-object v5

    :cond_9
    const/4 v2, 0x0

    return-object v2
.end method

.method final UpdateRigged(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)Z
    .locals 6

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->isRiggedMesh()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v2, p2}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->UpdateRiggedMatrices(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingFitsGL20()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getRawBuffer()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v3

    move v0, v1

    :goto_0
    iget v4, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    if-ge v0, v4, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v5, v0, 0x2

    aget v4, v4, v5

    invoke-virtual {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->UpdateRigged(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Reload(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :cond_2
    :goto_1
    return v1

    :cond_3
    invoke-virtual {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->PrepareInfluenceBuffers(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    const/4 v1, 0x1

    goto :goto_1
.end method

.method final getFaceCount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceCount:I

    return v0
.end method

.method public final getFaceFirstVertex(I)I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v1, p1, 0x2

    aget v0, v0, v1

    return v0
.end method

.method final getFaceID(I)I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceIndexStartsCounts:[I

    mul-int/lit8 v1, p1, 0x3

    aget v0, v0, v1

    return v0
.end method

.method public final getFaceVertexCount(I)I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->FaceVertexStartsCounts:[I

    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v1, v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public final getVertexCount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->VertexCount:I

    return v0
.end method

.method final hasExtendedBones()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->hasExtendedBones()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final isFacesCombined()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->facesCombined:Z

    return v0
.end method

.method final isRiggedMesh()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    return v0
.end method

.method final riggingFitsGL20()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->isRiggedMesh:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableGeometry;->meshData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingFitsGL20()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
