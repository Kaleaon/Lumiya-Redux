.class Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/executors/Startable;
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/utils/HasPriority;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextureFetchRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
        "Ljava/io/File;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/res/executors/Startable;",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;",
        "Ljava/lang/Runnable;",
        "Lcom/lumiyaviewer/lumiya/utils/HasPriority;"
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I = null

.field private static final MAX_RETRIES:I = 0x2


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$render$tex$TextureClass:[I

.field private final compressedFile:Ljava/io/File;

.field private volatile fetchRequest:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

.field private volatile fetchTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private final fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->values()[Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    sput-object v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->compressedFile:Ljava/io/File;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    return-void
.end method


# virtual methods
.method public OnTextureFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V
    .locals 1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->outputFile:Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->completeRequest(Ljava/io/File;)V

    return-void
.end method

.method public cancelRequest()V
    .locals 5

    const/4 v4, 0x1

    const-string/jumbo v1, "TextureFetchRequest: cancelled (%s)"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetchRequest:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetchTask:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->CancelFetch(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V

    :cond_0
    if-eqz v2, :cond_1

    invoke-interface {v2, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->-get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->cancelRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public completeRequest(Ljava/io/File;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->-get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->completeRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->completeRequest(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic completeRequest(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->completeRequest(Ljava/io/File;)V

    return-void
.end method

.method public execute()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/HTTPFetchExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetchTask:Ljava/util/concurrent/Future;

    return-void
.end method

.method public getPriority()I
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->-getcom-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues()[I

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x2

    return v0

    :pswitch_0
    const/4 v0, 0x0

    return v0

    :pswitch_1
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public run()V
    .locals 10

    const/4 v9, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    if-nez v0, :cond_0

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->completeRequest(Ljava/io/File;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->getCapURL()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->getAgentAppearanceService()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    :try_start_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v6

    if-eqz v1, :cond_1

    if-nez v5, :cond_2

    :cond_1
    new-instance v1, Ljava/net/URL;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v5, "/?texture_id="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "TextureFetchRequest: Fetching texture "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ", url = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v6, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->compressedFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ".part"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    const-string/jumbo v5, "TextureFetchRequest: tempOutputDir = %s, createResult = %b, exists = %b"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v0, v7, v3

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v7, v4

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v7, v9

    invoke-static {v5, v7}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v5, v3

    :goto_1
    if-ge v5, v9, :cond_7

    :try_start_1
    const-string/jumbo v0, "TextureFetchRequest: getting connection"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/net/URL;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string/jumbo v2, "Accept"

    const-string/jumbo v7, "image/x-j2c"

    invoke-virtual {v0, v2, v7}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->getOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v2

    invoke-virtual {v2, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v7

    if-nez v7, :cond_4

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v2, "Null response"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    move v2, v3

    :goto_2
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :goto_3
    if-eqz v2, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->-get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->compressedFile:Ljava/io/File;

    invoke-virtual {v6, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->compressedFile:Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->completeRequest(Ljava/io/File;)V

    return-void

    :cond_2
    if-eqz v6, :cond_1

    :try_start_3
    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "texture/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->getBakedTextureName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->completeRequest(Ljava/io/File;)V

    return-void

    :cond_4
    :try_start_4
    invoke-virtual {v7}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_5

    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Response code "

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Lokhttp3/Response;->code()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    move v2, v3

    :goto_4
    :try_start_5
    invoke-virtual {v7}, Lokhttp3/Response;->close()V

    throw v0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-exception v0

    goto/16 :goto_2

    :cond_5
    :try_start_6
    invoke-virtual {v7}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0

    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    invoke-static {v0, v2}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :try_start_9
    invoke-virtual {v7}, Lokhttp3/Response;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    move v2, v4

    goto/16 :goto_3

    :catchall_1
    move-exception v0

    :try_start_a
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :catchall_2
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_6
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto/16 :goto_1

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetchTask:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_8

    const-string/jumbo v0, "TextureFetchRequest: HTTP fetch unsuccessful. Trying UDP."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->-get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->queueRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    :cond_8
    return-void

    :catch_3
    move-exception v0

    move v2, v4

    goto/16 :goto_2

    :catchall_3
    move-exception v0

    move v2, v4

    goto :goto_4
.end method

.method public start()V
    .locals 8

    const/4 v0, 0x0

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetcher:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;

    if-nez v7, :cond_0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->completeRequest(Ljava/io/File;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarFaceIndex()Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->avatarUUID()Ljava/util/UUID;

    move-result-object v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->compressedFile:Ljava/io/File;

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;-><init>(Ljava/util/UUID;ILcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/util/UUID;Ljava/io/File;)V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->setOnFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache$TextureFetchRequest;->fetchRequest:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->BeginFetch(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
