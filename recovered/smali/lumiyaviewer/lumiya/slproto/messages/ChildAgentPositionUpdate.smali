.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x82

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleChildAgentPositionUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    const/16 v0, 0x1b

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->RegionHandle:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLong(Ljava/nio/ByteBuffer;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->ViewerCircuitCode:I

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packInt(Ljava/nio/ByteBuffer;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AgentPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AgentVel:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->LeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->UpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->ChangedGrid:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->RegionHandle:J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackInt(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->ViewerCircuitCode:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AgentPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AgentVel:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->Center:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->Size:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->AtAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->LeftAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->UpAxis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate$AgentData;->ChangedGrid:Z

    return-void
.end method
