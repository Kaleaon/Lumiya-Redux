.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;

.field public UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->DirectoryVisibility:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->EMail:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUserInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x70

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->IMViaEMail:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->DirectoryVisibility:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->EMail:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->IMViaEMail:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->DirectoryVisibility:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply$UserData;->EMail:[B

    return-void
.end method
