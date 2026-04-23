.class public abstract Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;
    .locals 2

    const/4 v1, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;

    invoke-direct {v0, p0, p1, v1, v1}, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/util/UUID;)V

    return-object v0
.end method

.method public static create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/lumiyaviewer/lumiya/render/tex/AutoValue_DrawableTextureParams;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/util/UUID;)V

    return-object v0
.end method


# virtual methods
.method public abstract avatarFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract avatarUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public final getTextureRawPath(Ljava/io/File;Z)Ljava/io/File;
    .locals 6

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    shr-int/lit8 v1, v0, 0x8

    xor-int/2addr v1, v0

    shr-int/lit8 v2, v0, 0x10

    xor-int/2addr v1, v2

    shr-int/lit8 v0, v0, 0x18

    xor-int/2addr v0, v1

    and-int/lit16 v1, v0, 0xff

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->getStorePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne v2, v3, :cond_0

    if-eqz p2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "-hq"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    new-instance v2, Ljava/io/File;

    const-string/jumbo v3, "%s-raw/%02x/%s.raw"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v4, v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method public abstract textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;
.end method

.method public abstract uuid()Ljava/util/UUID;
.end method
