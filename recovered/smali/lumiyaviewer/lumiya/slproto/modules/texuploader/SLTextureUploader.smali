.class public Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# instance fields
.field private capURL:Ljava/lang/String;

.field private executor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->UploadBakedTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->capURL:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->capURL:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->executor:Ljava/util/concurrent/ExecutorService;

    :cond_0
    return-void
.end method


# virtual methods
.method public BeginUpload(Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->executor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->capURL:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->capURL:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;->setCapURL(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->executor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploader;->executor:Ljava/util/concurrent/ExecutorService;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method
