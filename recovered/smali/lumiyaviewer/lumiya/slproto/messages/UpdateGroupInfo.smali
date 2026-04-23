.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;

.field public GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->Charter:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x12

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUpdateGroupInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x55

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->Charter:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->ShowInList:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->InsigniaID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->MembershipFee:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->OpenEnrollment:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->AllowPublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->MaturePublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->Charter:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->ShowInList:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->InsigniaID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->MembershipFee:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->OpenEnrollment:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->AllowPublish:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo$GroupData;->MaturePublish:Z

    return-void
.end method
