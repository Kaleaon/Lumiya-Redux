.class public Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field private final downloadExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

.field private volatile fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

.field private final lock:Ljava/lang/Object;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->downloadExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getMaxTextureDownloads()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->downloadExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->lock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    return-void
.end method


# virtual methods
.method protected CreateNewRequest(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Ljava/io/File;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getTextureCompressedFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Ljava/io/File;

    move-result-object v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;)V

    return-object v0
.end method

.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->CreateNewRequest(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method

.method public RequestResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 5

    const/4 v2, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getTextureCompressedFileOld(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Ljava/io/File;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getTextureCompressedFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Ljava/io/File;

    move-result-object v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_0

    :goto_0
    monitor-exit v3

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;->OnResourceReady(Ljava/lang/Object;Z)V

    :goto_1
    return-void

    :cond_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    if-eqz v0, :cond_2

    move-object v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_1
    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    goto :goto_1

    :cond_2
    move-object v0, v2

    goto :goto_0
.end method

.method public bridge synthetic RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->RequestResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method public setFetcher(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    return-void
.end method

.method public setMaxTextureDownloads(I)V
    .locals 1

    if-lez p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->downloadExecutor:Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->setMaxConcurrentTasks(I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->setCorePoolSize(I)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->setMaximumPoolSize(I)V

    :cond_0
    return-void
.end method
