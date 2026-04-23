.class public Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;

.field public ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->ProposalText:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1d

    add-int/lit8 v0, v0, 0x24

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleStartGroupProposal(Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/4 v1, 0x1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/16 v0, 0x6b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->GroupID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->Quorum:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->Majority:F

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->packFloat(Ljava/nio/ByteBuffer;F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->Duration:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->ProposalText:[B

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->packVariable(Ljava/nio/ByteBuffer;[BI)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->GroupID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->Quorum:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->unpackFloat(Ljava/nio/ByteBuffer;)F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->Majority:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->Duration:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->ProposalData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;->unpackVariable(Ljava/nio/ByteBuffer;I)[B

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal$ProposalData;->ProposalText:[B

    return-void
.end method
