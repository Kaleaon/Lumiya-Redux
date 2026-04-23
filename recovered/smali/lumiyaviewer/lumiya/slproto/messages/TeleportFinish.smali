.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;
    }
.end annotation


# instance fields
.field public Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SeedCapability:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x24

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTeleportFinish(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x45

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->LocationID:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SimIP:Ljava/net/Inet4Address;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SimPort:I

    int-to-short v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packShort(Ljava/nio/ByteBuffer;S)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SeedCapability:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SimAccess:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->TeleportFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->LocationID:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SimIP:Ljava/net/Inet4Address;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackShort(Ljava/nio/ByteBuffer;)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SimPort:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SeedCapability:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->SimAccess:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish$Info;->TeleportFlags:I

    return-void
.end method
