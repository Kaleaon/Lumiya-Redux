.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x38

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirPopularQuery(Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery$QueryData;->QueryFlags:I

    return-void
.end method
