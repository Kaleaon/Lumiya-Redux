.class final Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;
.super Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;


# instance fields
.field private final avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

.field private final avatarUUID:Ljava/util/UUID;

.field private final textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

.field private final uuid:Ljava/util/UUID;


# direct methods
.method constructor <init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/util/UUID;)V
    .locals 2
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;-><init>()V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null uuid"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->uuid:Ljava/util/UUID;

    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null textureClass"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarUUID:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public avatarFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    return-object v0
.end method

.method public avatarUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    if-eqz v2, :cond_6

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->uuid:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v2

    if-nez v2, :cond_3

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarUUID:Ljava/util/UUID;

    if-nez v2, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarUUID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_4

    :goto_0
    return v0

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_6
    return v1
.end method

.method public hashCode()I
    .locals 4

    const/4 v1, 0x0

    const v3, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    xor-int/2addr v0, v3

    mul-int/2addr v0, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v2, v0, v3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    xor-int/2addr v0, v2

    mul-int/2addr v0, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarUUID:Ljava/util/UUID;

    if-nez v2, :cond_1

    :goto_1
    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "DrawableTextureParams{uuid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "textureClass="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "avatarFaceIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "avatarUUID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->avatarUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public uuid()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;->uuid:Ljava/util/UUID;

    return-object v0
.end method
