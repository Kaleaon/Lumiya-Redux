.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;

.field public MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->FromAgentName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x22

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->Message:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->BinaryBucket:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupNoticeAdd(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x3d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->ToGroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->Dialog:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->FromAgentName:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->Message:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->BinaryBucket:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->ToGroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->ID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->Dialog:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->FromAgentName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->Message:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;->BinaryBucket:[B

    return-void
.end method
