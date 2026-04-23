.class public Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;
.super Ljava/lang/Object;


# static fields
.field public static final FP_MAG_THRESHOLD:F = 1.0E-7f


# instance fields
.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public static sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    sub-float/2addr v2, v3

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    return-object v0
.end method

.method public static sum(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    add-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    add-float/2addr v2, v3

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    return-object v0
.end method


# virtual methods
.method public add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)F
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    if-nez v2, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    :goto_0
    return v0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public magVec()F
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public mul(F)V
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public normVec()F
    .locals 4

    const/4 v3, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

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

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :goto_0
    return v0

    :cond_0
    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    goto :goto_0
.end method

.method public set(FF)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public setMax(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public setMin(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "(%f, %f)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
