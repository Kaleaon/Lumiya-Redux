.class public Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/modules/SLIdleHandler;


# static fields
.field private static final MAX_UDP_TRANSFERS:I = 0x2


# instance fields
.field private agentAppearanceService:Ljava/lang/String;

.field private capURL:Ljava/lang/String;

.field private lastCheckForStalls:J

.field private udpQueue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;",
            ">;"
        }
    .end annotation
.end field

.field private udpTransfers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->capURL:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->agentAppearanceService:Ljava/lang/String;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;->values()[Lcom/lumiyaviewer/lumiya/render/tex/TexturePriority;

    move-result-object v1

    array-length v1, v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpQueue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->lastCheckForStalls:J

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->agentAppearanceService:Ljava/lang/String;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->GetTexture:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->capURL:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TextureFetcher: capURL = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->capURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized RunUDPQueue()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpQueue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->destFile:Ljava/io/File;

    invoke-direct {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;-><init>(Ljava/io/File;Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureID:Ljava/util/UUID;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->StartTransfer(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public BeginFetch(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V
    .locals 3

    const/4 v0, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->destFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    iput-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->outputFile:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, p1

    :goto_0
    monitor-exit p0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    if-eqz v1, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;->OnTextureFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V

    :cond_0
    return-void

    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpQueue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->RunUDPQueue()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized CancelFetch(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpQueue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->RunUDPQueue()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public HandleCloseCircuit()V
    .locals 0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->StopFetching()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public HandleImageData(Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->ID:Ljava/util/UUID;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->HandleImageData(Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->isCompleted()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->ID:Ljava/util/UUID;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->RunUDPQueue()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;->OnTextureFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public HandleImageNotInDatabase(Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "TextureUDP: Image not in database: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase$ImageID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase$ImageID;->ID:Ljava/util/UUID;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase$ImageID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase$ImageID;->ID:Ljava/util/UUID;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;->OnTextureFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->RunUDPQueue()V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public HandleImagePacket(Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;)V
    .locals 3
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v1, 0x0

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;->ID:Ljava/util/UUID;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->HandleImagePacket(Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->isCompleted()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;->ID:Ljava/util/UUID;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->getOutputFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->outputFile:Ljava/io/File;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->RunUDPQueue()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    :goto_0
    monitor-exit p0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    invoke-interface {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;->OnTextureFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public ProcessIdle()V
    .locals 8

    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->lastCheckForStalls:J

    const-wide/16 v6, 0x3e8

    add-long/2addr v4, v6

    cmp-long v3, v0, v4

    if-ltz v3, :cond_2

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->lastCheckForStalls:J

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->hasStalled()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    invoke-virtual {v1, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->RetryTransfer(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v4, "Cannot retry texture %s"

    const/4 v1, 0x1

    new-array v5, v1, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez v2, :cond_4

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    :goto_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-object v0, v1

    :goto_2
    move-object v2, v0

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpTransfers:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->outputFile:Ljava/io/File;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->onFetchComplete:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;

    invoke-interface {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest$TextureFetchCompleteListener;->OnTextureFetchComplete(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V
    :try_end_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_2
    :goto_4
    return-void

    :cond_3
    :try_start_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->RunUDPQueue()V
    :try_end_1
    .catch Ljava/util/ConcurrentModificationException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    :cond_4
    move-object v1, v2

    goto :goto_1

    :cond_5
    move-object v0, v2

    goto :goto_2
.end method

.method public StopFetching()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpQueue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;->clear()V

    return-void
.end method

.method public UpdatePriority(Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->udpQueue:Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/utils/PriorityBinQueue;->updatePriority(Ljava/lang/Object;)V

    return-void
.end method

.method public getAgentAppearanceService()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->agentAppearanceService:Ljava/lang/String;

    return-object v0
.end method

.method public getCapURL()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetcher;->capURL:Ljava/lang/String;

    return-object v0
.end method
