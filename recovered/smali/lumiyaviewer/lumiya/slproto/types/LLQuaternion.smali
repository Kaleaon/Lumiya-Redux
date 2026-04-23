.class public Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-types-LLQuaternion$OrderSwitchesValues:[I = null

.field public static final FP_MAG_THRESHOLD:F = 1.0E-7f


# instance fields
.field private inverseMatrix:[F

.field private matrix:[F

.field public w:F

.field public x:F

.field public y:F

.field public z:F


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-types-LLQuaternion$OrderSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->-com-lumiyaviewer-lumiya-slproto-types-LLQuaternion$OrderSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->-com-lumiyaviewer-lumiya-slproto-types-LLQuaternion$OrderSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->values()[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->XYZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->XZY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YXZ:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->YZX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ZXY:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ZYX:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_5
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->-com-lumiyaviewer-lumiya-slproto-types-LLQuaternion$OrderSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_5

    :catch_1
    move-exception v1

    goto :goto_4

    :catch_2
    move-exception v1

    goto :goto_3

    :catch_3
    move-exception v1

    goto :goto_2

    :catch_4
    move-exception v1

    goto :goto_1

    :catch_5
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    return-void
.end method

.method public constructor <init>([F)V
    .locals 8

    const/high16 v5, 0x3e800000    # 0.25f

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    const/16 v4, 0xa

    const/4 v3, 0x5

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    aget v0, p1, v2

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    aget v1, p1, v3

    add-float/2addr v0, v1

    aget v1, p1, v4

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-float v0, v0

    const/16 v1, 0x9

    aget v1, p1, v1

    const/4 v2, 0x6

    aget v2, p1, v2

    sub-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    const/4 v1, 0x2

    aget v1, p1, v1

    const/16 v2, 0x8

    aget v2, p1, v2

    sub-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    const/4 v1, 0x4

    aget v1, p1, v1

    const/4 v2, 0x1

    aget v2, p1, v2

    sub-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v0, v5

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    :goto_0
    return-void

    :cond_0
    aget v0, p1, v2

    aget v1, p1, v3

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    aget v0, p1, v2

    aget v1, p1, v4

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    aget v0, p1, v2

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    aget v1, p1, v3

    sub-float/2addr v0, v1

    aget v1, p1, v4

    sub-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-float v0, v0

    mul-float v1, v5, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    const/4 v1, 0x4

    aget v1, p1, v1

    const/4 v2, 0x1

    aget v2, p1, v2

    add-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    const/4 v1, 0x2

    aget v1, p1, v1

    const/16 v2, 0x8

    aget v2, p1, v2

    add-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    const/16 v1, 0x9

    aget v1, p1, v1

    const/4 v2, 0x6

    aget v2, p1, v2

    sub-float/2addr v1, v2

    div-float v0, v1, v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    goto :goto_0

    :cond_1
    aget v0, p1, v3

    aget v1, p1, v4

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    aget v0, p1, v3

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    aget v1, p1, v2

    sub-float/2addr v0, v1

    aget v1, p1, v4

    sub-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-float v0, v0

    const/4 v1, 0x4

    aget v1, p1, v1

    const/4 v2, 0x1

    aget v2, p1, v2

    add-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float v1, v5, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    const/16 v1, 0x9

    aget v1, p1, v1

    const/4 v2, 0x6

    aget v2, p1, v2

    add-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    const/4 v1, 0x2

    aget v1, p1, v1

    const/16 v2, 0x8

    aget v2, p1, v2

    sub-float/2addr v1, v2

    div-float v0, v1, v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    goto/16 :goto_0

    :cond_2
    aget v0, p1, v4

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    aget v1, p1, v2

    sub-float/2addr v0, v1

    aget v1, p1, v3

    sub-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-float v0, v0

    const/4 v1, 0x2

    aget v1, p1, v1

    const/16 v2, 0x8

    aget v2, p1, v2

    add-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    const/16 v1, 0x9

    aget v1, p1, v1

    const/4 v2, 0x6

    aget v2, p1, v2

    add-float/2addr v1, v2

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float v1, v5, v0

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    const/4 v1, 0x4

    aget v1, p1, v1

    const/4 v2, 0x1

    aget v2, p1, v2

    sub-float/2addr v1, v2

    div-float v0, v1, v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    goto/16 :goto_0
.end method

.method public static fromEuler(FFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 24

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, p0, v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, p0, v4

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    const/high16 v6, 0x40000000    # 2.0f

    div-float v6, p1, v6

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    const/high16 v8, 0x40000000    # 2.0f

    div-float v8, p1, v8

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    const/high16 v10, 0x40000000    # 2.0f

    div-float v10, p2, v10

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    const/high16 v12, 0x40000000    # 2.0f

    div-float v12, p2, v12

    float-to-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    mul-double v14, v2, v6

    mul-double v16, v4, v8

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    mul-double v20, v4, v6

    mul-double v20, v20, v10

    mul-double v22, v2, v8

    mul-double v22, v22, v12

    add-double v20, v20, v22

    move-wide/from16 v0, v20

    double-to-float v0, v0

    move/from16 v19, v0

    mul-double/2addr v2, v8

    mul-double/2addr v2, v10

    mul-double/2addr v4, v6

    mul-double/2addr v4, v12

    sub-double/2addr v2, v4

    double-to-float v2, v2

    mul-double v4, v14, v12

    mul-double v6, v16, v10

    add-double/2addr v4, v6

    double-to-float v3, v4

    mul-double v4, v14, v10

    mul-double v6, v16, v12

    sub-double/2addr v4, v6

    double-to-float v4, v4

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v18
.end method

.method public static lerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;F)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 7

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    sub-float/2addr v2, v3

    mul-float/2addr v2, p2

    add-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    sub-float/2addr v3, v4

    mul-float/2addr v3, p2

    add-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p2

    add-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, p2

    add-float/2addr v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v0
.end method

.method public static mayaQ(FFFLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 8

    const/high16 v7, 0x3f800000    # 1.0f

    const v6, 0x3c8efa35

    const/4 v5, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    mul-float v3, p0, v6

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v7, v5, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v0, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    mul-float v3, p1, v6

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v5, v7, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v1, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    mul-float v3, p2, v6

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v5, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->-getcom-lumiyaviewer-lumiya-slproto-types-LLQuaternion$OrderSwitchesValues()[I

    move-result-object v5

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion$Order;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    :goto_0
    return-object v4

    :pswitch_0
    invoke-virtual {v3, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v4, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {v3, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v4, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v4, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {v3, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v4, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    goto :goto_0

    :pswitch_4
    invoke-virtual {v3, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v4, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    goto :goto_0

    :pswitch_5
    invoke-virtual {v3, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    invoke-virtual {v4, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_1
        :pswitch_2
        :pswitch_5
    .end packed-switch
.end method

.method public static parseFloatVec3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 6

    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v3

    mul-float v4, v1, v1

    mul-float v5, v2, v2

    add-float/2addr v4, v5

    mul-float v5, v3, v3

    add-float/2addr v4, v5

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v4, v5, v4

    cmpl-float v5, v4, v0

    if-lez v5, :cond_0

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v0, v4

    :cond_0
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v4, v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v4
.end method

.method public static parseU16Vec3(Ljava/nio/ByteBuffer;FF)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 5

    const v4, 0xffff

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    and-int/2addr v0, v4

    invoke-static {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U16_to_float(IFF)F

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    and-int/2addr v1, v4

    invoke-static {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U16_to_float(IFF)F

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    and-int/2addr v2, v4

    invoke-static {v2, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U16_to_float(IFF)F

    move-result v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    and-int/2addr v3, v4

    invoke-static {v3, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U16_to_float(IFF)F

    move-result v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v4
.end method

.method public static parseU8Vec3(Ljava/nio/ByteBuffer;FF)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 5

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    invoke-static {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U8_to_float(IFF)F

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-static {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U8_to_float(IFF)F

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U8_to_float(IFF)F

    move-result v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U8_to_float(IFF)F

    move-result v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v4
.end method

.method public static shortestArc(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 7

    const/high16 v6, 0x3f800000    # 1.0f

    const v5, 0x33d6bf95    # 1.0E-7f

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    move-result v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    move-result v3

    cmpg-float v2, v2, v5

    if-ltz v2, :cond_0

    cmpg-float v2, v3, v5

    if-gez v2, :cond_1

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    return-object v0

    :cond_1
    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->cross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v1

    const v3, 0x3f7ffffe    # 0.9999999f

    cmpl-float v3, v1, v3

    if-lez v3, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    return-object v0

    :cond_2
    const v3, -0x40800002    # -0.9999999f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_4

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-virtual {v0, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v0

    div-float v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, v6, v4, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    move-result v1

    cmpg-float v1, v1, v5

    if-gez v1, :cond_3

    invoke-virtual {v0, v4, v4, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    :cond_3
    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v1

    :cond_4
    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->acos(D)D

    move-result-wide v0

    double-to-float v0, v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-object v1
.end method

.method public static unpackFromVector3(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 7

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->magVecSquared()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v1, v2, v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpl-float v6, v1, v0

    if-lez v6, :cond_0

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    :cond_0
    invoke-direct {v2, v3, v4, v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v2
.end method


# virtual methods
.method public addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;F)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    return-void
.end method

.method public conjQuat()Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 5

    const/high16 v4, -0x40800000    # -1.0f

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v1, v4

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v2, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    return-object v0
.end method

.method public getAngleAxis(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F
    .locals 6

    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    cmpl-float v3, v1, v2

    if-lez v3, :cond_0

    move v1, v2

    :cond_0
    cmpg-float v3, v1, v0

    if-gez v3, :cond_3

    :goto_0
    mul-float v1, v0, v0

    sub-float v1, v2, v1

    float-to-double v4, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v1, v4

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const v4, 0x3a03126f    # 5.0E-4f

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    move v1, v2

    :goto_1
    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->acos(D)D

    move-result-wide v2

    double-to-float v0, v2

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v0, v2

    const v2, 0x40490fdb    # (float)Math.PI

    cmpl-float v2, v0, v2

    if-lez v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v2, v2

    mul-float/2addr v2, v1

    iput v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    neg-float v2, v2

    mul-float/2addr v2, v1

    iput v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    neg-float v2, v2

    mul-float/2addr v1, v2

    iput v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const v1, 0x40c90fdb

    sub-float v0, v1, v0

    return v0

    :cond_1
    div-float v1, v2, v1

    goto :goto_1

    :cond_2
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v2, v1

    iput v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v2, v1

    iput v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v1, v2

    iput v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return v0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public getInverseMatrix([FI)V
    .locals 12

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v3, v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    neg-float v4, v4

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v4, v4

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    neg-float v5, v5

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    neg-float v5, v5

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    neg-float v6, v6

    mul-float/2addr v5, v6

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v7, v7

    mul-float/2addr v6, v7

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    neg-float v8, v8

    mul-float/2addr v7, v8

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v9, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    neg-float v9, v9

    mul-float/2addr v8, v9

    add-int/lit8 v9, p2, 0x0

    add-float v10, v1, v2

    const/high16 v11, 0x40000000    # 2.0f

    mul-float/2addr v10, v11

    const/high16 v11, 0x3f800000    # 1.0f

    sub-float v10, v11, v10

    aput v10, p1, v9

    add-int/lit8 v9, p2, 0x1

    sub-float v10, v3, v8

    const/high16 v11, 0x40000000    # 2.0f

    mul-float/2addr v10, v11

    aput v10, p1, v9

    add-int/lit8 v9, p2, 0x2

    add-float v10, v4, v7

    const/high16 v11, 0x40000000    # 2.0f

    mul-float/2addr v10, v11

    aput v10, p1, v9

    add-int/lit8 v9, p2, 0x3

    const/4 v10, 0x0

    aput v10, p1, v9

    add-int/lit8 v9, p2, 0x4

    add-float/2addr v3, v8

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v3, v8

    aput v3, p1, v9

    add-int/lit8 v3, p2, 0x5

    add-float/2addr v2, v0

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v2, v8

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float v2, v8, v2

    aput v2, p1, v3

    add-int/lit8 v2, p2, 0x6

    sub-float v3, v5, v6

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v3, v8

    aput v3, p1, v2

    add-int/lit8 v2, p2, 0x7

    const/4 v3, 0x0

    aput v3, p1, v2

    add-int/lit8 v2, p2, 0x8

    sub-float v3, v4, v7

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    aput v3, p1, v2

    add-int/lit8 v2, p2, 0x9

    add-float v3, v5, v6

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    aput v3, p1, v2

    add-int/lit8 v2, p2, 0xa

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    aput v0, p1, v2

    add-int/lit8 v0, p2, 0xb

    const/4 v1, 0x0

    aput v1, p1, v0

    add-int/lit8 v0, p2, 0xc

    const/4 v1, 0x0

    aput v1, p1, v0

    add-int/lit8 v0, p2, 0xd

    const/4 v1, 0x0

    aput v1, p1, v0

    add-int/lit8 v0, p2, 0xe

    const/4 v1, 0x0

    aput v1, p1, v0

    add-int/lit8 v0, p2, 0xf

    const/high16 v1, 0x3f800000    # 1.0f

    aput v1, p1, v0

    return-void
.end method

.method public getInverseMatrix()[F
    .locals 15

    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    const/high16 v12, 0x40000000    # 2.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return-object v0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v3, v3

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    neg-float v4, v4

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v4, v4

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    neg-float v5, v5

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    neg-float v5, v5

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    neg-float v6, v6

    mul-float/2addr v5, v6

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v7, v7

    mul-float/2addr v6, v7

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    neg-float v8, v8

    mul-float/2addr v7, v8

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v9, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    neg-float v9, v9

    mul-float/2addr v8, v9

    const/16 v9, 0x10

    new-array v9, v9, [F

    add-float v10, v1, v2

    mul-float/2addr v10, v12

    sub-float v10, v14, v10

    const/4 v11, 0x0

    aput v10, v9, v11

    sub-float v10, v3, v8

    mul-float/2addr v10, v12

    const/4 v11, 0x1

    aput v10, v9, v11

    add-float v10, v4, v7

    mul-float/2addr v10, v12

    const/4 v11, 0x2

    aput v10, v9, v11

    const/4 v10, 0x3

    aput v13, v9, v10

    add-float/2addr v3, v8

    mul-float/2addr v3, v12

    const/4 v8, 0x4

    aput v3, v9, v8

    add-float/2addr v2, v0

    mul-float/2addr v2, v12

    sub-float v2, v14, v2

    const/4 v3, 0x5

    aput v2, v9, v3

    sub-float v2, v5, v6

    mul-float/2addr v2, v12

    const/4 v3, 0x6

    aput v2, v9, v3

    const/4 v2, 0x7

    aput v13, v9, v2

    sub-float v2, v4, v7

    mul-float/2addr v2, v12

    const/16 v3, 0x8

    aput v2, v9, v3

    add-float v2, v5, v6

    mul-float/2addr v2, v12

    const/16 v3, 0x9

    aput v2, v9, v3

    add-float/2addr v0, v1

    mul-float/2addr v0, v12

    sub-float v0, v14, v0

    const/16 v1, 0xa

    aput v0, v9, v1

    const/16 v0, 0xb

    aput v13, v9, v0

    const/16 v0, 0xc

    aput v13, v9, v0

    const/16 v0, 0xd

    aput v13, v9, v0

    const/16 v0, 0xe

    aput v13, v9, v0

    const/16 v0, 0xf

    aput v14, v9, v0

    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return-object v0
.end method

.method public getMatrix()[F
    .locals 15

    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    const/high16 v12, 0x40000000    # 2.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    return-object v0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v5, v6

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v6, v7

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v7, v8

    iget v8, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v9, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v8, v9

    const/16 v9, 0x10

    new-array v9, v9, [F

    add-float v10, v1, v2

    mul-float/2addr v10, v12

    sub-float v10, v14, v10

    const/4 v11, 0x0

    aput v10, v9, v11

    sub-float v10, v3, v8

    mul-float/2addr v10, v12

    const/4 v11, 0x1

    aput v10, v9, v11

    add-float v10, v4, v7

    mul-float/2addr v10, v12

    const/4 v11, 0x2

    aput v10, v9, v11

    const/4 v10, 0x3

    aput v13, v9, v10

    add-float/2addr v3, v8

    mul-float/2addr v3, v12

    const/4 v8, 0x4

    aput v3, v9, v8

    add-float/2addr v2, v0

    mul-float/2addr v2, v12

    sub-float v2, v14, v2

    const/4 v3, 0x5

    aput v2, v9, v3

    sub-float v2, v5, v6

    mul-float/2addr v2, v12

    const/4 v3, 0x6

    aput v2, v9, v3

    const/4 v2, 0x7

    aput v13, v9, v2

    sub-float v2, v4, v7

    mul-float/2addr v2, v12

    const/16 v3, 0x8

    aput v2, v9, v3

    add-float v2, v5, v6

    mul-float/2addr v2, v12

    const/16 v3, 0x9

    aput v2, v9, v3

    add-float/2addr v0, v1

    mul-float/2addr v0, v12

    sub-float v0, v14, v0

    const/16 v1, 0xa

    aput v0, v9, v1

    const/16 v0, 0xb

    aput v13, v9, v0

    const/16 v0, 0xc

    aput v13, v9, v0

    const/16 v0, 0xd

    aput v13, v9, v0

    const/16 v0, 0xe

    aput v13, v9, v0

    const/16 v0, 0xf

    aput v14, v9, v0

    iput-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    return-object v0
.end method

.method public normalize()F
    .locals 6

    const/4 v5, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const v1, 0x33d6bf95    # 1.0E-7f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    sub-float v1, v4, v0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x358637bd    # 1.0E-6f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    div-float v1, v4, v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    :cond_0
    :goto_0
    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return v0

    :cond_1
    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    goto :goto_0
.end method

.method public set(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 2

    const/4 v1, 0x0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return-void
.end method

.method public setIdentity()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    return-void
.end method

.method public setLerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;FLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;F)V
    .locals 3

    const/4 v2, 0x0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v0, p2

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v0, p2

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v0, p2

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v0, p2

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return-void
.end method

.method public setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 4

    const/4 v3, 0x0

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return-void
.end method

.method public setQuat(FFFF)V
    .locals 7

    const/4 v6, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v1, p1

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    float-to-double v4, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v1, v4

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v3, v1

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v3, v1

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->normalize()F

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return-void
.end method

.method public setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 7

    const/4 v6, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v1, p1

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    float-to-double v4, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v1, v4

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v3, v1

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v3, v1

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->normalize()F

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->matrix:[F

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->inverseMatrix:[F

    return-void
.end method

.method public setRaw(FFFF)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    return-void
.end method

.method public setZero()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "(%.2f, %.2f, %.2f, %.2f)"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
