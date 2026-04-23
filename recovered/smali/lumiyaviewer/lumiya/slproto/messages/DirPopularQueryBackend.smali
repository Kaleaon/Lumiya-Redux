.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x2d

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirPopularQueryBackend(Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x34

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->QueryFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend$QueryData;->Godlike:Z

    return-void
.end method
