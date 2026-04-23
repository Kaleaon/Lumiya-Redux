.class public Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;
    }
.end annotation


# instance fields
.field public TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;

.field public UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;->Reason:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x22

    add-int/lit8 v0, v0, 0xa

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleKickUser(Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x5d

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;->TargetIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;->TargetPort:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;->Reason:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;->TargetIP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->TargetBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;->TargetPort:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->UserInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$UserInfo;->Reason:[B

    return-void
.end method
