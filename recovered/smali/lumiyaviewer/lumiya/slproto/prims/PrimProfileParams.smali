.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;
.super Ljava/lang/Object;


# static fields
.field public static final CUT_QUANTA:F = 2.0E-5f

.field public static final HOLLOW_QUANTA:F = 2.0E-5f

.field public static final LL_PCODE_HOLE_CIRCLE:B = 0x10t

.field public static final LL_PCODE_HOLE_MASK:B = -0x10t

.field public static final LL_PCODE_HOLE_SAME:B = 0x0t

.field public static final LL_PCODE_HOLE_SQUARE:B = 0x20t

.field public static final LL_PCODE_HOLE_TRIANGLE:B = 0x30t

.field public static final LL_PCODE_PROFILE_CIRCLE:B = 0x0t

.field public static final LL_PCODE_PROFILE_CIRCLE_HALF:B = 0x5t

.field public static final LL_PCODE_PROFILE_EQUALTRI:B = 0x3t

.field public static final LL_PCODE_PROFILE_ISOTRI:B = 0x2t

.field public static final LL_PCODE_PROFILE_MASK:B = 0xft

.field public static final LL_PCODE_PROFILE_RIGHTTRI:B = 0x4t

.field public static final LL_PCODE_PROFILE_SQUARE:B = 0x1t


# instance fields
.field public final Begin:F

.field public final CurveType:B

.field public final End:F

.field public final Hollow:F

.field private final hashValue:I


# direct methods
.method public constructor <init>(BFFF)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->getHashValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->hashValue:I

    return-void
.end method

.method public static createFromObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;
    .locals 6

    const v5, 0xffff

    const v4, 0x37a7c5ac    # 2.0E-5f

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileCurve:I

    int-to-byte v0, v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileBegin:I

    and-int/2addr v1, v5

    int-to-float v1, v1

    mul-float/2addr v1, v4

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileEnd:I

    and-int/2addr v2, v5

    int-to-float v2, v2

    mul-float/2addr v2, v4

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v2, v3, v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ProfileHollow:I

    and-int/2addr v3, v5

    int-to-float v3, v3

    mul-float/2addr v3, v4

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;-><init>(BFFF)V

    return-object v4
.end method

.method public static createFromPackedData(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;
    .locals 6

    const v5, 0xffff

    const v4, 0x37a7c5ac    # 2.0E-5f

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    and-int/2addr v1, v5

    int-to-float v1, v1

    mul-float/2addr v1, v4

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    and-int/2addr v2, v5

    int-to-float v2, v2

    mul-float/2addr v2, v4

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v2, v3, v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    and-int/2addr v3, v5

    int-to-float v3, v3

    mul-float/2addr v3, v4

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;-><init>(BFFF)V

    return-object v4
.end method

.method private getHashValue()I
    .locals 2

    iget-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    mul-int/lit8 v0, v0, 0x11

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    if-nez v2, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    iget-byte v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    :goto_0
    return v0

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method public final hashCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->hashValue:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "CurveType: 0x%02x, Begin: %f, End: %f, Hollow: %f"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    iget-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->CurveType:B

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Begin:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->End:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->Hollow:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
