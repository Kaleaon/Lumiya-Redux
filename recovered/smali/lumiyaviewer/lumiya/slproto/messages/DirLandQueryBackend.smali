.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x3d

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirLandQueryBackend(Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x31

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->SearchType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->Price:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->Area:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->QueryStart:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->QueryFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->SearchType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->Price:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->Area:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->QueryStart:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend$QueryData;->Godlike:Z

    return-void
.end method
