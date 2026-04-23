.class public Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;
.super Ljava/lang/Object;


# static fields
.field public static final MAX_FACES:I = 0x20

.field private static final emptyFaces:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

.field private static final pool:Lcom/lumiyaviewer/lumiya/utils/InternPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InternPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

.field private final FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

.field private final faceMask:I

.field private final hashValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->emptyFaces:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->pool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    return-void
.end method

.method private constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move v1, v0

    :goto_0
    array-length v2, p2

    if-ge v0, v2, :cond_1

    aget-object v2, p2, v0

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    shl-int/2addr v2, v0

    or-int/2addr v1, v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getHashValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->hashValue:I

    return-void
.end method

.method private constructor <init>(Ljava/nio/ByteBuffer;I)V
    .locals 12

    const/4 v4, -0x1

    const/4 v1, 0x1

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    invoke-direct {v5, v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;-><init>(I)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    sub-int/2addr v0, v2

    const/16 v2, 0x10

    if-ge v0, v2, :cond_0

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->create(Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->emptyFaces:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getHashValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->hashValue:I

    return-void

    :cond_0
    const/16 v0, 0x20

    new-array v6, v0, [Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    new-array v7, v1, [I

    new-array v8, v1, [I

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setTextureID(Ljava/util/UUID;)V

    :cond_1
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_3

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v10

    move v0, v1

    move v2, v3

    :goto_0
    aget v11, v8, v3

    if-ge v2, v11, :cond_1

    and-int v11, v9, v0

    if-eqz v11, :cond_2

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setTextureID(Ljava/util/UUID;)V

    :cond_2
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRGBA(I)V

    :cond_4
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_6

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v10

    move v0, v1

    move v2, v3

    :goto_1
    aget v11, v8, v3

    if-ge v2, v11, :cond_4

    and-int v11, v9, v0

    if-eqz v11, :cond_5

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRGBA(I)V

    :cond_5
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_6
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRepeatU(F)V

    :cond_7
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_9

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v10

    move v0, v1

    move v2, v3

    :goto_2
    aget v11, v8, v3

    if-ge v2, v11, :cond_7

    and-int v11, v9, v0

    if-eqz v11, :cond_8

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRepeatU(F)V

    :cond_8
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_9
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRepeatV(F)V

    :cond_a
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_c

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v10

    move v0, v1

    move v2, v3

    :goto_3
    aget v11, v8, v3

    if-ge v2, v11, :cond_a

    and-int v11, v9, v0

    if-eqz v11, :cond_b

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRepeatV(F)V

    :cond_b
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_c
    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getOffset(Ljava/nio/ByteBuffer;)F

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setOffsetU(F)V

    :cond_d
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_f

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getOffset(Ljava/nio/ByteBuffer;)F

    move-result v10

    move v0, v1

    move v2, v3

    :goto_4
    aget v11, v8, v3

    if-ge v2, v11, :cond_d

    and-int v11, v9, v0

    if-eqz v11, :cond_e

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setOffsetU(F)V

    :cond_e
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_f
    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getOffset(Ljava/nio/ByteBuffer;)F

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setOffsetV(F)V

    :cond_10
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_12

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getOffset(Ljava/nio/ByteBuffer;)F

    move-result v10

    move v0, v1

    move v2, v3

    :goto_5
    aget v11, v8, v3

    if-ge v2, v11, :cond_10

    and-int v11, v9, v0

    if-eqz v11, :cond_11

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setOffsetV(F)V

    :cond_11
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_12
    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getRotation(Ljava/nio/ByteBuffer;)F

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRotation(F)V

    :cond_13
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_15

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getRotation(Ljava/nio/ByteBuffer;)F

    move-result v10

    move v0, v1

    move v2, v3

    :goto_6
    aget v11, v8, v3

    if-ge v2, v11, :cond_13

    and-int v11, v9, v0

    if-eqz v11, :cond_14

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setRotation(F)V

    :cond_14
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_15
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setMaterial(B)V

    :cond_16
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_18

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    move v0, v1

    move v2, v3

    :goto_7
    aget v11, v8, v3

    if-ge v2, v11, :cond_16

    and-int v11, v9, v0

    if-eqz v11, :cond_17

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setMaterial(B)V

    :cond_17
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_18
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setMedia(B)V

    :cond_19
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_1b

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    move v0, v1

    move v2, v3

    :goto_8
    aget v11, v8, v3

    if-ge v2, v11, :cond_19

    and-int v11, v9, v0

    if-eqz v11, :cond_1a

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setMedia(B)V

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_1b
    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getGlow(Ljava/nio/ByteBuffer;)F

    move-result v0

    invoke-virtual {v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setGlow(F)V

    :cond_1c
    invoke-direct {p0, p1, v8}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I

    move-result v9

    if-eqz v9, :cond_1e

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getGlow(Ljava/nio/ByteBuffer;)F

    move-result v10

    move v0, v1

    move v2, v3

    :goto_9
    aget v11, v8, v3

    if-ge v2, v11, :cond_1c

    and-int v11, v9, v0

    if-eqz v11, :cond_1d

    invoke-static {v6, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;->setGlow(F)V

    :cond_1d
    add-int/lit8 v2, v2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_1e
    aget v0, v7, v3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    move v0, v3

    move v1, v4

    :goto_a
    const/16 v2, 0x21

    if-ge v0, v2, :cond_22

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    and-int/2addr v2, v1

    if-nez v2, :cond_20

    :goto_b
    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->create(Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    if-nez v0, :cond_21

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->emptyFaces:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    :cond_1f
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getHashValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->hashValue:I

    return-void

    :cond_20
    shl-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_21
    new-array v1, v0, [Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    :goto_c
    if-ge v3, v0, :cond_1f

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v6, v3

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->create(Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v2

    aput-object v2, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_22
    move v0, v3

    goto :goto_b
.end method

.method private static CreateFace([Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;I[I)Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;
    .locals 3

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v0, 0x20

    if-lt p1, v0, :cond_0

    return-object v1

    :cond_0
    aget-object v0, p0, p1

    if-eqz v0, :cond_1

    aget-object v0, p0, p1

    return-object v0

    :cond_1
    aget v0, p2, v2

    const/4 v1, 0x1

    shl-int/2addr v1, p1

    or-int/2addr v0, v1

    aput v0, p2, v2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;

    invoke-direct {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/MutableSLTextureEntryFace;-><init>(I)V

    aput-object v0, p0, p1

    aget-object v0, p0, p1

    return-object v0
.end method

.method private ReadFaceBitfield(Ljava/nio/ByteBuffer;[I)I
    .locals 4

    const/4 v1, 0x0

    aput v1, p2, v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    if-lt v0, v2, :cond_0

    return v1

    :cond_0
    move v0, v1

    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    shl-int/lit8 v0, v0, 0x7

    and-int/lit8 v3, v2, 0x7f

    or-int/2addr v0, v3

    aget v3, p2, v1

    add-int/lit8 v3, v3, 0x7

    aput v3, p2, v1

    and-int/lit16 v2, v2, 0x80

    if-nez v2, :cond_1

    return v0
.end method

.method private WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V
    .locals 10

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v1, 0x0

    move v0, v1

    move v2, p2

    :goto_0
    const/4 v3, 0x6

    if-ge v0, v3, :cond_3

    and-int/lit8 v3, v2, -0x80

    if-nez v3, :cond_1

    add-int/lit8 v0, v0, 0x1

    :goto_1
    const-string/jumbo v2, "WriteFaceBitfield: faceBits = 0x%08x, count %d"

    new-array v3, v9, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    add-int/lit8 v2, v0, -0x1

    mul-int/lit8 v2, v2, 0x7

    move v3, v1

    move v4, v2

    :goto_2
    if-ge v3, v0, :cond_2

    shr-int v2, p2, v4

    and-int/lit8 v2, v2, 0x7f

    int-to-byte v2, v2

    add-int/lit8 v5, v0, -0x1

    if-eq v3, v5, :cond_0

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    :cond_0
    const-string/jumbo v5, "WriteFaceBitfield: i = %d, shift = %d, byte 0x%02x"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    add-int/lit8 v4, v4, -0x7

    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_2

    :cond_1
    shr-int/lit8 v2, v2, 0x7

    const v3, 0x1ffffff

    and-int/2addr v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->pool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    return-object v0
.end method

.method public static create(Ljava/nio/ByteBuffer;I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->pool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;-><init>(Ljava/nio/ByteBuffer;I)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    return-object v0
.end method

.method private static getGlow(Ljava/nio/ByteBuffer;)F
    .locals 2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    return v0
.end method

.method private getHashValue()I
    .locals 4

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    add-int/2addr v2, v1

    const/4 v1, 0x1

    :goto_0
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v3, v3

    if-ge v0, v3, :cond_1

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    and-int/2addr v3, v1

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hashCode()I

    move-result v3

    add-int/2addr v2, v3

    :cond_0
    shl-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private static getOffset(Ljava/nio/ByteBuffer;)F
    .locals 2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    int-to-float v0, v0

    const v1, 0x46fffe00    # 32767.0f

    div-float/2addr v0, v1

    return v0
.end method

.method private static getRotation(Ljava/nio/ByteBuffer;)F
    .locals 2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    int-to-float v0, v0

    const v1, 0x46fffe00    # 32767.0f

    div-float/2addr v0, v1

    const v1, 0x40490fdb    # (float)Math.PI

    mul-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    return v0
.end method

.method private static getUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;
    .locals 5

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    new-instance v4, Ljava/util/UUID;

    invoke-direct {v4, v0, v1, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-object v4
.end method

.method private static putGlow(Ljava/nio/ByteBuffer;F)V
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr v0, p1

    float-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method private static putOffset(Ljava/nio/ByteBuffer;F)V
    .locals 1

    const v0, 0x46fffe00    # 32767.0f

    mul-float/2addr v0, p1

    float-to-int v0, v0

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method

.method private static putRotation(Ljava/nio/ByteBuffer;F)V
    .locals 2

    const v0, 0x40c90fdb

    div-float v0, p1, v0

    const v1, 0x46fffe00    # 32767.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method

.method private static putUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V
    .locals 4

    const-wide/16 v0, 0x0

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    :goto_0
    invoke-virtual {p0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-void

    :cond_0
    move-wide v2, v0

    goto :goto_0
.end method


# virtual methods
.method public final GetDefaultTexture()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    return-object v0
.end method

.method public final GetFace(I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;
    .locals 2

    const/4 v1, 0x0

    const/16 v0, 0x20

    if-lt p1, v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v0, v0

    if-lt p1, v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v0, v0, p1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v0, v0, p1

    return-object v0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v3, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v3

    :cond_0
    if-nez p1, :cond_1

    return v1

    :cond_1
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    if-nez v0, :cond_2

    return v1

    :cond_2
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    if-eq v0, v2, :cond_3

    return v1

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v0, v0

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-eq v0, v2, :cond_4

    return v1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v1

    :cond_5
    move v0, v1

    move v2, v3

    :goto_0
    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v4, v4

    if-ge v0, v4, :cond_7

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    and-int/2addr v4, v2

    if-eqz v4, :cond_6

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v4, v4, v0

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v5, v5, v0

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    return v1

    :cond_6
    shl-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_7
    return v3
.end method

.method public getFaceMask()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    return v0
.end method

.method public final hashCode()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->hashValue:I

    return v0
.end method

.method public isSingleFace()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->faceMask:I

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public packByteArray()[B
    .locals 6

    const/4 v3, 0x1

    const/4 v1, 0x0

    const v0, 0xffff

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->textureID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->textureID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_1

    move v2, v3

    :goto_1
    if-eqz v2, :cond_0

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getTextureID(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Ljava/util/UUID;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getTextureID(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Ljava/util/UUID;

    move-result-object v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->textureID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    move v2, v3

    goto :goto_1

    :cond_2
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rgba()I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move v0, v1

    :goto_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRGBA(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)I

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rgba()I

    move-result v5

    if-eq v2, v5, :cond_3

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRGBA(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatU()F

    move-result v0

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    move v0, v1

    :goto_3
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRepeatU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatU()F

    move-result v5

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_5

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRepeatU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_6
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatV()F

    move-result v0

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    move v0, v1

    :goto_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_8

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRepeatV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatV()F

    move-result v5

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_7

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRepeatV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_8
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetU()F

    move-result v0

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putOffset(Ljava/nio/ByteBuffer;F)V

    move v0, v1

    :goto_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_a

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getOffsetU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetU()F

    move-result v5

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_9

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getOffsetU(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    invoke-static {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putOffset(Ljava/nio/ByteBuffer;F)V

    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_a
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetV()F

    move-result v0

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putOffset(Ljava/nio/ByteBuffer;F)V

    move v0, v1

    :goto_6
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_c

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_b

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getOffsetV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetV()F

    move-result v5

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_b

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getOffsetV(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    invoke-static {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putOffset(Ljava/nio/ByteBuffer;F)V

    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_c
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rotation()F

    move-result v0

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putRotation(Ljava/nio/ByteBuffer;F)V

    move v0, v1

    :goto_7
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_e

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRotation(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rotation()F

    move-result v5

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_d

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getRotation(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    invoke-static {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putRotation(Ljava/nio/ByteBuffer;F)V

    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_e
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->materialb()B

    move-result v0

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move v0, v1

    :goto_8
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_10

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_f

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getMaterial(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)B

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->materialb()B

    move-result v5

    if-eq v2, v5, :cond_f

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getMaterial(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)B

    move-result v2

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_10
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->mediab()B

    move-result v0

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move v0, v1

    :goto_9
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_12

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_11

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getMedia(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)B

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->mediab()B

    move-result v5

    if-eq v2, v5, :cond_11

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getMedia(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)B

    move-result v2

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_12
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->glow()F

    move-result v0

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putGlow(Ljava/nio/ByteBuffer;F)V

    move v0, v1

    :goto_a
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    array-length v2, v2

    if-ge v0, v2, :cond_14

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    if-eqz v2, :cond_13

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getGlow(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->glow()F

    move-result v5

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_13

    shl-int v2, v3, v0

    invoke-direct {p0, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->FaceTextures:[Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    aget-object v2, v2, v0

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->DefaultTexture:Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getGlow(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)F

    move-result v2

    invoke-static {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->putGlow(Ljava/nio/ByteBuffer;F)V

    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_14
    invoke-direct {p0, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->WriteFaceBitfield(Ljava/nio/ByteBuffer;I)V

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    const-string/jumbo v1, "Baking: TEpacked: "

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/Debug;->DumpBuffer(Ljava/lang/String;[B)V

    return-object v0

    :cond_15
    move v2, v1

    goto/16 :goto_1
.end method
