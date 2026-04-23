.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

.field public PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->AboutText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x32

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLAboutText:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->BornOn:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ProfileURL:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->CharterMember:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarPropertiesReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x55

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;->AvatarID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ImageID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLImageID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->PartnerID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->AboutText:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLAboutText:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->BornOn:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ProfileURL:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->CharterMember:[B

    invoke-virtual {p0, p1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$AgentData;->AvatarID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ImageID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLImageID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->PartnerID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->AboutText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->FLAboutText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->BornOn:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->ProfileURL:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->CharterMember:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply$PropertiesData;->Flags:I

    return-void
.end method
