.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;

.field public UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;->DirectoryVisibility:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUpdateUserInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x6f

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;->IMViaEMail:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;->DirectoryVisibility:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;->IMViaEMail:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->UserData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo$UserData;->DirectoryVisibility:[B

    return-void
.end method
