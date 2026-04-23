.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

.field public Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x38

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleSetGroupContribution(Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x71

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;->Contribution:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->packInt(Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution$Data;->Contribution:I

    return-void
.end method
