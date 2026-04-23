.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;

.field public GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

.field public MemberData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 4

    const/16 v0, 0x39

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->OnlineStatus:[B

    array-length v3, v3

    add-int/lit8 v3, v3, 0x15

    add-int/lit8 v3, v3, 0x8

    add-int/lit8 v3, v3, 0x1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->Title:[B

    array-length v0, v0

    add-int/2addr v0, v3

    add-int/lit8 v0, v0, 0x1

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupMembersReply(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x6f

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->RequestID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->MemberCount:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->Contribution:I

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->OnlineStatus:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->AgentPowers:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->Title:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->IsOwner:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 7

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->RequestID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$GroupData;->MemberCount:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v3

    iput v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->Contribution:I

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->OnlineStatus:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->AgentPowers:J

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->Title:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v3

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;->IsOwner:Z

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;->MemberData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
