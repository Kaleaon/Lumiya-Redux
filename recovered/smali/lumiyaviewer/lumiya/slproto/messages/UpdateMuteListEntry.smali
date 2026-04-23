.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

.field public MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteName:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x11

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleUpdateMuteListEntry(Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteName:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteType:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteFlags:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteName:[B

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteType:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->MuteData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;->MuteFlags:I

    return-void
.end method
