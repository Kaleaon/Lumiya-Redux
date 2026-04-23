.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;

.field public EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Creator:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Name:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Category:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Desc:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Date:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->SimName:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x18

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEventInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x4c

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->EventID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Creator:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Name:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Category:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Desc:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Date:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->DateUTC:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Duration:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Cover:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Amount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->SimName:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->GlobalPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packLLVector3d(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->EventFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->EventID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Creator:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Category:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Desc:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Date:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->DateUTC:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Duration:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Cover:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->Amount:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->SimName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackLLVector3d(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->GlobalPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->EventData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply$EventData;->EventFlags:I

    return-void
.end method
