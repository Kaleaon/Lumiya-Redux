.class Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/res/executors/Startable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextureLoadRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
        "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
        ">;",
        "Ljava/lang/Runnable;",
        "Lcom/lumiyaviewer/lumiya/res/executors/Startable;"
    }
.end annotation


# instance fields
.field private final rawFile:Ljava/io/File;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->rawFile:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->cancelRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->remove(Ljava/lang/Runnable;)Z

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->queueRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public run()V
    .locals 5

    :try_start_0
    new-instance v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->rawFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    sget-object v3, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->Raw:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    const/4 v4, 0x1

    invoke-direct {v1, v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/File;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;Z)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->completeRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureLoadRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public start()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
