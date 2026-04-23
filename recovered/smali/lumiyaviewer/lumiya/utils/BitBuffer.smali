.class public Lcom/lumiyaviewer/lumiya/utils/BitBuffer;
.super Ljava/lang/Object;


# static fields
.field private static final MAX_BITS:I = 0x8


# instance fields
.field private bitPos:I

.field private buf:Ljava/nio/ByteBuffer;

.field private bytePos:I

.field private output:[B


# direct methods
.method public constructor <init>([B)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->buf:Ljava/nio/ByteBuffer;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bytePos:I

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bitPos:I

    return-void
.end method


# virtual methods
.method public getBits(I)I
    .locals 9

    const/16 v4, 0x8

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    move v0, v1

    move v2, v1

    move v3, p1

    :goto_0
    if-lez v3, :cond_5

    if-le v3, v4, :cond_3

    add-int/lit8 v3, v3, -0x8

    move v5, v3

    move v3, v4

    :cond_0
    :goto_1
    if-lez v3, :cond_4

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    aget-byte v7, v6, v2

    shl-int/lit8 v7, v7, 0x1

    int-to-byte v7, v7

    aput-byte v7, v6, v2

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->buf:Ljava/nio/ByteBuffer;

    iget v7, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bytePos:I

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    iget v7, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bitPos:I

    const/16 v8, 0x80

    shr-int v7, v8, v7

    and-int/2addr v6, v7

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    aget-byte v7, v6, v2

    or-int/lit8 v7, v7, 0x1

    int-to-byte v7, v7

    aput-byte v7, v6, v2

    :cond_1
    iget v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bitPos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bitPos:I

    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v0, v0, 0x1

    iget v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bitPos:I

    if-lt v6, v4, :cond_2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bitPos:I

    iget v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bytePos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bytePos:I

    :cond_2
    if-lt v0, v4, :cond_0

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    move v0, v1

    goto :goto_1

    :cond_3
    move v5, v1

    goto :goto_1

    :cond_4
    move v3, v5

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    const/4 v2, 0x1

    aget-byte v1, v1, v2

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    const/4 v2, 0x2

    aget-byte v1, v1, v2

    shl-int/lit8 v1, v1, 0x10

    const/high16 v2, 0xff0000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->output:[B

    const/4 v2, 0x3

    aget-byte v1, v1, v2

    shl-int/lit8 v1, v1, 0x18

    const/high16 v2, -0x1000000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    return v0
.end method

.method public getFloat()F
    .locals 1

    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->getBits(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public isEOF()Z
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->bytePos:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/BitBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
