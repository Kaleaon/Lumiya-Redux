.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;

.field public GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->Name:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->Charter:[B

    array-length v1, v1

    add-int/2addr v0, v1

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCreateGroupRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x53

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->Name:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->Charter:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->ShowInList:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->InsigniaID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->MembershipFee:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->OpenEnrollment:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->AllowPublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->MaturePublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->Name:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->Charter:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->ShowInList:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->InsigniaID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->MembershipFee:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->OpenEnrollment:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->AllowPublish:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest$GroupData;->MaturePublish:Z

    return-void
.end method
