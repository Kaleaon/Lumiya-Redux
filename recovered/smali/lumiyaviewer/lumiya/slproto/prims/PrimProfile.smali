.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;
    }
.end annotation


# static fields
.field public static final MIN_DETAIL_FACES:I = 0x6

.field private static final tableScale:[F


# instance fields
.field public Concave:Z

.field public Dirty:Z

.field public EdgeCenters:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public EdgeNormals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Faces:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;",
            ">;"
        }
    .end annotation
.end field

.field public Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

.field public Open:Z

.field public Profile:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;",
            ">;"
        }
    .end annotation
.end field

.field public Total:I

.field public TotalOut:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->tableScale:[F

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
        0x3f3504f7
        0x3f07ae14    # 0.53f
        0x3f066666    # 0.525f
        0x3f000000    # 0.5f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Concave:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Dirty:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    return-void
.end method

.method private addCap(S)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;-><init>()V

    const/4 v1, 0x0

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Index:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Count:I

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->ScaleU:F

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Cap:Z

    iput-short p1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->FaceID:S

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;-><init>()V

    iput p1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Index:I

    iput p2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Count:I

    iput p3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->ScaleU:F

    iput-boolean p5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Flat:Z

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Cap:Z

    iput-short p4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->FaceID:S

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;
    .locals 7

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    float-to-double v0, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v2, v0

    const/high16 v4, -0x40800000    # -1.0f

    move-object v0, p0

    move-object v1, p1

    move v3, p4

    move v5, p6

    move v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    sub-int v2, v0, v2

    const/4 v3, 0x0

    const/4 v4, 0x4

    move-object v0, p0

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    move-result-object v3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    new-array v4, v0, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    move v1, v0

    :goto_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    if-ge v1, v0, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    aput-object v2, v4, v1

    aget-object v0, v4, v1

    invoke-virtual {v0, p5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v1, v0, -0x1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    :goto_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    if-ge v0, v2, :cond_1

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    add-int/lit8 v2, v1, -0x1

    aget-object v1, v4, v1

    invoke-virtual {v5, v0, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    move v1, v2

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Cap:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Count:I

    mul-int/lit8 v2, v2, 0x2

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Count:I

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_3
    return-object v3
.end method

.method private genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)V
    .locals 16

    const/high16 v2, 0x3f000000    # 0.5f

    move-object/from16 v0, p1

    iget v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    move-object/from16 v0, p1

    iget v9, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    move/from16 v0, p2

    int-to-float v3, v0

    const/high16 v4, 0x3f800000    # 1.0f

    div-float v10, v4, v3

    const v3, 0x40c90fdb

    mul-float/2addr v3, v10

    mul-float v11, v3, p5

    move/from16 v0, p2

    int-to-float v3, v0

    div-float v3, v3, p5

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    const/16 v4, 0x8

    if-ge v3, v4, :cond_8

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->tableScale:[F

    aget v2, v2, v3

    move v3, v2

    :goto_0
    move/from16 v0, p2

    int-to-float v2, v0

    mul-float/2addr v2, v8

    float-to-double v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    move/from16 v0, p2

    int-to-float v2, v0

    float-to-double v6, v2

    div-double/2addr v4, v6

    double-to-float v6, v4

    mul-float v2, v6, p5

    add-float v2, v2, p3

    const v4, 0x40c90fdb

    mul-float/2addr v4, v2

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    float-to-double v12, v4

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v5, v12

    mul-float/2addr v5, v3

    float-to-double v12, v4

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v7, v12

    mul-float/2addr v7, v3

    invoke-direct {v2, v5, v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    add-float v5, v6, v10

    add-float/2addr v4, v11

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    float-to-double v12, v4

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v12, v12

    mul-float/2addr v12, v3

    float-to-double v14, v4

    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    double-to-float v13, v14

    mul-float/2addr v13, v3

    invoke-direct {v7, v12, v13, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    sub-float v6, v8, v6

    move/from16 v0, p2

    int-to-float v12, v0

    mul-float/2addr v6, v12

    const v12, 0x3f7ff972    # 0.9999f

    cmpg-float v12, v6, v12

    if-gez v12, :cond_7

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-static {v2, v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->lerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v6

    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v6, v4

    move v7, v5

    :goto_1
    cmpg-float v4, v7, v9

    if-gez v4, :cond_1

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    float-to-double v12, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v2, v12

    mul-float/2addr v2, v3

    float-to-double v12, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v4, v12

    mul-float/2addr v4, v3

    invoke-direct {v5, v2, v4, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v4, 0x0

    :goto_2
    move/from16 v0, p6

    if-ge v4, v0, :cond_0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    add-int/lit8 v13, p6, 0x1

    int-to-float v13, v13

    const/high16 v14, 0x3f800000    # 1.0f

    div-float v13, v14, v13

    add-int/lit8 v14, v4, 0x1

    int-to-float v14, v14

    mul-float/2addr v13, v14

    invoke-static {v2, v5, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->lerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-float v4, v7, v10

    add-float v2, v6, v11

    move v6, v2

    move v7, v4

    move-object v2, v5

    goto :goto_1

    :cond_1
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    float-to-double v12, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v5, v12

    mul-float/2addr v5, v3

    float-to-double v12, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v6, v12

    mul-float/2addr v3, v6

    invoke-direct {v4, v5, v3, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    sub-float v3, v7, v10

    sub-float v3, v9, v3

    move/from16 v0, p2

    int-to-float v5, v0

    mul-float/2addr v3, v5

    const v5, 0x38d1b717    # 1.0E-4f

    cmpl-float v5, v3, v5

    if-lez v5, :cond_3

    invoke-static {v2, v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->lerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v3, 0x0

    :goto_3
    move/from16 v0, p6

    if-ge v3, v0, :cond_2

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    add-int/lit8 v6, p6, 0x1

    int-to-float v6, v6

    const/high16 v7, 0x3f800000    # 1.0f

    div-float v6, v7, v6

    add-int/lit8 v7, v3, 0x1

    int-to-float v7, v7

    mul-float/2addr v6, v7

    invoke-static {v2, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->lerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    sub-float v2, v9, v8

    mul-float v2, v2, p5

    const v3, 0x3f7d70a4    # 0.99f

    cmpg-float v2, v2, v3

    if-gez v2, :cond_6

    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    sub-float v2, v9, v8

    mul-float v2, v2, p5

    const/high16 v3, 0x3f000000    # 0.5f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5

    const/4 v2, 0x1

    :goto_4
    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Concave:Z

    move-object/from16 v0, p1

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct {v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    :goto_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    return-void

    :cond_5
    const/4 v2, 0x0

    goto :goto_4

    :cond_6
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Concave:Z

    goto :goto_5

    :cond_7
    move v6, v4

    move v7, v5

    goto/16 :goto_1

    :cond_8
    move v3, v2

    goto/16 :goto_0
.end method

.method private static getNumNGonPoints(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)I
    .locals 11

    const/4 v1, 0x0

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    int-to-float v0, p1

    const/high16 v2, 0x3f800000    # 1.0f

    div-float v5, v2, v0

    int-to-float v0, p1

    mul-float/2addr v0, v3

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    int-to-float v0, p1

    float-to-double v8, v0

    div-double/2addr v6, v8

    double-to-float v2, v6

    add-float v0, v2, v5

    sub-float v2, v3, v2

    int-to-float v6, p1

    mul-float/2addr v2, v6

    const v6, 0x3f7ff972    # 0.9999f

    cmpg-float v2, v2, v6

    if-gez v2, :cond_3

    const/4 v1, 0x1

    move v10, v0

    move v0, v1

    move v1, v10

    :goto_0
    cmpg-float v2, v1, v4

    if-gez v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    add-float v0, v1, v5

    move v1, v0

    move v0, v2

    goto :goto_0

    :cond_0
    sub-float/2addr v1, v5

    sub-float v1, v4, v1

    int-to-float v2, p1

    mul-float/2addr v1, v2

    const v2, 0x38d1b717    # 1.0E-4f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    :cond_1
    sub-float v1, v4, v3

    mul-float/2addr v1, p4

    const v2, 0x3f7d70a4    # 0.99f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_2

    add-int/lit8 v0, v0, 0x1

    :cond_2
    return v0

    :cond_3
    move v10, v0

    move v0, v1

    move v1, v10

    goto :goto_0
.end method

.method public static getNumPoints(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFIZI)I
    .locals 7

    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-gez v0, :cond_0

    const/4 p2, 0x0

    :cond_0
    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    const/4 v0, 0x0

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v1, v1, 0xf

    packed-switch v1, :pswitch_data_0

    :cond_1
    :goto_0
    return v0

    :pswitch_0
    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v1, 0x4

    const/high16 v2, -0x41400000    # -0.375f

    move-object v0, p0

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->getNumNGonPoints(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)I

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v6, v1

    if-eqz v1, :cond_1

    mul-int/lit8 v0, v0, 0x2

    goto :goto_0

    :pswitch_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v1, 0x3

    move-object v0, p0

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->getNumNGonPoints(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)I

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v6, v1

    if-eqz v1, :cond_1

    mul-int/lit8 v0, v0, 0x2

    goto :goto_0

    :pswitch_2
    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v0, p2

    const/4 v1, 0x0

    cmpl-float v1, v6, v1

    if-eqz v1, :cond_2

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v1, v1, -0x10

    const/16 v2, 0x20

    if-ne v1, v2, :cond_2

    const/high16 v1, 0x40800000    # 4.0f

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    mul-double/2addr v0, v2

    double-to-float v0, v0

    :cond_2
    float-to-int v1, v0

    if-eqz p4, :cond_3

    move v1, p5

    :cond_3
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->getNumNGonPoints(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)I

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v6, v1

    if-eqz v1, :cond_1

    mul-int/lit8 v0, v0, 0x2

    goto :goto_0

    :pswitch_3
    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v0, p2

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    const/4 v1, 0x0

    cmpl-float v1, v6, v1

    if-eqz v1, :cond_4

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v1, v1, -0x10

    const/16 v2, 0x20

    if-ne v1, v2, :cond_4

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    mul-double/2addr v0, v2

    double-to-float v0, v0

    :cond_4
    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v1, v0

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->getNumNGonPoints(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)I

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v6, v1

    if-eqz v1, :cond_5

    mul-int/lit8 v0, v0, 0x2

    :cond_5
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    sub-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_6

    const/4 v1, 0x1

    :goto_1
    if-nez v1, :cond_1

    const/4 v1, 0x0

    cmpl-float v1, v6, v1

    if-nez v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_6
    const/4 v1, 0x0

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method protected genNormals(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;)V
    .locals 13

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    move v1, v0

    :goto_0
    mul-int/lit8 v0, v8, 0x2

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->EdgeNormals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    mul-int/lit8 v0, v8, 0x2

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->EdgeCenters:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-array v0, v8, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_3

    const/4 v0, 0x1

    move v2, v0

    :goto_1
    const/4 v0, 0x0

    move v7, v0

    :goto_2
    if-ge v7, v8, :cond_8

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-direct {v4, v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    aput-object v4, v3, v7

    if-eqz v2, :cond_0

    if-lt v7, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v0, v0, v7

    const/high16 v3, -0x40800000    # -1.0f

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->mul(F)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v0, v0, v7

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->magVec()F

    move-result v0

    float-to-double v4, v0

    const-wide v10, 0x3f50624dd2f1a9fcL    # 0.001

    cmpg-double v0, v4, v10

    if-gez v0, :cond_1

    add-int/lit8 v0, v7, -0x1

    if-ltz v0, :cond_4

    add-int/lit8 v0, v7, -0x1

    move v6, v0

    :goto_3
    add-int/lit8 v0, v6, -0x1

    if-ltz v0, :cond_5

    add-int/lit8 v0, v6, -0x1

    move v5, v0

    :goto_4
    add-int/lit8 v0, v7, 0x1

    if-ge v0, v8, :cond_6

    add-int/lit8 v0, v7, 0x1

    move v4, v0

    :goto_5
    add-int/lit8 v0, v4, 0x1

    if-ge v0, v8, :cond_7

    add-int/lit8 v0, v4, 0x1

    move v3, v0

    :goto_6
    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v10, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v10, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v10, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float v6, v11, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float v0, v6, v0

    invoke-direct {v9, v10, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v6, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v6, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v10, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float v4, v10, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float v0, v4, v0

    invoke-direct {v5, v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-static {v9, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->sum(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-result-object v3

    aput-object v3, v0, v7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v0, v0, v7

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->mul(F)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Normals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    aget-object v0, v0, v7

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->normVec()F

    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto/16 :goto_2

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    div-int/lit8 v0, v0, 0x2

    move v1, v0

    goto/16 :goto_0

    :cond_3
    const/4 v0, 0x0

    move v2, v0

    goto/16 :goto_1

    :cond_4
    add-int/lit8 v0, v8, -0x1

    move v6, v0

    goto/16 :goto_3

    :cond_5
    add-int/lit8 v0, v8, -0x1

    move v5, v0

    goto/16 :goto_4

    :cond_6
    const/4 v0, 0x0

    move v4, v0

    goto/16 :goto_5

    :cond_7
    const/4 v0, 0x0

    move v3, v0

    goto/16 :goto_6

    :cond_8
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Concave:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x2

    move v1, v0

    :goto_7
    const/4 v0, 0x0

    move v4, v0

    :goto_8
    if-ge v4, v1, :cond_f

    const/4 v0, 0x0

    move v2, v0

    :goto_9
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    if-ge v2, v0, :cond_e

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    const/4 v0, 0x0

    iput v0, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Concave:Z

    if-eqz v0, :cond_b

    if-nez v4, :cond_b

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v0, v0, 0x2

    if-ne v2, v0, :cond_b

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    :cond_9
    :goto_a
    const/4 v3, 0x0

    iput v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-static {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z_axis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setCross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->EdgeNormals:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    mul-int v7, v4, v8

    add-int/2addr v7, v2

    aput-object v3, v6, v7

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->EdgeCenters:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    mul-int v6, v4, v8

    add-int/2addr v6, v2

    const/high16 v7, 0x3f000000    # 0.5f

    invoke-static {v5, v0, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->lerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    aput-object v0, v3, v6

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_9

    :cond_a
    const/4 v0, 0x1

    move v1, v0

    goto :goto_7

    :cond_b
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Concave:Z

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    if-ne v4, v0, :cond_c

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v0, v0, -0x1

    if-ne v2, v0, :cond_c

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v3, v3, -0x1

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    goto :goto_a

    :cond_c
    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    add-int/lit8 v0, v2, 0x1

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    rem-int/2addr v0, v7

    move v12, v0

    move-object v0, v3

    move v3, v12

    :cond_d
    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->magVecSquared()F

    move-result v7

    const v9, 0x38d1b717    # 1.0E-4f

    cmpg-float v7, v7, v9

    if-gez v7, :cond_9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6, v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v3, v3, 0x1

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    rem-int/2addr v3, v7

    if-ne v3, v2, :cond_d

    goto :goto_a

    :cond_e
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto/16 :goto_8

    :cond_f
    return-void
.end method

.method public generate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFIZI)Z
    .locals 12

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Dirty:Z

    if-nez v0, :cond_0

    xor-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Dirty:Z

    const/4 v0, 0x0

    cmpg-float v0, p3, v0

    if-gez v0, :cond_1

    const/4 p3, 0x0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget v9, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    iget v10, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    iget v11, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    const v0, 0x3c23d70a    # 0.01f

    sub-float v0, v10, v0

    cmpl-float v0, v9, v0

    if-lez v0, :cond_2

    const/4 v0, 0x0

    return v0

    :cond_2
    const/4 v7, 0x0

    iget-byte v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v0, v0, 0xf

    packed-switch v0, :pswitch_data_0

    :cond_3
    :goto_0
    if-eqz p2, :cond_4

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addCap(S)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_4
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v1, v0, -0x1

    const/4 v2, 0x2

    const/high16 v3, 0x3f000000    # 0.5f

    const/16 v4, 0x8

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-eqz v0, :cond_14

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->TotalOut:I

    add-int/lit8 v1, v0, -0x1

    const/4 v2, 0x2

    const/high16 v3, 0x3f000000    # 0.5f

    const/16 v4, 0x10

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_5
    :goto_1
    const/4 v0, 0x1

    return v0

    :pswitch_0
    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v2, 0x4

    const/high16 v3, -0x41400000    # -0.375f

    move-object v0, p0

    move-object v1, p1

    move/from16 v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)V

    if-eqz p2, :cond_6

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addCap(S)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_6
    const/high16 v0, 0x40800000    # 4.0f

    mul-float/2addr v0, v9

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    move v6, v0

    move v0, v7

    :goto_2
    const/high16 v1, 0x40800000    # 4.0f

    mul-float/2addr v1, v10

    const v2, 0x3f7fbe77    # 0.999f

    add-float/2addr v1, v2

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v1, v2

    if-ge v6, v1, :cond_7

    add-int/lit8 v7, v0, 0x1

    add-int/lit8 v1, p4, 0x1

    mul-int/2addr v1, v0

    add-int/lit8 v2, p4, 0x2

    const/16 v0, 0x20

    shl-int/2addr v0, v6

    int-to-short v4, v0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    add-int/lit8 v0, v6, 0x1

    move v6, v0

    move v0, v7

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    move v1, v0

    :goto_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/high16 v3, 0x40800000    # 4.0f

    mul-float/2addr v2, v3

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_3

    :cond_8
    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-eqz v0, :cond_9

    iget-byte v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v0, v0, -0x10

    sparse-switch v0, :sswitch_data_0

    const/high16 v3, 0x40800000    # 4.0f

    const/4 v2, 0x1

    const/high16 v4, -0x41400000    # -0.375f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v5, v11

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_9
    :goto_4
    if-eqz p2, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Faces:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;->Count:I

    goto/16 :goto_0

    :sswitch_0
    const/high16 v3, 0x40400000    # 3.0f

    const/4 v2, 0x1

    const/high16 v4, -0x41400000    # -0.375f

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v5, v11

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto :goto_4

    :sswitch_1
    const/high16 v0, 0x40c00000    # 6.0f

    mul-float v3, v0, p3

    const/4 v2, 0x0

    const/high16 v4, -0x41400000    # -0.375f

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v5, v11

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto :goto_4

    :pswitch_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v2, 0x3

    move-object v0, p0

    move-object v1, p1

    move/from16 v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)V

    const/4 v0, 0x0

    move v1, v0

    :goto_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/high16 v3, 0x40400000    # 3.0f

    mul-float/2addr v2, v3

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_5

    :cond_a
    if-eqz p2, :cond_b

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addCap(S)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_b
    const/high16 v0, 0x40400000    # 3.0f

    mul-float/2addr v0, v9

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    move v6, v0

    :goto_6
    const/high16 v0, 0x40400000    # 3.0f

    mul-float/2addr v0, v10

    const v1, 0x3f7fbe77    # 0.999f

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    if-ge v6, v0, :cond_c

    add-int/lit8 v8, v7, 0x1

    add-int/lit8 v0, p4, 0x1

    mul-int v1, v7, v0

    add-int/lit8 v2, p4, 0x2

    const/high16 v3, 0x3f800000    # 1.0f

    const/16 v0, 0x20

    shl-int/2addr v0, v6

    int-to-short v4, v0

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    add-int/lit8 v0, v6, 0x1

    move v6, v0

    move v7, v8

    goto :goto_6

    :cond_c
    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-eqz v0, :cond_3

    const/high16 v0, 0x40000000    # 2.0f

    div-float v5, v11, v0

    iget-byte v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v0, v0, -0x10

    sparse-switch v0, :sswitch_data_1

    const/high16 v3, 0x40400000    # 3.0f

    const/4 v4, 0x0

    const/4 v2, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto/16 :goto_0

    :sswitch_2
    const/high16 v0, 0x40c00000    # 6.0f

    mul-float v3, v0, p3

    const/4 v4, 0x0

    const/4 v2, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto/16 :goto_0

    :sswitch_3
    const/high16 v3, 0x40800000    # 4.0f

    const/4 v4, 0x0

    const/4 v2, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto/16 :goto_0

    :pswitch_2
    const/4 v1, 0x0

    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v0, p3

    const/4 v2, 0x0

    cmpl-float v2, v11, v2

    if-eqz v2, :cond_18

    iget-byte v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v1, v1, -0x10

    int-to-byte v1, v1

    const/16 v2, 0x20

    if-ne v1, v2, :cond_17

    const/high16 v2, 0x40800000    # 4.0f

    div-float/2addr v0, v2

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    mul-double/2addr v2, v4

    double-to-float v0, v2

    move v8, v0

    move v7, v1

    :goto_7
    float-to-int v2, v8

    if-eqz p5, :cond_d

    move/from16 v2, p6

    :cond_d
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)V

    if-eqz p2, :cond_e

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addCap(S)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_e
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-nez v0, :cond_f

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v2, v0, -0x1

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/16 v4, 0x20

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :goto_8
    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-eqz v0, :cond_3

    sparse-switch v7, :sswitch_data_2

    const/4 v4, 0x0

    const/4 v2, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, v8

    move v5, v11

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto/16 :goto_0

    :cond_f
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/16 v4, 0x20

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto :goto_8

    :sswitch_4
    const/high16 v3, 0x40800000    # 4.0f

    const/4 v4, 0x0

    const/4 v2, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v5, v11

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto/16 :goto_0

    :sswitch_5
    const/high16 v3, 0x40400000    # 3.0f

    const/4 v4, 0x0

    const/4 v2, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v5, v11

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto/16 :goto_0

    :pswitch_3
    const/4 v1, 0x0

    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v0, p3

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float/2addr v0, v2

    const/4 v2, 0x0

    cmpl-float v2, v11, v2

    if-eqz v2, :cond_16

    iget-byte v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    and-int/lit8 v1, v1, -0x10

    int-to-byte v1, v1

    const/16 v2, 0x20

    if-ne v1, v2, :cond_15

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v2, v4

    double-to-float v0, v2

    move v8, v0

    move v7, v1

    :goto_9
    float-to-double v0, v8

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v2, v0

    const/high16 v3, 0x3f000000    # 0.5f

    const/4 v4, 0x0

    const/high16 v5, 0x3f000000    # 0.5f

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;IFFFI)V

    if-eqz p2, :cond_10

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addCap(S)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_10
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-nez v0, :cond_12

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v2, v0, -0x1

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/16 v4, 0x20

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :goto_a
    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-eqz v0, :cond_11

    sparse-switch v7, :sswitch_data_3

    const/4 v2, 0x0

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v6, 0x3f000000    # 0.5f

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, v8

    move v5, v11

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    :cond_11
    :goto_b
    sub-float v0, v10, v9

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_13

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    goto/16 :goto_0

    :cond_12
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/16 v4, 0x20

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto :goto_a

    :sswitch_6
    const/high16 v3, 0x40000000    # 2.0f

    const/4 v2, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v6, 0x3f000000    # 0.5f

    move-object v0, p0

    move-object v1, p1

    move v5, v11

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto :goto_b

    :sswitch_7
    const/high16 v3, 0x40400000    # 3.0f

    const/4 v2, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v6, 0x3f000000    # 0.5f

    move-object v0, p0

    move-object v1, p1

    move v5, v11

    move/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addHole(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;ZFFFFI)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto :goto_b

    :cond_13
    const/4 v0, 0x0

    cmpl-float v0, v11, v0

    if-nez v0, :cond_3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Open:Z

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Profile:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    goto/16 :goto_0

    :cond_14
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->Total:I

    add-int/lit8 v1, v0, -0x2

    const/4 v2, 0x2

    const/high16 v3, 0x3f000000    # 0.5f

    const/16 v4, 0x10

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;->addFace(IIFSZ)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;

    goto/16 :goto_1

    :cond_15
    move v8, v0

    move v7, v1

    goto/16 :goto_9

    :cond_16
    move v8, v0

    move v7, v1

    goto/16 :goto_9

    :cond_17
    move v8, v0

    move v7, v1

    goto/16 :goto_7

    :cond_18
    move v8, v0

    move v7, v1

    goto/16 :goto_7

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x30 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x10 -> :sswitch_2
        0x20 -> :sswitch_3
    .end sparse-switch

    :sswitch_data_2
    .sparse-switch
        0x20 -> :sswitch_4
        0x30 -> :sswitch_5
    .end sparse-switch

    :sswitch_data_3
    .sparse-switch
        0x20 -> :sswitch_6
        0x30 -> :sswitch_7
    .end sparse-switch
.end method
