.class Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;
.implements Ljava/lang/Runnable;
.implements Lcom/lumiyaviewer/lumiya/utils/HasPriority;
.implements Lcom/lumiyaviewer/lumiya/res/executors/Startable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextureDecompressRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
        "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
        ">;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
        "Ljava/lang/Runnable;",
        "Lcom/lumiyaviewer/lumiya/utils/HasPriority;",
        "Lcom/lumiyaviewer/lumiya/res/executors/Startable;"
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$render$tex$TextureClass:[I

.field private volatile compressedFile:Ljava/io/File;

.field private volatile decompressorFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private volatile lowQualityDone:Z

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

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
    sput-object v0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->-com-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues:[I

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

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->lowQualityDone:Z

    return-void
.end method

.method private decompress(Ljava/io/File;Ljava/io/File;Z)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    .locals 5

    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->Raw:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    invoke-direct {v1, p2, v0, v2, p3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/File;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;Z)V

    return-object v1

    :cond_0
    const-string/jumbo v2, "Decompressing (%s) %s texture %s to %s"

    const/4 v1, 0x4

    new-array v3, v1, [Ljava/lang/Object;

    if-eqz p3, :cond_2

    const-string/jumbo v1, "high"

    :goto_0
    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x2

    aput-object v1, v3, v4

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x3

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->JPEG2000:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    invoke-direct {v1, p1, v2, v3, p3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/File;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;Z)V

    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ".tmpdec"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    sget-object v3, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne v0, v3, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getCompressedTextures()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->CompressETC1()Z

    :cond_1
    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->SaveRaw(Ljava/io/File;)V

    invoke-virtual {v2, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Decompressed texture "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-object v1

    :cond_2
    const-string/jumbo v1, "low"
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Failed to decompress texture "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 2

    const/4 v1, 0x0

    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_2

    check-cast p1, Ljava/io/File;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->compressedFile:Ljava/io/File;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Prim:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->queueRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->decompressorFuture:Ljava/util/concurrent/Future;

    goto :goto_0

    :cond_2
    if-nez p1, :cond_0

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public cancelRequest()V
    .locals 4

    const/4 v3, 0x0

    const-string/jumbo v1, "DecompressRequest: cancelled (%s)"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->uuid()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->decompressorFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get2(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->CancelRequest(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->cancelRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get2(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v1, v0, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCompressedCache;->RequestResource(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method

.method public getPriority()I
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-wrap0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->lowQualityDone:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x4

    return v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->-getcom-lumiyaviewer-lumiya-render-tex-TextureClassSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x3

    return v0

    :pswitch_0
    const/4 v0, 0x1

    return v0

    :pswitch_1
    const/4 v0, 0x2

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public run()V
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Sculpt:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->textureClass()Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne v1, v2, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->compressedFile:Ljava/io/File;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-virtual {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getResourceFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Z)Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v1, v0, v3}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->decompress(Ljava/io/File;Ljava/io/File;Z)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->completeRequest(Ljava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get1(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/StartingExecutor;->completeRequest(Lcom/lumiyaviewer/lumiya/res/executors/Startable;)V

    return-void

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-wrap0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->lowQualityDone:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->compressedFile:Ljava/io/File;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-virtual {v2, v0, v4}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getResourceFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Z)Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v1, v0, v4}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->decompress(Ljava/io/File;Ljava/io/File;Z)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getHighQualityTextures()Z

    move-result v1

    if-eqz v1, :cond_3

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->lowQualityDone:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->intermediateResult(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->decompressorFuture:Ljava/util/concurrent/Future;

    goto :goto_0

    :cond_3
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->compressedFile:Ljava/io/File;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-virtual {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getResourceFile(Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;Z)Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v1, v0, v3}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->decompress(Ljava/io/File;Ljava/io/File;Z)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public start()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->-get0(Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache$TextureDecompressRequest;->decompressorFuture:Ljava/util/concurrent/Future;

    return-void
.end method
