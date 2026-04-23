.class public Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;
.super Ljava/lang/Object;


# static fields
.field public static final MAX_RIGGED_MESH_JOINTS:I = 0xa3


# instance fields
.field private final bindShapeMatrix:[F
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

.field private glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

.field private final jointTranslations:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;",
            "[F>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final pelvisOffset:F

.field private final riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getMeshRendering()Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    move-result-object v4

    sget-object v2, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->disabled:Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    if-ne v4, v2, :cond_0

    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "Mesh rendering is disabled"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    const-string/jumbo v2, "loading file \'%s\'"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v3, v6

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v7, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x0

    :try_start_0
    new-instance v11, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance v12, Ljava/io/DataInputStream;

    invoke-direct {v12, v11}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-static {v12}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v8

    invoke-virtual {v11}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v14

    const/4 v2, 0x0

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->getLODName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->getLODName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    :cond_1
    :goto_0
    if-nez v2, :cond_6

    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "Mesh LOD not found"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v2

    :try_start_2
    invoke-virtual {v12}, Ljava/io/DataInputStream;->close()V

    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V

    throw v2
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v2

    new-instance v3, Ljava/io/IOException;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :cond_2
    :try_start_3
    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->values()[Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;

    move-result-object v9

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->ordinal()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    :goto_1
    array-length v10, v9

    if-ge v3, v10, :cond_3

    aget-object v10, v9, v3

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->getLODName()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_4

    invoke-virtual {v8, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-virtual {v8, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    :cond_3
    if-nez v2, :cond_1

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->ordinal()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_2
    if-ltz v3, :cond_1

    aget-object v4, v9, v3

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/GlobalOptions$MeshRendering;->getLODName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_5

    invoke-virtual {v8, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-virtual {v8, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    goto :goto_0

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_5
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    :cond_6
    const-string/jumbo v3, "offset"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v2

    invoke-virtual {v11}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    int-to-long v0, v2

    move-wide/from16 v16, v0

    add-long v16, v16, v14

    move-wide/from16 v0, v16

    invoke-virtual {v3, v0, v1}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    new-instance v13, Ljava/util/zip/InflaterInputStream;

    invoke-direct {v13, v12}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v16, Ljava/io/DataInputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v13}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static/range {v16 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v4

    new-array v2, v4, [Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v4, :cond_7

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v10, v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;-><init>(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    aput-object v10, v9, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_7
    const-string/jumbo v2, "skin"

    invoke-virtual {v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    const-string/jumbo v2, "skin"

    invoke-virtual {v8, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    const-string/jumbo v3, "offset"

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v2

    invoke-virtual {v11}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    int-to-long v8, v2

    add-long/2addr v8, v14

    invoke-virtual {v3, v8, v9}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    new-instance v2, Ljava/util/zip/InflaterInputStream;

    invoke-direct {v2, v12}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v3, Ljava/io/DataInputStream;

    invoke-direct {v3, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->fromBinary(Ljava/io/DataInputStream;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v14

    invoke-virtual {v3}, Ljava/io/DataInputStream;->close()V

    invoke-virtual {v2}, Ljava/util/zip/InflaterInputStream;->close()V

    const-string/jumbo v2, "bind_shape_matrix"

    invoke-virtual {v14, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    const/16 v2, 0x10

    new-array v4, v2, [F

    const/4 v2, 0x0

    :goto_4
    const/16 v3, 0x10

    if-ge v2, v3, :cond_9

    const-string/jumbo v3, "bind_shape_matrix"

    invoke-virtual {v14, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v3, v8

    aput v3, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_8
    const/4 v4, 0x0

    :cond_9
    const-string/jumbo v2, "joint_names"

    invoke-virtual {v14, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    const-string/jumbo v2, "joint_names"

    invoke-virtual {v14, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v15

    invoke-virtual {v15}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v2

    const/16 v3, 0xa3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v17

    move/from16 v0, v17

    new-array v8, v0, [I

    const/4 v2, 0x0

    move v10, v2

    :goto_5
    move/from16 v0, v17

    if-ge v10, v0, :cond_1e

    invoke-virtual {v15, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v3

    const/4 v9, -0x1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->bones:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, v3}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    if-eqz v2, :cond_a

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->ordinal()I

    move-result v9

    :cond_a
    if-eqz v2, :cond_b

    const/16 v18, -0x1

    move/from16 v0, v18

    if-ne v9, v0, :cond_d

    :cond_b
    sget-object v18, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    if-eqz v3, :cond_1d

    iget-object v2, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->bone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->nonHUDindex:I

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    array-length v9, v9

    add-int/2addr v3, v9

    :goto_6
    if-eqz v2, :cond_c

    iget-boolean v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->isExtended:Z

    if-eqz v2, :cond_c

    const/4 v7, 0x1

    :cond_c
    aput v3, v8, v10

    add-int/lit8 v2, v10, 0x1

    move v10, v2

    goto :goto_5

    :cond_d
    move v3, v9

    goto :goto_6

    :cond_e
    const/4 v3, 0x0

    :goto_7
    const-string/jumbo v2, "inverse_bind_matrix"

    invoke-virtual {v14, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    if-eqz v3, :cond_11

    const-string/jumbo v2, "inverse_bind_matrix"

    invoke-virtual {v14, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v10

    array-length v2, v3

    mul-int/lit8 v2, v2, 0x10

    new-array v2, v2, [F

    const/4 v8, 0x0

    move v9, v8

    :goto_8
    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v8

    if-ge v9, v8, :cond_10

    array-length v8, v3

    if-ge v9, v8, :cond_f

    invoke-virtual {v10, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v15

    const/4 v8, 0x0

    :goto_9
    const/16 v17, 0x10

    move/from16 v0, v17

    if-ge v8, v0, :cond_f

    mul-int/lit8 v17, v9, 0x10

    add-int v17, v17, v8

    invoke-virtual {v15, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v0, v0

    move/from16 v18, v0

    aput v18, v2, v17

    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    :cond_f
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_8

    :cond_10
    const-string/jumbo v8, "inverseBindMatrix count %d"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v15, 0x0

    aput-object v10, v9, v15

    invoke-static {v8, v9}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_a
    const-string/jumbo v8, "alt_inverse_bind_matrix"

    invoke-virtual {v14, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_18

    const-string/jumbo v8, "alt_inverse_bind_matrix"

    invoke-virtual {v14, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v10

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v8

    mul-int/lit8 v8, v8, 0x10

    new-array v15, v8, [F

    const/4 v8, 0x0

    move v9, v8

    :goto_b
    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v8

    if-ge v9, v8, :cond_14

    invoke-virtual {v10, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v17

    const/4 v8, 0x0

    :goto_c
    const/16 v18, 0x10

    move/from16 v0, v18

    if-ge v8, v0, :cond_13

    mul-int/lit8 v18, v9, 0x10

    add-int v18, v18, v8

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v20

    move-wide/from16 v0, v20

    double-to-float v0, v0

    move/from16 v19, v0

    aput v19, v15, v18

    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    :cond_11
    const/4 v2, 0x0

    goto :goto_a

    :cond_12
    const/4 v2, 0x0

    goto :goto_a

    :cond_13
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_b

    :cond_14
    if-eqz v3, :cond_17

    new-instance v6, Ljava/util/EnumMap;

    const-class v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-direct {v6, v8}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    const/4 v8, 0x0

    move v9, v8

    :goto_d
    array-length v8, v3

    if-ge v9, v8, :cond_17

    aget v8, v3, v9

    if-ltz v8, :cond_16

    sget-object v17, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v8, v0, :cond_16

    sget-object v17, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    aget-object v17, v17, v8

    const/4 v8, 0x3

    new-array v0, v8, [F

    move-object/from16 v18, v0

    const/4 v8, 0x0

    :goto_e
    const/16 v19, 0x3

    move/from16 v0, v19

    if-ge v8, v0, :cond_15

    mul-int/lit8 v19, v9, 0x10

    add-int/lit8 v19, v19, 0xc

    add-int v19, v19, v8

    aget v19, v15, v19

    aput v19, v18, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_e

    :cond_15
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_d

    :cond_17
    const-string/jumbo v8, "alt_inverse_bind_matrix count %d"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v15, 0x0

    aput-object v10, v9, v15

    invoke-static {v8, v9}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_18
    const-string/jumbo v8, "pelvis_offset"

    invoke-virtual {v14, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_19

    const-string/jumbo v5, "pelvis_offset"

    invoke-virtual {v14, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v8

    double-to-float v5, v8

    const-string/jumbo v8, "Pelvis offset: %f"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    const/4 v14, 0x0

    aput-object v10, v9, v14

    invoke-static {v8, v9}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_19
    invoke-virtual/range {v16 .. v16}, Ljava/io/DataInputStream;->close()V

    invoke-virtual {v13}, Ljava/util/zip/InflaterInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_f
    :try_start_4
    invoke-virtual {v12}, Ljava/io/DataInputStream;->close()V

    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_4 .. :try_end_4} :catch_0

    if-eqz v3, :cond_1c

    if-eqz v4, :cond_1c

    if-eqz v2, :cond_1c

    invoke-static {v3, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->create([I[FZ)Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->bindShapeMatrix:[F

    if-eqz v6, :cond_1b

    invoke-static {v6}, Lcom/google/common/collect/Maps;->immutableEnumMap(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v2

    :goto_10
    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->jointTranslations:Lcom/google/common/collect/ImmutableMap;

    :goto_11
    move-object/from16 v0, p0

    iput v5, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->pelvisOffset:F

    return-void

    :cond_1a
    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    goto :goto_f

    :cond_1b
    const/4 v2, 0x0

    goto :goto_10

    :cond_1c
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->bindShapeMatrix:[F

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->jointTranslations:Lcom/google/common/collect/ImmutableMap;

    goto :goto_11

    :cond_1d
    move v3, v9

    goto/16 :goto_6

    :cond_1e
    move-object v3, v8

    goto/16 :goto_7
.end method

.method private makeInfluenceBuffers()Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;
    .locals 6

    const/4 v1, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    array-length v4, v3

    move v2, v1

    move v0, v1

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v5, v3, v2

    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumVertices()I

    move-result v5

    add-int/2addr v0, v5

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;-><init>(I)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    array-length v4, v3

    move v0, v1

    :goto_1
    if-ge v1, v4, :cond_3

    aget-object v5, v3, v1

    if-eqz v5, :cond_2

    invoke-virtual {v5, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->PrepareInfluenceBuffer(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;I)V

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;->getNumVertices()I

    move-result v5

    add-int/2addr v0, v5

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return-object v2
.end method


# virtual methods
.method public ApplyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V
    .locals 4

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;->pelvisOffset:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->pelvisOffset:F

    add-float/2addr v0, v1

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;->pelvisOffset:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->jointTranslations:Lcom/google/common/collect/ImmutableMap;

    if-eqz v0, :cond_0

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;->jointTranslations:Ljava/util/EnumMap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->jointTranslations:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    invoke-virtual {v2, v1, v0}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public PrepareInfluenceBuffers(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->makeInfluenceBuffers()Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->jointIndexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_3

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->bindShapeMatrix:[F

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->PrepareInfluenceBuffers(Lcom/lumiyaviewer/lumiya/render/RenderContext;[F)V

    :cond_4
    return-void
.end method

.method public PrepareInfluencesForFace(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V
    .locals 7

    const/4 v3, 0x4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;->vJoint:I

    mul-int/lit8 v6, p2, 0x4

    const/16 v4, 0x1401

    move-object v1, p1

    move v5, v3

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;->vWeight:I

    mul-int/lit8 v1, p2, 0x4

    mul-int/lit8 v6, v1, 0x4

    const/16 v4, 0x1406

    const/16 v5, 0x10

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    :cond_1
    return-void
.end method

.method public SetupBuffers30(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->bindRiggingMeshData(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uBindShapeMatrix:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->bindShapeMatrix:[F

    const/4 v2, 0x1

    invoke-static {v0, v2, v3, v1, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    return-void
.end method

.method public SetupFace30(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V
    .locals 7

    const/4 v3, 0x4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->makeInfluenceBuffers()Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->jointIndexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v0, :cond_3

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->weightsBuffer:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glJointIndexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->vJoint:I

    mul-int/lit8 v6, p2, 0x4

    const/16 v4, 0x1401

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind30Integer(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->glWeightsBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget v2, v1, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->vWeight:I

    mul-int/lit8 v1, p2, 0x4

    mul-int/lit8 v6, v1, 0x4

    const/16 v4, 0x1406

    const/16 v5, 0x10

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V

    return-void
.end method

.method public UpdateRigged(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;I)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    aget-object v1, v1, p1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->bindShapeMatrix:[F

    invoke-virtual {v0, v1, v2, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->UpdateRigged(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;[FLcom/lumiyaviewer/rawbuffers/DirectByteBuffer;I)V

    :cond_0
    return-void
.end method

.method public UpdateRiggedMatrices(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->UpdateRiggedMatrices(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;)V

    :cond_0
    return-void
.end method

.method public final getFace(I)Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public final getFaceCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->faces:[Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshFace;

    array-length v0, v0

    return v0
.end method

.method public final hasExtendedBones()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->hasExtendedBones()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isRiggedMesh()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final riggingFitsGL20()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;->riggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->fitsGL20()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
