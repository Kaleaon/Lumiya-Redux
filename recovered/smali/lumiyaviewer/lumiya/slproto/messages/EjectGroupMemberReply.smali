.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;

.field public EjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;

.field public GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->EjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x25

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleEjectGroupMemberReply(Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x5a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->EjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;->Success:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->EjectData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply$EjectData;->Success:Z

    return-void
.end method
