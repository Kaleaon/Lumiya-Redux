.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

.field public MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x48

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleImprovedInstantMessage(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, -0x2

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromGroup:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ToAgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ParentEstateID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->RegionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Offline:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Timestamp:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->FromAgentName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    return-void
.end method
