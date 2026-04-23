.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimMath;
.super Ljava/lang/Object;


# static fields
.field public static final F_DEG_TO_RAD:F = 0.017453292f

.field public static final F_PI:F = 3.1415927f


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lerp(FFF)F
    .locals 1

    sub-float v0, p1, p0

    mul-float/2addr v0, p2

    add-float/2addr v0, p0

    return v0
.end method

.method public static lookAt(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)[F
    .locals 5

    const/16 v0, 0x10

    new-array v0, v0, [F

    invoke-static {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v2, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setCross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/4 v4, 0x0

    aput v3, v0, v4

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/4 v4, 0x4

    aput v3, v0, v4

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/16 v3, 0x8

    aput v2, v0, v3

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/4 v3, 0x1

    aput v2, v0, v3

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/4 v3, 0x5

    aput v2, v0, v3

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/16 v3, 0x9

    aput v2, v0, v3

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    neg-float v2, v2

    const/4 v3, 0x2

    aput v2, v0, v3

    iget v2, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    neg-float v2, v2

    const/4 v3, 0x6

    aput v2, v0, v3

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    neg-float v1, v1

    const/16 v2, 0xa

    aput v1, v0, v2

    const/high16 v1, 0x3f800000    # 1.0f

    const/16 v2, 0xf

    aput v1, v0, v2

    return-object v0
.end method
