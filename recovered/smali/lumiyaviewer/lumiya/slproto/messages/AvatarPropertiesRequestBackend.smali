.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x26

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarPropertiesRequestBackend(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x56

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->AvatarID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->GodLevel:I

    int-to-byte v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->packByte(Ljava/nio/ByteBuffer;B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->WebProfilesDisabled:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->AvatarID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->unpackByte(Ljava/nio/ByteBuffer;)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->GodLevel:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend$AgentData;->WebProfilesDisabled:Z

    return-void
.end method
