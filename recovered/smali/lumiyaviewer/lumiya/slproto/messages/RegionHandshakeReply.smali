.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

.field public RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x28

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleRegionHandshakeReply(Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x6b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->RegionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply$RegionInfo;->Flags:I

    return-void
.end method
