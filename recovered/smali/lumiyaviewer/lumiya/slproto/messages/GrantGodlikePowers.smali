.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;

.field public GrantData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->GrantData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x35

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGrantGodlikePowers(Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->GrantData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;->GodLevel:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->GrantData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;->Token:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->GrantData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;->GodLevel:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->GrantData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers$GrantData;->Token:Ljava/util/UUID;

    return-void
.end method
