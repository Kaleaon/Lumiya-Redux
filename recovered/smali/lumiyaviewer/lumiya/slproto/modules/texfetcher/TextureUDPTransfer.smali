.class public Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;
.super Ljava/lang/Object;


# static fields
.field private static final MAX_RETRIES:I = 0x2

.field private static final PACKET_TIMEOUT:J = 0x3a98L


# instance fields
.field private completed:Z

.field public fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

.field private gotSize:I

.field private headerReceived:Z

.field private lastReceivedPacket:J

.field private nextExpectedPacket:I

.field private outOfOrderPackets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field private outputFile:Ljava/io/File;

.field private outputStream:Ljava/io/FileOutputStream;

.field private packets:I

.field private retries:I

.field private size:I


# direct methods
.method public constructor <init>(Ljava/io/File;Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->completed:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->headerReceived:Z

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->nextExpectedPacket:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->gotSize:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->retries:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->lastReceivedPacket:J

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outOfOrderPackets:Ljava/util/Map;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputFile:Ljava/io/File;

    return-void
.end method

.method private HandleDataPacket(I[B)V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->lastReceivedPacket:J

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->headerReceived:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->nextExpectedPacket:I

    if-ne v0, p1, :cond_0

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->HandleNextDataPacket([B)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outOfOrderPackets:Ljava/util/Map;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->nextExpectedPacket:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->HandleNextDataPacket([B)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outOfOrderPackets:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private HandleNextDataPacket([B)V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->lastReceivedPacket:J

    :try_start_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->nextExpectedPacket:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputStream:Ljava/io/FileOutputStream;

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputFile:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputStream:Ljava/io/FileOutputStream;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputStream:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->gotSize:I

    array-length v1, p1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->gotSize:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->gotSize:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->size:I

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->completed:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TextureUDP: completed download, size = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->gotSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->nextExpectedPacket:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->nextExpectedPacket:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public HandleImageData(Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;)V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->lastReceivedPacket:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->headerReceived:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Size:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->size:I

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageID;->Packets:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->packets:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TextureUDP: header received, size = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->size:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", packets = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->packets:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", initial size = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;->Data:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;->ImageDataData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData$ImageDataData;->Data:[B

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->HandleDataPacket(I[B)V

    return-void
.end method

.method public HandleImagePacket(Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;)V
    .locals 2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageID_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageID;->Packet:I

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;->ImageData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket$ImageData;->Data:[B

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->HandleDataPacket(I[B)V

    return-void
.end method

.method public RetryTransfer(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;)Z
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->retries:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->retries:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->retries:I

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->StartTransfer(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;)V

    const/4 v0, 0x1

    return v0
.end method

.method public StartTransfer(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;)V
    .locals 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "TextureUDP: starting transfer, image ID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->lastReceivedPacket:J

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;-><init>()V

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$AgentData;->SessionID:Ljava/util/UUID;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;-><init>()V

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureID:Ljava/util/UUID;

    iput-object v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Image:Ljava/util/UUID;

    iput v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->DiscardLevel:I

    const v4, 0x49775080    # 1013000.0f

    iput v4, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->DownloadPriority:F

    iput v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Packet:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->fetchReq:Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/SLTextureFetchRequest;->textureClass:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    sget-object v5, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Baked:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    if-ne v4, v5, :cond_0

    move v0, v1

    :cond_0
    iput v0, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage$RequestImageData;->Type:I

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->RequestImageData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-boolean v1, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;->isReliable:Z

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public getOutputFile()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->outputFile:Ljava/io/File;

    return-object v0
.end method

.method public hasStalled()Z
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->lastReceivedPacket:J

    const-wide/16 v4, 0x3a98

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCompleted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/texfetcher/TextureUDPTransfer;->completed:Z

    return v0
.end method
