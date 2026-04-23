.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;
    }
.end annotation


# static fields
.field private static final MIN_DETAIL_FACES:I = 0x6

.field private static tableScale:[F


# instance fields
.field Dirty:Z

.field Open:Z

.field Path:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;",
            ">;"
        }
    .end annotation
.end field

.field Step:F

.field Total:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->tableScale:[F

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
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Total:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Dirty:Z

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Step:F

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    return-void
.end method

.method private genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;IFFF)V
    .locals 30

    move-object/from16 v0, p1

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    move-object/from16 v0, p1

    iget v12, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v13

    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v5, v13

    mul-float v14, v4, v5

    move-object/from16 v0, p1

    iget v15, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    const/high16 v7, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v6, v5, v4

    const/high16 v5, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float v4, v8, v4

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v8, v6, v8

    if-lez v8, :cond_7

    const/high16 v7, 0x40000000    # 2.0f

    sub-float/2addr v7, v6

    const/high16 v6, 0x3f800000    # 1.0f

    move v9, v6

    move v10, v7

    :goto_0
    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v6, v4, v6

    if-lez v6, :cond_6

    const/high16 v5, 0x40000000    # 2.0f

    sub-float/2addr v5, v4

    const/high16 v4, 0x3f800000    # 1.0f

    move v7, v4

    move v8, v5

    :goto_1
    const/high16 v4, 0x3f000000    # 0.5f

    const/16 v5, 0x8

    move/from16 v0, p2

    if-ge v0, v5, :cond_0

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->tableScale:[F

    aget v4, v4, p2

    :cond_0
    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v5, v15

    mul-float/2addr v4, v5

    move-object/from16 v0, p1

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    const/4 v6, 0x0

    cmpg-float v6, v5, v6

    if-gez v6, :cond_2

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    mul-float/2addr v5, v4

    :goto_2
    move-object/from16 v0, p1

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    mul-float v6, v6, p4

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    move/from16 v16, v0

    sub-float v6, v6, v16

    const/high16 v16, 0x3f800000    # 1.0f

    cmpg-float v6, v6, v16

    if-ltz v6, :cond_1

    const v6, 0x3a83126f    # 0.001f

    cmpl-float v6, v13, v6

    if-lez v6, :cond_3

    :cond_1
    const/4 v6, 0x1

    :goto_3
    move-object/from16 v0, p0

    iput-boolean v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct/range {v16 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v6, 0x3f800000    # 1.0f

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v6, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    move-object/from16 v0, p1

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    mul-float v18, v6, p5

    move-object/from16 v0, p1

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    mul-float v19, v6, p5

    move/from16 v0, p2

    int-to-float v6, v0

    const/high16 v20, 0x3f800000    # 1.0f

    div-float v20, v20, v6

    move-object/from16 v0, p1

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    invoke-direct/range {v21 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;-><init>()V

    const v22, 0x40c90fdb

    mul-float v22, v22, v11

    mul-float v22, v22, v6

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->sin(D)D

    move-result-wide v24

    invoke-static {v5, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v23

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    move-wide/from16 v0, v24

    double-to-float v0, v0

    move/from16 v23, v0

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->cos(D)D

    move-result-wide v24

    invoke-static {v5, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v26

    move/from16 v0, v26

    float-to-double v0, v0

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    move-wide/from16 v0, v24

    double-to-float v0, v0

    move/from16 v24, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v25, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    move/from16 v26, v0

    const/16 v27, 0x0

    move/from16 v0, v27

    move/from16 v1, v26

    move/from16 v2, v23

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v26

    const/16 v27, 0x0

    add-float v26, v26, v27

    neg-float v0, v12

    move/from16 v27, v0

    move/from16 v0, v27

    invoke-static {v0, v12, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v27

    const/high16 v28, 0x3f000000    # 0.5f

    mul-float v27, v27, v28

    add-float v26, v26, v27

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    move/from16 v27, v0

    const/16 v28, 0x0

    move/from16 v0, v28

    move/from16 v1, v27

    move/from16 v2, v23

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v27

    add-float v24, v24, v27

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v24

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-object/from16 v23, v0

    invoke-static {v10, v9, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v24

    mul-float v24, v24, v14

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-object/from16 v23, v0

    invoke-static {v8, v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v24

    mul-float v24, v24, v15

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    move-object/from16 v0, v21

    iput v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->TexT:F

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v23

    const/high16 v24, 0x40000000    # 2.0f

    mul-float v23, v23, v24

    const v24, 0x40490fdb    # (float)Math.PI

    mul-float v23, v23, v24

    const v24, 0x40490fdb    # (float)Math.PI

    sub-float v23, v23, v24

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/high16 v26, 0x3f800000    # 1.0f

    move/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FFFF)V

    move-object/from16 v0, v16

    move/from16 v1, v22

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v13, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-float v6, v6, v20

    move/from16 v0, p2

    int-to-float v0, v0

    move/from16 v21, v0

    mul-float v6, v6, v21

    float-to-int v6, v6

    int-to-float v6, v6

    move/from16 v0, p2

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v6, v6, v21

    :goto_4
    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    move/from16 v21, v0

    cmpg-float v21, v6, v21

    if-gez v21, :cond_5

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    invoke-direct/range {v21 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;-><init>()V

    const v22, 0x40c90fdb

    mul-float v22, v22, v11

    mul-float v22, v22, v6

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->cos(D)D

    move-result-wide v24

    invoke-static {v5, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v23

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    move-wide/from16 v0, v24

    double-to-float v0, v0

    move/from16 v23, v0

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->sin(D)D

    move-result-wide v24

    invoke-static {v5, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v26

    move/from16 v0, v26

    float-to-double v0, v0

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    move-wide/from16 v0, v24

    double-to-float v0, v0

    move/from16 v24, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v26

    const/16 v27, 0x0

    add-float v26, v26, v27

    neg-float v0, v12

    move/from16 v27, v0

    move/from16 v0, v27

    invoke-static {v0, v12, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v27

    const/high16 v28, 0x3f000000    # 0.5f

    mul-float v27, v27, v28

    add-float v26, v26, v27

    const/16 v27, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    move/from16 v28, v0

    move/from16 v0, v27

    move/from16 v1, v28

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v27

    add-float v23, v23, v27

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-object/from16 v23, v0

    invoke-static {v10, v9, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v24

    mul-float v24, v24, v14

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-object/from16 v23, v0

    invoke-static {v8, v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v24

    mul-float v24, v24, v15

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    move-object/from16 v0, v21

    iput v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->TexT:F

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v23

    const/high16 v24, 0x40000000    # 2.0f

    mul-float v23, v23, v24

    const v24, 0x40490fdb    # (float)Math.PI

    mul-float v23, v23, v24

    const v24, 0x40490fdb    # (float)Math.PI

    sub-float v23, v23, v24

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/high16 v26, 0x3f800000    # 1.0f

    move/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FFFF)V

    move-object/from16 v0, v16

    move/from16 v1, v22

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v13, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-float v6, v6, v20

    goto/16 :goto_4

    :cond_2
    const/high16 v6, 0x3f800000    # 1.0f

    sub-float v5, v6, v5

    mul-float/2addr v5, v4

    move/from16 v29, v5

    move v5, v4

    move/from16 v4, v29

    goto/16 :goto_2

    :cond_3
    sub-float v6, v9, v10

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const v13, 0x3a83126f    # 0.001f

    cmpl-float v6, v6, v13

    if-gtz v6, :cond_1

    sub-float v6, v7, v8

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const v13, 0x3a83126f    # 0.001f

    cmpl-float v6, v6, v13

    if-gtz v6, :cond_1

    sub-float v6, v4, v5

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const v13, 0x3a83126f    # 0.001f

    cmpl-float v6, v6, v13

    if-lez v6, :cond_4

    const/4 v6, 0x1

    goto/16 :goto_3

    :cond_4
    const/4 v6, 0x0

    goto/16 :goto_3

    :cond_5
    move-object/from16 v0, p1

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    new-instance v20, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    invoke-direct/range {v20 .. v20}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;-><init>()V

    const v21, 0x40c90fdb

    mul-float v11, v11, v21

    mul-float/2addr v11, v6

    float-to-double v0, v11

    move-wide/from16 v22, v0

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->cos(D)D

    move-result-wide v22

    invoke-static {v5, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v21

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v24, v0

    mul-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v21, v0

    float-to-double v0, v11

    move-wide/from16 v22, v0

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->sin(D)D

    move-result-wide v22

    invoke-static {v5, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v4

    float-to-double v4, v4

    mul-double v4, v4, v22

    double-to-float v4, v4

    move-object/from16 v0, v20

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/16 v22, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    invoke-static {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v22

    const/16 v23, 0x0

    add-float v22, v22, v23

    neg-float v0, v12

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-static {v0, v12, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v12

    const/high16 v23, 0x3f000000    # 0.5f

    mul-float v12, v12, v23

    add-float v12, v12, v22

    const/16 v22, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    invoke-static {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v22

    add-float v21, v21, v22

    move/from16 v0, v21

    invoke-virtual {v5, v12, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    move-object/from16 v0, v20

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-static {v10, v9, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v5

    mul-float/2addr v5, v14

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    move-object/from16 v0, v20

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-static {v8, v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v5

    mul-float/2addr v5, v15

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    move-object/from16 v0, v20

    iput v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->TexT:F

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v0, v1, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    mul-float/2addr v4, v5

    const v5, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v4, v5

    const v5, 0x40490fdb    # (float)Math.PI

    sub-float/2addr v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v13, v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FFFF)V

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v11, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, v20

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-object/from16 v0, v16

    invoke-virtual {v4, v13, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Total:I

    return-void

    :cond_6
    move v7, v4

    move v8, v5

    goto/16 :goto_1

    :cond_7
    move v9, v6

    move v10, v7

    goto/16 :goto_0
.end method


# virtual methods
.method public generate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;FIZI)Z
    .locals 11

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Dirty:Z

    if-nez v0, :cond_0

    xor-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-gez v0, :cond_1

    const/4 p2, 0x0

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Dirty:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    iget-byte v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    and-int/lit16 v0, v0, 0xf0

    sparse-switch v0, :sswitch_data_0

    :sswitch_0
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x40600000    # 3.5f

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float v1, p2, v1

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v1, p3, 0x2

    if-ge v0, v1, :cond_2

    add-int/lit8 v0, p3, 0x2

    :cond_2
    add-int/lit8 v1, v0, -0x1

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    div-float v1, v2, v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Step:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->ensureCapacity(I)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->getBeginScale()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->getEndScale()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-result-object v3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    int-to-float v6, v1

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Step:F

    mul-float/2addr v6, v7

    invoke-static {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v4

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;-><init>()V

    iget-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    iget v8, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    invoke-static {v7, v8, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v7

    const/4 v8, 0x0

    iget v9, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    invoke-static {v8, v9, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v8

    const/high16 v9, 0x3f000000    # 0.5f

    sub-float v9, v4, v9

    invoke-virtual {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    iget-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget v7, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    const v8, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v7, v8

    iget v8, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    const v9, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v8, v9

    invoke-static {v7, v8, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-virtual {v6, v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FFFF)V

    iget-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v7, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v8, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    invoke-static {v7, v8, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v7

    iput v7, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v7, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v8, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-static {v7, v8, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v7

    iput v7, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iput v4, v5, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->TexT:F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :sswitch_1
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x40c00000    # 6.0f

    mul-float/2addr v1, p2

    const/high16 v2, 0x40600000    # 3.5f

    mul-float/2addr v0, v2

    const/high16 v2, 0x3f000000    # 0.5f

    sub-float v2, p2, v2

    mul-float/2addr v0, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    float-to-double v2, v2

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v2, v0

    if-eqz p4, :cond_3

    move/from16 v2, p5

    :cond_3
    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;IFFF)V

    :cond_4
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    :cond_5
    const/4 v0, 0x1

    return v0

    :sswitch_2
    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    sub-float/2addr v0, v1

    const v1, 0x3f7d70a4    # 0.99f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_6

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    const v1, 0x3f7d70a4    # 0.99f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_6

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Open:Z

    :cond_6
    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v0, p2

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v2, v0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->genNGon(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;IFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float v0, v1, v0

    const/high16 v1, 0x3f000000    # 0.5f

    const/4 v0, 0x0

    move v2, v1

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v0, 0x3f000000    # 0.5f

    cmpl-float v0, v2, v0

    if-nez v0, :cond_7

    const/high16 v2, -0x41000000    # -0.5f

    :goto_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_7
    const/high16 v2, 0x3f000000    # 0.5f

    goto :goto_2

    :sswitch_3
    const/4 v0, 0x5

    const/4 v1, 0x4

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    div-float v1, v2, v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Step:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->ensureCapacity(I)V

    const/4 v0, 0x0

    :goto_3
    const/4 v1, 0x5

    if-ge v0, v1, :cond_4

    int-to-float v1, v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Step:F

    mul-float/2addr v1, v2

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;-><init>()V

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->pos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    const v5, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v4, v5

    mul-float/2addr v4, v1

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    neg-double v4, v4

    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v4, v6

    double-to-float v4, v4

    const/4 v5, 0x0

    invoke-static {v5, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v4

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    const v6, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v5, v6

    mul-float/2addr v5, v1

    float-to-double v6, v5

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    const-wide/high16 v8, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v6, v8

    double-to-float v5, v6

    const/high16 v6, -0x41000000    # -0.5f

    invoke-static {v6, v5, v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;->lerp(FFF)F

    move-result v4

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iput v1, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->TexT:F

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath$PathPoint;->rot:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    const v5, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v4, v5

    mul-float/2addr v1, v4

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v3, v1, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FFFF)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPath;->Path:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_0
        0x20 -> :sswitch_1
        0x30 -> :sswitch_2
        0x40 -> :sswitch_3
    .end sparse-switch
.end method
