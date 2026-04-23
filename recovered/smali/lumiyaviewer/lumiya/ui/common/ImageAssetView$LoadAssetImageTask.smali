.class Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;
.super Landroid/os/AsyncTask;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadAssetImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/util/UUID;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;"
    }
.end annotation


# instance fields
.field private volatile texture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

.field private final textureReady:Ljava/lang/Object;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->textureReady:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;-><init>(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;)V

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 2

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->texture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->textureReady:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->textureReady:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected varargs doInBackground([Ljava/util/UUID;)Landroid/graphics/Bitmap;
    .locals 6

    const/4 v5, 0x0

    const/4 v1, 0x1

    const/4 v3, 0x0

    const-string/jumbo v0, "loading asset ID %s"

    new-array v1, v1, [Ljava/lang/Object;

    aget-object v2, p1, v3

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    aget-object v1, p1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->textureReady:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->texture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    if-nez v0, :cond_0

    const-string/jumbo v0, "asset ID %s is not available, waiting"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->textureReady:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    const-string/jumbo v0, "done waiting for asset ID %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->texture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->texture:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getAsBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    :try_start_3
    const-string/jumbo v0, "interrupted while waiting for asset ID %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit v1

    return-object v5

    :cond_0
    :try_start_4
    const-string/jumbo v0, "asset ID %s is already available"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    return-object v5
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->doInBackground([Ljava/util/UUID;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->-set0(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->-get0(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->requestLayout()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->invalidate()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->-set1(Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;)Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView$LoadAssetImageTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
