.class public Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
.super Ljava/lang/Object;


# instance fields
.field public final x:F

.field public final y:F

.field public final z:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    return-void
.end method


# virtual methods
.method public distanceTo(FFF)F
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    sub-float v0, p1, v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    sub-float v1, p2, v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    sub-float v2, p3, v2

    mul-float/2addr v0, v0

    mul-float/2addr v1, v1

    add-float/2addr v0, v1

    mul-float v1, v2, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public distanceTo(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)F
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    const/high16 v0, 0x7fc00000    # Float.NaN

    return v0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    sub-float/2addr v2, v3

    mul-float/2addr v0, v0

    mul-float/2addr v1, v1

    add-float/2addr v0, v1

    mul-float v1, v2, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    if-eqz v2, :cond_2

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public getDistanceTo(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    const/high16 v0, 0x7fc00000    # Float.NaN

    return v0

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v2, v3

    mul-float/2addr v0, v0

    mul-float/2addr v1, v1

    add-float/2addr v0, v1

    mul-float v1, v2, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public getX()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    return v0
.end method

.method public getZ()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    return v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    const-string/jumbo v0, "(%f,%f,%f)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
