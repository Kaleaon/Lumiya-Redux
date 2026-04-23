.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x48

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirLandQuery(Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x30

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->SearchType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->Price:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->Area:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->QueryStart:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->QueryFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->SearchType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->Price:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->Area:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery$QueryData;->QueryStart:I

    return-void
.end method
