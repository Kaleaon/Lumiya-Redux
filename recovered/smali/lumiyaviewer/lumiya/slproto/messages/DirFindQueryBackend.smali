.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirFindQueryBackend(Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryText:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryStart:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->QueryStart:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend$QueryData;->Godlike:Z

    return-void
.end method
