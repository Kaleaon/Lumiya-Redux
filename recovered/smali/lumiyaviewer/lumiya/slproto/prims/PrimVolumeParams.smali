.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;
.super Ljava/lang/Object;


# static fields
.field public static final LL_SCULPT_FLAG_INVERT:B = 0x40t

.field public static final LL_SCULPT_FLAG_MIRROR:B = -0x80t

.field public static final LL_SCULPT_TYPE_CYLINDER:B = 0x4t

.field public static final LL_SCULPT_TYPE_MASK:B = 0x7t

.field public static final LL_SCULPT_TYPE_MESH:B = 0x5t

.field public static final LL_SCULPT_TYPE_NONE:B = 0x0t

.field public static final LL_SCULPT_TYPE_PLANE:B = 0x3t

.field public static final LL_SCULPT_TYPE_SPHERE:B = 0x1t

.field public static final LL_SCULPT_TYPE_TORUS:B = 0x2t

.field public static final PARAMS_FLEXIBLE:S = 0x10s

.field public static final PARAMS_LIGHT:S = 0x20s

.field public static final PARAMS_LIGHT_IMAGE:S = 0x40s

.field public static final PARAMS_MESH:S = 0x60s

.field public static final PARAMS_RESERVED:S = 0x50s

.field public static final PARAMS_SCULPT:S = 0x30s


# instance fields
.field public FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

.field public PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

.field public ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

.field public SculptID:Ljava/util/UUID;

.field public SculptType:B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFromObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;-><init>()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)V

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->createFromObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    return-object v0
.end method

.method public static createFromPackedData(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;-><init>()V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->createFromPackedData(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, p0, :cond_0

    return v1

    :cond_0
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    if-nez v0, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    iget-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B

    iget-byte v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B

    if-eq v0, v3, :cond_2

    return v2

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    if-nez v0, :cond_3

    move v0, v1

    :goto_0
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    if-nez v3, :cond_4

    move v3, v1

    :goto_1
    if-eq v0, v3, :cond_5

    return v2

    :cond_3
    move v0, v2

    goto :goto_0

    :cond_4
    move v3, v2

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    invoke-virtual {v0, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    return v2

    :cond_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    if-nez v0, :cond_7

    move v0, v1

    :goto_2
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    if-nez v3, :cond_8

    move v3, v1

    :goto_3
    if-eq v0, v3, :cond_9

    return v2

    :cond_7
    move v0, v2

    goto :goto_2

    :cond_8
    move v3, v2

    goto :goto_3

    :cond_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    return v2

    :cond_a
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    if-nez v0, :cond_b

    move v0, v1

    :goto_4
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    if-nez v3, :cond_c

    move v3, v1

    :goto_5
    if-eq v0, v3, :cond_d

    return v2

    :cond_b
    move v0, v2

    goto :goto_4

    :cond_c
    move v3, v2

    goto :goto_5

    :cond_d
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    return v2

    :cond_e
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    if-nez v0, :cond_f

    move v0, v1

    :goto_6
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    if-nez v3, :cond_10

    move v3, v1

    :goto_7
    if-eq v0, v3, :cond_11

    return v2

    :cond_f
    move v0, v2

    goto :goto_6

    :cond_10
    move v3, v2

    goto :goto_7

    :cond_11
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    return v2

    :cond_12
    return v1
.end method

.method public hashCode()I
    .locals 2

    iget-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B

    mul-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x25

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    return v0
.end method

.method public isFlexible()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMesh()Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    if-eqz v1, :cond_0

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B

    and-int/lit8 v1, v1, 0x7

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public isSculpt()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{Volume: SculptType 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", SculptID "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Path = ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->PathParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "), Profile = ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->ProfileParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, "null"

    goto :goto_0
.end method

.method public unpackExtraParams(Ljava/nio/ByteBuffer;)V
    .locals 8

    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/2addr v3, v4

    sparse-switch v2, :sswitch_data_0

    :goto_1
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :sswitch_0
    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v2

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptID:Ljava/util/UUID;

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    iput-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->SculptType:B
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_0
    return-void

    :sswitch_1
    :try_start_1
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    invoke-direct {v2, p1, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;-><init>(Ljava/nio/ByteBuffer;I)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->FlexiParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;
    :try_end_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x30 -> :sswitch_0
        0x60 -> :sswitch_0
    .end sparse-switch
.end method
