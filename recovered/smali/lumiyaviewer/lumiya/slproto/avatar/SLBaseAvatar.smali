.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$InstanceHolder;,
        Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;
    }
.end annotation


# instance fields
.field private meshes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HAIR_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "hairMesh"

    const-string/jumbo v6, "avatar_hair"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HEAD_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "headMesh"

    const-string/jumbo v6, "avatar_head"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_EYELASH:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HEAD_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "eyelashMesh"

    const-string/jumbo v6, "avatar_eyelashes"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_UPPER_BODY:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_UPPER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "upperBodyMesh"

    const-string/jumbo v6, "avatar_upper_body"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_LOWER_BODY:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_LOWER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "lowerBodyMesh"

    const-string/jumbo v6, "avatar_lower_body"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_EYEBALL_LEFT:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_EYES:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_EYES_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "eyeBallLeftMesh"

    const-string/jumbo v6, "avatar_eye"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_EYEBALL_RIGHT:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_EYES:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_EYES_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "eyeBallRightMesh"

    const-string/jumbo v6, "avatar_eye"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->MESH_ID_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_SKIRT_BAKED:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v5, "skirtMesh"

    const-string/jumbo v6, "avatar_skirt"

    invoke-direct {p0, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;

    move-result-object v0

    return-object v0
.end method

.method private loadMesh(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;
    .locals 6

    const/4 v1, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "BaseAvatar: loading mesh for "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "character/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".lbm"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    const-string/jumbo v2, "avatar_head"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "character/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ".lbm_0"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :goto_0
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    new-instance v5, Ljava/io/DataInputStream;

    invoke-direct {v5, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;-><init>(Ljava/io/DataInputStream;Ljava/io/DataInputStream;)V

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v4

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    return-object v1

    :cond_1
    move-object v0, v1

    move-object v2, v1

    goto :goto_0
.end method


# virtual methods
.method public getMeshEntry(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->meshes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    return-object v0
.end method
