.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;

.field public Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;->Message:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTeleportProgress(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x42

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;->TeleportFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;->Message:[B

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;->TeleportFlags:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress$Info;->Message:[B

    return-void
.end method
