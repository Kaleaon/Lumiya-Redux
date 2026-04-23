.class public Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;
.super Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x3

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;-><init>(II)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;I)V

    return-void
.end method


# virtual methods
.method public final MatrixScale([FII)V
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p3

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v3, v0

    invoke-static {p1, p2, v1, v2, v0}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    return-void
.end method

.method public final MatrixTranslate([FI[FII)V
    .locals 7

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p5

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v4, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x1

    aget v5, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v6, v1, v0

    move-object v0, p1

    move v1, p2

    move-object v2, p3

    move v3, p4

    invoke-static/range {v0 .. v6}, Landroid/opengl/Matrix;->translateM([FI[FIFFF)V

    return-void
.end method

.method public final add(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v3, v1, v2

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v3, v4

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x1

    aget v3, v1, v2

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v3, v4

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v2, v1, v0

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v2, v3

    aput v2, v1, v0

    return-void
.end method

.method public final addToVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    aget v2, v2, v3

    add-float/2addr v1, v2

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    add-float/2addr v1, v2

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v2, v0

    add-float/2addr v0, v1

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public final clear()V
    .locals 5

    const/4 v4, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    const/4 v0, 0x0

    :goto_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->length:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x0

    aput v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x1

    aput v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x2

    aput v4, v2, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final distToPlane(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v3, v0

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v0, v3

    iget v3, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v1, v3

    iget v3, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public final fill(IILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v1, v0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x0

    iget v4, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aput v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x1

    iget v4, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aput v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x2

    iget v4, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aput v4, v2, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final get(I)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v4, v0, 0x1

    aget v3, v3, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v4, v0

    invoke-direct {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v1
.end method

.method public final get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x1

    aget v1, v1, v2

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v1, v0

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public final getDistanceTo(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v3, v0

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v0, v3

    mul-float/2addr v1, v1

    mul-float/2addr v2, v2

    add-float/2addr v1, v2

    mul-float/2addr v0, v0

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public final getMaxComponent(I)F
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v1, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v1, 0x0

    aget v0, v0, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x1

    aget v2, v2, v3

    cmpl-float v2, v2, v0

    if-lez v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v1, 0x1

    aget v0, v0, v2

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x2

    aget v2, v2, v3

    cmpl-float v2, v2, v0

    if-lez v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v1, v1, 0x2

    aget v0, v0, v1

    :cond_1
    return v0
.end method

.method public final getSub(IILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v2, p2

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v4, v1, 0x0

    aget v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v4, v1, 0x1

    aget v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v2, v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v1, v1, 0x2

    aget v1, v2, v1

    sub-float/2addr v0, v1

    iput v0, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public final getSub(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v2, p3

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    aget v2, v2, v3

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v4, v1, 0x0

    aget v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v4, v1, 0x1

    aget v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v2, v0

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v1, v1, 0x2

    aget v1, v2, v1

    sub-float/2addr v0, v1

    iput v0, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public final minMaxVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v3, v0

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    cmpl-float v3, v3, v1

    if-lez v3, :cond_0

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    :cond_0
    iget v3, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    cmpg-float v3, v3, v1

    if-gez v3, :cond_1

    iput v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    :cond_1
    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2

    iput v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    :cond_2
    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_3

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    :cond_3
    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpl-float v1, v1, v0

    if-lez v1, :cond_4

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :cond_4
    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpg-float v1, v1, v0

    if-gez v1, :cond_5

    iput v0, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :cond_5
    return-void
.end method

.method public final minMaxVector(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 6

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    const/4 v0, 0x0

    :goto_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->length:I

    if-ge v0, v2, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v1, 0x0

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v4, v1, 0x1

    aget v3, v3, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v5, v1, 0x2

    aget v4, v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    cmpl-float v5, v5, v2

    if-lez v5, :cond_0

    iput v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    :cond_0
    iget v5, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    cmpg-float v5, v5, v2

    if-gez v5, :cond_1

    iput v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    :cond_1
    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    iput v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    :cond_2
    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_3

    iput v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    :cond_3
    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpl-float v2, v2, v4

    if-lez v2, :cond_4

    iput v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :cond_4
    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpg-float v2, v2, v4

    if-gez v2, :cond_5

    iput v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :cond_5
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method public final mul(ILcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 9

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v4, v0, 0x2

    aget v3, v3, v4

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v4, v4

    mul-float/2addr v4, v1

    iget v5, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v5, v2

    sub-float/2addr v4, v5

    iget v5, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v5, v3

    sub-float/2addr v4, v5

    iget v5, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v5, v1

    iget v6, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v6, v3

    add-float/2addr v5, v6

    iget v6, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v6, v2

    sub-float/2addr v5, v6

    iget v6, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v6, v2

    iget v7, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v7, v1

    add-float/2addr v6, v7

    iget v7, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v7, v3

    sub-float/2addr v6, v7

    iget v7, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v3, v7

    iget v7, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v2, v7

    add-float/2addr v2, v3

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v3

    sub-float v1, v2, v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    neg-float v7, v4

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v7, v8

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v8, v5

    add-float/2addr v7, v8

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v8, v6

    sub-float/2addr v7, v8

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v8, v1

    add-float/2addr v7, v8

    aput v7, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    neg-float v7, v4

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v7, v8

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v8, v6

    add-float/2addr v7, v8

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v8, v1

    sub-float/2addr v7, v8

    iget v8, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v8, v5

    add-float/2addr v7, v8

    aput v7, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    neg-float v3, v4

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v3, v4

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v1, v4

    add-float/2addr v1, v3

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v3, v5

    sub-float/2addr v1, v3

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v3, v6

    add-float/2addr v1, v3

    aput v1, v2, v0

    return-void
.end method

.method public final set(IFFF)V
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aput p2, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x1

    aput p3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aput p4, v1, v0

    return-void
.end method

.method public final set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v2, v0, 0x1

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aput v2, v1, v0

    return-void
.end method

.method public final set(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;I)V
    .locals 6

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v2, p3

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v5, v1, 0x0

    aget v4, v4, v5

    aput v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v5, v1, 0x1

    aget v4, v4, v5

    aput v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v1, v1, 0x2

    aget v1, v3, v1

    aput v1, v2, v0

    return-void
.end method

.method public final setAdd(II)V
    .locals 8

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v1, v0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v2, p2

    add-int/2addr v2, v0

    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x3

    if-ge v0, v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int v4, v1, v0

    aget v5, v3, v4

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int v7, v2, v0

    aget v6, v6, v7

    add-float/2addr v5, v6

    aput v5, v3, v4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int v4, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int v6, v1, v0

    aget v5, v5, v6

    aput v5, v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final subFromVector(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;I)V
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->numComponents:I

    mul-int/2addr v1, p2

    add-int/2addr v0, v1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    aget v2, v2, v3

    sub-float/2addr v1, v2

    iput v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    sub-float/2addr v1, v2

    iput v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->data:[F

    add-int/lit8 v0, v0, 0x2

    aget v0, v2, v0

    sub-float v0, v1, v0

    iput v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method
