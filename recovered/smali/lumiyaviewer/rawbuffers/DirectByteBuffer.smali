.class public Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
.super Ljava/lang/Object;


# instance fields
.field private buf:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "rawbuf"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-void

    :cond_0
    new-instance v0, Ljava/lang/OutOfMemoryError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "DirectByteBuffer: Failed to allocate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    invoke-virtual {p0, v2, p1, v2, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFrom(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/OutOfMemoryError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "DirectByteBuffer: Failed to allocate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private native allocate(I)Ljava/nio/ByteBuffer;
.end method

.method private native copyByteArray(Ljava/nio/ByteBuffer;I[BII)V
.end method

.method private native copyFloatArray(Ljava/nio/ByteBuffer;I[FII)V
.end method

.method private native copyPart(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;III)V
.end method

.method private native copyShortArray(Ljava/nio/ByteBuffer;I[SII)V
.end method

.method private native copyShortArrayOffset(Ljava/nio/ByteBuffer;I[SIIS)V
.end method

.method private native release(Ljava/nio/ByteBuffer;)V
.end method

.method public static zeroDecode([BII[BII)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    invoke-static/range {p0 .. p5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->zeroDecodeArray([BII[BII)I

    move-result v0

    if-ltz v0, :cond_0

    return v0

    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "zeroDecode: out of dest buffer, destStart "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " destMaxLen "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static native zeroDecodeArray([BII[BII)I
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public asFloatBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    return-object v0
.end method

.method public asIntBuffer()Ljava/nio/IntBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    return-object v0
.end method

.method public asShortBuffer()Ljava/nio/ShortBuffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    return-object v0
.end method

.method public copyFrom(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V
    .locals 6

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    iget-object v2, p2, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    move-object v0, p0

    move v3, p1

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyPart(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;III)V

    return-void
.end method

.method public copyFromFloat(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V
    .locals 6

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    iget-object v2, p2, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    mul-int/lit8 v3, p1, 0x4

    mul-int/lit8 v4, p3, 0x4

    mul-int/lit8 v5, p4, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyPart(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;III)V

    return-void
.end method

.method public copyFromShort(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V
    .locals 6

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    iget-object v2, p2, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    mul-int/lit8 v3, p1, 0x2

    mul-int/lit8 v4, p3, 0x2

    mul-int/lit8 v5, p4, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyPart(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;III)V

    return-void
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->release(Ljava/nio/ByteBuffer;)V

    iput-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method public getCapacity()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    return v0
.end method

.method public getFloat(I)F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    mul-int/lit8 v1, p1, 0x4

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getFloat(I)F

    move-result v0

    return v0
.end method

.method public getShort(I)S
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    mul-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v0

    return v0
.end method

.method public loadFromByteArray(I[BII)V
    .locals 6

    const/4 v5, 0x0

    add-int v0, p1, p4

    if-gez p1, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    const-string/jumbo v4, "capacity %d, posStart %d, posEnd %d"

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x2

    aput-object v0, v2, v3

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-gt p1, v1, :cond_0

    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-gt v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyByteArray(Ljava/nio/ByteBuffer;I[BII)V

    return-void
.end method

.method public loadFromFloatArray(I[FII)V
    .locals 7

    const/4 v6, 0x0

    mul-int/lit8 v0, p1, 0x4

    add-int v1, p1, p4

    mul-int/lit8 v1, v1, 0x4

    if-gez v0, :cond_1

    :cond_0
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    const-string/jumbo v5, "capacity %d, posStart %d, posEnd %d"

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v3, v1

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-gt v0, v2, :cond_0

    if-ltz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-gt v1, v2, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFloatArray(Ljava/nio/ByteBuffer;I[FII)V

    return-void
.end method

.method public loadFromShortArray(I[SII)V
    .locals 7

    const/4 v6, 0x0

    mul-int/lit8 v0, p1, 0x2

    add-int v1, p1, p4

    mul-int/lit8 v1, v1, 0x2

    if-gez v0, :cond_1

    :cond_0
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    const-string/jumbo v5, "capacity %d, posStart %d, posEnd %d"

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v3, v1

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-gt v0, v2, :cond_0

    if-ltz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-gt v1, v2, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyShortArray(Ljava/nio/ByteBuffer;I[SII)V

    return-void
.end method

.method public loadFromShortArrayOffset(I[SIIS)V
    .locals 7

    const/4 v6, 0x0

    mul-int/lit8 v0, p1, 0x2

    add-int v1, p1, p4

    mul-int/lit8 v1, v1, 0x2

    if-gez v0, :cond_1

    :cond_0
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    const-string/jumbo v5, "capacity %d, posStart %d, posEnd %d"

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v3, v1

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-gt v0, v2, :cond_0

    if-ltz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-gt v1, v2, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyShortArrayOffset(Ljava/nio/ByteBuffer;I[SIIS)V

    return-void
.end method

.method public position()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    return v0
.end method

.method public position(I)Ljava/nio/Buffer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public positionFloat()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public positionFloat(I)Ljava/nio/Buffer;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    mul-int/lit8 v1, p1, 0x4

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public positionShort(I)Ljava/nio/Buffer;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    mul-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public putFloat(F)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public putFloat(IF)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    mul-int/lit8 v1, p1, 0x4

    invoke-virtual {v0, v1, p2}, Ljava/nio/ByteBuffer;->putFloat(IF)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public putRawFloat(IF)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->putFloat(IF)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public putRawInt(II)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public putShort(S)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public read(Ljava/io/InputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    new-array v1, v1, [B

    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-void
.end method
