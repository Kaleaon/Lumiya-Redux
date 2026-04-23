.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;

.field public QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleDirClassifiedQueryBackend(Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x28

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryText:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->Category:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryStart:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->Category:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->Godlike:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->QueryData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend$QueryData;->QueryStart:I

    return-void
.end method
