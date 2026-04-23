.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;

.field public RequestBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->RequestBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x35

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRequestGodlikePowers(Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->RequestBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->RequestBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;->Token:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->RequestBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;->Godlike:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->RequestBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers$RequestBlock;->Token:Ljava/util/UUID;

    return-void
.end method
