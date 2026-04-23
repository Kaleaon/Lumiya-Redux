.class public Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;
.super Ljava/lang/Object;


# instance fields
.field public final mvpMatrix:[F

.field public final viewDistance:F

.field public final viewX:F

.field public final viewY:F

.field public final viewZ:F


# direct methods
.method public constructor <init>(FFFF[FI)V
    .locals 3

    const/16 v2, 0x10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewX:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewY:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewZ:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewDistance:F

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    const/4 v1, 0x0

    invoke-static {p5, p6, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>(FFFF[FI[FI)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewX:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewY:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewZ:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewDistance:F

    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    const/4 v1, 0x0

    move-object v2, p7

    move v3, p8

    move-object v4, p5

    move v5, p6

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v2, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    if-nez v0, :cond_0

    return v2

    :cond_0
    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewX:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewX:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewY:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewY:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_2

    :cond_1
    return v2

    :cond_2
    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewZ:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewZ:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewDistance:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewDistance:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    if-nez v0, :cond_3

    return v2

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewX:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewY:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewZ:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->viewDistance:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumInfo;->mvpMatrix:[F

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
