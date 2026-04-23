.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

.field public Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x44

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleTeleportLocationRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x3f

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest$Info;->LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
