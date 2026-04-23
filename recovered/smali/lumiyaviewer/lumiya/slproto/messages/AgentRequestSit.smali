.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;
    }
.end annotation


# instance fields
.field public AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

.field public TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x3d

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAgentRequestSit(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;->AgentID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;->SessionID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;->TargetID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;->Offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;->TargetID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->TargetObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit$TargetObject;->Offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-void
.end method
