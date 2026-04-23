.class public final Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final U16_to_float(IFF)F
    .locals 1

    const v0, 0x37800080

    invoke-static {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->int_dequantize(FIFF)F

    move-result v0

    return v0
.end method

.method public static final U8_to_float(IFF)F
    .locals 1

    const v0, 0x3b808081

    invoke-static {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLTersePacking;->int_dequantize(FIFF)F

    move-result v0

    return v0
.end method

.method public static final getSignedByte(I)I
    .locals 2

    and-int/lit16 v0, p0, 0xff

    const/16 v1, 0x80

    if-lt v0, v1, :cond_0

    add-int/lit16 v0, v0, -0x100

    :cond_0
    return v0
.end method

.method private static final int_dequantize(FIFF)F
    .locals 3

    int-to-float v0, p1

    mul-float/2addr v0, p0

    sub-float v1, p3, p2

    mul-float/2addr v0, v1

    add-float/2addr v0, p2

    mul-float/2addr v1, p0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v1, v2, v1

    if-gez v1, :cond_0

    const/4 v0, 0x0

    :cond_0
    return v0
.end method
