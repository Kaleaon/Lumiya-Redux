.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->Notes:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x12

    add-int/lit8 v0, v0, 0x14

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarNotesReply(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, -0x50

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->TargetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->Notes:[B

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->TargetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->Notes:[B

    return-void
.end method
