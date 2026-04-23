.class public Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
.super Ljava/lang/Object;


# static fields
.field public static final FP_MAG_THRESHOLD:F = 1.0E-7f

.field public static final Zero:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public static final z_axis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# instance fields
.field public x:F

.field public y:F

.field public z:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z_axis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, v2, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->Zero:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public static cross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, v2

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v2, v3

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v3, v4

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v5

    sub-float/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v0
.end method

.method public static lerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v2, v3

    mul-float/2addr v2, p2

    add-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v3, v4

    mul-float/2addr v3, p2

    add-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p2

    add-float/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v0
.end method

.method public static parseFloatVec(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 4

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v3
.end method

.method public static parseU16Vec(Ljava/nio/ByteBuffer;FFFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 4

    const v3, 0xffff

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    and-int/2addr v0, v3

    invoke-static {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U16_to_float(IFF)F

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    and-int/2addr v1, v3

    invoke-static {v1, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U16_to_float(IFF)F

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    and-int/2addr v2, v3

    invoke-static {v2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U16_to_float(IFF)F

    move-result v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v3
.end method

.method public static parseU8Vec(Ljava/nio/ByteBuffer;FFFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 4

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

    invoke-static {v2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->U8_to_float(IFF)F

    move-result v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v3
.end method

.method public static scaleFromMatrix([F)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 6

    const/4 v5, 0x5

    const/4 v4, 0x4

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    aget v0, p0, v1

    aget v1, p0, v1

    mul-float/2addr v0, v1

    aget v1, p0, v2

    aget v2, p0, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p0, v3

    aget v2, p0, v3

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    aget v1, p0, v4

    aget v2, p0, v4

    mul-float/2addr v1, v2

    aget v2, p0, v5

    aget v3, p0, v5

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/4 v2, 0x6

    aget v2, p0, v2

    const/4 v3, 0x6

    aget v3, p0, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v1, v2

    const/16 v2, 0x8

    aget v2, p0, v2

    const/16 v3, 0x8

    aget v3, p0, v3

    mul-float/2addr v2, v3

    const/16 v3, 0x9

    aget v3, p0, v3

    const/16 v4, 0x9

    aget v4, p0, v4

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    const/16 v3, 0xa

    aget v3, p0, v3

    const/16 v4, 0xa

    aget v4, p0, v4

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v2, v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v3, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v3
.end method

.method public static sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 5

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v0
.end method


# virtual methods
.method public add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public addMul(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;F)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public dot(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

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
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    if-nez v2, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    :goto_0
    return v0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method public getDistanceTo(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F
    .locals 4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

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

.method public getMax()F
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public getRotatedOffset(FF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 6

    const v0, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v0, p2

    const/high16 v1, 0x43340000    # 180.0f

    div-float/2addr v0, v1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float/2addr v2, p1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v2, v3

    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v0, v4

    mul-float/2addr v0, p1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v0, v3

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-direct {v1, v2, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v1
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isZero()Z
    .locals 3

    const/4 v0, 0x0

    const/4 v2, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public magVec()F
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public magVecSquared()F
    .locals 3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public mul(F)V
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 6

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    neg-float v0, v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, v1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v1, v2

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v2, v3

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v3, v4

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v4, v5

    sub-float/2addr v3, v4

    neg-float v4, v0

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v5, v1

    add-float/2addr v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v5, v2

    sub-float/2addr v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v5, v3

    add-float/2addr v4, v5

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    neg-float v4, v0

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v5, v2

    add-float/2addr v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v5, v3

    sub-float/2addr v4, v5

    iget v5, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v5, v1

    add-float/2addr v4, v5

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    neg-float v0, v0

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    mul-float/2addr v0, v4

    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->w:F

    mul-float/2addr v3, v4

    add-float/2addr v0, v3

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    mul-float/2addr v1, v3

    sub-float/2addr v0, v1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public mulWeighted(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;F)V
    .locals 3

    const/high16 v2, 0x3f800000    # 1.0f

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->x:F

    mul-float/2addr v1, p2

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->y:F

    mul-float/2addr v1, p2

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;->z:F

    mul-float/2addr v1, p2

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public mulWeighted(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    .locals 3

    const/high16 v2, 0x3f800000    # 1.0f

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v1, p2

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, p2

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, p2

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public normVec()F
    .locals 4

    const/4 v3, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

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

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v2, v1

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :goto_0
    return v0

    :cond_0
    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    goto :goto_0
.end method

.method public set(FFF)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 1

    if-eqz p1, :cond_0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :cond_0
    return-void
.end method

.method public setAdd(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public setCross(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, v1

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v1, v2

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v2, v3

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public setLerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    .locals 2

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, p2

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v0, p2

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, p2

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public setLerp(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    .locals 3

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v1, v2

    mul-float/2addr v1, p3

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v1, v2

    mul-float/2addr v1, p3

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v1, v2

    mul-float/2addr v1, p3

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V
    .locals 1

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, p2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v0, p2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, p2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-void
.end method

.method public toLLSD()Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;
    .locals 8

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v1, 0x3

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v3, "X"

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    float-to-double v6, v5

    invoke-direct {v4, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;-><init>(D)V

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v3, "Y"

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    float-to-double v6, v5

    invoke-direct {v4, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;-><init>(D)V

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v3, "Z"

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;

    iget v5, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    float-to-double v6, v5

    invoke-direct {v4, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDDouble;-><init>(D)V

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "(%f, %f, %f)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
