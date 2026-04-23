.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

.field public NameData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->NameData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->NameData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x2d

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleMapNameRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x68

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->NameData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$AgentData;->Godlike:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->NameData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest$NameData;->Name:[B

    return-void
.end method
