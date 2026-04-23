.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x2d

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleChildAgentAlive(Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0x1a

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->ViewerCircuitCode:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->ViewerCircuitCode:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive$AgentData;->SessionID:Ljava/util/UUID;

    return-void
.end method
