.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;
.super Ljava/lang/Object;


# static fields
.field public static final CUT_QUANTA:F = 2.0E-5f

.field public static final LL_PCODE_PATH_CIRCLE:B = 0x20t

.field public static final LL_PCODE_PATH_CIRCLE2:B = 0x30t

.field public static final LL_PCODE_PATH_FLEXIBLE:B = -0x80t

.field public static final LL_PCODE_PATH_LINE:B = 0x10t

.field public static final LL_PCODE_PATH_TEST:B = 0x40t

.field public static final REV_QUANTA:F = 0.015f

.field public static final SCALE_QUANTA:F = 0.01f

.field public static final SHEAR_QUANTA:F = 0.01f

.field public static final TAPER_QUANTA:F = 0.01f


# instance fields
.field public final Begin:F

.field public final CurveType:B

.field public final End:F

.field public final RadiusOffset:F

.field public final Revolutions:F

.field public final ScaleX:F

.field public final ScaleY:F

.field public final ShearX:F

.field public final ShearY:F

.field public final Skew:F

.field public final TaperX:F

.field public final TaperY:F

.field public final TwistBegin:F

.field public final TwistEnd:F

.field private final hashValue:I


# direct methods
.method public constructor <init>(BFFFFFFFFFFFFF)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    iput p6, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    iput p7, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    iput p8, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    iput p9, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    iput p10, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    iput p11, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    iput p12, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    iput p13, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    iput p14, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->getHashValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->hashValue:I

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)V
    .locals 4

    const v1, 0xffff

    const v3, 0x37a7c5ac    # 2.0E-5f

    const v2, 0x3c23d70a    # 0.01f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathCurve:I

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathBegin:I

    and-int/2addr v0, v1

    int-to-float v0, v0

    mul-float/2addr v0, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathEnd:I

    and-int/2addr v0, v1

    const v1, 0xc350

    sub-int v0, v1, v0

    int-to-float v0, v0

    mul-float/2addr v0, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathScaleX:I

    and-int/lit16 v0, v0, 0xff

    rsub-int v0, v0, 0xc8

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathScaleY:I

    and-int/lit16 v0, v0, 0xff

    rsub-int v0, v0, 0xc8

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathShearX:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathShearY:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTwist:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTwistBegin:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathRadiusOffset:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTaperX:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathTaperY:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathRevolutions:I

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    const v1, 0x3c75c28f    # 0.015f

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PathSkew:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->getHashValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->hashValue:I

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 4

    const v1, 0xffff

    const v3, 0x37a7c5ac    # 2.0E-5f

    const v2, 0x3c23d70a    # 0.01f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    iput-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    and-int/2addr v0, v1

    int-to-float v0, v0

    mul-float/2addr v0, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    and-int/2addr v0, v1

    const v1, 0xc350

    sub-int v0, v1, v0

    int-to-float v0, v0

    mul-float/2addr v0, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    rsub-int v0, v0, 0xc8

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    rsub-int v0, v0, 0xc8

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    const v1, 0x3c75c28f    # 0.015f

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->getSignedByte(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->getHashValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->hashValue:I

    return-void
.end method

.method private getHashValue()I
    .locals 2

    iget-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    mul-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    if-nez v2, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    iget-byte v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    :goto_0
    return v0

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public getBeginScale()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;
    .locals 4

    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v2, 0x3f800000    # 1.0f

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v0, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    sub-float v1, v3, v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    :cond_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    sub-float v1, v3, v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :cond_1
    return-object v0
.end method

.method public getEndScale()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;
    .locals 3

    const/high16 v2, 0x3f800000    # 1.0f

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v0, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(FF)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    :cond_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    :cond_1
    return-object v0
.end method

.method public final hashCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->hashValue:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "CurveType: 0x%02x, Begin: %f, End: %f, Scale: (%f, %f), Shear: (%f, %f), TwistBegin: %f, TwistEnd: %f, RadiusOffset: %f, Taper: (%f, %f), Revolutions: %f, Skew: %f"

    const/16 v1, 0xe

    new-array v1, v1, [Ljava/lang/Object;

    iget-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->CurveType:B

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Begin:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->End:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleX:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ScaleY:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x4

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearX:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x5

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->ShearY:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x6

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistBegin:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x7

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TwistEnd:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/16 v3, 0x8

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->RadiusOffset:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/16 v3, 0x9

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperX:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/16 v3, 0xa

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->TaperY:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/16 v3, 0xb

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Revolutions:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/16 v3, 0xc

    aput-object v2, v1, v3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->Skew:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/16 v3, 0xd

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
