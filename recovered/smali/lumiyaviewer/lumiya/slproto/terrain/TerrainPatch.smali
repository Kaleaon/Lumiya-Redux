.class public Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;
.super Ljava/lang/Object;


# static fields
.field private static CopyMatrix16:[I = null

.field private static CopyMatrix32:[I = null

.field private static CosineTable16:[F = null

.field private static DequantizeTable16:[F = null

.field private static DequantizeTable32:[F = null

.field public static final END_OF_PATCHES:I = 0x61

.field private static OO_SQRT2:F

.field private static QuantizeTable16:[F


# instance fields
.field DCOffset:F

.field PatchIDs:I

.field QuantWBits:I

.field Range:I

.field WordBits:I

.field public heightMap:[F

.field patches:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v1, 0x100

    new-array v0, v1, [F

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DequantizeTable16:[F

    new-array v0, v1, [F

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DequantizeTable32:[F

    new-array v0, v1, [F

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CosineTable16:[F

    new-array v0, v1, [I

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CopyMatrix16:[I

    new-array v0, v1, [I

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CopyMatrix32:[I

    new-array v0, v1, [F

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->QuantizeTable16:[F

    const v0, 0x3f3504f3

    sput v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->OO_SQRT2:F

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->BuildDequantizeTable16()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->SetupCosines16()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->BuildCopyMatrix16()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->BuildQuantizeTable16()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static BuildCopyMatrix16()V
    .locals 12

    const/16 v11, 0x10

    const/16 v10, 0xf

    const/4 v4, 0x1

    const/4 v3, 0x0

    move v6, v3

    move v0, v3

    move v1, v3

    move v2, v4

    move v5, v3

    :goto_0
    if-ge v1, v11, :cond_8

    if-ge v0, v11, :cond_8

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CopyMatrix16:[I

    mul-int/lit8 v7, v0, 0x10

    add-int v9, v7, v1

    add-int/lit8 v7, v6, 0x1

    aput v6, v8, v9

    if-nez v5, :cond_4

    if-eqz v2, :cond_2

    if-ge v1, v10, :cond_1

    add-int/lit8 v1, v1, 0x1

    :goto_1
    move v2, v3

    move v5, v4

    :cond_0
    :goto_2
    move v6, v7

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    if-ge v0, v10, :cond_3

    add-int/lit8 v0, v0, 0x1

    :goto_3
    move v2, v4

    move v5, v4

    goto :goto_2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_4
    if-eqz v2, :cond_6

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, -0x1

    if-eq v1, v10, :cond_5

    if-nez v0, :cond_0

    :cond_5
    move v5, v3

    goto :goto_2

    :cond_6
    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v0, v0, 0x1

    if-eq v0, v10, :cond_7

    if-nez v1, :cond_0

    :cond_7
    move v5, v3

    goto :goto_2

    :cond_8
    return-void
.end method

.method private static BuildDequantizeTable16()V
    .locals 8

    const/16 v7, 0x10

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v7, :cond_1

    move v0, v1

    :goto_1
    if-ge v0, v7, :cond_0

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DequantizeTable16:[F

    mul-int/lit8 v4, v2, 0x10

    add-int/2addr v4, v0

    add-int v5, v0, v2

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    aput v5, v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static BuildQuantizeTable16()V
    .locals 9

    const/16 v8, 0x10

    const/4 v1, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    move v2, v1

    :goto_0
    if-ge v2, v8, :cond_1

    move v0, v1

    :goto_1
    if-ge v0, v8, :cond_0

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->QuantizeTable16:[F

    mul-int/lit8 v4, v2, 0x10

    add-int/2addr v4, v0

    int-to-float v5, v0

    int-to-float v6, v2

    add-float/2addr v5, v6

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    add-float/2addr v5, v7

    div-float v5, v7, v5

    aput v5, v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static DecompressPatch(Lcom/lumiyaviewer/lumiya/utils/BitBuffer;I)Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;
    .locals 11

    const/16 v10, 0x100

    const/16 v9, 0x10

    const/4 v7, 0x1

    const/4 v0, 0x0

    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v1

    const/16 v2, 0x61

    if-ne v1, v2, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;-><init>()V

    iput v1, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->QuantWBits:I

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getFloat()F

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DCOffset:F

    invoke-virtual {p0, v9}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->Range:I

    const/16 v3, 0xa

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->PatchIDs:I

    and-int/lit8 v1, v1, 0xf

    add-int/lit8 v1, v1, 0x2

    iput v1, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->WordBits:I

    mul-int v1, p1, p1

    new-array v1, v1, [I

    iput-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->patches:[I

    move v1, v0

    :goto_0
    mul-int v3, p1, p1

    if-ge v1, v3, :cond_4

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    if-eqz v3, :cond_1

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->WordBits:I

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->patches:[I

    mul-int/lit8 v3, v3, -0x1

    aput v3, v4, v1

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->WordBits:I

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v3

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->patches:[I

    aput v3, v4, v1

    goto :goto_1

    :cond_2
    :goto_2
    mul-int v3, p1, p1

    if-ge v1, v3, :cond_4

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->patches:[I

    aput v0, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_3
    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->patches:[I

    aput v0, v3, v1

    goto :goto_1

    :cond_4
    mul-int v1, p1, p1

    new-array v3, v1, [F

    mul-int v1, p1, p1

    new-array v4, v1, [F

    iget v1, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->QuantWBits:I

    shr-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x2

    shl-int v5, v7, v1

    int-to-float v5, v5

    const/high16 v6, 0x3f800000    # 1.0f

    div-float v5, v6, v5

    iget v6, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->Range:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-int/lit8 v1, v1, -0x1

    shl-int v1, v7, v1

    int-to-float v1, v1

    mul-float/2addr v1, v5

    iget v6, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DCOffset:F

    add-float/2addr v6, v1

    if-ne p1, v9, :cond_7

    move v1, v0

    :goto_3
    if-ge v1, v10, :cond_5

    iget-object v7, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->patches:[I

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CopyMatrix16:[I

    aget v8, v8, v1

    aget v7, v7, v8

    int-to-float v7, v7

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DequantizeTable16:[F

    aget v8, v8, v1

    mul-float/2addr v7, v8

    aput v7, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_5
    new-array v7, v10, [F

    move v1, v0

    :goto_4
    if-ge v1, v9, :cond_6

    invoke-static {v3, v7, v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->IDCTColumn16([F[FI)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_6
    move v1, v0

    :goto_5
    if-ge v1, v9, :cond_8

    invoke-static {v7, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->IDCTLine16([F[FI)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_7
    move v1, v0

    :goto_6
    const/16 v7, 0x400

    if-ge v1, v7, :cond_8

    iget-object v7, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->patches:[I

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CopyMatrix32:[I

    aget v8, v8, v1

    aget v7, v7, v8

    int-to-float v7, v7

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->DequantizeTable32:[F

    aget v8, v8, v1

    mul-float/2addr v7, v8

    aput v7, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_8
    :goto_7
    array-length v1, v3

    if-ge v0, v1, :cond_9

    aget v1, v3, v0

    mul-float/2addr v1, v5

    add-float/2addr v1, v6

    aput v1, v4, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_9
    iput-object v4, v2, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->heightMap:[F

    return-object v2
.end method

.method private static IDCTColumn16([F[FI)V
    .locals 7

    const/16 v6, 0x10

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v6, :cond_1

    sget v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->OO_SQRT2:F

    aget v1, p0, p2

    mul-float/2addr v1, v0

    const/4 v0, 0x1

    :goto_1
    if-ge v0, v6, :cond_0

    mul-int/lit8 v3, v0, 0x10

    add-int v4, v3, p2

    aget v4, p0, v4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CosineTable16:[F

    add-int/2addr v3, v2

    aget v3, v5, v3

    mul-float/2addr v3, v4

    add-float/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    mul-int/lit8 v0, v2, 0x10

    add-int/2addr v0, p2

    aput v1, p1, v0

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static IDCTLine16([F[FI)V
    .locals 9

    const/16 v8, 0x10

    const/high16 v7, 0x3e000000    # 0.125f

    mul-int/lit8 v3, p2, 0x10

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v8, :cond_1

    sget v0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->OO_SQRT2:F

    aget v1, p0, v3

    mul-float/2addr v1, v0

    const/4 v0, 0x1

    :goto_1
    if-ge v0, v8, :cond_0

    add-int v4, v3, v0

    aget v4, p0, v4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CosineTable16:[F

    mul-int/lit8 v6, v0, 0x10

    add-int/2addr v6, v2

    aget v5, v5, v6

    mul-float/2addr v4, v5

    add-float/2addr v1, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int v0, v3, v2

    mul-float/2addr v1, v7

    aput v1, p1, v0

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static SetupCosines16()V
    .locals 10

    const/16 v9, 0x10

    const/4 v1, 0x0

    const v8, 0x3dc90fdb

    move v2, v1

    :goto_0
    if-ge v2, v9, :cond_1

    move v0, v1

    :goto_1
    if-ge v0, v9, :cond_0

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->CosineTable16:[F

    mul-int/lit8 v4, v2, 0x10

    add-int/2addr v4, v0

    int-to-float v5, v0

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    int-to-float v6, v2

    mul-float/2addr v5, v6

    mul-float/2addr v5, v8

    float-to-double v6, v5

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    double-to-float v5, v6

    aput v5, v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public getX()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->PatchIDs:I

    shr-int/lit8 v0, v0, 0x5

    return v0
.end method

.method public getY()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatch;->PatchIDs:I

    and-int/lit8 v0, v0, 0x1f

    return v0
.end method
