.class public Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$InstanceHolder;,
        Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;,
        Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
        "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
        ">;"
    }
.end annotation


# instance fields
.field private baseDir:Ljava/io/File;

.field private final cacheDirLock:Ljava/lang/Object;

.field private final decompressorExecutor:Ljava/util/concurrent/ExecutorService;

.field private final isLowMemory:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final memoryAwareExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

.field private final textureCompressedCache:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

.field private textureTempDir:Ljava/io/File;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->decompressorExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->memoryAwareExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureCompressedCache:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->canBeLowQuality(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Z

    move-result v0

    return v0
.end method

.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->cacheDirLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->isLowMemory:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureCompressedCache:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;

    const-string/jumbo v1, "TextureDecompressor"

    new-instance v2, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;-><init>(Ljava/lang/String;ILjava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->decompressorExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->memoryAwareExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    return-void
.end method

.method private canBeLowQuality(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Z
    .locals 2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected CreateNewRequest(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getHighQualityTextures()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->canBeLowQuality(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getResourceFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Z)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)V

    return-object v1

    :cond_1
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->canBeLowQuality(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getHighQualityTextures()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getResourceFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Z)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)V

    return-object v1

    :cond_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;

    invoke-direct {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method

.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->CreateNewRequest(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method

.method protected getBaseDir()Ljava/io/File;
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->cacheDirLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->baseDir:Ljava/io/File;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    const-string/jumbo v2, "tex2"

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getCacheDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->baseDir:Ljava/io/File;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->baseDir:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public getBitmapsBaseDir()Ljava/io/File;
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    const-string/jumbo v1, "bitmaps"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getCacheDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getDecompressorExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->decompressorExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public declared-synchronized getResourceFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Z)Ljava/io/File;
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getBaseDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->getTextureRawPath(Ljava/io/File;Z)Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTextureCompressedCache()Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureCompressedCache:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    return-object v0
.end method

.method public getTextureCompressedFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Ljava/io/File;
    .locals 7

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v1

    shr-int/lit8 v2, v1, 0x8

    xor-int/2addr v2, v1

    shr-int/lit8 v3, v1, 0x10

    xor-int/2addr v2, v3

    shr-int/lit8 v1, v1, 0x18

    xor-int/2addr v1, v2

    and-int/lit16 v1, v1, 0xff

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getTextureTempDir()Ljava/io/File;

    move-result-object v3

    const-string/jumbo v4, "%02x/%s.jp2"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method public getTextureCompressedFileOld(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Ljava/io/File;
    .locals 4

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getTextureTempDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".jp2"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getTextureTempDir()Ljava/io/File;
    .locals 3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->cacheDirLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureTempDir:Ljava/io/File;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    const-string/jumbo v2, "textures"

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getCacheDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureTempDir:Ljava/io/File;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureTempDir:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onCacheDirChanged()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->cacheDirLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->baseDir:Ljava/io/File;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureTempDir:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setFetcher(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureCompressedCache:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->setFetcher(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;)V

    return-void
.end method

.method public setMaxTextureDownloads(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->textureCompressedCache:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->setMaxTextureDownloads(I)V

    return-void
.end method

.method public setTextureMemoryState(Z)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->isLowMemory:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eq v0, p1, :cond_0

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->memoryAwareExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->pause()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->memoryAwareExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->unpause()V

    goto :goto_0
.end method
