.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

.field public PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleMapBlockRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x69

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->EstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->Godlike:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MinX:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MaxX:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MinY:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MaxY:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->packShort(Ljava/nio/ByteBuffer;S)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const v2, 0xffff

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->Flags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->EstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$AgentData;->Godlike:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MinX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MaxX:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MinY:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->PositionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest$PositionData;->MaxY:I

    return-void
.end method
