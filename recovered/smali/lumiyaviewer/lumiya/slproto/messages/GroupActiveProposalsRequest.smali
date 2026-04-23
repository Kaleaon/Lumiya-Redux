.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;

.field public GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;

.field public TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;

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

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleGroupActiveProposalsRequest(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x67

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;->TransactionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$GroupData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->TransactionData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest$TransactionData;->TransactionID:Ljava/util/UUID;

    return-void
.end method
