.class final Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;
.super Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;


# instance fields
.field private final glow:F

.field private final hasAttribute:I

.field private final materialb:B

.field private final mediab:B

.field private final offsetU:F

.field private final offsetV:F

.field private final repeatU:F

.field private final repeatV:F

.field private final rgba:I

.field private final rotation:F

.field private final textureID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Ljava/util/UUID;IFFFFFFBBI)V
    .locals 0
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->textureID:Ljava/util/UUID;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rgba:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatU:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatV:F

    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetU:F

    iput p6, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetV:F

    iput p7, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rotation:F

    iput p8, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->glow:F

    iput-byte p9, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->materialb:B

    iput-byte p10, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->mediab:B

    iput p11, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->hasAttribute:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    if-eqz v2, :cond_5

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->textureID:Ljava/util/UUID;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->textureID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_3

    :cond_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rgba:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rgba()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatU:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatU()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatV:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->repeatV()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetU:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetU()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetV:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->offsetV()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rotation:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->rotation()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->glow:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->glow()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->materialb:B

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->materialb()B

    move-result v3

    if-ne v2, v3, :cond_3

    iget-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->mediab:B

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->mediab()B

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->hasAttribute:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->hasAttribute()I

    move-result v3

    if-ne v2, v3, :cond_4

    :goto_0
    return v0

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->textureID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->textureID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    move v0, v1

    goto :goto_0

    :cond_5
    return v1
.end method

.method public glow()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->glow:F

    return v0
.end method

.method public hasAttribute()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->hasAttribute:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    const v2, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->textureID:Ljava/util/UUID;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    xor-int/2addr v0, v2

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rgba:I

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatU:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatV:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetU:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetV:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rotation:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->glow:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->materialb:B

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->mediab:B

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->hasAttribute:I

    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->textureID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public materialb()B
    .locals 1

    iget-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->materialb:B

    return v0
.end method

.method public mediab()B
    .locals 1

    iget-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->mediab:B

    return v0
.end method

.method public offsetU()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetU:F

    return v0
.end method

.method public offsetV()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetV:F

    return v0
.end method

.method public repeatU()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatU:F

    return v0
.end method

.method public repeatV()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatV:F

    return v0
.end method

.method public rgba()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rgba:I

    return v0
.end method

.method public rotation()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rotation:F

    return v0
.end method

.method public textureID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->textureID:Ljava/util/UUID;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SLTextureEntryFace{textureID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->textureID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "rgba="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rgba:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "repeatU="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatU:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "repeatV="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->repeatV:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "offsetU="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetU:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "offsetV="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->offsetV:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "rotation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->rotation:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "glow="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->glow:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "materialb="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->materialb:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "mediab="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->mediab:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "hasAttribute="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/textures/AutoValue_SLTextureEntryFace;->hasAttribute:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
