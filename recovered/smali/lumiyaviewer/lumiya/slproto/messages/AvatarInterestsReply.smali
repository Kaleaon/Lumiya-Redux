.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;

.field public PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->WantToText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->SkillsText:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->LanguagesText:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarInterestsReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x54

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;->AvatarID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->WantToMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->WantToText:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->SkillsMask:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->SkillsText:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->LanguagesText:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$AgentData;->AvatarID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->WantToMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->WantToText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->SkillsMask:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->SkillsText:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->PropertiesData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;

    invoke-virtual {p0, p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply$PropertiesData;->LanguagesText:[B

    return-void
.end method
