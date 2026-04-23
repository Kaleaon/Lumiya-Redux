.class public Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;
.super Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;-><init>(II)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;I)V

    return-void
.end method


# virtual methods
.method public final add(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v3, v1, v2

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    add-float/2addr v3, v4

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v0, v0, 0x1

    aget v2, v1, v0

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    add-float/2addr v2, v3

    aput v2, v1, v0

    return-void
.end method

.method public final addToVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    aget v2, v2, v3

    add-float/2addr v1, v2

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v0, v0, 0x1

    aget v0, v2, v0

    add-float/2addr v0, v1

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public final get(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v0, v0, 0x1

    aget v0, v1, v0

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public final getSub(ILcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v2, p3

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v3, v0, 0x0

    aget v2, v2, v3

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v4, v1, 0x0

    aget v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v0, v0, 0x1

    aget v0, v2, v0

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v1, v1, 0x1

    aget v1, v2, v1

    sub-float/2addr v0, v1

    iput v0, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    return-void
.end method

.method public final minMaxVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v0, v0, 0x1

    aget v0, v2, v0

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    cmpl-float v2, v2, v1

    if-lez v2, :cond_0

    iput v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    :cond_0
    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    cmpg-float v2, v2, v1

    if-gez v2, :cond_1

    iput v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    :cond_1
    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    cmpl-float v1, v1, v0

    if-lez v1, :cond_2

    iput v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :cond_2
    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    cmpg-float v1, v1, v0

    if-gez v1, :cond_3

    iput v0, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :cond_3
    return-void
.end method

.method public final minMaxVector(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 5

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    const/4 v0, 0x0

    :goto_0
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->length:I

    if-ge v0, v2, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v3, v1, 0x0

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v4, v1, 0x1

    aget v3, v3, v4

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    cmpl-float v4, v4, v2

    if-lez v4, :cond_0

    iput v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    :cond_0
    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    cmpg-float v4, v4, v2

    if-gez v4, :cond_1

    iput v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    :cond_1
    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    iput v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :cond_2
    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_3

    iput v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :cond_3
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public final set(IFF)V
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v2, v0, 0x0

    aput p2, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int/lit8 v0, v0, 0x1

    aput p3, v1, v0

    return-void
.end method

.method public swap(II)V
    .locals 8

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v1, v0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->offset:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->numComponents:I

    mul-int/2addr v2, p2

    add-int/2addr v2, v0

    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x2

    if-ge v0, v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int v4, v1, v0

    aget v3, v3, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int v5, v1, v0

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int v7, v2, v0

    aget v6, v6, v7

    aput v6, v4, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->data:[F

    add-int v5, v2, v0

    aput v3, v4, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
