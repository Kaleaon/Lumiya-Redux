.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

.field public PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->AboutText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x22

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->FLAboutText:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->ProfileURL:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarPropertiesUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x52

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->ImageID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->FLImageID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->AboutText:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->FLAboutText:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->AllowPublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->MaturePublish:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->ProfileURL:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->ImageID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->FLImageID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->AboutText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->FLAboutText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->AllowPublish:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->MaturePublish:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate$PropertiesData;->ProfileURL:[B

    return-void
.end method
