.class public Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;
.super Ljava/lang/Object;


# static fields
.field public static final DEFAULT_AVATAR_TEXTURE:Ljava/util/UUID;


# instance fields
.field private final avatarTextures:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "c228d1cf-4b5d-4ba8-84f4-899a0796aa97"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->DEFAULT_AVATAR_TEXTURE:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->avatarTextures:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public declared-synchronized ApplyAvatarAppearance(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$ObjectData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$ObjectData;->TextureEntry:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;->ObjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$ObjectData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance$ObjectData;->TextureEntry:[B

    array-length v1, v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->create(Ljava/nio/ByteBuffer;I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->ApplyTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized ApplyTextures(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;Z)Z
    .locals 8

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->getFaceMask()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->GetDefaultTexture()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v4

    array-length v5, v4

    move v2, v0

    move v1, v0

    :goto_0
    if-ge v2, v5, :cond_3

    aget-object v6, v4, v2

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->GetFace(I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;->getTextureID(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntryFace;)Ljava/util/UUID;

    move-result-object v7

    if-eqz v7, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->avatarTextures:Ljava/util/Map;

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz p2, :cond_1

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move v1, v0

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v7, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->avatarTextures:Ljava/util/Map;

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x1

    goto :goto_1

    :cond_3
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_4
    move v0, v1

    goto :goto_1
.end method

.method public declared-synchronized getTexture(Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)Ljava/util/UUID;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarTextures;->avatarTextures:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
