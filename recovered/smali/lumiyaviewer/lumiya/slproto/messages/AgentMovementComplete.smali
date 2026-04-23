.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

.field public SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;->ChannelVersion:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x48

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentMovementComplete(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, -0x6

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->Timestamp:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;->ChannelVersion:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$Data;->Timestamp:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->SimData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete$SimData;->ChannelVersion:[B

    return-void
.end method
