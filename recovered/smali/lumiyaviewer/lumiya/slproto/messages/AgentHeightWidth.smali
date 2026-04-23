.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

.field public HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x30

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentHeightWidth(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x53

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;->CircuitCode:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;->GenCounter:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;->Height:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;->Width:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->packShort(Ljava/nio/ByteBuffer;S)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const v2, 0xffff

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$AgentData;->CircuitCode:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;->GenCounter:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;->Height:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->HeightWidthBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth$HeightWidthBlock;->Width:I

    return-void
.end method
