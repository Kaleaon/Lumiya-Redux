.class public Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;

.field public FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;->SimFilename:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;->ViewerFilename:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleInitiateDownload(Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x6d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;->SimFilename:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;->ViewerFilename:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;->SimFilename:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->FileData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload$FileData;->ViewerFilename:[B

    return-void
.end method
