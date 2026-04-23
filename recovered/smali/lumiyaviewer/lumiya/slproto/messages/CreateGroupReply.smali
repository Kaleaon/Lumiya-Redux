.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;

.field public ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;->Message:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x12

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCreateGroupReply(Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x54

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;->Success:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;->Message:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;->Success:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->ReplyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;->Message:[B

    return-void
.end method
