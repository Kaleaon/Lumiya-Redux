.class public Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;
    }
.end annotation


# static fields
.field public static final DEFAULT_AVATAR_TEXTURE:Ljava/util/UUID;


# instance fields
.field private final avatarUUID:Ljava/util/UUID;

.field private final faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

.field private final hasGL20:Z

.field private volatile meshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;

.field private volatile meshDataUpdated:Z

.field private final meshUpdate:Ljava/lang/Runnable;

.field private volatile partMorphParams:[F

.field private volatile rawTexture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

.field private final referenceMeshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

.field private volatile texture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

.field private volatile textureUUID:Ljava/util/UUID;

.field private final updateLock:Ljava/lang/Object;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->hasGL20:Z

    return v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->partMorphParams:[F

    return-object v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->rawTexture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    return-object v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->referenceMeshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    return-object v0
.end method

.method static synthetic -get5(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->updateLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;

    return-object p1
.end method

.method static synthetic -set1(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshDataUpdated:Z

    return p1
.end method

.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "c228d1cf-4b5d-4ba8-84f4-899a0796aa97"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->DEFAULT_AVATAR_TEXTURE:Ljava/util/UUID;

    return-void
.end method

.method constructor <init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->updateLock:Ljava/lang/Object;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshUpdate:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->avatarUUID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->referenceMeshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->hasGL20:Z

    return-void
.end method

.method private RequestMeshUpdate()V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;[FZ)V
    .locals 4

    const/4 v0, 0x0

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v1, :cond_3

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->updateLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->texture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    if-eqz v0, :cond_0

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshDataUpdated:Z

    if-eqz v3, :cond_0

    if-eqz p2, :cond_0

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshDataUpdated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p3, 0x1

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_2

    if-eqz p3, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->referenceMeshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    invoke-virtual {v1, v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->applySkeleton(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;[F)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->setVerticesDirty()V

    :cond_1
    invoke-virtual {v0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)V

    :cond_2
    return-void

    :cond_3
    move p3, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 4

    const-string/jumbo v1, "Avatar: (requesting meshUpdate) face %s texture %s"

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    aput-object v0, v2, v3

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->updateLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    check-cast p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->rawTexture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->RequestMeshUpdate()V

    :cond_0
    return-void

    :cond_1
    const-string/jumbo v0, "null"

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    return-object v0
.end method

.method setPartMorphParams([F)V
    .locals 4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->updateLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->partMorphParams:[F

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->partMorphParams:[F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_1

    const-string/jumbo v0, "Avatar: (requesting meshUpdate) new morphParams for part %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->RequestMeshUpdate()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method setTexture(Lcom/lumiyaviewer/lumiya/render/glres/textures/GLTextureCache;Ljava/util/UUID;)V
    .locals 6

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->updateLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    const-string/jumbo v3, "Avatar: face %s texture %s"

    const/4 v1, 0x2

    new-array v4, v1, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x0

    aput-object v1, v4, v5

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p2, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {p2, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    move-object p2, v0

    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->textureUUID:Ljava/util/UUID;

    if-eqz v0, :cond_3

    if-eqz p2, :cond_4

    invoke-virtual {v0, p2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_4

    monitor-exit v2

    return-void

    :cond_1
    :try_start_1
    const-string/jumbo v1, "null"

    goto :goto_0

    :cond_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->DEFAULT_AVATAR_TEXTURE:Ljava/util/UUID;

    invoke-virtual {p2, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    move-object p2, v0

    goto :goto_1

    :cond_3
    if-nez p2, :cond_4

    monitor-exit v2

    return-void

    :cond_4
    :try_start_2
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->textureUUID:Ljava/util/UUID;

    if-eqz p2, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->faceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->avatarUUID:Ljava/util/UUID;

    invoke-static {p2, v0, v1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v1

    invoke-virtual {v1, v0, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->texture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_2
    monitor-exit v2

    return-void

    :cond_5
    const/4 v0, 0x0

    :try_start_3
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->texture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->meshData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->rawTexture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method
