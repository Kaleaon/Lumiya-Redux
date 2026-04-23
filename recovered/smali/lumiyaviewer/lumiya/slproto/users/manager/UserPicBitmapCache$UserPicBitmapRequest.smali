.class Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserPicBitmapRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Ljava/util/UUID;",
        "Landroid/graphics/Bitmap;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;"
    }
.end annotation


# instance fields
.field private volatile compressedFile:Ljava/io/File;

.field private final decompressRunnable:Ljava/lang/Runnable;

.field private volatile decompressorFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private final loadRunnable:Ljava/lang/Runnable;

.field private volatile loaderFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->compressedFile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Ljava/util/UUID;",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->this$0:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->compressedFile:Ljava/io/File;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->loadRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest$2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->decompressRunnable:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 5

    const/4 v4, 0x0

    const-string/jumbo v1, "UserPic: bitmap ID %s: got resource %s"

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->getParams()Ljava/lang/Object;

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

    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_2

    check-cast p1, Ljava/io/File;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->compressedFile:Ljava/io/File;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getDecompressorExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->decompressRunnable:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->decompressorFuture:Ljava/util/concurrent/Future;

    :cond_0
    :goto_1
    return-void

    :cond_1
    const-string/jumbo v0, "null"

    goto :goto_0

    :cond_2
    if-nez p1, :cond_0

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public cancelRequest()V
    .locals 4

    const/4 v3, 0x0

    const-string/jumbo v1, "DecompressRequest: cancelled (%s)"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->decompressorFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->loaderFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_1

    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getTextureCompressedCache()Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 4

    const-string/jumbo v0, "UserPic: Requesting load for %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->getParams()Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->loadRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserPicBitmapCache$UserPicBitmapRequest;->loaderFuture:Ljava/util/concurrent/Future;

    return-void
.end method
