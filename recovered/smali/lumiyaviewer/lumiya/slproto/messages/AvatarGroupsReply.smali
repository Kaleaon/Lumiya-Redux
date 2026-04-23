.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

.field public GroupData_Fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;",
            ">;"
        }
    .end annotation
.end field

.field public NewGroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->GroupData_Fields:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->NewGroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 4

    const/16 v0, 0x25

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupTitle:[B

    array-length v3, v3

    add-int/lit8 v3, v3, 0xa

    add-int/lit8 v3, v3, 0x10

    add-int/lit8 v3, v3, 0x1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupName:[B

    array-length v0, v0

    add-int/2addr v0, v3

    add-int/lit8 v0, v0, 0x10

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarGroupsReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x53

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;->AvatarID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;

    iget-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupPowers:J

    invoke-virtual {p0, p1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->AcceptNotices:Z

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupTitle:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupName:[B

    invoke-virtual {p0, p1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupInsigniaID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->NewGroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;->ListInProfile:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 7

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;->AvatarID:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v1, v0, 0xff

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupPowers:J

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v3

    iput-boolean v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->AcceptNotices:Z

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupTitle:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v6}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupName:[B

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupInsigniaID:Ljava/util/UUID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->NewGroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;->ListInProfile:Z

    return-void
.end method
