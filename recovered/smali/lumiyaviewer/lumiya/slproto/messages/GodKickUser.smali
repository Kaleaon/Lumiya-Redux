.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;
    }
.end annotation


# instance fields
.field public UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->Reason:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x36

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGodKickUser(Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x5b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->GodID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->GodSessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->KickFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->Reason:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->GodID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->GodSessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->KickFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;->Reason:[B

    return-void
.end method
