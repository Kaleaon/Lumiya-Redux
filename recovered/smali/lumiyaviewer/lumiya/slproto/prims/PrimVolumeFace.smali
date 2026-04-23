.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;
.super Ljava/lang/Object;


# static fields
.field public static final BOTTOM_MASK:I = 0x400

.field public static final CAP_MASK:I = 0x2

.field public static final END_MASK:I = 0x4

.field public static final FLAT_MASK:I = 0x100

.field public static final HOLLOW_MASK:I = 0x40

.field public static final INNER_MASK:I = 0x10

.field public static final OPEN_MASK:I = 0x80

.field public static final OUTER_MASK:I = 0x20

.field public static final SIDE_MASK:I = 0x8

.field public static final SINGLE_MASK:I = 0x1

.field public static final TOP_MASK:I = 0x200


# instance fields
.field public BeginS:I

.field public BeginT:I

.field public Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Edge:[I

.field public Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ID:I

.field public Indices:[S

.field public Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

.field public NumIndices:I

.field public NumS:I

.field public NumT:I

.field public NumVertices:I

.field public Positions:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

.field public TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

.field public TexCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

.field public TypeMask:I

.field public vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;


# direct methods
.method public constructor <init>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v4, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>()V

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>()V

    aput-object v1, v0, v3

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    new-array v0, v4, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    aput-object v1, v0, v3

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method

.method private createCap(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z
    .locals 16

    move-object/from16 v0, p0

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v1, v1, 0x40

    if-nez v1, :cond_0

    move-object/from16 v0, p0

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_0

    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->getProfileType()B

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->getPathType()B

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_0

    invoke-direct/range {p0 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->createUnCutCubeCap(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z

    move-result v1

    return v1

    :cond_0
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v6, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    mul-int/lit8 v1, v1, 0x3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v2, v2, 0x40

    if-nez v2, :cond_1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v2, v2, 0x80

    if-nez v2, :cond_1

    add-int/lit8 v2, v3, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeVertices(I)V

    add-int/lit8 v1, v1, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeIndices(I)V

    :goto_0
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v4, v4, 0x200

    if-eqz v4, :cond_2

    add-int/lit8 v2, v2, -0x1

    mul-int/2addr v1, v2

    move v2, v1

    :goto_1
    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>()V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>()V

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v4, 0x0

    aget-object v9, v1, v4

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v4, 0x1

    aget-object v10, v1, v4

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Positions:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    const/4 v1, 0x0

    move v4, v1

    :goto_2
    if-ge v4, v3, :cond_5

    move-object/from16 v0, p0

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_3

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v14, 0x3f000000    # 0.5f

    add-float/2addr v14, v1

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/high16 v15, 0x3f000000    # 0.5f

    add-float/2addr v1, v15

    invoke-virtual {v11, v4, v14, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    :goto_3
    add-int v1, v4, v2

    invoke-virtual {v12, v4, v5, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;I)V

    if-nez v4, :cond_4

    invoke-virtual {v12, v4, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v12, v4, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v11, v4, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    invoke-virtual {v11, v4, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    :goto_4
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_2

    :cond_1
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeVertices(I)V

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeIndices(I)V

    goto/16 :goto_0

    :cond_2
    move-object/from16 v0, p0

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    move v2, v1

    goto :goto_1

    :cond_3
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v14, 0x3f000000    # 0.5f

    add-float/2addr v14, v1

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/high16 v15, 0x3f000000    # 0.5f

    sub-float v1, v15, v1

    invoke-virtual {v11, v4, v14, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    goto :goto_3

    :cond_4
    invoke-virtual {v12, v4, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->minMaxVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v11, v4, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->minMaxVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    goto :goto_4

    :cond_5
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v1, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    invoke-static {v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->sum(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-result-object v2

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->mul(F)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v5, 0x0

    invoke-virtual {v12, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->subFromVector(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;I)V

    const/4 v5, 0x1

    invoke-virtual {v12, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->subFromVector(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;I)V

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v5, v5, 0x200

    if-eqz v5, :cond_a

    invoke-static {v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->cross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    :goto_5
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v4, v4, 0x40

    if-nez v4, :cond_b

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v4, v4, 0x80

    if-nez v4, :cond_b

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v12, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget v4, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-virtual {v11, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    add-int/lit8 v2, v3, 0x1

    :goto_6
    const/4 v3, 0x0

    invoke-virtual {v13, v3, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->fill(IILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v1, v1, 0x40

    if-eqz v1, :cond_19

    move-object/from16 v0, p0

    iget v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_10

    const/4 v3, 0x0

    add-int/lit8 v2, v2, -0x1

    const/4 v1, 0x0

    move v5, v1

    :goto_7
    sub-int v1, v2, v3

    const/4 v4, 0x1

    if-le v1, v4, :cond_1b

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v1, v3, 0x1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v9, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v1, v2, -0x1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v1, 0x0

    iput v1, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/4 v1, 0x0

    iput v1, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/4 v1, 0x0

    iput v1, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/4 v1, 0x0

    iput v1, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v11

    sub-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v11, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v11

    iget v11, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v11, v12

    sub-float/2addr v4, v11

    add-float/2addr v1, v4

    iget v4, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v11

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v11, v12

    sub-float/2addr v4, v11

    add-float v11, v1, v4

    iget v1, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v12

    sub-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v12

    iget v12, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v12, v13

    sub-float/2addr v4, v12

    add-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v12

    iget v12, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v12, v13

    sub-float/2addr v4, v12

    add-float v12, v1, v4

    iget v1, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v13

    sub-float/2addr v1, v4

    iget v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v13

    iget v13, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v13, v14

    sub-float/2addr v4, v13

    add-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v13

    iget v13, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v13, v14

    sub-float/2addr v4, v13

    add-float v13, v1, v4

    iget v1, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v14

    sub-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v14

    iget v14, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v15, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v14, v15

    sub-float/2addr v4, v14

    add-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v14

    iget v14, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v15, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v14, v15

    sub-float/2addr v4, v14

    add-float v14, v1, v4

    const/4 v4, 0x1

    const/4 v1, 0x1

    const/4 v15, 0x0

    cmpg-float v11, v11, v15

    if-gez v11, :cond_6

    const/4 v4, 0x0

    :cond_6
    const/4 v11, 0x0

    cmpg-float v11, v14, v11

    if-gez v11, :cond_7

    const/4 v4, 0x0

    :cond_7
    const/4 v11, 0x0

    cmpg-float v11, v13, v11

    if-gez v11, :cond_8

    const/4 v1, 0x0

    :cond_8
    const/4 v11, 0x0

    cmpg-float v11, v12, v11

    if-gez v11, :cond_9

    const/4 v1, 0x0

    :cond_9
    if-nez v4, :cond_c

    const/4 v1, 0x0

    :goto_8
    if-eqz v1, :cond_f

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v4, v5, 0x1

    int-to-short v7, v3

    aput-short v7, v1, v5

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v5, v4, 0x1

    add-int/lit8 v7, v3, 0x1

    int-to-short v7, v7

    aput-short v7, v1, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v1, v5, 0x1

    int-to-short v7, v2

    aput-short v7, v4, v5

    add-int/lit8 v3, v3, 0x1

    :goto_9
    move v5, v1

    goto/16 :goto_7

    :cond_a
    invoke-static {v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->cross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    goto/16 :goto_5

    :cond_b
    move v2, v3

    goto/16 :goto_6

    :cond_c
    if-nez v1, :cond_d

    const/4 v1, 0x1

    goto :goto_8

    :cond_d
    invoke-static {v7, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-static {v8, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v4

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->magVecSquared()F

    move-result v1

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->magVecSquared()F

    move-result v4

    cmpg-float v1, v1, v4

    if-gez v1, :cond_e

    const/4 v1, 0x1

    goto :goto_8

    :cond_e
    const/4 v1, 0x0

    goto :goto_8

    :cond_f
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v4, v5, 0x1

    int-to-short v7, v3

    aput-short v7, v1, v5

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v5, v4, 0x1

    add-int/lit8 v7, v2, -0x1

    int-to-short v7, v7

    aput-short v7, v1, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v1, v5, 0x1

    int-to-short v7, v2

    aput-short v7, v4, v5

    add-int/lit8 v2, v2, -0x1

    goto :goto_9

    :cond_10
    const/4 v3, 0x0

    add-int/lit8 v2, v2, -0x1

    const/4 v1, 0x0

    move v5, v1

    :goto_a
    sub-int v1, v2, v3

    const/4 v4, 0x1

    if-le v1, v4, :cond_1b

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v1, v3, 0x1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v9, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v1, v2, -0x1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v1, 0x0

    iput v1, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/4 v1, 0x0

    iput v1, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/4 v1, 0x0

    iput v1, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/4 v1, 0x0

    iput v1, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v11

    sub-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v11, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v11

    iget v11, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v11, v12

    sub-float/2addr v4, v11

    add-float/2addr v1, v4

    iget v4, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v11

    iget v11, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v11, v12

    sub-float/2addr v4, v11

    add-float v11, v1, v4

    iget v1, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v12

    sub-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v12

    iget v12, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v12, v13

    sub-float/2addr v4, v12

    add-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v12, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v12

    iget v12, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v12, v13

    sub-float/2addr v4, v12

    add-float v12, v1, v4

    iget v1, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v13

    sub-float/2addr v1, v4

    iget v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v13

    iget v13, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v13, v14

    sub-float/2addr v4, v13

    add-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v13, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v13

    iget v13, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v13, v14

    sub-float/2addr v4, v13

    add-float v13, v1, v4

    iget v1, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v14

    sub-float/2addr v1, v4

    iget v4, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v14

    iget v14, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v15, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v14, v15

    sub-float/2addr v4, v14

    add-float/2addr v1, v4

    iget v4, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v14, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v14

    iget v14, v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v15, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v14, v15

    sub-float/2addr v4, v14

    add-float v14, v1, v4

    const/4 v4, 0x1

    const/4 v1, 0x1

    const/4 v15, 0x0

    cmpg-float v11, v11, v15

    if-gez v11, :cond_11

    const/4 v4, 0x0

    :cond_11
    const/4 v11, 0x0

    cmpg-float v11, v14, v11

    if-gez v11, :cond_12

    const/4 v4, 0x0

    :cond_12
    const/4 v11, 0x0

    cmpg-float v11, v13, v11

    if-gez v11, :cond_13

    const/4 v1, 0x0

    :cond_13
    const/4 v11, 0x0

    cmpg-float v11, v12, v11

    if-gez v11, :cond_14

    const/4 v1, 0x0

    :cond_14
    if-nez v4, :cond_15

    const/4 v1, 0x0

    :goto_b
    if-eqz v1, :cond_18

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v4, v5, 0x1

    int-to-short v7, v3

    aput-short v7, v1, v5

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v5, v4, 0x1

    int-to-short v7, v2

    aput-short v7, v1, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v1, v5, 0x1

    add-int/lit8 v7, v3, 0x1

    int-to-short v7, v7

    aput-short v7, v4, v5

    add-int/lit8 v3, v3, 0x1

    :goto_c
    move v5, v1

    goto/16 :goto_a

    :cond_15
    if-nez v1, :cond_16

    const/4 v1, 0x1

    goto :goto_b

    :cond_16
    invoke-static {v7, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-static {v8, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v4

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->magVecSquared()F

    move-result v1

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->magVecSquared()F

    move-result v4

    cmpg-float v1, v1, v4

    if-gez v1, :cond_17

    const/4 v1, 0x1

    goto :goto_b

    :cond_17
    const/4 v1, 0x0

    goto :goto_b

    :cond_18
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v4, v5, 0x1

    int-to-short v7, v3

    aput-short v7, v1, v5

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v5, v4, 0x1

    int-to-short v7, v2

    aput-short v7, v1, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v1, v5, 0x1

    add-int/lit8 v7, v2, -0x1

    int-to-short v7, v7

    aput-short v7, v4, v5

    add-int/lit8 v2, v2, -0x1

    goto :goto_c

    :cond_19
    const/4 v3, 0x2

    const/4 v1, 0x1

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v4, v4, 0x200

    if-eqz v4, :cond_1a

    const/4 v3, 0x1

    const/4 v1, 0x2

    :cond_1a
    const/4 v4, 0x0

    :goto_d
    add-int/lit8 v5, v2, -0x2

    if-ge v4, v5, :cond_1b

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    mul-int/lit8 v6, v4, 0x3

    add-int/lit8 v7, v2, -0x1

    int-to-short v7, v7

    aput-short v7, v5, v6

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    mul-int/lit8 v6, v4, 0x3

    add-int/2addr v6, v3

    int-to-short v7, v4

    aput-short v7, v5, v6

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    mul-int/lit8 v6, v4, 0x3

    add-int/2addr v6, v1

    add-int/lit8 v7, v4, 0x1

    int-to-short v7, v7

    aput-short v7, v5, v6

    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_1b
    const/4 v1, 0x1

    return v1
.end method

.method private createSide(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z
    .locals 22

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v2, v2, 0x100

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    move v3, v2

    :goto_0
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->volumeParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-byte v5, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B

    and-int/lit8 v2, v5, 0x7

    int-to-byte v10, v2

    and-int/lit8 v2, v5, 0x40

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    move v4, v2

    :goto_1
    and-int/lit8 v2, v5, -0x80

    if-eqz v2, :cond_4

    const/4 v2, 0x1

    :goto_2
    if-eqz v4, :cond_5

    xor-int/lit8 v2, v2, 0x1

    move v4, v2

    :goto_3
    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v12, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v13, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget v14, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    mul-int/2addr v2, v5

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v6, v6, -0x1

    mul-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x6

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeVertices(I)V

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeIndices(I)V

    new-array v2, v5, [I

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Positions:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    float-to-double v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v0, v6

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_6

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v2, v2, 0x100

    if-eqz v2, :cond_6

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    const/4 v5, 0x2

    if-le v2, v5, :cond_6

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    div-int/lit8 v2, v2, 0x2

    move v5, v2

    :goto_4
    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginT:I

    move v7, v6

    move v6, v2

    :goto_5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginT:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/2addr v2, v8

    if-ge v6, v2, :cond_11

    invoke-virtual {v13, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    iget v0, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->TexT:F

    move/from16 v19, v0

    const/4 v2, 0x0

    move v9, v2

    move v8, v7

    :goto_6
    if-ge v9, v5, :cond_c

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v2, v2, 0x4

    if-nez v2, :cond_0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v2, v9

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v2, v7, :cond_8

    :cond_0
    if-eqz v9, :cond_7

    const/high16 v2, 0x3f800000    # 1.0f

    :goto_7
    if-eqz v4, :cond_1

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float v2, v7, v2

    :cond_1
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v7, v9

    if-lt v7, v14, :cond_a

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v7, v9

    add-int/lit8 v20, v6, -0x1

    mul-int v20, v20, v14

    add-int v7, v7, v20

    :goto_8
    invoke-virtual {v15, v8, v11, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;I)V

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v8, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    move/from16 v20, v0

    and-int/lit8 v20, v20, 0x10

    if-eqz v20, :cond_b

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    move/from16 v20, v0

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0x100

    move/from16 v20, v0

    if-eqz v20, :cond_b

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_b

    if-lez v9, :cond_b

    invoke-virtual {v15, v8, v11, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;I)V

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v8, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    add-int/lit8 v2, v8, 0x1

    :goto_9
    add-int/lit8 v7, v9, 0x1

    move v9, v7

    move v8, v2

    goto :goto_6

    :cond_2
    const/4 v2, 0x0

    move v3, v2

    goto/16 :goto_0

    :cond_3
    const/4 v2, 0x0

    move v4, v2

    goto/16 :goto_1

    :cond_4
    const/4 v2, 0x0

    goto/16 :goto_2

    :cond_5
    move v4, v2

    goto/16 :goto_3

    :cond_6
    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move v5, v2

    goto/16 :goto_4

    :cond_7
    const/4 v2, 0x0

    goto :goto_7

    :cond_8
    if-nez v3, :cond_9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v2, v9

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    goto/16 :goto_7

    :cond_9
    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v2, v9

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move/from16 v0, v18

    int-to-float v7, v0

    sub-float/2addr v2, v7

    goto/16 :goto_7

    :cond_a
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v7, v9

    mul-int v20, v14, v6

    add-int v7, v7, v20

    goto/16 :goto_8

    :cond_b
    move v2, v8

    goto :goto_9

    :cond_c
    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_d

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v2, v2, 0x100

    if-eqz v2, :cond_d

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    const/4 v7, 0x2

    if-le v2, v7, :cond_d

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_e

    add-int/lit8 v2, v5, -0x1

    :goto_a
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v7, v2

    mul-int v9, v14, v6

    add-int/2addr v7, v9

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v9, v2

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    if-ge v9, v0, :cond_f

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    add-int/2addr v2, v9

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move/from16 v0, v18

    int-to-float v9, v0

    sub-float/2addr v2, v9

    :goto_b
    invoke-virtual {v15, v8, v11, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;I)V

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v8, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    add-int/lit8 v7, v8, 0x1

    :goto_c
    add-int/lit8 v2, v6, 0x1

    move v6, v2

    goto/16 :goto_5

    :cond_d
    move v7, v8

    goto :goto_c

    :cond_e
    const/4 v2, 0x0

    goto :goto_a

    :cond_f
    if-eqz v2, :cond_10

    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_b

    :cond_10
    const/4 v2, 0x0

    goto :goto_b

    :cond_11
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    const/4 v4, 0x0

    invoke-virtual {v15, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v4, 0x0

    invoke-virtual {v15, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v15, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->minMaxVector(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    const/4 v4, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v2, v2, 0x100

    if-eqz v2, :cond_12

    const/4 v2, 0x1

    :goto_d
    const/4 v5, 0x0

    :goto_e
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v6, v6, -0x1

    if-ge v5, v6, :cond_20

    const/4 v6, 0x0

    :goto_f
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v7, v7, -0x1

    if-ge v6, v7, :cond_1f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v8, v4, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v9, v5

    add-int/2addr v9, v6

    int-to-short v9, v9

    aput-short v9, v7, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v7, v8, 0x1

    add-int/lit8 v9, v6, 0x1

    move-object/from16 v0, p0

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v12, v5, 0x1

    mul-int/2addr v11, v12

    add-int/2addr v9, v11

    int-to-short v9, v9

    aput-short v9, v4, v8

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v8, v7, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v11, v5, 0x1

    mul-int/2addr v9, v11

    add-int/2addr v9, v6

    int-to-short v9, v9

    aput-short v9, v4, v7

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v7, v8, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v9, v5

    add-int/2addr v9, v6

    int-to-short v9, v9

    aput-short v9, v4, v8

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v8, v7, 0x1

    add-int/lit8 v9, v6, 0x1

    move-object/from16 v0, p0

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v11, v5

    add-int/2addr v9, v11

    int-to-short v9, v9

    aput-short v9, v4, v7

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    add-int/lit8 v4, v8, 0x1

    add-int/lit8 v9, v6, 0x1

    move-object/from16 v0, p0

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v12, v5, 0x1

    mul-int/2addr v11, v12

    add-int/2addr v9, v11

    int-to-short v9, v9

    aput-short v9, v7, v8

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v8, v3, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    mul-int/2addr v9, v5

    mul-int/lit8 v11, v6, 0x2

    add-int/2addr v9, v11

    add-int/lit8 v9, v9, 0x1

    aput v9, v7, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v3, v3, -0x2

    if-ge v5, v3, :cond_13

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v8, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    add-int/lit8 v11, v5, 0x1

    mul-int/2addr v9, v11

    mul-int/lit8 v11, v6, 0x2

    add-int/2addr v9, v11

    add-int/lit8 v9, v9, 0x1

    aput v9, v7, v8

    move v7, v3

    :goto_10
    if-lez v6, :cond_16

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v7, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    mul-int/2addr v9, v5

    mul-int/lit8 v11, v6, 0x2

    add-int/2addr v9, v11

    add-int/lit8 v9, v9, -0x1

    aput v9, v8, v7

    move v7, v3

    :goto_11
    if-lez v5, :cond_19

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v7, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    add-int/lit8 v11, v5, -0x1

    mul-int/2addr v9, v11

    mul-int/lit8 v11, v6, 0x2

    add-int/2addr v9, v11

    aput v9, v8, v7

    :goto_12
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v7, v7, -0x2

    if-ge v6, v7, :cond_1c

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v7, v3, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    mul-int/2addr v9, v5

    add-int/lit8 v11, v6, 0x1

    mul-int/lit8 v11, v11, 0x2

    add-int/2addr v9, v11

    aput v9, v8, v3

    :goto_13
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v7, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    mul-int/2addr v9, v5

    mul-int/lit8 v11, v6, 0x2

    add-int/2addr v9, v11

    aput v9, v8, v7

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_f

    :cond_12
    const/4 v2, 0x0

    goto/16 :goto_d

    :cond_13
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    const/4 v7, 0x3

    if-le v3, v7, :cond_14

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    if-eqz v3, :cond_15

    :cond_14
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v8, 0x1

    const/4 v9, -0x1

    aput v9, v7, v8

    move v7, v3

    goto/16 :goto_10

    :cond_15
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v8, 0x1

    mul-int/lit8 v9, v6, 0x2

    add-int/lit8 v9, v9, 0x1

    aput v9, v7, v8

    move v7, v3

    goto/16 :goto_10

    :cond_16
    if-nez v2, :cond_17

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    if-eqz v3, :cond_18

    :cond_17
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v7, 0x1

    const/4 v9, -0x1

    aput v9, v8, v7

    move v7, v3

    goto/16 :goto_11

    :cond_18
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v7, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    mul-int/2addr v9, v5

    move-object/from16 v0, p0

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v11, v11, -0x2

    mul-int/lit8 v11, v11, 0x2

    add-int/2addr v9, v11

    add-int/lit8 v9, v9, 0x1

    aput v9, v8, v7

    move v7, v3

    goto/16 :goto_11

    :cond_19
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    const/4 v8, 0x3

    if-le v3, v8, :cond_1a

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    if-eqz v3, :cond_1b

    :cond_1a
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v7, 0x1

    const/4 v9, -0x1

    aput v9, v8, v7

    goto/16 :goto_12

    :cond_1b
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v3, v7, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    move-object/from16 v0, p0

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v11, v11, -0x2

    mul-int/2addr v9, v11

    mul-int/lit8 v11, v6, 0x2

    add-int/2addr v9, v11

    aput v9, v8, v7

    goto/16 :goto_12

    :cond_1c
    if-nez v2, :cond_1d

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v7, v7, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    if-eqz v7, :cond_1e

    :cond_1d
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v7, v3, 0x1

    const/4 v9, -0x1

    aput v9, v8, v3

    goto/16 :goto_13

    :cond_1e
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Edge:[I

    add-int/lit8 v7, v3, 0x1

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v9, v9, -0x1

    mul-int/lit8 v9, v9, 0x2

    mul-int/2addr v9, v5

    aput v9, v8, v3

    goto/16 :goto_13

    :cond_1f
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_e

    :cond_20
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->clear()V

    const/4 v2, 0x3

    new-array v4, v2, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v2, 0x3

    new-array v5, v2, [S

    const/4 v2, 0x0

    :goto_14
    const/4 v3, 0x3

    if-ge v2, v3, :cond_21

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    aput-object v3, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    :cond_21
    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    const/4 v2, 0x0

    :goto_15
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    div-int/lit8 v3, v3, 0x3

    if-ge v2, v3, :cond_24

    const/4 v3, 0x0

    :goto_16
    const/4 v8, 0x3

    if-ge v3, v8, :cond_22

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    mul-int/lit8 v9, v2, 0x3

    add-int/2addr v9, v3

    aget-short v8, v8, v9

    aput-short v8, v5, v3

    aget-short v8, v5, v3

    aget-object v9, v4, v3

    invoke-virtual {v15, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :cond_22
    const/4 v3, 0x0

    aget-object v3, v4, v3

    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-virtual {v6, v3, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v3, 0x0

    aget-object v3, v4, v3

    const/4 v8, 0x2

    aget-object v8, v4, v8

    invoke-virtual {v7, v3, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setCross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v3, 0x0

    :goto_17
    const/4 v8, 0x3

    if-ge v3, v8, :cond_23

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    aget-short v9, v5, v3

    invoke-virtual {v8, v9, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->add(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_23
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    and-int/lit8 v8, v2, 0x1

    add-int/lit8 v8, v8, 0x1

    aget-short v8, v5, v8

    invoke-virtual {v3, v8, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->add(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    :cond_24
    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v15, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v6, v6, -0x2

    mul-int/2addr v2, v6

    invoke-virtual {v15, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v3, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v2

    const v6, 0x358637bd    # 1.0E-6f

    cmpg-float v2, v2, v6

    if-gez v2, :cond_25

    const/4 v2, 0x1

    :goto_18
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v15, v6, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v7, v7, -0x2

    mul-int/2addr v6, v7

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v15, v6, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v3, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v3

    const v4, 0x358637bd    # 1.0E-6f

    cmpg-float v3, v3, v4

    if-gez v3, :cond_26

    const/4 v3, 0x1

    move v4, v3

    :goto_19
    if-nez v10, :cond_2a

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    if-nez v3, :cond_27

    const/4 v3, 0x0

    :goto_1a
    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    if-ge v3, v5, :cond_27

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v6, v6, -0x1

    mul-int/2addr v5, v6

    add-int/2addr v5, v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->setAdd(II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_25
    const/4 v2, 0x0

    goto :goto_18

    :cond_26
    const/4 v3, 0x0

    move v4, v3

    goto :goto_19

    :cond_27
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-boolean v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    if-nez v3, :cond_28

    xor-int/lit8 v3, v2, 0x1

    if-eqz v3, :cond_28

    const/4 v3, 0x0

    :goto_1b
    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    if-ge v3, v5, :cond_28

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v5, v3

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v6, v3

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->setAdd(II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    :cond_28
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->getPathType()B

    move-result v3

    const/16 v5, 0x20

    if-ne v3, v5, :cond_32

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->getProfileType()B

    move-result v3

    and-int/lit8 v3, v3, 0xf

    const/4 v5, 0x5

    if-ne v3, v5, :cond_32

    if-eqz v2, :cond_29

    const/4 v2, 0x0

    :goto_1c
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    if-ge v2, v3, :cond_29

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v3, v2

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(IFFF)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    :cond_29
    if-eqz v4, :cond_32

    const/4 v2, 0x0

    :goto_1d
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    if-ge v2, v3, :cond_32

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v3, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    const/high16 v4, -0x40800000    # -1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(IFFF)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    :cond_2a
    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x1

    if-ne v10, v5, :cond_34

    const/4 v4, 0x1

    move v5, v4

    :goto_1e
    const/4 v4, 0x1

    if-eq v10, v4, :cond_2b

    const/4 v4, 0x2

    if-ne v10, v4, :cond_2c

    :cond_2b
    const/4 v3, 0x1

    move v4, v3

    :goto_1f
    const/4 v3, 0x2

    if-ne v10, v3, :cond_33

    const/4 v2, 0x1

    move v3, v2

    :goto_20
    if-eqz v5, :cond_30

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    const/4 v2, 0x0

    :goto_21
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    if-ge v2, v6, :cond_2d

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->addToVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    :cond_2c
    const/4 v4, 0x4

    if-eq v10, v4, :cond_2b

    move v4, v3

    goto :goto_1f

    :cond_2d
    const/4 v2, 0x0

    :goto_22
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    if-ge v2, v6, :cond_2e

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    :cond_2e
    const/4 v2, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, v2, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    const/4 v2, 0x0

    :goto_23
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    if-ge v2, v6, :cond_2f

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v7, v7, -0x1

    mul-int/2addr v6, v7

    add-int/2addr v6, v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v6, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->addToVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    :cond_2f
    const/4 v2, 0x0

    :goto_24
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    if-ge v2, v6, :cond_30

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v7, v7, -0x1

    mul-int/2addr v6, v7

    add-int/2addr v6, v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v6, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    :cond_30
    if-eqz v4, :cond_31

    const/4 v2, 0x0

    :goto_25
    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    if-ge v2, v4, :cond_31

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v4, v2

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    mul-int/2addr v5, v2

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->setAdd(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    :cond_31
    if-eqz v3, :cond_32

    const/4 v2, 0x0

    :goto_26
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    if-ge v2, v3, :cond_32

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumS:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumT:I

    add-int/lit8 v4, v4, -0x1

    mul-int/2addr v3, v4

    add-int/2addr v3, v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->setAdd(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    :cond_32
    const/4 v2, 0x1

    return v2

    :cond_33
    move v3, v2

    goto/16 :goto_20

    :cond_34
    move v5, v4

    goto/16 :goto_1e
.end method

.method private createUnCutCubeCap(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z
    .locals 25

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Mesh:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget-object v8, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Profile:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;->Path:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    div-int/lit8 v19, v5, 0x4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v6, 0x0

    aget-object v20, v5, v6

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Extents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v6, 0x1

    aget-object v21, v5, v6

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v5, v5, 0x200

    if-eqz v5, :cond_0

    add-int/lit8 v4, v4, -0x1

    mul-int/2addr v3, v4

    move v4, v3

    :goto_0
    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    const/4 v3, 0x4

    invoke-direct {v5, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;-><init>(I)V

    new-instance v22, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct/range {v22 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getVertices()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v9

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getTexCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-result-object v10

    const/4 v3, 0x0

    move v6, v3

    :goto_1
    const/4 v3, 0x4

    if-ge v6, v3, :cond_1

    mul-int v3, v19, v6

    add-int/2addr v3, v4

    invoke-virtual {v9, v6, v7, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;I)V

    mul-int v3, v19, v6

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v11, v3

    mul-int v3, v19, v6

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/high16 v12, 0x3f000000    # 0.5f

    sub-float v3, v12, v3

    invoke-virtual {v10, v6, v11, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    add-int/lit8 v3, v6, 0x1

    move v6, v3

    goto :goto_1

    :cond_0
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->BeginS:I

    move v4, v3

    goto :goto_0

    :cond_1
    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    const/4 v4, 0x1

    const/4 v6, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v9, v4, v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getSub(IILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v4, 0x2

    const/4 v6, 0x1

    invoke-virtual {v9, v4, v6, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getSub(IILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setCross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual/range {v22 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v3, v3, 0x200

    if-nez v3, :cond_2

    const/high16 v3, -0x40800000    # -1.0f

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    :goto_2
    add-int/lit8 v3, v19, 0x1

    add-int/lit8 v4, v19, 0x1

    mul-int/2addr v3, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeVertices(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Positions:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v23, v0

    const/4 v4, 0x0

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v15}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>()V

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct/range {v16 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>()V

    const/4 v3, 0x0

    move/from16 v18, v3

    :goto_3
    add-int/lit8 v3, v19, 0x1

    move/from16 v0, v18

    if-ge v0, v3, :cond_5

    const/4 v3, 0x0

    move/from16 v17, v3

    :goto_4
    add-int/lit8 v3, v19, 0x1

    move/from16 v0, v17

    if-ge v0, v3, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    move/from16 v0, v18

    int-to-float v6, v0

    move/from16 v0, v19

    int-to-float v7, v0

    div-float v11, v6, v7

    move/from16 v0, v17

    int-to-float v6, v0

    move/from16 v0, v19

    int-to-float v7, v0

    div-float v12, v6, v7

    const/4 v6, 0x0

    const/4 v8, 0x1

    const/4 v10, 0x3

    move-object v7, v5

    move-object v9, v5

    invoke-virtual/range {v3 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->LerpPlanarVertex(ILcom/lumiyaviewer/lumiya/slproto/types/VertexArray;ILcom/lumiyaviewer/lumiya/slproto/types/VertexArray;ILcom/lumiyaviewer/lumiya/slproto/types/VertexArray;IFFLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getNormals()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v3, v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    if-nez v18, :cond_3

    if-nez v17, :cond_3

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :goto_5
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v17, 0x1

    move/from16 v17, v3

    goto :goto_4

    :cond_2
    const/4 v3, 0x0

    const/4 v4, 0x3

    invoke-virtual {v10, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->swap(II)V

    const/4 v3, 0x1

    const/4 v4, 0x2

    invoke-virtual {v10, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->swap(II)V

    goto/16 :goto_2

    :cond_3
    move-object/from16 v0, v23

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v4, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->minMaxVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    goto :goto_5

    :cond_4
    add-int/lit8 v3, v18, 0x1

    move/from16 v18, v3

    goto :goto_3

    :cond_5
    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, v20

    invoke-direct {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v4, 0x3f000000    # 0.5f

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    mul-int v3, v19, v19

    mul-int/lit8 v3, v3, 0x6

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->resizeIndices(I)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    const/4 v3, 0x6

    new-array v9, v3, [S

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-short v3, v9, v4

    const/4 v3, 0x1

    const/4 v4, 0x1

    aput-short v3, v9, v4

    add-int/lit8 v3, v19, 0x1

    add-int/lit8 v3, v3, 0x1

    int-to-short v3, v3

    const/4 v4, 0x2

    aput-short v3, v9, v4

    add-int/lit8 v3, v19, 0x1

    add-int/lit8 v3, v3, 0x1

    int-to-short v3, v3

    const/4 v4, 0x3

    aput-short v3, v9, v4

    add-int/lit8 v3, v19, 0x1

    int-to-short v3, v3

    const/4 v4, 0x4

    aput-short v3, v9, v4

    const/4 v3, 0x0

    const/4 v4, 0x5

    aput-short v3, v9, v4

    const/4 v4, 0x0

    const/4 v3, 0x0

    move v7, v3

    :goto_6
    move/from16 v0, v19

    if-ge v7, v0, :cond_9

    const/4 v3, 0x0

    move v6, v3

    :goto_7
    move/from16 v0, v19

    if-ge v6, v0, :cond_8

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit16 v3, v3, 0x200

    if-eqz v3, :cond_6

    const/4 v3, 0x5

    move/from16 v24, v3

    move v3, v4

    move/from16 v4, v24

    :goto_8
    if-ltz v4, :cond_7

    add-int/lit8 v5, v19, 0x1

    mul-int/2addr v5, v6

    add-int/2addr v5, v7

    aget-short v10, v9, v4

    add-int/2addr v5, v10

    int-to-short v5, v5

    aput-short v5, v8, v3

    add-int/lit8 v5, v3, 0x1

    add-int/lit8 v3, v4, -0x1

    move v4, v3

    move v3, v5

    goto :goto_8

    :cond_6
    const/4 v3, 0x0

    move/from16 v24, v3

    move v3, v4

    move/from16 v4, v24

    :goto_9
    const/4 v5, 0x6

    if-ge v4, v5, :cond_7

    add-int/lit8 v5, v19, 0x1

    mul-int/2addr v5, v6

    add-int/2addr v5, v7

    aget-short v10, v9, v4

    add-int/2addr v5, v10

    int-to-short v5, v5

    aput-short v5, v8, v3

    add-int/lit8 v5, v3, 0x1

    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move v3, v5

    goto :goto_9

    :cond_7
    add-int/lit8 v4, v6, 0x1

    move v6, v4

    move v4, v3

    goto :goto_7

    :cond_8
    add-int/lit8 v3, v7, 0x1

    move v7, v3

    goto :goto_6

    :cond_9
    const/4 v3, 0x1

    return v3
.end method

.method private resizeIndices(I)V
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    if-eq p1, v0, :cond_0

    if-eqz p1, :cond_1

    new-array v0, p1, [S

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    :goto_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumIndices:I

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Indices:[S

    goto :goto_0
.end method

.method private resizeVertices(I)V
    .locals 2

    const/4 v1, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    if-eq v0, p1, :cond_0

    if-eqz p1, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getVertices()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Positions:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getNormals()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->getTexCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    :goto_0
    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->NumVertices:I

    :cond_0
    return-void

    :cond_1
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Positions:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->Normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->vertexArray:Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;

    goto :goto_0
.end method


# virtual methods
.method public create(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z
    .locals 8

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v1, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->createCap(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z

    move-result v0

    :goto_0
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v3, v7, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    aput-object v3, v2, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v3, v6, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    aput-object v3, v2, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v3, v3, v1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v4, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->minMaxVector(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v2, v2, v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v3, v3, v1

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    invoke-static {v6, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v2, v2, v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v1, v3, v1

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-static {v6, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v1, v1, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v2, v2, v5

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    invoke-static {v7, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v1, v1, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TexCoordExtents:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v2, v2, v5

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-static {v7, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :cond_0
    return v0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->TypeMask:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_3

    :cond_2
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeFace;->createSide(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolume;)Z

    move-result v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method
