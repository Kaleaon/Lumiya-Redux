.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;
.super Ljava/lang/Object;


# instance fields
.field public AirFriction:F

.field public Gravity:F

.field public NumFlexiSections:I

.field public Tension:F

.field public UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public WindSensitivity:F


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;I)V
    .locals 5

    const/4 v0, 0x0

    const/high16 v4, 0x41200000    # 10.0f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    and-int/lit8 v3, v1, 0x7f

    int-to-float v3, v3

    div-float/2addr v3, v4

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Tension:F

    and-int/lit8 v3, v2, 0x7f

    int-to-float v3, v3

    div-float/2addr v3, v4

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->AirFriction:F

    and-int/lit16 v1, v1, 0x80

    if-eqz v1, :cond_0

    const/4 v0, 0x2

    :cond_0
    and-int/lit16 v1, v2, 0x80

    if-eqz v1, :cond_1

    or-int/lit8 v0, v0, 0x1

    :cond_1
    const/4 v1, 0x1

    shl-int v0, v1, v0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    div-float/2addr v0, v4

    sub-float/2addr v0, v4

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Gravity:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    div-float/2addr v0, v4

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->WindSensitivity:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-ge v0, p2, :cond_2

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseFloatVec(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    :goto_0
    return-void

    :cond_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->Zero:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    if-ne p1, p0, :cond_0

    return v3

    :cond_0
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    if-nez v0, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Tension:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Tension:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->AirFriction:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->AirFriction:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_3

    :cond_2
    return v2

    :cond_3
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Gravity:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Gravity:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->WindSensitivity:F

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->WindSensitivity:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_2

    return v3
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Tension:F

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->AirFriction:F

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Gravity:F

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->WindSensitivity:F

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
