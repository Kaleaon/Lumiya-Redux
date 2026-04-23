.class public Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;
.super Ljava/lang/Object;


# static fields
.field public static final INSIDE:I = 0x1

.field public static final INTERSECT:I = 0x0

.field private static final NUM_PLANES:I = 0x6

.field public static final OUTSIDE:I = -0x1


# instance fields
.field private final params:[F

.field private final pnIndex:[I


# direct methods
.method public constructor <init>([F)V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v1, 0x18

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    const/16 v1, 0x24

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->pnIndex:[I

    move v1, v0

    :goto_0
    const/4 v0, 0x6

    if-ge v1, v0, :cond_1

    div-int/lit8 v0, v1, 0x2

    rsub-int/lit8 v2, v0, 0x2

    and-int/lit8 v0, v1, 0x1

    if-eqz v0, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    :goto_1
    invoke-direct {p0, v1, p1, v2, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->initPlane(I[FIF)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_1
    return-void
.end method

.method private initPlane(I[FIF)V
    .locals 10

    const/4 v9, 0x4

    const/4 v3, 0x0

    const/4 v8, 0x3

    const/4 v1, 0x0

    mul-int/lit8 v4, p1, 0x4

    move v0, v1

    :goto_0
    if-ge v0, v9, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    add-int v5, v4, v0

    mul-int/lit8 v6, v0, 0x4

    add-int/lit8 v6, v6, 0x3

    aget v6, p2, v6

    mul-int/lit8 v7, v0, 0x4

    add-int/2addr v7, p3

    aget v7, p2, v7

    mul-float/2addr v7, p4

    add-float/2addr v6, v7

    aput v6, v2, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    move v2, v3

    :goto_1
    if-ge v0, v8, :cond_1

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    add-int v6, v4, v0

    aget v5, v5, v6

    mul-float/2addr v5, v5

    add-float/2addr v2, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    float-to-double v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    double-to-float v2, v6

    move v0, v1

    :goto_2
    if-ge v0, v9, :cond_2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    add-int v6, v4, v0

    aget v7, v5, v6

    div-float/2addr v7, v2

    aput v7, v5, v6

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    :goto_3
    if-ge v1, v8, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->pnIndex:[I

    mul-int/lit8 v0, p1, 0x6

    add-int v5, v0, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    add-int v6, v4, v1

    aget v0, v0, v6

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_3

    add-int/lit8 v0, v1, 0x3

    :goto_4
    aput v0, v2, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->pnIndex:[I

    mul-int/lit8 v0, p1, 0x6

    add-int/2addr v0, v1

    add-int/lit8 v5, v0, 0x3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    add-int v6, v4, v1

    aget v0, v0, v6

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_4

    move v0, v1

    :goto_5
    aput v0, v2, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_3
    move v0, v1

    goto :goto_4

    :cond_4
    add-int/lit8 v0, v1, 0x3

    goto :goto_5

    :cond_5
    return-void
.end method

.method private planeDistance(II[F)F
    .locals 5

    const/4 v1, 0x0

    const/4 v0, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    add-int v3, p1, v0

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->pnIndex:[I

    add-int v4, p2, v0

    aget v3, v3, v4

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->params:[F

    add-int/lit8 v2, p1, 0x3

    aget v0, v0, v2

    add-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method public testBoundingBox([F[F)I
    .locals 7

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v4, 0x1

    move v0, v1

    move v2, v1

    move v3, v1

    :goto_0
    const/4 v5, 0x6

    if-ge v0, v5, :cond_3

    invoke-direct {p0, v3, v2, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->planeDistance(II[F)F

    move-result v5

    cmpg-float v5, v5, v6

    if-gez v5, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    add-int/lit8 v5, v2, 0x3

    invoke-direct {p0, v3, v5, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/FrustrumPlanes;->planeDistance(II[F)F

    move-result v5

    if-nez v0, :cond_1

    aput v5, p2, v1

    :cond_1
    cmpg-float v5, v5, v6

    if-gez v5, :cond_2

    return v1

    :cond_2
    add-int/lit8 v3, v3, 0x4

    add-int/lit8 v2, v2, 0x6

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v4
.end method
