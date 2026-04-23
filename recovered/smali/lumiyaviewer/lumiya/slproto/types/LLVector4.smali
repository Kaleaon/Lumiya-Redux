.class public Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;
.super Ljava/lang/Object;


# static fields
.field public static final FP_MAG_THRESHOLD:F = 1.0E-7f


# instance fields
.field public w:F

.field public x:F

.field public y:F

.field public z:F


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public static add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;
    .locals 6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    add-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    add-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    add-float/2addr v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;-><init>(FFFF)V

    return-object v0
.end method

.method public static cross3(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;
    .locals 6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    mul-float/2addr v4, v5

    sub-float/2addr v3, v4

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;-><init>(FFFF)V

    return-object v0
.end method

.method public static sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;
    .locals 6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    sub-float/2addr v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;-><init>(FFFF)V

    return-object v0
.end method


# virtual methods
.method public add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public dot3(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)F
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public mul(F)V
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public normalize3()F
    .locals 4

    const/4 v3, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const v1, 0x33d6bf95    # 1.0E-7f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v1, v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    :goto_0
    return v0

    :cond_0
    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    goto :goto_0
.end method

.method public set(FFF)V
    .locals 1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V
    .locals 1

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public setMax(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public setMin(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "(%f, %f, %f)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
