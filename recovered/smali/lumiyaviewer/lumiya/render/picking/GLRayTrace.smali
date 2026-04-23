.class public Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getIntersectionDepth(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;[F)F
    .locals 8

    const/4 v6, 0x4

    const/4 v1, 0x0

    new-array v4, v6, [F

    const/16 v0, 0x8

    new-array v0, v0, [F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    aput v2, v4, v1

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    const/4 v3, 0x1

    aput v2, v4, v3

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    const/4 v3, 0x2

    aput v2, v4, v3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x3

    aput v2, v4, v3

    move-object v2, p2

    move v3, v1

    move v5, v1

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v5

    move-object v2, v0

    move v3, v6

    move-object v6, v0

    move v7, v1

    invoke-static/range {v2 .. v7}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    :goto_0
    const/4 v1, 0x6

    aget v0, v0, v1

    return v0

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v5

    move-object v2, v0

    move v3, v6

    move-object v6, v0

    move v7, v1

    invoke-static/range {v2 .. v7}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    goto :goto_0
.end method

.method public static intersect_RayTriangle(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;I)Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;
    .locals 12

    add-int/lit8 v0, p3, 0x1

    aget-object v0, p2, v0

    add-int/lit8 v1, p3, 0x0

    aget-object v1, p2, v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    add-int/lit8 v1, p3, 0x2

    aget-object v1, p2, v1

    add-int/lit8 v2, p3, 0x0

    aget-object v2, p2, v2

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->cross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->isZero()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-static {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v3

    add-int/lit8 v4, p3, 0x0

    aget-object v4, p2, v4

    invoke-static {p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v4

    neg-float v4, v4

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v6, 0x33d6bf95    # 1.0E-7f

    cmpg-float v5, v5, v6

    if-gez v5, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    div-float v2, v4, v2

    float-to-double v4, v2

    const-wide/16 v6, 0x0

    cmpg-double v4, v4, v6

    if-gez v4, :cond_2

    const/4 v0, 0x0

    return-object v0

    :cond_2
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    invoke-virtual {v4, p0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v0, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v3

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v5

    invoke-virtual {v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v6

    add-int/lit8 v7, p3, 0x0

    aget-object v7, p2, v7

    invoke-static {v4, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v7

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v0

    invoke-virtual {v7, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v1

    mul-float v7, v5, v5

    mul-float v8, v3, v6

    sub-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v8

    const v9, 0x33d6bf95    # 1.0E-7f

    cmpg-float v8, v8, v9

    if-gez v8, :cond_3

    const/4 v0, 0x0

    return-object v0

    :cond_3
    mul-float v8, v5, v1

    mul-float/2addr v6, v0

    sub-float v6, v8, v6

    div-float/2addr v6, v7

    float-to-double v8, v6

    const-wide/16 v10, 0x0

    cmpg-double v8, v8, v10

    if-ltz v8, :cond_4

    float-to-double v8, v6

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    cmpl-double v8, v8, v10

    if-lez v8, :cond_5

    :cond_4
    const/4 v0, 0x0

    return-object v0

    :cond_5
    mul-float/2addr v0, v5

    mul-float/2addr v1, v3

    sub-float/2addr v0, v1

    div-float/2addr v0, v7

    float-to-double v8, v0

    const-wide/16 v10, 0x0

    cmpg-double v1, v8, v10

    if-ltz v1, :cond_6

    add-float v1, v6, v0

    float-to-double v8, v1

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    cmpl-double v1, v8, v10

    if-lez v1, :cond_7

    :cond_6
    const/4 v0, 0x0

    return-object v0

    :cond_7
    new-instance v1, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget v5, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v7, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-direct {v3, v5, v7, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;-><init>(FFFF)V

    invoke-direct {v1, v3, v6, v0}, Lcom/lumiyaviewer/lumiya/render/picking/GLRayTrace$RayIntersectInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;FF)V

    return-object v1
.end method
